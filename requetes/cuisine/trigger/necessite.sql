CREATE TRIGGER [ctrl_necessite]
    ON [NECESSITE]
    instead of INSERT, UPDATE AS
BEGIN
    SET NOCOUNT ON
    DECLARE
        @Numplat int,
        @Numdenree int,
        @Qtedenree float,
        @action char(1),
        @mess1 char(50),
        @mess2 char(50)
    set @mess1 = N'La durée de préparation doit être positive.'
    set @mess2 = N'La durée de cuisson doit être positive.'

    IF EXISTS (SELECT * FROM DELETED)
        BEGIN
            SET @action = 'U'
        END
    ELSE
        BEGIN
            SET @action = 'I'
        END

    SELECT @Numplat = I.Numplat,
           @Numdenree = I.Numdenree,
           @Qtedenree = I.Qtedenree
    FROM inserted AS I

    IF @Qtedenree <= 0
        BEGIN
            RAISERROR (@mess1,16,1)
        END
    ELSE
        IF @action = 'I'
            BEGIN
                INSERT INTO NECESSITE
                VALUES (@Numdenree,
                        @Numplat,
                        @Qtedenree)
            END
        ELSE
            IF @action = 'U'
                BEGIN
                    UPDATE NECESSITE
                    SET Qtedenree = @Qtedenree
                    WHERE Numplat = @Numplat
                      AND Numdenree = @Numdenree
                END
END