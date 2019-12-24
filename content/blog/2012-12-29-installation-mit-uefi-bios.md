+++
title 		= "Linux-Installation auf einem Rechner mit UEFI-BIOS"
description = "Da hab ich schon manchen Rechner installiert, aber ein UEFI-Bios schafft neue Bedingungen"
date 		= "2012-12-29T22:25:17+01:00"
linux 		= ["Installation"]
+++



## Voraussetzungen

Beim Upgrade meines Media-PC stand ich vor dem Problem, daß ein frisch installiertes Debian nicht starten wollte.

Das verwendete Mainboard Gigabyte Z77-DS3H verlangte das neueste Debian-Testing (Wheezy), damit überhaupt der LAN-Chip geht. Nachdem das geklärt war und ich eine Internet-Verbindung herstellen konnte (ich verwende in der Regel die Netinstall-CD's, die nur ein Basis-System enthalten und den Rest direkt aus den Software-Repositories der jeweiligen Distribution beziehen), hab ich die Installation gestartet.
<!--more-->

## Lösung

1. Platte grundsätzlich einrichten: die Partitionstabelle muß GPT sein (NICHT MSDOS)
Dabei entsteht ein freier Platz von ca. 1MB VOR der ersten Partition, die im nächsten Schritt angelegt wird, wird offenbar benötigt für den Bootloader

![Screenshot](/bilder/2012-12/uefi-inst-1.png)
     
1. Partitionen einrichten, z. B.

![Screenshot](/bilder/2012-12/uefi-inst-2.jpg)
     
1. Installation starten: Wichtig: das Installationsmedium (hier: CD) wird 2 mal im Menü der Boot-Reihenfolge angezeigt => dasjenige mit UEFI: am Anfang auswählen!!!

![Screenshot](/bilder/2012-12/uefi-inst-3.jpg)
     
1. den Anweisungen folgen bis zur Festplattenpartitionierung, hier "manuell" wählen.
Da diese schon erfolgt ist, nur noch die Partitionen ins Dateisystem einbinden, also "/", "/home" etc.

![Screenshot](/bilder/2012-12/uefi-inst-4.jpg)
     
1. den Installer weiter durchlaufen lassen, Kiste neu starten, fertig!!

Offenbar gehen alle Tutorials von einer existierenden Windows-Installation aus, die erledigt den ersten Punkt schon.
Ich hab hier aber nackte Hardware zusammengestöpselt und von Grund auf neu begonnen, daher die Probleme.

