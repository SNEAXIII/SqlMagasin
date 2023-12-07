CREATE TRIGGER [crtl_employe] ON EMPLOYE
    instead of INSERT, UPDATE
    AS


BEGIN
    SET NOCOUNT ON
    DECLARE
        @No_employé int,
        @Nom_employé char(30),
        @Prénom_employé char(30),
        @No_rue_employé char(10),
        @Lib_rue_employé char(50),
        @CP_employé char(5),
        @Ville_employé char(30),
        @Date_embauche date,
        @No_magasin int,
        @action char(1),
        @message2 char(<<WQAASX     Aésaxascf'sS'>>)

    set @message2 = N'Cet employé ne peut pas avoir une date d'+char(39)+N'embauche supérieure à la date du jour !'

    IF EXISTS(SELECT * FROM DELETED)
        BEGIN
            SET @action='U'
        END
    ELSE
        BEGIN
            SET @action='I'
        END

    SELECT @No_employé = I.No_employé,
           @Nom_employé = I.Nom_employé,
           @Prénom_employé = I.Prénom_employé,
           @No_rue_employé = I.No_rue_employé,
           @Lib_rue_employé = I.Lib_rue_employé,
           @CP_employé = I.CP_employé,
           @Ville_employé = I.Ville_employé,
           @Date_embauche = I.Date_embauche ,
           @No_magasin = I.No_magasin
    FROM inserted AS I

    IF NOT CAST(@CP_employé as INT) BETWEEN 1000 AND 95999
        BEGIN
            RAISERROR(N'Cet employé doit avoir un code postal en métropole ! (Entre 01000 et 95999)',16,1)
        END

    ELSE IF @Date_embauche > (SELECT CAST(GETDATE() AS date))
        BEGIN
            RAISERROR(@message2,16,1)
        END


    ELSE IF @action = 'I'
        BEGIN
            INSERT INTO EMPLOYE
            VALUES (@No_magasin,
                    @Nom_employé,
                    @Prénom_employé,
                    @No_rue_employé,
                    @Lib_rue_employé,
                    @CP_employé,
                    @Ville_employé,
                    @Date_embauche,
                    @No_magasin)
        END
    ELSE IF @action = 'U'
        BEGIN
            UPDATE EMPLOYE
            SET CP_employé = @CP_employé, Date_embauche = @Date_embauche
            WHERE No_employé = @No_employé
        END
END



