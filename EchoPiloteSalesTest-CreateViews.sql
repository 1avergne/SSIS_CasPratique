create or alter view [ssisdbo].[DimClient]
as
select c.[ClientID]
, c.[ClientDesc]
, t.[TypeClientDesc]
, v.[CodePostal]
, v.[VilleDesc]
, p.[PaysDesc]
from [ssisdbo].[Client] c
inner join [ssisdbo].[TypeClient] t on t.TypeClientID = c.TypeClientID
inner join [ssisdbo].[Ville] v on v.[VilleID] = c.[VilleID]
inner join [ssisdbo].[Pays] p on p.PaysID = v.PaysID
GO

create or alter view [ssisdbo].[DimCommercial]
as
select c.[CommercialID]
, c.[CommercialDesc]
, s.[SuccursaleDesc]
, p.[PaysDesc]
from [ssisdbo].[Commercial] c
inner join [ssisdbo].[Succursale] s on s.[SuccursaleID] = c.[SuccursaleID]
inner join [ssisdbo].[Pays] p on p.[PaysID] = s.[PaysID]
GO