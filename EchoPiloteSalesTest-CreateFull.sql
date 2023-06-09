CREATE SCHEMA [ssisdbo]
GO


CREATE SCHEMA [ssisods]
GO


CREATE TABLE [ssisdbo].[Canal](
	[CanalID] [int] NOT NULL,
	[CanalDesc] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO


CREATE TABLE [ssisdbo].[Client](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[ClientDesc] [nvarchar](50) NOT NULL,
	[TypeClientID] [int] NOT NULL,
	[VilleID] [int] NOT NULL
) ON [PRIMARY]
GO


CREATE TABLE [ssisdbo].[Commercial](
	[CommercialID] [int] IDENTITY(1,1) NOT NULL,
	[CommercialDesc] [nvarchar](50) NOT NULL,
	[SuccursaleID] [int] NOT NULL
) ON [PRIMARY]
GO


CREATE TABLE [ssisdbo].[Objectif](
	[CommercialID] [int] NOT NULL,
	[DateObjectif] [datetime] NOT NULL,
	[Prix] [numeric](18, 5) NULL
) ON [PRIMARY]
GO


CREATE TABLE [ssisdbo].[Pays](
	[PaysID] [int] NOT NULL,
	[PaysDesc] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO


CREATE TABLE [ssisdbo].[Produit](
	[ProduitID] [int] NOT NULL,
	[ProduitDesc] [nvarchar](50) NULL,
	[GammeDesc] [nvarchar](50) NULL,
	[TypeProduitDesc] [nvarchar](50) NULL,
) ON [PRIMARY]
GO


CREATE TABLE [ssisods].[Produit](
	[ProduitID] [int] NOT NULL,
	[ProduitDesc] [nvarchar](50) NULL,
	[GammeDesc] [nvarchar](50) NULL,
	[TypeProduitDesc] [nvarchar](50) NULL,
) ON [PRIMARY]
GO


CREATE TABLE [ssisdbo].[Succursale](
	[SuccursaleID] [int] IDENTITY(1,1) NOT NULL,
	[SuccursaleDesc] [nvarchar](50) NOT NULL,
	[PaysID] [int] NOT NULL
) ON [PRIMARY]
GO


CREATE TABLE [ssisdbo].[TypeClient](
	[TypeClientID] [int] IDENTITY(1,1) NOT NULL,
	[TypeClientDesc] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO


CREATE TABLE [ssisdbo].[Vente](
	[ClientID] [int] NOT NULL,
	[ProduitID] [int] NOT NULL,
	[CommercialID] [int] NOT NULL,
	[CanalID] [int] NOT NULL,
	[DateVente] [datetime] NOT NULL,
	[Quantite] [int] NULL,
	[Prix] [numeric](18, 5) NULL,
	[Remise] [numeric](18, 5) NULL,
	[Cout] [numeric](18, 5) NULL
) ON [PRIMARY]
GO


CREATE TABLE [ssisdbo].[Ville](
	[VilleID] [int] NOT NULL,
	[VilleDesc] [nvarchar](50) NOT NULL,
	[CodePostal] [nvarchar](50) NOT NULL,
	[PaysID] [int] NOT NULL
) ON [PRIMARY]
GO


CREATE TABLE [ssisdbo].[zSourcesListe](
	[tableName] [nvarchar](255) NULL,
	[sourceType] [nvarchar](255) NULL,
	[alimType] [nvarchar](255) NULL,
	[lastUpdate] [datetime] NULL,
	[fileName] [nvarchar](255) NULL,
	[lastUpdateStatus] [nvarchar](5) NULL
) ON [PRIMARY]
GO


CREATE TABLE [ssisods].[Vente](
	[ClientID] [int] NOT NULL,
	[ProduitID] [int] NOT NULL,
	[CommercialID] [int] NOT NULL,
	[CanalID] [int] NOT NULL,
	[DateVente] [datetime] NOT NULL,
	[Quantite] [int] NULL,
	[Prix] [numeric](18, 5) NULL,
	[Remise] [numeric](18, 5) NULL,
	[Cout] [numeric](18, 5) NULL
) ON [PRIMARY]
GO


SET IDENTITY_INSERT [ssisdbo].[TypeClient] ON 

INSERT [ssisdbo].[TypeClient] ([TypeClientID], [TypeClientDesc]) VALUES (1, N'Grands magasins')
INSERT [ssisdbo].[TypeClient] ([TypeClientID], [TypeClientDesc]) VALUES (2, N'Indépendants')
INSERT [ssisdbo].[TypeClient] ([TypeClientID], [TypeClientDesc]) VALUES (3, N'Grossistes')
INSERT [ssisdbo].[TypeClient] ([TypeClientID], [TypeClientDesc]) VALUES (4, N'Détaillants')
INSERT [ssisdbo].[TypeClient] ([TypeClientID], [TypeClientDesc]) VALUES (5, N'Magasins spécialisés')
SET IDENTITY_INSERT [ssisdbo].[TypeClient] OFF
GO


INSERT [ssisdbo].[zSourcesListe] ([tableName], [sourceType], [alimType], [lastUpdate], [fileName], [lastUpdateStatus]) 
VALUES (N'[ssisdbo].[Canal]', N'csv', N'full', NULL, N'Canal.csv', NULL)
INSERT [ssisdbo].[zSourcesListe] ([tableName], [sourceType], [alimType], [lastUpdate], [fileName], [lastUpdateStatus]) 
VALUES (N'[ssisdbo].[Client]', N'csv', N'slow', NULL, N'Client.csv', NULL)
INSERT [ssisdbo].[zSourcesListe] ([tableName], [sourceType], [alimType], [lastUpdate], [fileName], [lastUpdateStatus]) 
VALUES (N'[ssisdbo].[Commercial]', N'csv', N'full', NULL, N'Commercial.csv', NULL)
INSERT [ssisdbo].[zSourcesListe] ([tableName], [sourceType], [alimType], [lastUpdate], [fileName], [lastUpdateStatus]) 
VALUES (N'[ssisdbo].[Objectif]', N'csv', N'delta', NULL, N'Objectif.csv', NULL)
INSERT [ssisdbo].[zSourcesListe] ([tableName], [sourceType], [alimType], [lastUpdate], [fileName], [lastUpdateStatus]) 
VALUES (N'[ssisdbo].[Pays]', N'blob', N'full', NULL, NULL, NULL)
INSERT [ssisdbo].[zSourcesListe] ([tableName], [sourceType], [alimType], [lastUpdate], [fileName], [lastUpdateStatus]) 
VALUES (N'[ssisdbo].[Produit]', N'csv', N'full', NULL, N'Produit.csv', NULL)
INSERT [ssisdbo].[zSourcesListe] ([tableName], [sourceType], [alimType], [lastUpdate], [fileName], [lastUpdateStatus]) 
VALUES (N'[ssisdbo].[Succursale]', N'csv', N'full', NULL, N'Succursale.csv', NULL)
INSERT [ssisdbo].[zSourcesListe] ([tableName], [sourceType], [alimType], [lastUpdate], [fileName], [lastUpdateStatus]) 
VALUES (N'[ssisdbo].[TypeClient]', N'csv', N'full', NULL, N'TypeClient.csv', NULL)
INSERT [ssisdbo].[zSourcesListe] ([tableName], [sourceType], [alimType], [lastUpdate], [fileName], [lastUpdateStatus]) 
VALUES (N'[ssisdbo].[Vente]', N'csv', N'delta', NULL, N'Vente.csv', NULL)
INSERT [ssisdbo].[zSourcesListe] ([tableName], [sourceType], [alimType], [lastUpdate], [fileName], [lastUpdateStatus]) 
VALUES (N'[ssisdbo].[Ville]', N'blob', N'full', NULL, NULL, NULL)
GO
