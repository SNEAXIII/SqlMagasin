CREATE TRIGGER [ctrl_CP]
    ON [MAGASIN]
    instead of INSERT, UPDATE AS
BEGIN
    SET NOCOUNT ON
    DECLARE
        @No_magasin int,
        @Nom_magasin char(40),
        @No_rue_magasin char(10),
        @Lib_rue_magasin char(50),
        @CP_magasin char(5),
        @Ville_magasin char(30),
        @action char(1),
        @mess char(50)
--     todo remove mess
    set @mess = N'Le CP doit être compris entre 01000 et 95999 !'

    IF EXISTS (SELECT * FROM DELETED)
        BEGIN
            SET @action = 'U'
        END
    ELSE
        BEGIN
            SET @action = 'I'
        END

    SELECT @No_magasin = I.No_magasin,
           @Nom_magasin = I.Nom_magasin,
           @No_rue_magasin = I.No_rue_magasin,
           @Lib_rue_magasin = I.Lib_rue_magasin,
           @CP_magasin = I.CP_magasin,
           @Ville_magasin = I.Ville_magasin
    FROM inserted AS I

    IF NOT CAST(@CP_magasin as INT) BETWEEN 1000 AND 95999
        BEGIN
            RAISERROR (@mess,16,1)
        END
    ELSE IF @action = 'I'
        BEGIN
            INSERT INTO MAGASIN
            VALUES (
                    @Nom_magasin,
                    @No_rue_magasin,
                    @Lib_rue_magasin,
                    @CP_magasin,
                    @Ville_magasin
                   )
        END
    ELSE IF @action = 'U'
        BEGIN
            UPDATE MAGASIN
            SET CP_magasin =@CP_magasin
            WHERE No_magasin = @No_magasin
        END
END



