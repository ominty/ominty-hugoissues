+++
title 		= "Terminal-Ausgabe mitprotokollieren"
description = ""
date 		= "2016-10-10"
linux		= ["Tipps"]
+++


Ein ">" hinter einem Terminalbefehl, gefolgt von einem Pfad und einem Dateinamen, lenkt die Ausgabe um in eben diese Datei. Dabei wird eine evtl. vorhandene Datei mit diesem Namen überschrieben.
So ergibt zum Beispiel der Befehl<!--more-->

    sudo lshw > /home/{benutzername}/hardware.txt

ein Textfile im Benutzerverzeichnis, das die komplette Hardware-Konfiguration des betreffenden Rechners enthält.

(">>" läßt die vorhandene Datei bestehen und hängt die Ausgabe hinten an)

 
