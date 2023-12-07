SELECT E.No_employé, E.Nom_employé, E.Date_embauche, M.Nom_magasin
FROM EMPLOYE E INNER JOIN MAGASIN M ON M.No_magasin = E.No_magasin
WHERE Date_embauche < (SELECT Date_embauche FROM EMPLOYE WHERE nom_employé='ARBISON');
