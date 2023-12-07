CREATE TRIGGER [ctrl_cuisinier]
    ON [CUISINIER]
    instead of INSERT, UPDATE AS
BEGIN
    SET NOCOUNT ON
    DECLARE
        @Numcuisinier int,
        @Nomcuisinier varchar(40),
        @Dateembauche date,
        @Numcuisine int,
        @action char(1),
        @mess char(50)
    set @mess = N'La date d' + char(39) + N'embauche ne peux pas etre antidatée.'

    IF EXISTS (SELECT * FROM DELETED)
        BEGIN
            SET @action = 'U'
        END
    ELSE
        BEGIN
            SET @action = 'I'
        END

    SELECT @Numcuisinier = I.Numcuisinier,
           @Nomcuisinier = I.Nomcuisinier,
           @Dateembauche = I.Dateembauche,
           @Numcuisine = I.Numcuisine
    FROM inserted AS I

    IF (select CAST(getdate() as date)) < @Dateembauche
        BEGIN
            RAISERROR (@mess,16,1)
        END
    ELSE
        IF @action = 'I'
            BEGIN
                INSERT INTO CUISINIER
                VALUES (@Numcuisinier,
                        @Nomcuisinier,
                        @Dateembauche,
                        @Numcuisine)
            END
        ELSE
            IF @action = 'U'
                BEGIN
                    UPDATE CUISINIER
                    SET Nomcuisinier = @Nomcuisinier,
                        Dateembauche = @Dateembauche,
                        Numcuisine = @Numcuisine
                    WHERE @Numcuisinier = Numcuisinier
                END
END