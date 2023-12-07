CREATE TABLE [dbo].[CUISINIER]
(
    [Numcuisinier] [int]         NOT NULL,
    [Nomcuisinier] [varchar](20) NOT NULL,
    [Dateembauche] [date]        NOT NULL,
    [Numcuisine]   [int]         NOT NULL,
    CONSTRAINT [Pk_Cuisinier] PRIMARY KEY CLUSTERED
        (
         [Numcuisinier] ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]