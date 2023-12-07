    select *
from MAGASIN M
         inner join (select No_magasin, count(*) as NB
                     from POSSEDE
                     group by No_magasin) as listAll on listAll.No_magasin = M.No_magasin
         inner join (select min(NB) as mini
                     from (select No_magasin, count(*) as NB
                           from POSSEDE
                           group by No_magasin)
                              as P1) as mini on mini.mini = listAll.NB

