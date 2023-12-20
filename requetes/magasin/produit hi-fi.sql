CREATE view viewProduitHF as
    select Code_produit, Désignation_produit, PU_TTC_produit, Tx_TVA_prod
    from PRODUIT p
             inner join dbo.CATEGORIE c on c.Code_catégorie = p.Code_catégorie
    where c.Libellé_catégorie = 'hi-fi'
go