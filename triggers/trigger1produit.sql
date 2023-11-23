CREATE TRIGGER [dbo].[ctrl_prix_tva]
    ON [dbo].[PRODUIT]
    instead of INSERT, UPDATE
    AS
BEGIN
    SET NOCOUNT ON
    DECLARE
        @Code_produit char(5),
        @Designation_prod char(50),
        @Pu_TTC_prod float,
        @Tx_TVA_prod float,
        @Code_catégorie char(2),
        @action char(1),
        @Erreur char(1)


    SET @Erreur = 'N'


    IF EXISTS(SELECT * FROM DELETED)
        BEGIN
            SET @action = 'U'
        END
    ELSE
        BEGIN
            SET @action = 'I'
        END


    SELECT @Code_produit = I.Code_produit,
           @Designation_prod = I.Désignation_produit,
           @Pu_TTC_prod = I.PU_TTC_produit,
           @Tx_TVA_prod = I.Tx_TVA_prod,
           @Code_catégorie = I.Code_catégorie
    FROM inserted AS I


    IF @Pu_TTC_prod < 0
        BEGIN
            RAISERROR (N'Le prix du produit doit être positif ! > 0',16,1)
            SET @Erreur = 'O'
        END


    IF NOT @Tx_TVA_prod IN (0.021, 0.055, 0.2)
        BEGIN
            RAISERROR (N'Le taux de TVA doit être à 0.021, 0.055 ou 0.2 !',16,1)
            SET @Erreur = 'O'
        END


    IF @Erreur = 'N'
        BEGIN
            IF @action = 'I'
                BEGIN
                    INSERT INTO PRODUIT
                    VALUES (@Code_produit, @Designation_prod, @Pu_TTC_prod, @Tx_TVA_prod, @Code_catégorie)
                END
            ELSE
                BEGIN
                    UPDATE PRODUIT
                    SET PU_TTC_produit = @Pu_TTC_prod,
                        Tx_TVA_prod    = @Tx_TVA_prod
                    WHERE Code_produit = @Code_produit
                END
        END
END
