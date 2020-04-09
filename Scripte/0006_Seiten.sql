--Test : tabelle mit char(4100)
--Einf�gen von 20000 Datens�tzen

create table t1 (id int identity, spx char(4100))
GO

insert into t1
select 'XY'
GO 20000 --23 Sekunden --19 Sekunden-- 1:37min -- 1:26 --1:43

--Idee: 
/*

wie gro� ist ein DS ca: 4kb
select 20000*4--> 80MB, aber die t1 ist tats. 160MB gro�!!!!

DS kommen in Datendateien (mdf)
Dateien sind in Seiten und Bl�cken organisiert
Seite hat immer 8192 bytes, davon sind aber nur 8060bytes Nutzlast


*/

create table t2 (id int identity, sp1 varchar(4100), sp2 char(4100))

--Gro�es Ziel: Reduzieren der Seiten!!
--Weniger Seiten--> Weniger CPU --> weniger RAM
--Indizes
--Kompression
--Partitionierung



dbcc showcontig('t1')
--- Gescannte Seiten.............................: 20000
--- Mittlere Seitendichte (voll).....................: 50.79%
--- Gescannte Bl�cke..............................: 2501


--typische Kandidaten:
--Tabellen mit viele Spalten und vielen Zeilen


--Hobby1 Hobby2 Hobby3 Fax1 Fax2 Fax3 Frau1 Frau2 Frau3 Frau4 Religion

dbcc showcontig() --sehr vorsichtig..es wird alles untersucht!!


--Wie h�tte man das beseer machen k�nnen
create table t1 (id int identity, spx char(4100))
GO

--evtl geht die Anwendung nicht mehr!
--statt char varchar
--statt char(4100) lieber char(4030)

--APP muss weitergehen

--Tabelle komprimiert
--Anwendung bekommt nachwievor 160MB !!
--aber was passiert lokal auf dem Server:
--HDD weniger Zugriffe    im RAM auch komprimiert
--das kostet CPU--meist ist hier was �brig!!

--Normalerweise schaffen wir 40 bis 60% ..


set statistics io, time on

select * from t1 --statt 20000 Seiten nun 32 Seiten (aus dem RAM)

--SAP, AX, spoint
