/*

Richtlinien

Facets: was kann man pro Objekt wie Tabellen oder Datenbanken beobachten
--( Eigenschaften )


--Bedingungen : wir stellen Bedingungen, was gelten muss


Richtlininen: pr�fen die Bedingungen
--k�nnen verhindern 8nicht immer), oder auswerten (gr�n/rot)
--k�nnen auch (seleten) Richtlinien umsetzten


--> Registrierte Server
--Gruppe besteht aus mehreren Servern
--Server k�nnen in verschiedenen Gruppen mehrfach registriert werden


--Abfrage und Richtlinen auf der Gruppen werden bei allesn Servern der Gruppe ausgef�hrt



--evtl mehrere SQL Server 

--best practice: Richtlinien aus SQL 2017 oder fr�her lassen sich auch in SQL 2019 anwenden
--allerdings nicht jede ist perfekt
/*
Trenne Daten von Log
Ist Backup auf dem selben Datntr�ger wie DB
Ist das letzte Backup mehr als 24 Std
Guest muss inaktiv
Wiederherstellungsmodel: FULL


*/