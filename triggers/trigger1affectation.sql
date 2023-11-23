CREATE TRIGGER [maxi3]
    ON [AFFECTATION]
    instead of INSERT, UPDATE AS
BEGIN
    SET NOCOUNT ON
    DECLARE
        @No_employé varchar(5),
        @CAT int,
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


    SELECT @No_employé = I.No_Employé,
           @CAT = I.Cat
    FROM inserted AS I

--     todo finish that shit
    select P.Code_catégorie from PRODUIT P inner join
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


