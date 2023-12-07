CREATE TRIGGER [ctrl_PREPARE]
    ON [PREPARE]
    instead of INSERT, UPDATE AS
BEGIN
    SET NOCOUNT ON
    DECLARE
        @Numplat int,
        @Numcuisine int,
        @Dateprepa date,
        @Nbreplats int,
        @action char(1),
        @mess1 char(37) = N'La quantité saisie doit être positive',
        @mess2 char(50) = N'La date de préparation ne peux pas etre antidatée.',
        @mess3 char(62) = N'Un atelier peut préparer au maximum 6 plats différent par jour'

    IF EXISTS (SELECT * FROM DELETED)
        BEGIN
            SET @action = 'U'
        END
    ELSE
        BEGIN
            SET @action = 'I'
        END

    SELECT @Numplat = I.Numplat,
           @Numcuisine = I.Numcuisine,
           @Dateprepa = I.Dateprepa,
           @Nbreplats = I.Nbreplats
    FROM inserted AS I

    IF @Nbreplats <= 0
        BEGIN
            RAISERROR (@mess1,16,1)
            return;
        END

    IF (select CAST(getdate() as date)) < @Dateprepa
        BEGIN
            RAISERROR (@mess2,16,1)
            return;
        END

    IF (select DISTINCT COUNT(Numplat) as [count]
        from PREPARE
        where Numcuisine = @Numcuisine
          and Dateprepa = @Dateprepa) > 6 - 1
        begin
            RAISERROR (@mess3,16,1)
            return;
        end

    IF @action = 'I'
        BEGIN
            INSERT INTO PREPARE
            VALUES (@Numplat,
                    @Numcuisine,
                    @Dateprepa,
                    @Nbreplats)
            return;
        END
    IF @action = 'U'
        BEGIN
            UPDATE PREPARE
            SET Nbreplats = @Nbreplats
            WHERE @Numplat = Numplat
              and @Numcuisine = Numcuisine
              and @Dateprepa = Dateprepa
            return;
        END
END