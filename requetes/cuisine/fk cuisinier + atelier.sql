ALTER TABLE [dbo].[ATELIER_CUISINE]
    WITH CHECK ADD CONSTRAINT [Fk_Atelier_cuisine_Cuisinier] FOREIGN KEY ([Numcuisinier])
        REFERENCES [dbo].[CUISINIER] ([Numcuisinier])

ALTER TABLE [dbo].[CUISINIER]
    WITH CHECK ADD CONSTRAINT [Fk_Cuisinier_Atelier_Cuisine] FOREIGN KEY ([Numcuisine])
        REFERENCES [dbo].[ATELIER_CUISINE] ([Numcuisine])