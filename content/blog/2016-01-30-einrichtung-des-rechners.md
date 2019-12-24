+++
date 		   = "2016-01-30T22:25:17+01:00"
#lastmod        = "2017-xx-xx"
author         = "Bernhard"
title 		   = "Einrichtung des Rechners zur Linux-Installation"
description    = "Beschreibung der Vorbereitung der Festplatte(n) zur Installation eines Linux-Betriebssystems"
#vgwort         = ""
keywords       = "Linux, Windows, Laptop, Festplatte, Dual-Boot"
linux 		   = ["Installation", "Grundlagen"]
#artikelbild    = "/bilder/.."
#draft          = true
+++


Die in der Einleitung beschriebene Möglichkeit des "Weg zurück" stellt auch einige Anforderungen an die Einrichtung der Festplatten sowie die Anordnung der Daten und Betriebssysteme auf dem Rechner ...
<!--more-->

## Einrichtung der Festplatte

Mehrere Dinge sind zu berücksichtigen, wenn eine Festplatte eingerichtet wird:

1.    Art der Partitionstabelle
2.    Anzahl der Partitionen
3.    Filesystem der Partitionen

### Allgemeines

Ich bin grundsätzlich der Meinung: "Meine Daten gehören mir". Das hat einerseits Auswirkungen auf die Software-Auswahl und die Datenformate, in denen diese Anwendungen ihre Daten speichern, aber andererseits auch auf die grundsätzliche Einrichtung eines Rechners - und darum soll es hier gehen.

Nutzerdaten müssen meiner Ansicht nach stets "physikalisch" getrennt von Betriebssystem-Dateien gespeichert werden. Linux erleichtert dies insofern, als es die Benutzerdaten immer im Verzeichnis /home ablegt und schon bei der Installation anbietet, dieses Verzeichnis auf eine separate Partition zu legen.
Was sind nun "Benutzerdaten"?

1.    Offensichtlich gehören dazu alle Daten, die der Benutzer erzeugt: Bilder, Schriftstücke, e-mails, CAD-Zeichnungen, GPS-Tracks, ...
2.    Benutzerdaten können aber auch die spezifischen Einstellungen der vom Benutzer genutzten Software-Programme sein, wie z. B. Lesezeichen im Webbrowser, Konvertierungseinstellungen im Bildbetrachter, Seiten- und Absatzformatierungen in der Textverarbeitung, Bauteilbibliotheken in CAD-Programmen etc.

Wie schon beschrieben:

-    Linux speichert ALLE diese Daten im Verzeichnis /home/{benutzername} - das erleichtet die Datensicherung und auch das Ändern des Betriebssystems, ein mühsames Zusammensuchen der Nutzerdaten entfällt - und wenn /home auf einer separaten Partition liegt, dann entfällt auch umkopieren (ich verbiete hier aber niemand das Anlegen von Backups ;-) ).
-    anders ist die Sache bei Windows: dort liegen die Daten recht verstreut in "Dokumente und Einstellungen" unter verschiedenen Einzel- oder Sammel-Benutzern sowie in "Eigene Dateien" oder - und da wird's in Sachen Sicherung ganz mühsam - in der Registry. Bei den meisten ab Werk konfigurierten Rechnern gibt es dann ohnehin nur eine große Partition C:\ - und dann viel Spaß bei der Wiederherstellung im Falle eines Crashs oder Schadsoftware-Befall.

### Desktop-PC (Workstation) - Reine Linux-Installation

Bei einem typischen Schreibtisch-PC empfehle ich folgende Vorgehensweise:

1.    gibt es bereits eine vorhandene Windows-Installation?
      1.  ja: Dann empfiehlt sich angesichts der heutigen Festplattenpreise der Einbau einer zweiten Festplatte
      2.  nein: dann weiter mit Schritt 2
2.    auf dieser (ggf. zweiten) Festplatte kann dann Linux installiert werden
3.    falls es eine Windows-Installation auf einer Festplatte gibt, so empfiehlt sich, diese Platte vom Mainboard zu trennen während der Installation von Linux. Damit ist sichergestellt, daß auch der Linux-Bootmanager (GRUB) zwingend auf der Linux-Platte landet.
4.    fortfahren wie nachfolgend beschrieben

Das nachfolgende Bild zeigt die Konfiguration einer "Linux-Platte" eines aktuellen Rechners.

![Festplatten-Partitionierung-Dual-Boot-Desktop-PC](/bilder/2016-01-30/re_festplatte-desktop-linux.png)

Im Falle einer "Zwei-Platten-zwei-Betriebssysteme"-Konfiguration kann jetzt die erste Platte (mit der Windows-Installation) wieder angeschlossen werden. Im BIOS wird die Startreihenfolge auf Platte 2 eingestellt. Nach dem Start von Linux kann im Terminal der Befehl

    sudo update-grub

eingegeben werden. Der Linux-Bootmanager wird das auf der Platte 1 befindliche Windows finden und fortan beim Start des Rechners als Option anbieten.

### Dual-Boot Installation

Insbesondere in Notebooks läßt sich nicht "mal eben" eine zweite Festplatte einbauen, dort gibt es nur den Weg der Dual-Boot-Installation auf einer Platte. Dabei ist zu berücksichtigen:

1.    Es sollte der Installations-Datenträger des ersten Betriebssystems (i. d. R. Windows) greifbar sein (wird benötigt, falls man Linux "wieder los werden" will und dann den Bootmanager wieder entfernen muß)
2.    Linux kann auf Windows-Partitionen zugreifen, umgekehrt gilt das nicht.
3.    Linux benötigt neben der Betriebssystems- auch eine Auslagerungs-Partition. Ferner sollte für /home ebenfalls zumindest eine kleine Partition vorgehalten werden für die Konfigurationsdateien

Daraus ergibt sich ein Platten-Schema wie im folgenden Bild:

![Festplatten-Partitionierung-Dual-Boot-Laptop](/bilder/2016-01-30/re_festplatte-laptop.png)
