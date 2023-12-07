CREATE TRIGGER [miximum2Specialite]
    ON [AFFECTATION]
    instead of INSERT, UPDATE AS
BEGIN
    SET NOCOUNT ON
    DECLARE
        @No_employé int,
        @Cat varchar(2),
        @Nb int,
        @message varchar(255),
        @action char(1)

    IF EXISTS (SELECT * FROM DELETED)
        BEGIN
            SET @action = 'U'
        END
    ELSE
        BEGIN
            SET @action = 'I'
        END


    SELECT @No_employé = I.No_Employé,
           @Cat = I.Cat
    FROM inserted AS I

    SELECT @Nb = count(*)
    FROM AFFECTATION
    where @No_employé = No_employé;

    IF @Nb > 1
        BEGIN
            SET @message = N'L' + char(39) + N'employé numéro ' + CAST(@No_employé AS NVARCHAR(50)) +
                           N' ne peux pas être spécialisé dans 2 catégories'
            RAISERROR (@message,16,1)
        END

    ELSE
        IF not EXISTS (SELECT p.Code_catégorie
                       FROM produit p
                                inner join dbo.POSSEDE P2 on p.Code_produit = P2.Code_produit
                       where No_magasin = (SELECT No_magasin FROM EMPLOYE e where e.No_employé = @No_employé)
                       and @Cat = p.Code_catégorie)
            BEGIN
                set @message = N'L' + char(39) + N'employé ne peux pas être spécialiste d' + char(39) +
                               N'une catégorie qui n' + char(39) + 'est pas dans son magasin'
                RAISERROR (@message,16,1)
            END

        ELSE
            IF @action = 'U'
                BEGIN
                    UPDATE AFFECTATION
                    SET No_employé = @No_employé,
                        Cat        = @Cat
                    WHERE
                        No_employé = @No_employé
                        and Cat = @Cat
                END
            ELSE
                BEGIN
                    INSERT Into AFFECTATION VALUES (@No_employé, @Cat)
                END
END


