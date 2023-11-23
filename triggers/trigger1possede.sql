CREATE TRIGGER [maxi3]
    ON [POSSEDE]
    instead of INSERT, UPDATE AS
BEGIN
    SET NOCOUNT ON
    DECLARE
        @Code_produit varchar(5),
        @No_magasin int,
        @Nb int,
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
           @No_magasin = I.No_magasin
    FROM inserted AS I

    select @Nb = count(*) from POSSEDE P where @Code_produit= P.Code_produit
    IF @Nb >= 3
        BEGIN
            RAISERROR (N'Le produit existe déja dans 3 magasins.',16,1)
        end
    ELSE IF @action='U'
        BEGIN
            RAISERROR (N'Un enregistrement de la table POSSEDE ne peux pas etre modifié.',16,1)
        end
    ELSE
        BEGIN
            INSERT Into POSSEDE VALUES (@No_magasin,@Code_produit)
        end
END


