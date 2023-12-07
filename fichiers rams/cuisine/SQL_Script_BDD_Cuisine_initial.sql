
CREATE DATABASE [CUISINES_BASSIGNOT]
GO
USE [CUISINES_BASSIGNOT]
GO
/****** Object:  Table [dbo].[ATELIER_CUISINE]    Script Date: 01/12/2022 09:31:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATELIER_CUISINE](
	[Numcuisine] [int] IDENTITY(1,1) NOT NULL,
	[Telcuisine] [varchar](20) NOT NULL,
	[Numcuisinier] [int] NULL,
 CONSTRAINT [Pk_Atelier_cuisine] PRIMARY KEY CLUSTERED 
(
	[Numcuisine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIE]    Script Date: 01/12/2022 09:31:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIE](
	[Numcat] [int] NOT NULL,
	[Libcat] [varchar](50) NOT NULL,
 CONSTRAINT [Pk_Categorie] PRIMARY KEY CLUSTERED 
(
	[Numcat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUISINIER]    Script Date: 01/12/2022 09:31:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUISINIER](
	[Numcuisinier] [int] NOT NULL,
	[Nomcuisinier] [varchar](20) NOT NULL,
	[Dateembauche] [date] NOT NULL,
	[Numcuisine] [int] NOT NULL,
 CONSTRAINT [Pk_Cuisinier] PRIMARY KEY CLUSTERED 
(
	[Numcuisinier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DENREE]    Script Date: 01/12/2022 09:31:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DENREE](
	[Numdenree] [int] IDENTITY(1,1) NOT NULL,
	[Libdenree] [varchar](50) NOT NULL,
 CONSTRAINT [Pk_Denree] PRIMARY KEY CLUSTERED 
(
	[Numdenree] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NECESSITE]    Script Date: 01/12/2022 09:31:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NECESSITE](
	[Numdenree] [int] NOT NULL,
	[Numplat] [int] NOT NULL,
	[Qtedenree] [float] NOT NULL,
 CONSTRAINT [Pk_Necessite] PRIMARY KEY CLUSTERED 
(
	[Numdenree] ASC,
	[Numplat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PLAT]    Script Date: 01/12/2022 09:31:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PLAT](
	[Numplat] [int] IDENTITY(1,1) NOT NULL,
	[Nomplat] [varchar](50) NOT NULL,
	[Dureeprepa] [int] NOT NULL,
	[Dureecuisson] [int] NOT NULL,
	[Numcat] [int] NOT NULL,
 CONSTRAINT [Pk_Plat] PRIMARY KEY CLUSTERED 
(
	[Numplat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PREPARE]    Script Date: 01/12/2022 09:31:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PREPARE](
	[Numplat] [int] NOT NULL,
	[Numcuisine] [int] NOT NULL,
	[Dateprepa] [date] NOT NULL,
	[Nbreplats] [int] NOT NULL,
 CONSTRAINT [Pk_Prepare] PRIMARY KEY CLUSTERED 
(
	[Numplat] ASC,
	[Numcuisine] ASC,
	[Dateprepa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROPOSE]    Script Date: 01/12/2022 09:31:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROPOSE](
	[Numvin] [int] NOT NULL,
	[Numplat] [int] NOT NULL,
 CONSTRAINT [Pk_Propose] PRIMARY KEY CLUSTERED 
(
	[Numvin] ASC,
	[Numplat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VIN]    Script Date: 01/12/2022 09:31:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VIN](
	[Numvin] [int] IDENTITY(1,1) NOT NULL,
	[Libvin] [varchar](50) NOT NULL,
 CONSTRAINT [Pk_Vin] PRIMARY KEY CLUSTERED 
(
	[Numvin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ATELIER_CUISINE]  WITH CHECK ADD  CONSTRAINT [Fk_Atelier_cuisine_Cuisinier] FOREIGN KEY([Numcuisinier])
REFERENCES [dbo].[CUISINIER] ([Numcuisinier])
GO
ALTER TABLE [dbo].[ATELIER_CUISINE] CHECK CONSTRAINT [Fk_Atelier_cuisine_Cuisinier]
GO
ALTER TABLE [dbo].[CUISINIER]  WITH CHECK ADD  CONSTRAINT [Fk_Cuisinier_Atelier_Cuisine] FOREIGN KEY([Numcuisine])
REFERENCES [dbo].[ATELIER_CUISINE] ([Numcuisine])
GO
ALTER TABLE [dbo].[CUISINIER] CHECK CONSTRAINT [Fk_Cuisinier_Atelier_Cuisine]
GO
ALTER TABLE [dbo].[NECESSITE]  WITH CHECK ADD  CONSTRAINT [Fk_Necessite_Denree] FOREIGN KEY([Numdenree])
REFERENCES [dbo].[DENREE] ([Numdenree])
GO
ALTER TABLE [dbo].[NECESSITE] CHECK CONSTRAINT [Fk_Necessite_Denree]
GO
ALTER TABLE [dbo].[NECESSITE]  WITH CHECK ADD  CONSTRAINT [Fk_Necessite_Plat] FOREIGN KEY([Numplat])
REFERENCES [dbo].[PLAT] ([Numplat])
GO
ALTER TABLE [dbo].[NECESSITE] CHECK CONSTRAINT [Fk_Necessite_Plat]
GO
ALTER TABLE [dbo].[PLAT]  WITH CHECK ADD  CONSTRAINT [Fk_Plat_Categorie] FOREIGN KEY([Numcat])
REFERENCES [dbo].[CATEGORIE] ([Numcat])
GO
ALTER TABLE [dbo].[PLAT] CHECK CONSTRAINT [Fk_Plat_Categorie]
GO
ALTER TABLE [dbo].[PREPARE]  WITH CHECK ADD  CONSTRAINT [Fk_Prepare_Cuisine] FOREIGN KEY([Numcuisine])
REFERENCES [dbo].[ATELIER_CUISINE] ([Numcuisine])
GO
ALTER TABLE [dbo].[PREPARE] CHECK CONSTRAINT [Fk_Prepare_Cuisine]
GO
ALTER TABLE [dbo].[PREPARE]  WITH CHECK ADD  CONSTRAINT [Fk_Prepare_Plat] FOREIGN KEY([Numplat])
REFERENCES [dbo].[PLAT] ([Numplat])
GO
ALTER TABLE [dbo].[PREPARE] CHECK CONSTRAINT [Fk_Prepare_Plat]
GO
ALTER TABLE [dbo].[PROPOSE]  WITH CHECK ADD  CONSTRAINT [Fk_Propose_Plat] FOREIGN KEY([Numplat])
REFERENCES [dbo].[PLAT] ([Numplat])
GO
ALTER TABLE [dbo].[PROPOSE] CHECK CONSTRAINT [Fk_Propose_Plat]
GO
ALTER TABLE [dbo].[PROPOSE]  WITH CHECK ADD  CONSTRAINT [Fk_Propose_Vin] FOREIGN KEY([Numvin])
REFERENCES [dbo].[VIN] ([Numvin])
GO
ALTER TABLE [dbo].[PROPOSE] CHECK CONSTRAINT [Fk_Propose_Vin]
GO
/****** Object:  Trigger [dbo].[ctrl_atelier_cuisine]    Script Date: 01/12/2022 09:31:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

