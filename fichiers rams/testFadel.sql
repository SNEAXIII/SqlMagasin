CREATE TRIGGER [ctrl_CP]
    ON [MAGASIN]
    INSTEAD OF INSERT, UPDATE AS
BEGIN
    SET NOCOUNT ON;
    DECLARE
        @No_magasin INT,
        @Nom_magasin CHAR(40),
        @No_rue_magasin CHAR(10),
        @Lib_rue_magasin CHAR(50),
        @CP_magasin CHAR(5),
        @Ville_magasin CHAR(30),
        @action CHAR(1);

    IF EXISTS (SELECT * FROM DELETED)
        BEGIN
            SET @action = 'U';
        END
    ELSE
        BEGIN
            SET @action = 'I';
        END;

    SELECT @No_magasin = I.No_magasin,
           @Nom_magasin = I.Nom_magasin,
           @No_rue_magasin = I.No_rue_magasin,
           @Lib_rue_magasin = I.Lib_rue_magasin,
           @CP_magasin = I.CP_magasin,
           @Ville_magasin = I.Ville_magasin
    FROM inserted AS I;

    IF NOT (CAST(@CP_magasin AS INT) BETWEEN 1000 AND 95999)
        BEGIN
            RAISERROR (N'Le CP doit être compris entre 01000 et 95999 !', 16, 1);
        END
    ELSE
        BEGIN
                    CASE @action
                WHEN 'I' THEN INSERT INTO MAGASIN
                              VALUES (
                                         @Nom_magasin,
                                         @No_rue_magasin,
                                         @Lib_rue_magasin,
                                         @CP_magasin,
                                         @Ville_magasin
                                     );
                    WHEN 'U' THEN UPDATE MAGASIN
                                  SET CP_magasin = @CP_magasin
                                  WHERE No_magasin = @No_magasin;
        END
END
