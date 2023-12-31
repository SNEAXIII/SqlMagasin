CREATE TABLE CATEGORIE
(
Code_catégorie varchar(2) NOT NULL,
Libellé_catégorie varchar(30) NOT NULL,
CONSTRAINT PK_CATEGORIE PRIMARY KEY(Code_catégorie)
)
GO

CREATE TABLE PRODUIT
(
Code_produit varchar(5) NOT NULL,
Désignation_produit varchar(50) NOT NULL,
PU_TTC_produit float NULL,
Tx_TVA_prod float NOT NULL,
Code_catégorie varchar(2) NOT NULL,
CONSTRAINT PK_PRODUIT PRIMARY KEY (Code_produit),
CONSTRAINT FK_PRODUIT_CATEGORIE FOREIGN KEY (Code_catégorie) REFERENCES CATEGORIE(Code_catégorie)
)

GO

CREATE TABLE MAGASIN
(
No_magasin int IDENTITY(1,1) NOT NULL,
Nom_magasin varchar(40) NOT NULL,
No_rue_magasin varchar(10) NULL,
Lib_rue_magasin varchar(50) NULL,
CP_magasin varchar(5) NOT NULL,
Ville_magasin varchar(30) NOT NULL,
CONSTRAINT PK_MAGASIN PRIMARY KEY (No_magasin)
)
GO

CREATE TABLE EMPLOYE
(
No_employé int NOT NULL,
Nom_employé varchar(30) NOT NULL,
Prénom_employé varchar(30) NULL,
No_rue_employé varchar(10) NULL,
Lib_rue_employé varchar(50) NULL,
CP_employé varchar(5) NULL,
Ville_employé varchar(30) NULL,
Date_embauche date NULL,
No_magasin int NOT NULL,
CONSTRAINT PK_EMPLOYE PRIMARY KEY (No_employé),
CONSTRAINT FK_EMPLOYE_MAGASIN FOREIGN KEY (No_magasin) REFERENCES MAGASIN(No_magasin)
)
GO

CREATE TABLE POSSEDE
(
No_magasin int NOT NULL,
Code_produit varchar(5) NOT NULL,
CONSTRAINT PK_POSSEDE PRIMARY KEY (No_magasin,Code_produit),
CONSTRAINT FK_POSSEDE_MAGASIN FOREIGN KEY(No_magasin) REFERENCES MAGASIN(No_magasin),
CONSTRAINT FK_POSSEDE_PRODUIT FOREIGN KEY(Code_produit) REFERENCES PRODUIT(Code_produit)
)
GO

CREATE TABLE VEND
(
Code_produit varchar(5) NOT NULL,
No_employé int NOT NULL,
Date_vente date NOT NULL,
Qté_vendue [float] NOT NULL,
CONSTRAINT [PK_VEND] PRIMARY KEY(Code_produit,No_employé,Date_vente),
CONSTRAINT FK_VEND_PRODUIT FOREIGN KEY(Code_produit) REFERENCES PRODUIT(Code_produit),
CONSTRAINT FK_VEND_EMPLOYE FOREIGN KEY(No_employé) REFERENCES EMPLOYE(No_employé)  
)

