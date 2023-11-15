select *
from MAGASIN
         inner join (select No_magasin, count(Code_produit) as nb_produit
                     from POSSEDE) as count_refere ON count_refere.No_magasin = MAGASIN.No_magasin
         inner join (select min(nb_produit) as min_reference_produit
                     from (select No_magasin, count(Code_produit) as nb_produit
                           from POSSEDE
                           group by No_magasin)
                              as count_refere2)
    as min_refere on min_refere.min_reference_produit = count_refere.nb_produit
