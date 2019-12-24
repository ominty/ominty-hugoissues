+++
title 		= "Garmin etrex Vista HCx stürzt ab"
description = "Probleme unterwegs mit meinem Garmin Vista. Große Kartenfiles fordern das Gerät offenbar sehr ..."
date 		= "2016-09-14"
navigation  = ["Geräte", "Karten"]
reisen      = ["Erfahrungen"]

+++

> Computer lösen die Probleme, die wir ohne sie nicht hätten ...

Bei [Open Streetmap](https://www.openstreetmap.de/) arbeiten viele fleißige Leute mit, folgerichtig wird die Karte immer größer (gemeint ist das Datenvolumen). Während vor ein paar Jahren die Garmin-Version einer Deutschlandkarte gut auf eine 2GB-Karte paßte, wird das heute schon sehr eng (ich brauche ja auch noch Platz für die mitgeschriebenen Tracklogs).
    
__>>> dieser Artikel ist für die meisten Leser wohl keine Hilfestellung, aber ein Erfahrungsbericht über die Irrungen und Wirrungen im Umgang mit Computern und Peripherie <<<__

### Die Ausgangssituation
Also hab ich mir 8GB-Karten besorgt ...
<!--more-->

... und weil ich schon grad am "umorganisieren" war, hab ich mir gleich die sog. "Plus-Länder"-Karten beim Projekt [Freizeitkarte](http://www.freizeitkarte-osm.de/garmin/de/) heruntergeladen. Die Deutschland-Karte reicht hier am Oberrhein bis auf die Vogesenhöhen nach Frankreich herein, das ist praktisch bei grenzüberschreitenden Touren.

Im Mai diesen Jahres hatte die  

- Deutschland-Plus-Karte 2,9GB (2.912.681.984 Bytes)
- Frankreich-Plus-Karte 2,8GB (2.764.374.016 Bytes) 

Bei Tests mit der Deutschlandkarte fiel mir die unproportional lange Ladezeit in meinem _etrex_ auf, die Karte funktionierte aber. 

### Das Problem
Anders die Frankreichkarte: Nach dem Einschalten und Hochfahren zeigte das Gerät die Kartenansicht mit der Bemerkung "Bildaufbau", um gleich danach auszuschalten.

Es ist ärgerlich in Frankreich zu stehen ohne funktionierende Karte, und mal eben eine neue runterladen bei den Roaming-Tarifen ... geht gar nicht.

Also hab ich mal versucht, eine Teilkarte zu nutzen, denn auf dem Laptop waren die Kacheln dieser Karte abgelegt, um damit in [QLandkarteGT]() zu arbeiten.

Zunächst habe ich mit `F1` die Kartenansicht aktiviert, dann mittels `F5` den Markierungsmodus. Im Dropdown-Menü links habe ich dann `EtrexVistaHCx` ausgewählt und mittels `F9` auf das angeschlossene Gerät kopiert.

    Aus den Karten wird ein Abbild erzeugt:
    
    Karte: Freizeitkarte_FRA+
    Tiles:
        16.05 IT-Settimo Torinese (72500392) (3.56 MB)
        16.05 FR-Gueret (72500393) (3.64 MB)
        16.05 FR-Romorantin-Lanthenay (72500397) (3.39 MB)
        16.05 FR-Chateauroux (72500399) (3.38 MB)
        16.05 FR-Chartres (72500403) (3.07 MB)
        16.05 FR-Blois (72500404) (3.08 MB)
        (...)
        16.05 DE-Speyer (72500697) (5.32 MB)
        16.05 DE-Karlsruhe (72500698) (5.25 MB)
        16.05 DE-Bretten (72500699) (4.45 MB)
        16.05 DE-Pforzheim (72500700) (5.10 MB)
        MDR file (111.80 MB)
     
    FAT-Einträge: 1412 (von 30720) 
    Blockzähler: 19745 (of 65536)
    Dateigröße: 1234.06 MB (von 4096.00 MB)
    /tmp/qt_temp.Ti2834 wird initialisiert
    Dateikopf schreiben ...
    Daten der Kacheln werden kopiert ...
        16.05 IT-Settimo Torinese (72500392) wird kopiert ...
        16.05 FR-Gueret (72500393) wird kopiert ...
        16.05 FR-Romorantin-Lanthenay (72500397) wird kopiert ...
        16.05 FR-Chateauroux (72500399) wird kopiert ...
        16.05 FR-Chartres (72500403) wird kopiert ...
        16.05 FR-Blois (72500404) wird kopiert ...
        (...)
        16.05 DE-Speyer (72500697) wird kopiert ...
        16.05 DE-Karlsruhe (72500698) wird kopiert ...
        16.05 DE-Bretten (72500699) wird kopiert ...
        16.05 DE-Pforzheim (72500700) wird kopiert ...
        MDR file wird kopiert ...
    Typ-Dateien werden kopiert ...
    /home/benutzer/Daten2/Navigation/Garmin-OSM/Frankreich/Freizeitkarte_FRA+_Images/freizeit.TYP
    Kartenindexdatei wird geschrieben ...
    ----------
    
Den nachfolgenden Upload auf das Gerät selbst habe ich dann abgebrochen, nachdem eine Upload-Zeit von mehreren Stunden angezeigt wurde und anhand dem prozentualen Fortschritt abzusehen war (über einen normalen Kartenleser dauern 3GB wenige Minuten), daß die Schätzung nicht so ganz daneben liegen könnte. 

Schade ... so hatte ich schon befürchtet, mich mit einer 4 Jahre alten Karte zufrieden geben zu müssen, die ich noch auf einer anderen microSD dabei hatte.

### Die Schein-Lösung
Dann hab ich aber doch noch die mikroSD formatiert und das .img-File (also das, das _nicht_ funktioniert hatte) neu übertragen ... nach einer endlos langen Bildaufbau-Phase im _etrex_ war die Karte wieder da!!!

### Und die Ursache?   
Ich hatte auf der Karte folgende Verzeichnis-Struktur angelegt:

```
.
├── DEU+_de_gmapsupp.img
├── FRA+_en_gmapsupp.img
└── garmin
```
und am Rechner jeweils das passende image in den Garmin-Ordner verschoben, das ich gerade benötigt hatte - Platz war ja genug da (mit beiden Images im jeweiligen Ordner noch 3GB leer).    
Irgendwas ist wohl schief gegangen.

Momentan gibt's nur noch das `garmin`-Verzeichnis mit dem Frankreich-Image ...
