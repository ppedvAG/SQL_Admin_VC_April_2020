/*
Aktiv

ISt SQL Server schuld??
Taskmanager und Ressourcenmonitor von Windows

? unbekannte Prozesse
teakids.exe  Admin
mslaugh.exe  Admin

SQL Server --> Aktivit�tsmonitor
basiert auf DMVs
zeigt mehr oder weniger das live System

Aufzeichung auf Dauer �ber l�ngeren Zeitraum

DMVs ausf�hren --> Ergebnisse in Tabellen wegschreiben mit Zeitstempel
Profiler  (zeichnet TSQL Statements und mehr auf) 
	Vorsicht: Ressourcenfresser

Perfmon (NT Tool: Grafische Auswertung des OS und SQL)
	lieber mehr messen als zu wenig

	--Siehe Projekt: Sonstiges
	PAL.xml  = VOrlage f�r Perfmon

Xevents.. die "Zukunft" bzw sollte schin verwendet werden
	etwas komplizierter in der Bedienung
	genauer und umfangreicher
	Auswertung k�nnte besser sein
	ressourcenschonender.. kann Profiler noch nicht ganz ersetzen

Datenbakoptimierungsratgeber
	Indizes auf basis eines typischen Workload des Tages vorschlagen lassen







*/