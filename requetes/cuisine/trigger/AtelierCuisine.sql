CREATE TRIGGER [ctrl_ATELIER_CUISINE]
    ON [ATELIER_CUISINE]
    instead of INSERT, UPDATE AS
BEGIN
    SET NOCOUNT ON
    DECLARE
        @Numcuisine int,
        @Telcuisine varchar(20),
        @Numcuisinier int,
        @action char(1),
        @mess1 char(37) = N'Le chef doit appartenir à sa cuisine'

    IF EXISTS (SELECT * FROM DELETED)
        BEGIN
            SET @action = 'U'
        END
    ELSE
        BEGIN
            SET @action = 'I'
        END

    SELECT @Numcuisine = I.Numcuisine,
           @Telcuisine = I.Telcuisine,
           @Numcuisinier = I.Numcuisinier
    FROM inserted AS I

    IF not EXISTS(select *
                  from CUISINIER
                  where CUISINIER.Numcuisinier = @Numcuisinier
                    and CUISINIER.Numcuisine = @Numcuisine)
        BEGIN
            RAISERROR (@mess1,16,1)
            return;
        END

    IF @action = 'I'
        BEGIN
            INSERT INTO ATELIER_CUISINE
            VALUES (@Telcuisine,
                    @Numcuisinier)
            return;
        END
    IF @action = 'U'
        BEGIN
            UPDATE ATELIER_CUISINE
            SET Numcuisinier = @Numcuisinier,
                Telcuisine   = @Telcuisine
            WHERE @Numcuisine = Numcuisine
            return;
        END
END