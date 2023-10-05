drop table VEND;
drop table POSSEDE;
drop table PRODUIT;
drop table EMPLOYE;
drop table MAGASIN;
drop table CATEGORIE;

CREATE TABLE CATEGORIE
(
    Code_catégorie varchar(2)  NOT NULL,
    Lib_catégorie  VARCHAR(20) NOT NULL,
    CONSTRAINT PK_catégorie PRIMARY KEY (code_catégorie)
);

create table PRODUIT
(
    Code_produit     varchar(5)  not null,
    Designation_prod varchar(80) not null,
    Pu_TTC_prod      decimal,
    Tx_TVA_prod      decimal     not null,
    Code_catégorie   varchar(2)  NOT NULL,
    CONSTRAINT PK_produit PRIMARY KEY (code_produit),
    constraint FK_produit FOREIGN KEY (Code_catégorie) references CATEGORIE (Code_catégorie)
);

create table MAGASIN
(
    No_magasin      int identity(1,1) not null,
    Nom_magasin     varchar(25) not null,
    No_rue_magasin  varchar(25),
    Lib_rue_magasin varchar(50),
    Cp_magasin      varchar(5)  not null,
    Ville_magasin   varchar(35) not null,
    constraint PK_magasin PRIMARY KEY (No_magasin)
);

create table EMPLOYE
(
    No_employé      int identity(1,1) not null,
    Nom_employé     varchar(25) not null,
    No_rue_employé  varchar(25),
    Lib_rue_employé varchar(50),
    CP_employé      varchar(5)  not null,
    Ville_employé   varchar(30) not null,
    Date_embauche   date        not null,
    No_magasin      int         not null,
    CONSTRAINT PK_employe PRIMARY KEY (No_employé),
    constraint FK_employe FOREIGN KEY (No_magasin) references MAGASIN (No_magasin)
);

create table POSSEDE
(
    No_magasin   int        not null,
    Code_produit varchar(5) not null,
    CONSTRAINT PK_possede1 PRIMARY KEY (No_magasin, Code_produit),
    constraint FK_employe1 FOREIGN KEY (No_magasin) references MAGASIN (No_magasin),
    constraint FK_employe2 FOREIGN KEY (Code_produit) references PRODUIT (Code_produit)
);

create table VEND
(
    Code_produit varchar(5) NOT NULL,
    No_employé   int        NOT NULL,
    Date_vente   date       NOT NULL,
    Qté_vendue   int        NOT NULL,
    CONSTRAINT PK_vend PRIMARY KEY (Code_produit, No_employé, Date_vente),
    CONSTRAINT FK_vend FOREIGN KEY (Code_produit) REFERENCES PRODUIT (Code_produit),
    CONSTRAINT FK_vend2 FOREIGN KEY (No_employé) REFERENCES EMPLOYE (No_employé)
);
