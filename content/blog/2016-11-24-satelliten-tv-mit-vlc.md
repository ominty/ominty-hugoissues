+++
title 		= "DVB-S: Satelliten-TV mit VLC unter Linux"
date 		= "2016-11-24"
description = "Struktur einer Webseite für den Einsatz von Hugo, es werden erläutert: Verzeichnisse, Bereiche, Dokumententypen"
keywords      = "Hugo, Webseite, Struktur, Verzeichnis, Template, Theme, Menü"
categories 	= ["Linux", "Medien"]
tags 		= ["Programme"]

+++

In meinen bisherigen Linux-Installationen nutzte ich immer Kaffeine als Programm, um Satelliten-Programme (Astra, DVB-S) zu empfangen und auch aufzunehmen. Das ist etwas unschön, weil Kaffeine als Programm für den KDE-Desktop (und das einzige, das ich aus dieser Umgebung nutze) eine Menge von KDE-spezifischen Programmbibliotheken als Ballast mit "einschleppt" und so wollte ich <!--more--> im Rahmen der Neuinstallation, die ich gerade durchführe, sehen, ob es da nicht Alternativen gibt.

## Schrittweise Einrichtung
### Hardware testen
Zunächst muß einmal festgestellt werden, ob die vorhandene Tuner-Karte vom System erkannt wird. In meinem Fall habe ich die (interne) PCI-Karte mittels 

    root@Media-PC:~# lspci

aufgespürt:

    04:00.0 Multimedia controller: Philips Semiconductors SAA7146 (rev 01)

Für externe Geräte hilft ggf. `lsusb` weiter.

### Suchlauf durchführen
Für das Erstellen einer Kanal-Liste verwende ich `w_scan`, das ist ein Kommando-Zeilen-Programm.

    ~$ w_scan -fs -s S19E2 -c DE -X -E 0 -R 1 -O 1 > ~/channels.conf

führt einen Scan der Satellitenkanäle durch und schreibt die von vielen Medienplayern genutzte Datei `channels.conf`, in der die gefundenen Kanäle als Senderliste gespeichert werden. Da ich im Weiteren aber VLC nutzen möchte, schreibe ich die Datei im (als 'experimentell' gekennzeichnete) Datei `channels.xspf` mit dem leicht modifizierten Befehl

    ~$ w_scan -fs -s S19E2 -c DE -L -E 0 -R 1 -O 1 > ~/channels.xspf

Die Option `-E 0` am Ende des Befehls schließt die für mich uninteressanten verschlüsselten Kanäle aus, `-R 1` und `-O 1` schließen ausdrücklich Radiokanäle und "sonstige Dienste" ein.     
`w_scan` antwortet zunächst mit den "Untersuchungsergebnissen" seines Hardware-Checks:

    w_scan -fs -s S19E2 -c DE -L -E 0 -R 1 -O 1 
    w_scan version 20161022 (compiled for DVB API 5.10)
    using settings for 19.2 east Astra 1KR/1L/1N/1M
    scan type SATELLITE, channellist 68
    output format czap/tzap/szap/xine
    output charset 'UTF-8', use -C <charset> to override
    Info: using DVB adapter auto detection.
    	/dev/dvb/adapter0/frontend0 -> SATELLITE "STV090x Multistandard": very good :-))
    
    Using SATELLITE frontend (adapter /dev/dvb/adapter0/frontend0)
    -_-_-_-_ Getting frontend capabilities-_-_-_-_ 
    Using DVB API 5.10
    frontend 'STV090x Multistandard' supports
    INVERSION_AUTO
    DVB-S
    DVB-S2
    FREQ (0.95GHz ... 2.15GHz)
    SRATE (1.000MSym/s ... 45.000MSym/s)
    using LNB "UNIVERSAL"

und führt dann den eigentlichen Suchlauf durch, den es dann mit der benötigten Zeit und der Summe der gefundenen Kanäle abschließt:

    (time: 25:27.251) dumping lists (726 services)
    ..
    Done, scan time: 25:27.251

### Fernseh-Empfang mit VLC
Der VLC-Player wird gestartet und die Datei `channels.conf` oder `channels.xspf` mittels `[Medien] - [Datei öffnen ...]` geladen. Die Wiedergabeliste zeigt nun die verfügbaren Kanäle an, die per Doppelklick angewählt werden können:

![Kanalliste im VLC-Player](/bilder/2016-11/vlc-01-kanalliste.png)

Dann wird geprüft, ob der VLC-Player auf den Tuner zugreift:

![Hardware-Check im VLC](/bilder/2016-11/vlc-02-aufnahmegeraet-1.png)

`w_scan` hatte den Tuner in `adapter0` gemeldet, und dort ist er auch im VLC-Player zu finden:

![Anzeige des Tuners im VLC-Player](/bilder/2016-11/vlc-02-aufnahmegeraet-2.png)

### Aufnahmen mit dem VLC-Player
Zunächst muß der Aufnahmebutton aktiviert werden, indem die Werkzeugleiste erweitert wird:

![Aktivierung u. a. des Aufnahmebuttons im VLC-Player](/bilder/2016-11/vlc-03-aufnahmebutton-1.png)

![Aktivierung u. a. des Aufnahmebuttons im VLC-Player](/bilder/2016-11/vlc-03-aufnahmebutton-2.png)

Außerdem muß ein Aufnahmeverzeichnis angegeben werden, in dem die aufgenommenen Sendungen gespeichert werden. Dies wird in den Einstellungen `[Strg] + [P]` vorgenommen in der Rubrik `Eingang/Codecs`:

![Festlegung des Aufnahmeverzeichnisses im VLC-Player](/bilder/2016-11/vlc-04-aufnahmeverzeichnis.png)

Somit ist alles erledigt und es kann losgehen ... 

![VLC-Player im Fernsehbetrieb](/bilder/2016-11/vlc-05-betrieb.png)