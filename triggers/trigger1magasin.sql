CREATE TRIGGER [ctrl_CP]
    ON [MAGASIN]
    instead of INSERT, UPDATE AS
BEGIN
    SET NOCOUNT ON
    DECLARE @Code_produit char(5),
        @No_employé int,
        @Date_vente date,
        @Qté_vendue float,
        @action char(1)

    IF EXISTS (SELECT * FROM DELETED)
    BEGIN
        SET @action = 'U'
    END
    ELSE
    BEGIN
        SET @action = 'I'
    END

    SELECT @Code_produit = I.No_magasin,
           @No_employé = I.Nom_magasin,
           @Date_vente = I.No_rue_magasin,
           @Qté_vendue = I.Lib_rue_magasin,
           @Qté_vendue = I.CPw
           @Qté_vendue = I.Lib_rue_magasin
    FROM inserted AS I
    IF @Qté_vendue <= 0
    BEGIN
        RAISERROR (N'La quantité vendue doit être > 0 !',16,1)
    END
    ELSE
    BEGIN
        IF @action = 'I'
        BEGIN
            INSERT INTO VEND
                VALUES (@Code_produit, @No_employé, @Date_vente, @Qté_vendue)
                    END
            ELSE
            BEGIN
                UPDATE VEND
                SET Qté_vendue =@Qté_vendue
                WHERE Code_produit = @Code_produit
                  AND No_employé = @No_employé
                  AND Date_vente = @Date_vente
            END
            END
        END



