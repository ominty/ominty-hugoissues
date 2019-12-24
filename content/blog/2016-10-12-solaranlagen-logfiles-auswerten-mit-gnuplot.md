+++
title 		= "Solaranlagen-Logfiles auswerten mit gnuplot"
description = "Beschreibung, wie man mit gnuplot Meßdaten aus einem Textfile schnell in eine ansprechende Grafik umwandelt"
date 		= "2016-10-12"
software    = ["Meßwertauswertung"]
programme   = ["gnuplot"]
wohnmobile  = ["Blogartikel", "Solar", "Elektrik"]
+++

Mein [Solarregler](http://privat.albicker.org/iveco-womo/elektrik.html) schreibt ein Protokoll über seine Aktivitäten, d. h. er schreibt Datum, Uhrzeit und die zugehörigen Werte für Spannung und Strom am Eingang, also von der Solarzelle, sowie Ausgang, also zur Batterie, in ein Textfile, das er auf einer SD-Karte abspeichert.    
Hier soll gezeigt werden, wie diese Daten als Grafik ausgewertet werden können - standardisiert und ohne viel Handarbeit.
<!--more-->

## Die Daten
Wie bereits erwähnt liegen die Daten als Textfile `SOLARLOG.TXT` vor, das Format sieht folgendermaßen aus:

       DATE      TIME    U1   I1   Us   Is
    ----------------------------------------
    2015.11.01 11:15:57 12.8 02.3 21.1 01.4 
    2015.11.01 11:16:09 12.8 02.3 21.4 01.5 
    2015.11.01 11:16:20 12.8 02.3 21.4 01.5 
    2015.11.01 11:16:31 12.8 02.3 21.0 01.5 
    2015.11.01 11:16:43 12.8 02.3 21.4 01.5 
    2015.11.01 11:16:54 12.8 02.3 21.4 01.4 
    2015.11.01 11:17:05 12.8 02.3 21.6 01.5 
    2015.11.01 11:17:17 12.8 02.3 21.6 01.5 
    2015.11.01 11:17:28 12.7 02.3 21.4 01.4 
    2015.11.01 11:17:39 12.7 02.4 21.4 01.5 
    2015.11.01 11:17:51 12.7 02.4 21.1 01.5 
    2015.11.01 11:18:02 12.6 02.4 21.1 01.5 
    2015.11.01 11:18:13 12.5 02.4 21.1 01.5 
    2015.11.01 11:18:25 12.5 02.4 21.0 02.0 
    2015.11.01 11:18:36 12.5 02.4 21.0 01.5 
    2015.11.01 11:18:47 12.5 02.4 20.9 01.5 
    2015.11.01 11:18:59 12.6 02.4 20.9 01.5 
    2015.11.01 11:19:10 12.6 02.4 20.9 01.4 
    2015.11.01 11:19:21 12.6 02.4 21.0 01.4 
    2015.11.01 11:19:33 12.7 02.4 21.0 01.5 
    2015.11.01 11:19:44 12.7 02.4 21.1 01.4 

Die Spalten sind jeweils durch ein Leerzeichen getrennt, die Spannungs- und Stromwerte liegen als Dezimalwerte mit einem Dezimalpunkt vor. Das Logfile speichert fortlaufend die Meßwerte des Solarreglers, über Tage/Wochen/Monate ..., bis die Datei von der SD-Karte auf den Rechner verschoben (damit auf der Karte gelöscht) wird und folglich ein neues File geöffnet wird und das Spiel von vorn beginnt.

## Die Auswertung
### Die Software 'gnuplot'
[Gnuplot](http://www.gnuplot.info/) (Eigenschreibweise: gnuplot) ist ein skript- bzw. kommandozeilengesteuertes Computerprogramm zur grafischen Darstellung von Messdaten und mathematischen Funktionen (Funktionenplotter). Das Projekt Gnuplot wird seit 1986 kontinuierlich von einem internationalen Team ehrenamtlicher Entwickler vorangetrieben. Gnuplot stammt aus der Unix-Welt, läuft aber auf allen gängigen Betriebssystemen. Es besitzt keine eigene grafische Benutzeroberfläche, sondern wird von der Kommandozeile aus bedient oder über Skripte gesteuert.   
Es kann sowohl mathematische Funktionen aus Formeln grafisch darstellen als auch tabellarisch vorliegende Werte, z. B. Meßwerte, als Diagramm anzeigen. Letzteres wird hier genutzt und beschrieben.  
Dabei greift es direkt auf die Originaldaten zu, ohne diese zu verändern. Ein Import wie z. B. in üblichen Tabellenkalkulationsprogrammen entfällt.

### Das Plotfile
Das Plotfile enthält alle Anweisungen an gnuplot, wie die vorliegenden Messdaten zu interpretieren und die Diagramme zu formatieren sind. Ich gebe hier den Inhalt dieser Datei abschnittsweise mit Erklärungen wieder:

    reset
    # Parameter
    datenfile = "SOLARLOG.TXT"
    datum_start = "2016.09.14 04:00:00"
    datum_stop = "2016.09.14 22:00:00"
    bildbreite = 800
    bildhoehe = 600

Gnuplot wird zunächst in den Ausgangszustand zurückgesetzt (`reset`).   
Als nächstes definiere ich einige Variablen. Das hat den Hintergrund, daß ich Werte, die sich ändern können, gerne am Anfang eines Files oder scripts zusammengefaßt stehen habe, weil das übersichtlicher ist.
    
    # Diagramm
     set title "Ladekurven ".datum_start
     set xlabel "Uhrzeit (MEZ)" font "courier"
     set xtics rotate font "courier" font "courier"
     set mxtics
     set ytics nomirror font "courier" font "courier"
     set mytics
     set y2tics nomirror font "courier" font "courier"
     set my2tics
     set nologscale x
     set xdata time
     set timefmt "%Y.%m.%d %H:%M:%S"
     set format x "%H"
     set grid
     set border
     set key inside right top

In diesem Abschnitt wird bestimmt, wie das Diagramm aussieht:    

- Diagramm-Überschrift (dabei wird auf das Start-Datum als Variable zugegriffen, damit in der Überschrift schon sichtbar ist, auf welchen Tag sich die Auswertungen beziehen)
- x-Achsen-Beschriftung und Achseneinteilung
- y-Achse: Einteilung, das selbe für die zweite y-Achse rechts
- Die x-Achse wird als lineare Zeitachse festgelegt, das Zeitformat besteht aus den beiden ersten Spalten der Tabelle (Datum/Uhrzeit) in der angegebenen Form mit Punkten und Doppelpunkten als Trennzeichen, das Format der Achsenbeschriftung: es werden die Stunden als Beschriftung bestimmt.
- Das Diagramm erhält ein Gitternetz und ist rundum mit durchgezogenen Linien berandet, die Legende befindet sich rechts oben innerhalb der Diagrammfläche

Im nächsten Abschnitt werden Anfangs-und Endwert der x-Achse gesetzt sowie die Bildausgabe festgelegt: es wird eine PNG-Bilddatei erzeugt und deren Größe (in Pixeln) gesetzt.
    
    set xrange [datum_start:datum_stop]		#Zeitangabe in "" setzen als Wertebereich für x-Achse    
    set term png size bildbreite, bildhoehe		#Graph als png-Datei ausgeben mit Diagrammgröße lt. Parameter

auch hier wird auf die anfangs gesetzten Variablen zurückgegriffen.
    
    # Diagramm 1:
    set yrange [12:15]      #Wertebereich der linken y-Achse
    set y2range [0:12]      #Wertebereich der rechten y-Achse
    
     set ylabel "Batteriespannung (V)" font "courier"
     set y2label "Ladestrom (A)" font "courier"
     set out datum_start."_solar1_batterie.png"
     plot datenfile using 1:3 title 'Spannung' with lines,\
     datenfile using 1:4 title 'Strom' axis x1y2 with lines

Das erste Diagramm wird beschrieben:

- Anfangs- und Endwerte der beiden y-Achsen
- Die Beschriftung der beiden y-Achsen
- der Dateiname der erzeugten PNG-Bilddatei (auch hier wird wieder auf das Startdatum aus den anfangs gesetzten Variablen zurückgegriffen)

werden festgelegt.    
In den letzten beiden Zeilen wird dann angegeben, daß die Spannungswerte an die erste y-Achse dargestellt werden und dazu auf die Werte der Spalten 1 (x-Wert) und 3 (y-Wert) zugegriffen wird, die Spannungswerte werden aus der Spalte 4 entnommen und auf die y2-Achse bezogen. Bei beiden Graphen werden die Meßwerte durch Linien zu geschlossenen Kurven verbunden.

Anmerkung: Obwohl hier als x-Wert die Spalten 1 und 2 zusammengefaßt (Datum UND Zeit) verwendet werden, wird die Spaltenzählung für die Folgespalten mit den Meßwerten weiter so behandelt, als wären diese Spalten getrennt. 
    
    # Diagramm 2:
    set yrange [0:30]
    set y2range [0:10]
    
     set ylabel "Solarspannung (V)"
     set y2label "Solarstrom (A)"
     set out datum_start."_solar2_zellen.png"
     plot datenfile using 1:5 title 'Spannung' with lines,\
     datenfile using 1:6 title 'Strom' axis x1y2 with lines
    
    # Diagramm 3:
    set yrange [0:200]
    set y2range [0:200]
    
     set ylabel "Ladeleistung (W)" font "courier"
     set y2label "Solarleistung (W)" font "courier"
     set out datum_start."_solar3_leistung.png"
     plot datenfile using 1:($5*$6) title 'Solarleistung' axis x1y2 with lines,\
     datenfile using 1:($3*$4) title 'Ladeleistung' with lines			#Ladeleistung in zweiter Zeile legt deren Graph ÜBER den Graphen der Solarleistung
 
Diagramm 2 und 3 werden in derselben Weise definiert wie Diagramm 1. In Diagramm 3 wird für die Leistung als y-Wert aber auf das Produkt zweier Spalten zurückgegriffen, dazu werden die Spaltennummern mit vorangestelltem `$`-Zeichen angegeben, also z. B. `($5*$6)`.

Das fertige Plotfile speichere ich z. B. als `solar.plt` und lege es zusammen mit dem Datenfile `SOLARLOG.TXT` in einem gemeinsamen Verzeichnis ab.


## Ausführung und Ergebnis
### gnuplot aufrufen
Im Terminal wird in das Verzeichnis gewechselt (`cd /Pfad/zum/script`), in dem die beiden Files `SOLARLOG.TXT` (Messdaten) und `solar.plt` (Plotfile) liegen. Der Befehl

    ~/Pfad/zum/script $ gnuplot solar.plt
    
startet gnuplot und veranlaßt es, das Plotfile abzuarbeiten und die Ergebnisse (Diagramme) im selben Verzeichnis abzulegen:

### Beispiel-Diagramme zum obigen Plotfile
- Diagramm 1: Ausgangs-Spannungs- und -Strom-Werte in Richtung Batterie:    
![Batterie](/bilder/2016-10/2016.09.14_04-00-00_solar1_batterie.png)

- Diagramm 2: Eingangs-Spannungs- und -Strom-Werte von den Solarzellen:    
![Solarzellen](/bilder/2016-10/2016.09.14_04-00-00_solar2_zellen.png)

- Diagramm 3: Leistungswerte Ein- und Ausgang:     
![Leistung](/bilder/2016-10/2016.09.14_04-00-00_solar3_leistung.png)

## Schlußbemerkung
Die Beschreibung bezieht sich auf Linux. [Gnuplot](http://www.gnuplot.info/) steht aber auch für Windows und MacOS zur Verfügung, sodaß dieses Verfahren, möglicherweise unter Anpassung des Plotfiles (insbesondere der Pfade), auch dort einsetzbar sein dürfte.