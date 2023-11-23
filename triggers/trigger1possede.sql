CREATE TRIGGER [maxi3]
    ON [POSSEDE]
    instead of INSERT, UPDATE AS
BEGIN
    SET NOCOUNT ON
    DECLARE
        @Code_produit varchar(5),
        @No_magasin int,
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



