--Login in der Datenbank m�glich
--#tabellen haben Sprachsortierung der Db aus der sie erstellt 
--in der sie erstellt wurden

--Verbinden..Option.. Datenbank angeben

--> DB muss f�r ContainedDB aktiviert sein

--Contained Database auf Server aktivieren
--

EXEC sys.sp_configure N'contained database authentication', N'1'
GO
RECONFIGURE WITH OVERRIDE
GO


--auf DB aktivieren

USE [master]
GO
ALTER DATABASE [Northwind] SET CONTAINMENT = PARTIAL WITH NO_WAIT
GO

GO
