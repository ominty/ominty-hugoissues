+++
title       =  "Oktober 2013 - Datenshredder?"
date        =   "2013-10-18T12:20:15"
description = "Datenverlust im Dual-Boot-Betrieb mit Windows und Linux bei gemeinsamer Nutzung der Profile für Firefox und Thunderbird"
keywords    = "Dual-Boot, Windows, Linux, Datenverlust, Profil, Firefox, Thunderbird"
linux       = [ "Erfahrungen", "Migration" ]

+++

## Das Problem

Weil Linux für meine Anwendungen (bisher?) nicht als alleiniges Betriebssystem taugt, hatte ich mir eine Dual-Boot Umgebung auf meinem Schleppi mit dem dort vorhandenen WinXP eingerichtet - und wollte damit in Urlaub.     
Pünktlich am Tag vor dem Start hatte es mir damals mein Thunderbird-mail-Profil zerschossen. Ich hatte in Linux gearbeitet und nach Neustart in XP waren die mails weg (ich greife von beiden Systemen auf dasselbe Profil zu, symbolischer Link in Linux). <!--more--> Hab das dann im Urlaub natürlich gelassen (bin schon 'n Tag später losgekommen deshalb) und emails nur in WinXP bearbeitet.   
Nachdem ich wieder zurück war habe ich noch ein paar Photos durch den Workflow mit darktable gelassen. Diese wollte ich dann auf meinen Desktop-PC synchronisieren und habe dabei 'ne Menge Fehlermeldungen über nicht les- und damit kopierbare Dateien bekommen. Auf dem Schleppi selber konnte ich das dann bestätigen, die Files waren kaputt (13 RAW-Dateien und 16 JPG-Dateien, die aus RAWs exportiert wurden). Interessanterweise wurden die RAWs von der Software (darktable) nur zum lesen geöffnet, => non destructive imaging, die Bearbeitungen werden in Sidecar-Files (.xmp) abgelegt - trotzdem kaputt.

Das nervt natürlich, denn ständiges Überwachen der Dateiintegrität und hantieren mit Backups kann ja wohl nicht sein.

Was mich allerdings gewundert hat: beim nächsten Start nach der Verwendung von Linux erschien nach der Auswahl von WinXP per Bootmanager Grub kurz die Meldung "Windows XP wird fortgesetzt", meiner Meinung nach konnte das ja nicht sein, denn zuvor hatte ich in Linux (ebenfalls über den Bootmanager gestartet) gearbeitet.    
Trotzdem war das der entscheidende Hinweis:

## Die Ursache

Das WinXP kennt im Energiesparmode

    Bildschirm aus
    Festplatte aus
    Stand-By (dann blinkt der Powerschalter)
    Ruhezustand (dann sieht der Schleppi aus wie "Aus")

Zustände 1 - 3 sind unkritisch, Reaktivierung führt immer zu WinXP. Zustand 4 ist offenbar hochgefährlich, denn bei Reaktivierung kommt der Bootmanager (Grub2) und ich habe keinerlei Hinweis darauf, daß WinXP "eigentlich noch aktiv ist", und damit ist das Dateisystem nicht freigegeben und es kommt bei Zugriff "von außen", also einem anderen Betriebssystem, zu Datenfehlern.

## ... und noch ein Rückblick

Warum ist unterwegs nichts passiert? Weil ich die Kiste nur dann raushole, wenn ich daran arbeite, ansonsten in der Tasche verpackt ist (und vollständig ausgeschaltet). Da kommt Zustand 4 überhaupt nie vor.
Zu Hause hab ich länger dauernde Prozesse, wie z. B. Filesynchronisation mit dem Desktop-PC, die ich schon mal anwerfe, bevor ich schlafen gehe, weil das Überspielen von einigen hundert RAW-Files etliche Zeit in Anspruch nimmt, und danach legt sich die Kiste eben auch "schlafen", Stand-By nach 15min, Ruhezustand nach 2 Std. (den hab ich jetzt vollständig deaktiviert).    
Warum passiert auf dem Desktop-PC nix? Weil nichtmal Stand-By geht mit Win7 auf meiner 2-Platten-Installation (Boot- und Systempartitionen Win7 und die beiden o.g. Datenpartitionen auf Platte 2, Grub sowie Linux System, Swap und /home auf Platte 1) , da geht's über die Zustände 1 und 2 und wenn 3 an der Reihe ist, dann geht der Bildschirm wieder an und die Kiste ist voll "wach".

Und zu guter Letzt bin ich in diesem Zusammenhang noch auf 'ne Info gestoßen, die [Win8](http://stadt-bremerhaven.de/gefahr-von-datenverlust-bei-dualboot-von-windows-8-und-linux/) betrifft, dort hilft in Standardkonfiguration offenbar nicht mal mehr "ausschalten" ...