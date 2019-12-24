+++
title 		= "Schaltbild erstellen mit gschem, erste Schritte"
description = "Einrichtung von gEDA incl. Einbindung lokaler zusätzlicher Bauelemente-Symbole"
date 		= "2016-01-06"
software 	= ["CAD"]
programme	= ["gEDA"]

+++

Ein mit einem Bleistift auf einen Verpackungskarton gemaltes Schaltbild taugt nicht unbedingt zur Dokumentation.   
Und so wollte ich für einen Bekannten "mal eben schnell" ein Schaltbild erstellen. 
<!--more-->

## Die Software
Unter Linux ist da z. B. gschem ein Mittel der Wahl. Das gehört zur [gEDA Suite](http://geda-project.org/), einem Programmpaket, mit dem man vom Schaltbild über Layout bis zur Erstellung von Daten zur Herstellung von Platinen und Stücklisten den gesamten Arbeitsablauf abbilden kann.

![gschem Screenshot](/bilder/2016-01/gschem_screenshot.png)

### Installation
Unter LinuxMint 17 waren folgende Pakete nötig:
```
sudo apt-get install -y geda pcb geda-xgsch2pcb 
```

### Benutzung
Zunächst habe ich im Programm-Menü den gEDA Schematic Editor aufgerufen und angefangen, das Schaltbild zu erstellen.   
Leider fehlte dann in der Bauelemente-Library ein geeignetes Symbol für eine Glühlampe, und auch ein Relais war nicht in der geeigneten Form verfügbar. Es gibt aber eine [Seite für zusätzliche Symbole](http://www.gedasymbols.org/), wo ich dann fündig wurde.

### Einbindung lokaler Baulelemente-Symbole
#### Grundsätzliches Vorgehen
Nächstes Problem: wie kann ich die zusätzlichen Bauelemente-Symbole in das Programm einbinden?    
Dazu wurde ich im [Wiki](http://wiki.geda-project.org), dort in der FAQ, fündig:

1. Projektverzeichnis erstellen, z. B. `/home/{Benutzername}/Projekte`
2. in diesm Projektverzeichnis werden die zusätzlichen Symbole im Unterverzeichnis `symbols` abgelegt
3. im Projektverzeichnis eine leere Datei mit dem Namen `gafrc` erstellen
4. in diese Datei wird (im Editor) folgende Zeile eingefügt:
   ```
     (component-library "./symbols") 
   ```
   
5. Jetzt wird gschem aus diesem Projektverzeichnis heraus gestartet - per Terminal:
   ```
   cd /home/{Benutzername}/Projekte
   ```
   und dann das (falls vorhandene) Schaltbild geöffnet:
   ```
   gschem Schaltbilddatei.sch
   ```

Und dann geht alles ganz normal weiter: Symbole einfügen `Einfügen - Bauteil` (Tastaturkürzel `I`), Leitungen ziehen `Einfügen - Netz` (Tastaturkürzel `N`), Bauteile beschriften etc., bis die Arbeit erledigt ist.   
Die Arbeit geht - insbesondere bei Nutzung der Tastaturkürzel - sehr flüssig vonstatten.

#### Vereinfachung
Im Arbeitsverzeichnis wird ein Script `startscript.sh` abgelegt mit dem Inhalt
```
#!/bin/bash

# ins Arbeitsverzeichnis wechseln
cd /home/benutzer/Projekte

# gschem aufrufen
gschem
```
und der Programmaufruf im Menü von `gschem %F` geändert auf
```
sh /home/{Benutzername}/Projekte/startscript.sh
```
Damit wird erreicht, daß der Schaltbildeditor auch beim Start aus dem Programm-Menü ins Arbeitsverzeichnis wechselt und die dort hinterlegten lokalen Symbole lädt und zur Verfügung stellt.
