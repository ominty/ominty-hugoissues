+++
title 		= "Wegpunkte aus Texten und Tabellen importieren"
date 		= "2016-09-04"
categories 	= ["Navigation"]
tags     	= ["Programme"]

+++

Da stehen also z. B. auf einer Webseite die geografischen Koordinaten vieler interessanter Punkte, aber es gibt keinen Download für diese Daten, um sie in ein GPS-Gerät zu importieren. Was nun? Jeden Wegpunkt von Hand übertragen? DAS ist richtig Arbeit, es muß auch einfacher gehen ...
<!--more-->

Die Hilfe steht in Form von [GPS-Babel](http://www.gpsbabel.org/) bereit, das jede Menge Geo-Daten-Formate ineinander überführen kann. Da sind auch "für Menschen lesbare" Formate dabei, wie zum Beispiel `Universal csv`.

Dazu müssen die Daten in Form einer Tabelle vorliegen, diese kann man z. B. in Libre Office Calc anlegen. Beim anschließenden Export ins Format `.csv` muß bei den Optionen "Tabulator getrennt" angegeben werden.   
Oder man nimmt gleich einen Texteditor und erzeugt eine Datei, die so aussieht:

    Name	Latitude	Longitude	Description
    Playa del Asperillo (Cuesta Maneli)	37.06829	-6.6854	Das ist ein Strand
    Playa del Rompeculos	37.103	-6.7544	Auch das ist ein Strand
    Playa de los Enebrales	37.19083	-6.99718	und noch ein Strand, mit Komma in der Beschreibung
    Playa de la Flecha de Nueva Umbria	37.20609	-7.17042	und ein letzter Strand
    
In der ersten Zeile stehen die Feldbezeichnungen, diese sind durch Tabulatoren getrennt. Dadurch wird GPS-Babel veranlaßt, nur Tabulator-Zeichen als Spaltentrenner zu nehmen anstelle von Kommas (denn ein Komma kann auch in z. B. der Beschreibung vorkommen wie in der dritten Daten-Zeile).    
Längen- und Breitengrade werden mit Dezimalpunkt angegeben, westliche Längengrade mit vorgesetztem Minus-Zeichen.

Aus einer Text-Auflistung läßt sich in einem Text-Editor so ein File relativ schnell erzeugen, viele Formatierungen etc. kann man automatisieren mittels `Bearbeiten - Ersetzen`.

Zum Abschluß kommt dann GPS-Babel mit folgendem Befehl zum Zuge:

    gpsbabel -i unicsv -f /pfad/zum/input.csv -o gpx -F /pfad/zum/output.gpx
    
Das entstandene `.gpx`-File läßt sich in jedem GPS-Programm öffnen und auf ein angeschlossenes GPS-Gerät hochladen.