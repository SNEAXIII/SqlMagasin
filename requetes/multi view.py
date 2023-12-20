from pyperclip import copy

result = ""
tab = ["Boulangerie-Patisserie", "Disques-Librairie", "Fruits et Légumes", "Fromage", "Pharmacie"]
for cat in tab:
    result += (f"""CREATE or ALTER view AJOUT_MODIF_{cat.upper().replace(" ", "").replace("-", "")} as
    select pr.Code_produit,
                    Désignation_produit,
                    PU_TTC_produit,
                    Tx_TVA_prod,
                    c.Libellé_catégorie,
                    m.No_magasin,
                    m.Nom_magasin
    from PRODUIT pr
             inner join dbo.CATEGORIE c on c.Code_catégorie = pr.Code_catégorie
             inner join dbo.POSSEDE po on pr.Code_produit = po.Code_produit
             inner join dbo.MAGASIN m on m.No_magasin = po.No_magasin
    where c.Libellé_catégorie = N'{cat}'
    with check option
go
""")
copy(result)