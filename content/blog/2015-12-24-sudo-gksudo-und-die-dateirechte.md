+++
title 		= "sudo vs. gksudo - und verbogene Dateirechte"
date 		= "2015-12-24T22:25:17+01:00"
categories 	= ["Linux"]
tags 		= ["Linux-Tipps", "Systemwartung"]

+++


## Dateimanager mit Admin-Rechten

es kommt immer mal wieder vor, daß man "mal eben schnell" eine Konfigurationsdatei verändern muß. Für mich ist es dabei eine große Hilfe, wenn ich einen grafischen Überblick über die Verzeichnisstruktur habe, deshalb nutze ich für solche Fälle den Befehl im Terminal:
```
gksudo nemo
```
<!--more-->
Das startet im Cinnamon-Desktop den Dateimanager Nemo mit root-Rechten, kenntlich gemacht durch eine rote Erinnerungsleiste unterhalb des Menüs.

![Nemo Dateimanager mit root-Rechten aufgerufen](/bilder/2015-12/nemo-root.png "Nemo als root")

Eine daraus geöffnete Datei z. B. mit dem Texteditor läßt sich nun ebenfalls mit root-Rechten bearbeiten und abspeichern.

Hinweis: unter dem Gnome-Desktop ist natürlich Nautilus aufzurufen:
```
gksudo nautilus
```

## sudo/gksudo und "verbogene" Dateirechte ...
### Problem/Lösung
Unlängst hatte ich ein Problem mit meinem Dateimanager Nemo, der immer wieder eine Meldung ausgab, der Vorschaupuffer hätte ein Problem - das könnte nur mit root-Rechten behoben werden:

![Vorschaupuffer](/bilder/2015-12/vorschaupuffer.png "Vorschaupuffer")

"Reparieren" brachte aber nicht die anhaltende Lösung.

Der Lösung auf die Spur kam ich durch einen Hinweis aus dem Linux-Mint-Forum.

    find ~ -user root -ls

lieferte als Antwort eine lange Liste von Dateien wie diese:

     ~ $ find ~ -user root -ls
    3064133   12 -rw-r--r--   1 root     root        10429 Dez 23  2013 /home/{benutzername}/Software/Source/pyExifToolGUI-0.5/build/lib.linux-x86_64-2.7/logo/pyexiftoolgui.png
    3064134    4 drwxr-xr-x   2 root     root         4096 Jul 21  2014 /home/{benutzername}/Software/Source/pyExifToolGUI-0.5/build/lib.linux-x86_64-2.7/xdg
    3064135    4 -rw-r--r--   1 root     root          386 Dez 23  2013 /home/{benutzername}/Software/Source/pyExifToolGUI-0.5/build/lib.linux-x86_64-2.7/xdg/pyexiftoolgui.desktop
    3064098    4 drwxr-xr-x   2 root     root         4096 Jul 21  2014 /home/{benutzername}/Software/Source/pyExifToolGUI-0.5/build/lib.linux-x86_64-2.7/manual
    
Viele Dateien im home-Verzeichnis waren  `root` zugeordnet und nicht dem Benutzer.

Das war durch

    sudo chown -R $USER:$USER /home/$USER/

in Ordnung zu bringen.

### Ursache
Der Hintergrund dieser Problematik ist schön in einem [englischsprachigen Artikel](http://www.psychocats.net/ubuntu/graphicalsudo) beschrieben.

Kurz gesagt gibt es zwei Gründe, sehr sorgfältig zwischen `sudo` und `gksudo` zu unterscheiden:

1. eine grafische Anwendung wie z. B. gedit oder auch Firefox kann aus dem Terminal mit beiden Varianten aufgerufen werden, aber als Starter auf dem Desktop oder Eintrag im Startmenü scheitert der Aufruf per `sudo`, weil kein grafisches Paßwortfenster erscheint.
2. einige grafische Anwendungen verändern bei Aufruf ihr Profil. Auf welches Profil (das im Benutzer-Verzeichnis oder dasjenige im root-Verzeichnis), das kann davon abhängen, auf welche Art und Weise das Programm mit root-Rechten aufgerufen wird.    
Schreibt das Programm mit root-Rechten ins Benutzer-Profil, dann kann der Benutzer später nicht mehr auf seine Einstellungen zugreifen.

Deshalb:

> Terminal-Programme mit `sudo` ausführen, grafische Programme mit `gksudo`, falls _wirklich_ root-Rechte gebraucht werden.

Hinweis: dies bezieht sich auf Gnome-Desktop und seine Abkömmlinge. In der "KDE-Welt" gibt es wohl den ähnlichen Befehl `kdesudo` für grafische Anwendungen.