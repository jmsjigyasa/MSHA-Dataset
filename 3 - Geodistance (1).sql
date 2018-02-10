/*Microsoft SQL server database - MSHA dataset

Author:Jigyasa Kohli (jk423)
Class: IS 631 101 (FALL 2016)
Professor: James Markulic

*/

USE [MSHA]
GO
/****** Object:  StoredProcedure [dbo].[Calc_GEO_Distance]    Script Date: 3/20/2016 10:50:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		James Markulic
-- Create date: August 2015
-- Description:	IS631 Stored Procedure for Excel example for class project
-- =============================================
alter PROCEDURE [dbo].[Calc_GEO_Distance] (
	@longitude nvarchar(255),
	@latitude  nvarchar(255),
	@rows      nvarchar(255)
)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE @h geography;
DECLARE	@r integer;
---SET @h = geography::STGeomFromText('POINT(74.1790 40.7420)', 4326);
SET @h = geography::STGeomFromText('POINT(' + @Longitude + ' ' + @Latitude + ')', 4326);
set @r = @rows
SELECT top (@r) mine_id,mine_nm, state_abbr, directions_to_mine, nearest_town,longitude,latitude,(geoLocation.STDistance(@h)) as distance
from [msha_mine] 
--where [GEOCODE_LATITUDE] <> ''
where ([latitude] is not null) and ([latitude]<='90.000000')  and [longitude] is not null
order by distance;
---	SELECT <@Param1, sysname, @p1>, <@Param2, sysname, @p2>
END

--- adding new column for geospacial location
alter table msha_mine add [GeoLocation] GEOGRAPHY
GO

---updating newly created geospacial location column with geography casting
update [dbo].[msha_mine] 
set [GeoLocation] =geography::STPointFromText('POINT('+ CAST([longitude] as varchar(20))+
' '+ CAST([latitude] as varchar(20)) + ')', 4326)
where ([latitude] is not null) and ([latitude]<='90.000000') and [longitude] is not null
go
