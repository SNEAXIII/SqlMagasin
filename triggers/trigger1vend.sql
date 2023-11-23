CREATE TRIGGER [ctrl_qte]
    ON [VEND]
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

    SELECT @Code_produit = I.Code_produit,
           @No_employé = I.No_employé,
           @Date_vente = I.Date_vente,
           @Qté_vendue = I.Qté_vendue
    FROM inserted AS I
    IF @Qté_vendue <= 0
        BEGIN
            RAISERROR (N'La quantité vendue doit être > 0 !',16,1)
        END
    ELSE
        IF @Date_vente > (SELECT CAST(GETDATE() AS date))
            BEGIN
                RAISERROR (N'La doit etre saisie correctement !',16,1)
            END
        ELSE
            IF NOT (SELECT No_magasin FROM EMPLOYE E WHERE E.No_employé = @No_employé) in
               (SELECT No_magasin FROM POSSEDE P WHERE Code_produit = @Code_produit)
                BEGIN
                    declare @mess char(100);
                    set @mess = N'L' + char(39) + 'employe ne peut vendre que des produits present dans son magasin!';
                    RAISERROR (@mess,16,1)
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



