--Backup

/*

Stromausfall eigtl kein Problem.. Logfile

Fall 1: update, nach update ist DB defekt


Fall 2: update, update �ndert versehentlich falsche Daten
	Daten versaut, DB geht

Fall 3: DB gel�scht 

Fall 4: DB korrupt
	--mdf defekt 
	oder ldf defekt


Fall 5: 
	SQL Server tot
		DB auf HDD noch da



--Letzte Sicherung (Dienstag, 24. M�rz 2020 11:23:20)-- T
--DB l�uft... logischen Fehler..
--mit geringstm�glichen Datenverlust..
--Fehler:  13:20!
--das n�chste T kommt um 13:45
--D um 15 Uhr
--V 20 Uhr


/*
--Garantie, dass nur wir mit der DB arbeiten..(single User )
jetzt Sicherung: T (dauert 5 min)
11:23 - 13:41(...13:46) online


--die aktuelle DB muss restored werden!
--muss auf 13:19 restored werden


Verlust : 
alles weg ab 13:41
--wir haben aber alles von 13:19 bis 13:41 in der Sicherung

1. Alle User runterwerfen
2. Tlog sichern
3. Restore auf Sekunde genau
4. DB in MULTI USER

Wie werfe ich die Leute runter?

select * from sysprocesses where spid > 50 and dbid = db_id('testdb')
kill 62


USE [master]
GO
ALTER DATABASE [testdb] SET  SINGLE_USER WITH NO_WAIT
GO

BACKUP







*/







--Wiederherstellungsmodel
--Backupvarianten

Vollst�ndiges V
	sichert alle Dateien inkl Infos bzgl Pfad und Gr��e und Name der DAteien
	alle DAten zu diesem Zeitpunkt gesichert
	Checkpoint wird ausgef�hrt


Diff Sicherung D
alle Bl�cke sichern, die seit dem letzten V ge�ndert wurden


Transaktionsprotkollsicherung T (inkrementell)
werden alle Anweisung gesichert , die im Laufe der Zeit stattgefunden haben
 (�nderungen)


V TTT  D TTT D TTT D TTT
V				   D TTT


schnellste Restore: 
 nur das V.. so wie m�glich eine V Sicherung?

wie lange dauert der restore eines T?
kann so lange dauern, wie dier Zeitraum des Ts ist
Restore Log f�hrt alle Anweisungen wieder aus
wichtig: nicht viele Logfiles restoren m�ssen

V TxTTTTTTTTTTTTT D TTTTTTTTTTTT D TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT  

100MB DB -- 100MB

D immer wiede reintreuen um die Sicherung zu verk�rzen und sicherer zu machen


Ausfallzeit der DB /Serves
Datenverlust in Zeit

nur das Tlogbackup schafft es eine Restore auf die Sekunden genau zu arrangieren






Einfach
automatisch TX aus Log gel�scht. Log leert sich automatisch
T Sicherung ist nicht m�glich
Es wird INS UP DEL protokolliert  auch BULK Befehle, aber rudiment�r
Wenn man es nicht braucht
schnellste Variante


Massenprotkolliert (Bulk)
wie einfach, aber es wird nichts gel�scht
daher--> Backup Log
auch hier wird bulk nur rudiment�r protokolliert


Voll (Full)

protokoliiert ausf�hrlich
auf Sek restore m�glich

ausf�hrlich, umfassender, langsam, aber sicherer
Logshipping , Spiegelung muss ind Bulk oder Full

Vollst�ndig



V TTT D TTT D TTT


*/

--Medium: Datei, Band, URL
--Nie in eine BAK Datei mehrere Sicherung
--zum Ende 3 TTTs davor beliebig D und Ts..
-- V TTT D TTT D TTT D TTT


--VOLL
BACKUP DATABASE [testdb] TO  DISK = N'C:\_SQLBACKUPS\testdb.bak'
WITH NOFORMAT, NOINIT,  NAME = N'testdb-VOLL',
SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

--DIFF
BACKUP DATABASE [testdb] TO  DISK = N'C:\_SQLBACKUPS\testdb.bak' WITH  DIFFERENTIAL ,
NOFORMAT, NOINIT,  NAME = N'testdb-DIFF', SKIP, NOREWIND,
NOUNLOAD,  STATS = 10
GO

--LOG
BACKUP LOG [testdb] TO  DISK = N'C:\_SQLBACKUPS\testdb.bak'
WITH NOFORMAT, NOINIT,  NAME = N'testdb-LOG',
SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO


--11:28......


--Fall 1: 
----logischer Fehler , DB funktioniert.. versehentlich Adressen ver�ndert
--  11:26

--Idee nur falsche DAten korrigieren
--DB unter anderen NAmen restoren (�lteren Zeitpunkt)

--Dev -- soll update ausf�hren























*/