--SystemDBs
/*
tempdb 100GB
#tabelle
Zeilenversionierung (Kopien der Datens�tze werden in tempdb wegkopiert
IX Wartung

--muss man die tempdb sichern?.. Neee.. nie, aber schnelle HDDs

master

model
Vorlage f�r neue DBs
create Database testdb =kopie der model

--zugleich Doku
USE [master]
GO
ALTER DATABASE [model] MODIFY FILE ( NAME = N'modeldev', SIZE = 10240KB )
GO
ALTER DATABASE [model] MODIFY FILE ( NAME = N'modellog', SIZE = 10240KB )
GO


--muss ich die model sichern? -- 


msdb
= DB f�r den Agent (Jobs)
Emailsystem

muss ich die msdb sichern? -- klar


master
Kernst�ckst�ck
Logins
DB selbst
Konfiguration des SQL Server

--muss ich die master sichern? --definitiv
--msdb tut weh!!

--mdf Datei 20 Gb
--ldf 200GB


regelm Sicherung der Sytemdb per Wartungsplan


*/