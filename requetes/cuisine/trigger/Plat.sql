CREATE TRIGGER [ctrl_plat]
    ON [PLAT]
    instead of INSERT, UPDATE AS
BEGIN
    SET NOCOUNT ON
    DECLARE
        @Numplat int,
        @Nomplat varchar(50),
        @Dureeprepa int,
        @Dureecuisson int,
        @Numcat int,
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
           @Nomplat = I.Nomplat,
           @Dureeprepa = I.Dureeprepa,
           @Dureecuisson = I.Dureecuisson,
           @Numcat = I.Numcat
    FROM inserted AS I

    IF @Dureeprepa <= 0
        BEGIN
            RAISERROR (@mess1,16,1)
        END
    else
        IF @Dureecuisson <= 0
            BEGIN
                RAISERROR (@mess2,16,1)
            END
        ELSE
            IF @action = 'I'
                BEGIN
                    INSERT INTO PLAT
                    VALUES (@Nomplat,
                            @Dureeprepa,
                            @Dureecuisson,
                            @Numcat)
                END
            ELSE
                IF @action = 'U'
                    BEGIN
                        UPDATE PLAT
                        SET Nomplat      = @Nomplat,
                            Dureeprepa   = @Dureeprepa,
                            Dureecuisson = @Dureecuisson,
                            Numcat       = @Numcat
                        WHERE Numplat = @Numplat
                    END
END