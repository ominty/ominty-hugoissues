+++
title 		    = "Ein Blog mit Hugo erstellen - Tutorial Teil 2 - Einrichtung der Seitenstruktur"
date 		    = "2015-12-28T22:25:17+01:00"
description     = "Einrichtung der Verzeichnisstruktur der künftigen Webseite, Bedeutung der Hugo-Arbeitsverzeichnisse, Aufbau einer Inhaltsseite mit Seitenkopf und dem eigentlichen Inhalt"
keywords        = "Hugo, Webseite, Verzeichnis, Struktur, Seitenkopf, Inhalt"
software 	    = ["Webseiten", "Blog"]
programme	    = ["Hugo"]
tutorials 		= ["Hugo"]

+++

In der letzten Folge ging es um die Installation von Hugo auf dem lokalen Rechner, heute soll es um die Einrichtung der Verzeichnisse und der Konfiguration gehen, um ein Blog starten zu können.

## Seitenstruktur einrichten
Zunächst muß ein "Basisverzeichnis" erstellt werden, in dem alle Verzeichnisse, Unterverzeichnisse und Dateien des zukünftigen Blogs liegen.
Das könnte unter Windows z. B. sein:<!--more-->
```
C:\Dokumente und Einstellungen\{Benutzername}\Eigene Dateien\Webseiten\blog
```
oder unter Linux:
```
/home/{Benutzername}/Webseiten/blog
```
Nun muß Hugo mitgeteilt werden, daß er dort ein "Gerippe" des künftigen Blogs erstellen soll (hier für Linux, für Windows geht das analog mit dem entspr. Pfadnamen), dazu wird im Terminal eingegeben:
```
~$ hugo new site /home/{Benutzername}/Webseiten/blog
```
bzw:
```
C:\Dokumente und Einstellungen\{Benutzername} > hugo new site C:\Dokumente und Einstellungen\{Benutzername}\Eigene Dateien\Webseiten\blog
```

und dadurch wird von Hugo eine Unterverzeichnisstruktur erstellt:
```
.
├── config.toml
├── archetypes
├── content
├── data
├── layouts
├── themes
└── static
```
`config.toml` in der ersten Zeile ist eine Datei, die Konfigurationsdatei, in der generelle Einstellungen für die Webseite/das Blog notiert werden.  
Alles andere sind Verzeichnisse, die zunächst noch leer sind.

Und weil wir das Terminal später noch brauchen, wechseln wir hier gleich in das Verzeichnis des Blogs, hier für Linux:
```
~$ cd /home/{Benutzername}/Webseiten/blog
```
und für Windows:
```
C:\Dokumente und Einstellungen\{Benutzername} >cd C:\Dokumente und Einstellungen\{Benutzername}\Eigene Dateien\Webseiten\blog
```

### Konfigurationsdatei erstellen
Am Beispiel dieses Blogs zeige ich eine grundlegende Konfigurationsdatei:
```
baseurl = "http://privat.albicker.org/blog/"
languageCode = "de-DE"
title = "Seiten, die die Welt (nicht) braucht"
relativeURLs = true
```
Sie enthält die Internetadresse (url) des zukünftigen Blogs, Angaben zur Sprache, den generellen Seitentitel und die Anweisung, relative Pfade für die Unterseiten zu verwenden.

Letzteres ist m. E. dann wichtig, wenn das Blog nicht direkt auf der Hauptadresse wie z. B. `http://privat.albicker.org` läuft, sondern in einem Unterverzeichnis, hier `http://privat.albicker.org/blog/`, weil das Blog nur ein kleiner Teil einer größeren Seite ist.

### Bedeutung der einzelnen Verzeichnisse
Für den Beginn die wichtigsten Verzeichnisse sind _content_, _static_ und _themes_.

- content: in diesem Verzeichnis werden die Artikel erstellt
- static: hier werden Dateien abgelegt, die in die Artikel eingebunden werden: Bilder, pdf-Dokumente, Sound- und Video-Dateien. Diese Dateien werden 1:1 in die fertige Webseite kopiert beim Erstellen.
- themes: Ein Blog braucht nicht nur Inhalt, sondern auch ein Erscheinungsbild. In diesem Ordner werden in Unterordnern die Templates mit ihren Layouts gespeichert. Falls dieser Ordner nicht existiert, muß er erstellt werden.   
Fertige Themes für Hugo gibt es [hier](http://themes.gohugo.io/).

... und jetzt wollen wir im Verzeichnis _content_ ...

#### einen Artikel erstellen
Ein Artikel besteht aus zwei Teilen: dem Dateikopf und dem Seiteninhalt. Hugo kann eine "Rumpf-Datei" erstellen,
```
~/home/{Benutzername}/Webseiten/blog $ hugo new erster-beitrag.md
```
für Linux bzw. für Windows:
```
C:\Dokumente und Einstellungen\{Benutzername}\Eigene Dateien\Webseiten\blog> hugo new erster-beitrag.md  
```
die sich dann im Unterverzeichnis _content_ wiederfindet und ergänzt/bearbeitet werden kann.

Im Dateikopf sind Seitentitel, Datum, ggf. Ersteller, Kategorien, Tags etc. vermerkt, der Kopf für diese Tutorial-Seite sieht beispielsweise so aus:
```
+++
title 		= "Ein Blog mit Hugo erstellen - Teil 2"
date 		= "2015-12-28T22:25:17+01:00"
categories 	= ["Webseiten"]
tags 		= ["Hugo", "Tutorial"]

+++
```
Entwürfe kann man zusätzlich durch den Eintrag
```
draft = true
```
im Dateikopf kennzeichnen, diese Dokumente werden dann beim Erstellen der Seite ignoriert.

Unterhalb der unteren `+++`-Markierung kann der Seiteninhalt beginnen, er wird in [markdown](https://de.wikipedia.org/wiki/Markdown) - [Beispielseite](https://support.zendesk.com/hc/de/articles/203691016-Formatieren-von-Text-mit-Markdown) geschrieben, einer einfachen und auch für den Menschen gut lesbaren Formatierungs-Schrift.


Und jetzt müssen erstmal Inhalte für das neue Blog her - darum geht es in der nächsten Folge.