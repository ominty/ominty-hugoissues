+++
title 		= "Hugo-Finetuning, Tipps aus der Praxis"
date 		= "2017-01-14"
description = "Webseitengenerator Hugo: Kurzkommandos und effektiver upload per automatisiertem Script"
keywords    = "Hugo, Webseite, Kommando, Script, upload, ftp"
software 	= ["Webseiten"]
programme	= ["Hugo"]

+++

Nach einiger Zeit der intensiven Nutzung von Hugo haben sich ein paar Dinge ergeben, die die Arbeit vereinfachen. Für das Verständnis ist die Kenntnis der ersten 4 Teile des [Tutorials](/tutorials/hugo.html) notwendig.    
(Die Hinweise beziehen sich auf die derzeit aktuelle Version 0.17 von Hugo)
<!--more-->
## Hugo vereinfachen

### Kommandozeilen-Befehle verkürzen
Der in [Teil 4](/blog/2015-12-30-ein-blog-mit-hugo-erstellen-teil4.html) des Tutorials beschriebene Befehl für den Servermode, der die Live-Ansicht liefert beim Schreiben der Beiträge, läßt sich mit folgendem Kurzbefehl starten:

    $ hugo server -w -D 

### Theme in config.toml eintragen
Im [Teil 4](/blog/2015-12-30-ein-blog-mit-hugo-erstellen-teil4.html) wurde in o. g. Befehl außerdem ein spezielles Template (Theme) angegeben, auf dem die Seiten aufgebaut sind. Dieses läßt sich auch in der Konfigurationsdatei `config.toml` eintragen. Für dieses Blog würde diese Datei dann so aussehen:

    baseurl = "http://privat.albicker.org/blog"
    languageCode = "de-DE"
    title = "Seiten, die die Welt (nicht) braucht"
    relativeURLs = true
    uglyURLs = false
    theme = "hugo-multi-bootswatch-master"


## Seiten veröffentlichen

### tatsächlich geänderte Seiten filtern
Hugo beobachtet im Server-Mode die Verzeichnisse `data`, `content`, `layouts`, `static` und `themes` auf Veränderungen. Im Rendering Mode (siehe auch hier [Teil 4](/blog/2015-12-30-ein-blog-mit-hugo-erstellen-teil4.html)) werden alle Dateien im Ausgabeunterverzeichnis `public` neu geschrieben. Das würde bedeuten, daß bei JEDER Änderung (auch nur der Korrektur eines Rechtschreibfehlers) alle Seiten mit dem neuen Dateidatum erscheinen und es daher nicht einfach ist, nur die korrigierten/geänderten/hinzugefügten Seiten zu ermitteln und auf den Server hochzuladen. Das ist insbesondere dann lästig, wenn die Datenübertragung langsam (mobil) und/oder teuer (Ausland) ist.    
Ich habe mich daher zu einem zweistufigen Verfahren entschlossen:

- zunächst werden die geänderten Daten vom Hugo-Arbeitsverzeichnis in ein Unterverzeichnis der Gesamthomepage übertragen (bei meiner privaten Homepage ist das Blog nur ein Teil des Gesamt-Auftritts).
- dann werden mittels FTP die geänderten Dateien auf den Webserver übertragen.

Die Schritte im Einzelnen:

### geänderte Seiten ermitteln
Dies läßt sich mit dem Programm `rsync` erledigen. Dieses Programm wird z. B. zur Erstellung von Backups verwendet, es kann geänderte Dateien anhand unterschiedlicher Kriterien erkennen, wie z. B. Dateigröße, Datum/Uhrzeit oder auch Dateiinhalt.    
Die letztere Fähigkeit machen wir uns hier zu Nutze: Für jede Datei wird eine Art "Fingerabdruck" ermittelt, und wenn dieser sich unterscheidet, dann wird die Datei übertragen:

    rsync -rlpcgoDv --checksum --progress --stats --delete /home/{benutzername}/Webseiten/hugo/meinehomepage/public/ /home/{benutzername}/Webseiten/Arbeitsverzeichnis/meinehomepage/blog/ 

Der Befehl erledigt:

- in Hugo neu erstellte Dateien werden ins Hompepage-Unterverzeichnis übertragen
- in Hugo geänderte Dateien werden ins Hompepage-Unterverzeichnis übertragen und die dort liegende alte Version überschrieben
- in Hugo entfernte Dateien werden im Hompepage-Unterverzeichnis gelöscht

### Upload
Für die Übertragung auf den Webserver verwende ich das Kommandozeilen-Programm ["lftp"](https://de.wikipedia.org/wiki/Lftp), das ist ein Linux/Unix-Programm. Hier möchte ich die Windows-Benutzer um Nachsicht bitten, daß ich die [Windows-Variante](https://nwgat.ninja/lftp-for-windows) mangels Verwendbarkeit auf meinen Rechnern nicht wirklich angeschaut habe.

Zunächst erfolgt die Anmeldung am Server: 
```
~ $ lftp -u {benutzername}:{passwort} ftp://{domainname}.{domainendung}
```
(der Parameter `-u` übergibt die Benutzerdaten)    
und im nächsten Schritt gleich der komplette upload:
```
lftp {benutzername}@{domainname}.{domainendung}:/> mirror -eRv /home/{benutzername}/Webseiten/Arbeitsverzeichnis/meinehomepage/blog/ /httpdocs/{serverbenutzerkennung}/meinehomepage/blog/
```
Damit wird der Inhalt des auf dem lokalen Rechner befindlichen Verzeichnisses `/home/{benutzername}/Webseiten/Arbeitsverzeichnis/meinehomepage/blog/` in das entsprechende Verzeichnis `/httpdocs/{serverbenutzerkennung}/meinehomepage/blog/`auf dem Webserver (der Pfad kann je nach Provider variieren) synchronisiert.    
Die Parameter (im Befehl oben alle zusammengefaßt) bewirken:    
`-e` löscht die im lokalen Verzeichnis nicht mehr vorhandenen Dateien auf dem Server    
`-R` betrachtet das lokale Verzeichnis als Quelle und synchronisiert die Verzeichnisse auf dem Webserver     
`-v` "verbose" gibt die durchgeführten Operationen zur Kontrolle auf dem Bildschirm aus    

## Abläufe automatisieren
Aus dem oben Gesagten ergibt sich das folgende Script, das "in einem Aufwasch" alles erledigt:

- Seite zur Veröffentlichung erstellen
- tatsächlich aktualisierte Seiten filtern
- Veränderungen aus dem gefilterten Verzeichnis per ftp auf den Server übertragen

```
#!/bin/bash

# Hugo-internes Veröffentlichungs-Verzeichnis leeren
rm -r /home/{benutzername}/Webseiten/hugo/meinehomepage/public/

# aktualisierte Seite zur Veröffentlichung erstellen
hugo

# tatsächlich veränderte Files filtern und ins upload-Verzeichnis auf dem lokalen Rechner übertragen
rsync -rlpcgoDv --checksum --progress --stats --delete /home/{benutzername}/Webseiten/hugo/meinehomepage/public/ /home/{benutzername}/Webseiten/Arbeitsverzeichnis/meinehomepage/blog/ 

# ftp-Übertragung der geänderten Files: lftp aufrufen und Textfile mit Anweisungen übergeben
lftp -f lftp_sync.txt
```
und die zuletzt aufgerufene Textdatei `lftp_sync.txt`enthält:
```
lftp -u {benutzername}:{passwort} ftp://{domainname}.{domainendung} 
mirror -eRv /home/{benutzername}/Webseiten/Arbeitsverzeichnis/meinehomepage/blog/ /httpdocs/{serverbenutzerkennung}/meinehomepage/blog/
```
Damit ist das zu übertragende Datenvolumen auf den Webserver minimiert und eine Aktualisierung kann auch z. B. von unterwegs mobil durchgeführt werden.
