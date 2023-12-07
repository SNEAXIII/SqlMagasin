CREATE TRIGGER [ctrl_propose]
    ON [PROPOSE]
    instead of INSERT, UPDATE AS
BEGIN
    SET NOCOUNT ON
    DECLARE
        @Numvin int,
        @Numplat int,
        @action char(1),
        @mess1 char(50)= N'Un plat ne peux etre proposé qu' + char(39) + N'avec 3 vins',
        @mess2 char(50)= N'On ne peux pas modifier cet enregistrement'

    IF EXISTS (SELECT * FROM DELETED)
        BEGIN
            SET @action = 'U'
        END
    ELSE
        BEGIN
            SET @action = 'I'
        END

    SELECT @Numvin = I.Numvin,
           @Numplat = I.Numplat
    FROM inserted AS I

    IF (select count(*) from PROPOSE where PROPOSE.Numplat = @Numplat) > 3 - 1
        BEGIN
            RAISERROR (@mess1,16,1)
        END
    ELSE
        IF @action = 'U'
            BEGIN
                RAISERROR (@mess2,16,1)
            END
        ELSE
            IF @action = 'I'
                BEGIN
                    INSERT INTO PROPOSE
                    VALUES (@Numvin,
                            @Numplat)
                END

END