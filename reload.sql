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
INSERT INTO CATEGORIE (Code_catégorie,Lib_catégorie) VALUES ('BP','Boulangerie-Patisse');
INSERT INTO CATEGORIE (Code_catégorie,Lib_catégorie) VALUES ('DL','Disques-Librairie');
INSERT INTO CATEGORIE (Code_catégorie,Lib_catégorie) VALUES ('EM','Electro-Ménager');
INSERT INTO CATEGORIE (Code_catégorie,Lib_catégorie) VALUES ('FL','Fruits et Légumes');
INSERT INTO CATEGORIE (Code_catégorie,Lib_catégorie) VALUES ('FR','Fromage');
INSERT INTO CATEGORIE (Code_catégorie,Lib_catégorie) VALUES ('HF','HI-FI');
INSERT INTO CATEGORIE (Code_catégorie,Lib_catégorie) VALUES ('PH','Pharmacie');
INSERT INTO PRODUIT (Code_produit,Designation_prod,Pu_TTC_prod,Tx_TVA_prod,Code_catégorie) VALUES ('BA001','Bananes 1ère catégorie', 2.15 ,5.5,'FL');
INSERT INTO PRODUIT (Code_produit,Designation_prod,Pu_TTC_prod,Tx_TVA_prod,Code_catégorie) VALUES ('CD666','CD ROM Le Louvre', 38.00 ,20,'DL');
INSERT INTO PRODUIT (Code_produit,Designation_prod,Pu_TTC_prod,Tx_TVA_prod,Code_catégorie) VALUES ('CO124','Coton hydrophyl', 1.50 ,2.1,'PH');
INSERT INTO PRODUIT (Code_produit,Designation_prod,Pu_TTC_prod,Tx_TVA_prod,Code_catégorie) VALUES ('DI550','CD Audio Claude François Compilation Ref:PL78945', 19.00 ,20,'DL');
INSERT INTO PRODUIT (Code_produit,Designation_prod,Pu_TTC_prod,Tx_TVA_prod,Code_catégorie) VALUES ('END01','Endives 1kg', 1.30 ,5.5,'FL');
INSERT INTO PRODUIT (Code_produit,Designation_prod,Pu_TTC_prod,Tx_TVA_prod,Code_catégorie) VALUES ('FN12P','Forêt Noire 12 personnes', 13.80 ,5.5,'BP');
INSERT INTO PRODUIT (Code_produit,Designation_prod,Pu_TTC_prod,Tx_TVA_prod,Code_catégorie) VALUES ('FO088','Four Scholtès Pyrolyse modèle Sch088', 305.00 ,20,'EM');
INSERT INTO PRODUIT (Code_produit,Designation_prod,Pu_TTC_prod,Tx_TVA_prod,Code_catégorie) VALUES ('FR123','Comté 1/2 Sel 1er choix', 8.50 ,5.5,'FR');
INSERT INTO PRODUIT (Code_produit,Designation_prod,Pu_TTC_prod,Tx_TVA_prod,Code_catégorie) VALUES ('FR657','Roquefort Société coupe', 13.00 ,5.5,'FR');
INSERT INTO PRODUIT (Code_produit,Designation_prod,Pu_TTC_prod,Tx_TVA_prod,Code_catégorie) VALUES ('FR743','Ptit Louis 12 portions', 1.50 ,5.5,'FR');
INSERT INTO PRODUIT (Code_produit,Designation_prod,Pu_TTC_prod,Tx_TVA_prod,Code_catégorie) VALUES ('LP478','Livre Poche RAMSES Ch. Jack', 20.00 ,20,'DL');
INSERT INTO PRODUIT (Code_produit,Designation_prod,Pu_TTC_prod,Tx_TVA_prod,Code_catégorie) VALUES ('NE120','Neurofen pastilles', 5.42 ,2.1,'PH');
INSERT INTO PRODUIT (Code_produit,Designation_prod,Pu_TTC_prod,Tx_TVA_prod,Code_catégorie) VALUES ('PA250','Baguette 250 g normale', 0.50 ,5.5,'BP');
INSERT INTO PRODUIT (Code_produit,Designation_prod,Pu_TTC_prod,Tx_TVA_prod,Code_catégorie) VALUES ('PA251','Baguette 250 g campagne', 0.70 ,5.5,'BP');
INSERT INTO PRODUIT (Code_produit,Designation_prod,Pu_TTC_prod,Tx_TVA_prod,Code_catégorie) VALUES ('PA400','Pain 400 g normal', 0.70 ,5.50,'BP');
INSERT INTO PRODUIT (Code_produit,Designation_prod,Pu_TTC_prod,Tx_TVA_prod,Code_catégorie) VALUES ('RF001','Réfrigérateur Zanussi 100 l',Null,20,'EM');
INSERT INTO PRODUIT (Code_produit,Designation_prod,Pu_TTC_prod,Tx_TVA_prod,Code_catégorie) VALUES ('RF145','Réfrigérateur combi Scholtès 250 l', 380.00 ,20,'EM');
INSERT INTO PRODUIT (Code_produit,Designation_prod,Pu_TTC_prod,Tx_TVA_prod,Code_catégorie) VALUES ('SC002','Scarole X2', 1.40 ,5.5,'FL');
INSERT INTO PRODUIT (Code_produit,Designation_prod,Pu_TTC_prod,Tx_TVA_prod,Code_catégorie) VALUES ('SPA15','Sparadrap', 3.00 ,2.1,'PH');
INSERT INTO PRODUIT (Code_produit,Designation_prod,Pu_TTC_prod,Tx_TVA_prod,Code_catégorie) VALUES ('TV105','Télévision 36 cm Brandt couleur modèle br105', 145.00 ,20,'HF');
INSERT INTO PRODUIT (Code_produit,Designation_prod,Pu_TTC_prod,Tx_TVA_prod,Code_catégorie) VALUES ('TV406','Télévision 71 cm Sony couleur modèle son406', 302.00 ,20,'HF');
INSERT INTO PRODUIT (Code_produit,Designation_prod,Pu_TTC_prod,Tx_TVA_prod,Code_catégorie) VALUES ('TV666','Télévision 71 cm Grundig couleur modèle gr666', 533.00 ,20,'HF');
INSERT INTO PRODUIT (Code_produit,Designation_prod,Pu_TTC_prod,Tx_TVA_prod,Code_catégorie) VALUES ('TV985','Télévision 55 cm Brandt couleur modèle br 985', 240.00 ,20,'HF');
INSERT INTO MAGASIN (No_magasin,Nom_magasin,No_rue_magasin,Lib_rue_magasin,CP_magasin,Ville_magasin) VALUES (1,'Dourty Lyon 1','10z','Rue des Alouettes',69000,'Lyon');
INSERT INTO MAGASIN (No_magasin,Nom_magasin,No_rue_magasin,Lib_rue_magasin,CP_magasin,Ville_magasin) VALUES (2,'Dourty Lyon 2',8,'Allée des dames',69000,'Lyon');
INSERT INTO MAGASIN (No_magasin,Nom_magasin,No_rue_magasin,Lib_rue_magasin,CP_magasin,Ville_magasin) VALUES (3,'InterPrice',5,'Rue des inventeurs fous',90000,'Belfort');
INSERT INTO MAGASIN (No_magasin,Nom_magasin,No_rue_magasin,Lib_rue_magasin,CP_magasin,Ville_magasin) VALUES (4,'Big Farm',14,'Avenue des Fusillés',25000,'Besançon');
INSERT INTO MAGASIN (No_magasin,Nom_magasin,No_rue_magasin,Lib_rue_magasin,CP_magasin,Ville_magasin) VALUES (5,'Stop AFFAIRES',Null,Null,67000,'Strasbourg');
INSERT INTO EMPLOYE (No_employé,Nom_employé,No_rue_employé,Lib_rue_employé,CP_employé,Ville_employé,Date_embauche,No_magasin) VALUES (21,'TRIPONNET',25,'Rue Lino Ventura',67000,'Strasbourg','14/01/1987',5);
INSERT INTO EMPLOYE (No_employé,Nom_employé,No_rue_employé,Lib_rue_employé,CP_employé,Ville_employé,Date_embauche,No_magasin) VALUES (22,'DUPONT',14,'Allée des dames',90100,'Fontaine','14/12/1995',3);
INSERT INTO EMPLOYE (No_employé,Nom_employé,No_rue_employé,Lib_rue_employé,CP_employé,Ville_employé,Date_embauche,No_magasin) VALUES (74,'MALLET',39,'Boulevard Clovis',67000,'Strasbourg','12/10/1997',5);
INSERT INTO EMPLOYE (No_employé,Nom_employé,No_rue_employé,Lib_rue_employé,CP_employé,Ville_employé,Date_embauche,No_magasin) VALUES (78,'ZIMMERMANN',70,'Rue de la Liberté',25660,'Morre','01/02/1983',4);
INSERT INTO EMPLOYE (No_employé,Nom_employé,No_rue_employé,Lib_rue_employé,CP_employé,Ville_employé,Date_embauche,No_magasin) VALUES (100,'DUPOND',30,'route de Paris',69000,'Lyon','25/10/1995',1);
INSERT INTO EMPLOYE (No_employé,Nom_employé,No_rue_employé,Lib_rue_employé,CP_employé,Ville_employé,Date_embauche,No_magasin) VALUES (122,'DURAND',100,'Allée de la Résistance',90000,'Belfort','25/10/1990',3);
INSERT INTO EMPLOYE (No_employé,Nom_employé,No_rue_employé,Lib_rue_employé,CP_employé,Ville_employé,Date_embauche,No_magasin) VALUES (130,'STOCKLIN',256,'Rue Mermoz',90000,'Belfort','02/08/1994',3);
INSERT INTO EMPLOYE (No_employé,Nom_employé,No_rue_employé,Lib_rue_employé,CP_employé,Ville_employé,Date_embauche,No_magasin) VALUES (140,'MARTIN',12,'Avenue Charles De Gaulle',69000,'Lyon','24/10/1995',1);
INSERT INTO EMPLOYE (No_employé,Nom_employé,No_rue_employé,Lib_rue_employé,CP_employé,Ville_employé,Date_embauche,No_magasin) VALUES (144,'MARTIN',140,'Boulevard des marmottes',69200,'Villeurbanne','14/01/1984',2);
INSERT INTO EMPLOYE (No_employé,Nom_employé,No_rue_employé,Lib_rue_employé,CP_employé,Ville_employé,Date_embauche,No_magasin) VALUES (145,'AFFALOU',145,'Avenue de Ile de France',67000,'Strasbourg','14/01/1979',5);
INSERT INTO EMPLOYE (No_employé,Nom_employé,No_rue_employé,Lib_rue_employé,CP_employé,Ville_employé,Date_embauche,No_magasin) VALUES (154,'LIENARD',1001,'zazazazaz',90400,'Bavilliers','18/05/1991',3);
INSERT INTO EMPLOYE (No_employé,Nom_employé,No_rue_employé,Lib_rue_employé,CP_employé,Ville_employé,Date_embauche,No_magasin) VALUES (451,'LEMAIRE',15,'Boulevard Fr Mitterand',69000,'Lyon','12/07/1997',2);
INSERT INTO EMPLOYE (No_employé,Nom_employé,No_rue_employé,Lib_rue_employé,CP_employé,Ville_employé,Date_embauche,No_magasin) VALUES (645,'OSSE',25,'Avenue des oiseaux',67100,'Illkirch','06/01/1985',5);
INSERT INTO EMPLOYE (No_employé,Nom_employé,No_rue_employé,Lib_rue_employé,CP_employé,Ville_employé,Date_embauche,No_magasin) VALUES (654,'VIEILLE',23,'Avenue Foch',69000,'Lyon','13/07/1993',1);
INSERT INTO EMPLOYE (No_employé,Nom_employé,No_rue_employé,Lib_rue_employé,CP_employé,Ville_employé,Date_embauche,No_magasin) VALUES (666,'MARTIN',36,'Rue des artisans',90000,'Belfort','20/06/1975',3);
INSERT INTO EMPLOYE (No_employé,Nom_employé,No_rue_employé,Lib_rue_employé,CP_employé,Ville_employé,Date_embauche,No_magasin) VALUES (743,'DUPONT',45,'Allée des marronniers',25000,'Besançon','18/03/1987',4);
INSERT INTO EMPLOYE (No_employé,Nom_employé,No_rue_employé,Lib_rue_employé,CP_employé,Ville_employé,Date_embauche,No_magasin) VALUES (748,'POULLAINE',1001,'Grande Rue',25660,'Morre','14/10/1987',4);
INSERT INTO EMPLOYE (No_employé,Nom_employé,No_rue_employé,Lib_rue_employé,CP_employé,Ville_employé,Date_embauche,No_magasin) VALUES (776,'SIMONIN',10,'Rue des sapins',68000,'Colmar','23/02/1986',5);
INSERT INTO EMPLOYE (No_employé,Nom_employé,No_rue_employé,Lib_rue_employé,CP_employé,Ville_employé,Date_embauche,No_magasin) VALUES (777,'AZZAOUI',10,'Rue Charlemagne',67000,'Strasbourg','11/02/1996',5);
INSERT INTO EMPLOYE (No_employé,Nom_employé,No_rue_employé,Lib_rue_employé,CP_employé,Ville_employé,Date_embauche,No_magasin) VALUES (810,'ARBISON',147,'Rue du Maréchal Joffre',69200,'Villeurbanne','12/12/1994',1);
INSERT INTO EMPLOYE (No_employé,Nom_employé,No_rue_employé,Lib_rue_employé,CP_employé,Ville_employé,Date_embauche,No_magasin) VALUES (887,'RUFFENACH',45,'Route des escargots',69000,'Lyon','30/07/1979',2);
INSERT INTO EMPLOYE (No_employé,Nom_employé,No_rue_employé,Lib_rue_employé,CP_employé,Ville_employé,Date_embauche,No_magasin) VALUES (999,'LEONCE',158,'Allée des mimosas',69000,'Lyon','14/02/1998',2);
INSERT INTO EMPLOYE (No_employé,Nom_employé,No_rue_employé,Lib_rue_employé,CP_employé,Ville_employé,Date_embauche,No_magasin) VALUES (1010,'LOUIS',5,'Rue Jules Ferry',90000,'Belfort','10/02/1998',4);
INSERT INTO EMPLOYE (No_employé,Nom_employé,No_rue_employé,Lib_rue_employé,CP_employé,Ville_employé,Date_embauche,No_magasin) VALUES (1647,'PERRIN',90,'Place du commerce',90100,'Fontaine','10/07/1987',3);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('BA001',78,'16/03/2021',12);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('BA001',144,'15/03/2021',10);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('BA001',144,'16/03/2021',12.5);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('CD666',130,'14/03/2021',4);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('CD666',140,'15/03/2021',5);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('CD666',654,'16/03/2021',10);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('CD666',1647,'14/03/2021',8);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('DI550',130,'16/03/2021',10);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('DI550',654,'14/03/2021',4);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('DI550',654,'15/03/2021',14);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('DI550',1647,'14/03/2021',6);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('END01',999,'15/03/2021',10);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('FN12P',21,'16/03/2021',2);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('FN12P',645,'16/03/2021',8);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('FN12P',743,'16/03/2021',5);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('FO088',122,'16/03/2021',4);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('FO088',810,'15/03/2021',5);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('FR123',78,'12/03/2021',8.5);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('FR123',748,'16/03/2021',10.5);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('FR657',743,'12/03/2021',5.5);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('FR657',887,'12/03/2021',6.7);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('FR657',887,'16/03/2021',4);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('LP478',654,'16/03/2021',11);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('NE120',74,'16/03/2021',2);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('NE120',145,'16/03/2021',4);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('NE120',451,'16/03/2021',4);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('PA250',74,'16/03/2021',90);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('PA400',74,'16/03/2021',60);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('RF145',140,'16/03/2021',3);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('RF145',154,'16/03/2021',4);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('SC002',645,'16/03/2021',9);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('SC002',776,'12/03/2021',10);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('SC002',777,'13/03/2021',12);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('SPA15',21,'16/03/2021',6);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('SPA15',451,'10/03/2021',5);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('SPA15',999,'12/03/2021',10);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('TV105',100,'15/03/2021',2);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('TV105',140,'16/03/2021',1);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('TV105',654,'15/03/2021',1);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('TV105',1647,'16/03/2021',2);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('TV406',666,'16/03/2021',2);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('TV985',100,'16/03/2021',2);
INSERT INTO VEND (Code_produit,No_Employé,Date_vente,Qté_vendue) VALUES ('TV985',140,'16/03/2021',3);
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (1,'CD666');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (1,'DI550');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (1,'FO088');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (1,'LP478');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (1,'RF001');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (1,'RF145');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (1,'TV105');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (1,'TV406');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (1,'TV666');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (1,'TV985');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (2,'BA001');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (2,'CO124');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (2,'END01');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (2,'FR123');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (2,'FR657');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (2,'FR743');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (2,'NE120');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (2,'SC002');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (2,'SPA15');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (3,'CD666');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (3,'DI550');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (3,'FO088');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (3,'LP478');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (3,'RF001');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (3,'RF145');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (3,'TV105');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (3,'TV406');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (3,'TV666');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (3,'TV985');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (4,'BA001');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (4,'END01');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (4,'FN12P');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (4,'FR123');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (4,'FR657');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (4,'FR743');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (4,'PA250');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (4,'PA251');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (4,'PA400');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (4,'SC002');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (5,'CO124');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (5,'END01');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (5,'FN12P');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (5,'FR123');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (5,'FR657');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (5,'NE120');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (5,'PA250');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (5,'PA251');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (5,'PA400');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (5,'SC002');
INSERT INTO POSSEDE (No_magasin,Code_produit) VALUES (5,'SPA15');
