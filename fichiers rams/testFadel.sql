CREATE TRIGGER [dbo].[crtl_affectationCatEmploye] ON [dbo].[AFFECTATION]
    instead of INSERT, UPDATE
    AS


BEGIN
    SET NOCOUNT ON
    DECLARE
        @No_employé integer,
        @Cat char(2),
        @action char(1),
        @Erreur char(1),
        @nb_cat_employe integer


    SET @Erreur='N'



    IF EXISTS(SELECT * FROM DELETED)
        BEGIN
            SET @action='U'
        END
    ELSE
        BEGIN
            SET @action='I'
        END




    SELECT @No_employé = I.No_employé ,  @cat = I.Cat
    FROM inserted AS I


    SELECT @nb_cat_employe = COUNT(cat) from AFFECTATION where  cat = @cat



    IF @nb_cat_employe >= 3
        BEGIN
            RAISERROR(N'Le produit doit être au max dans 3 magasin',16,1)
            SET @Erreur='O'
        END


    IF @Erreur='N'
        BEGIN
            IF @action = 'I'
                BEGIN
                    INSERT INTO AFFECTATION
                    VALUES (@No_employé , @Cat)
                END
            ELSE
                BEGIN
                    RAISERROR('Upadate imposible',16,1)


                END
        END
END










