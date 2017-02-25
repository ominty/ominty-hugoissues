+++
title 		= "Ein Blog mit Hugo erstellen - Tutorial Teil 3 - Erstellen von Inhalten"
date 		= "2015-12-29T22:25:17+01:00"
description = "Eine Inhaltsseite wird erstellt: Dateikopf, Inhalt, einbinden von Inhalten wie Bildern, "
keywords      = "Hugo, Webseite, Datum, Format, Inhalt, Markdown"
categories 	= ["Webseiten"]
tags 		= ["Hugo", "Tutorial"]

+++

Nachdem wir in den ersten beiden Teilen die Software eingerichtet und die Seitenstruktur erstellt haben, können wir jetzt beginnen mit dem

## Erstellen von Inhalten
Wie bereits am Ende des letzten Teils erwähnt, wird der Inhalt der einzelnen Textdokumente in [markdown](https://de.wikipedia.org/wiki/Markdown) - [Beispielseite](https://support.zendesk.com/hc/de/articles/203691016-Formatieren-von-Text-mit-Markdown) geschrieben, einer einfachen und auch für den Menschen gut lesbaren Formatierungs-Schrift.<!--more-->

### Beispiel-Markdown-Dokument
Ein im Texteditor erstelltes Dokument dieser Art
```
## Testüberschrift 2. Ordnung
Dies hier gibt einen __fett__ gedruckten, manchmal auch _kursiven_ Text.
### Testüberschrift 3. Ordnung
Text kann auch umgebrochen werden,    
dazu müssen 4 Leerzeichen ans Ende einer Zeile.

Eine Leerzeile ergibt einen neuen Absatz.    
Ein Bild wird so

![Bilddtitel](/bilder/2015-12/testbild-hugo.png "Bildbeschreibung bei Mausberührung")

eingefügt.
```
wird so im Browser dargestellt:

****
## Testüberschrift 2. Ordnung
Dies hier gibt einen __fett__ gedruckten, manchmal auch _kursiven_ Text.
### Testüberschrift 3. Ordnung
Text kann auch umgebrochen werden,    
dazu müssen 4 Leerzeichen ans Ende einer Zeile.

Eine Leerzeile ergibt einen neuen Absatz.    
Ein Bild wird so

![Bilddtitel](/bilder/2015-12/testbild-hugo.png "Bildbeschreibung bei Mausberührung")

eingefügt.

****

Schrifttypen und -größen ergeben sich aus den Festlegungen im verwendeten Theme.

### "Einsortieren" der Inhalte in die Verzeichnisstruktur
#### Textdokumente
Alle Markdown-Dokumente werden mit einem aussagekräftigen Dateinamen (ich stelle das Datum in der Form `YYYY-MM-DD` voran, dann liegen die Einträge zeitlich sortiert im Verzeichnis) und der Endung `.md` abgespeichert.

In der Hugo-Verzeichnisstruktur ist das Verzeichnis `content`der richtige Platz.

Hugo bietet die Möglichkeit, Dokumente je nach ihrer Art unterschiedlich zu formatieren.     
Blogposts beinhalten in der Regel Datum/Uhrzeit, Tags, Kategorisierungen etc. und sind chronologisch fortlaufende Beiträge.    
Demgegenüber gibt es auch normale Seiten, wie z. B. eine Darstellung der Angebote der Webseite, Lizenz- oder Rechtshinweise oder eine Kontaktseite.
Diese Seiten werden ständig angezeigt und benötigen weder Datum-/Zeitangaben noch blogtypische Angaben wie Tags etc.

Eine Sortierung in unterschiedliche Unterverzeichnisse erhöht nicht nur die Übersicht, sondern ermöglicht es auch, Hugo im Theme mitzuteilen, wie die Seitentypen in den Unterverzeichnissen formatiert werden müssen.

#### Bilder und Multimedia
In die Textdokumente eingebundene Elemente gehören ins Verzeichnis `static`, wobei ich dort eine Unterverzeichnis-Struktur der Form `YYYY-MM` etabliert habe. So lassen sich die Elemente, z. B. Bilder, leichter den zugehörigen Blogeinträgen zuordnen (andererseits wird der einzutippende Pfadname etwas länger, siehe Beispiel oben)

#### Themes/Templates
Um Webseiten generieren zu können, benötigt Hugo neben den Inhalten auch Angaben, in welcher Form die Seiten gestaltet sein sollen. Dies wird durch die sog. Themes erreicht.

Für dieses Tutorial beschränken wir uns darauf, fertige Themes zu verwenden. Auf [http://themes.gohugo.io/](http://themes.gohugo.io/) sind viele Beispiele zu finden, diese können heruntergeladen werden, es sind i. d. R. zip-Dateien.    
Nach dem Entpacken muß der entstandene Ordner in das Verzeichnis `themes` der Hugo-Ordner-Struktur verschoben werden (falls dieses noch nicht besteht, dann muß es erstellt werden).    
Bei einzelnen Themes müssen noch Angaben in deren Konfigurationsfiles eingetragen werden oder diese müssen an einen anderen Ort verschoben werden. Angaben hierzu finden sich jeweils in der Datei `Readme.md` im Ordner des jeweiligen Themes.


## Die resultierende Verzeichnis-Struktur
mit den beispielhaften Inhalten sieht demnach dann so aus:
```
.
├── config.toml
├── archetypes
├── content
|   ├── post
|   |   ├── 2012-12-29-installation-mit-uefi-bios.md
|   |   └── 2015-12-26-ein-blog-mit-hugo-erstellen-teil1.md
|   |   └── 2015-12-28-ein-blog-mit-hugo-erstellen-teil2.md
|   |   └── 2015-12-29-ein-blog-mit-hugo-erstellen-teil3.md
|   └── page
|       ├── kontakt.md
|       └── about.md
├── static
|   └── bilder
|       └── 2012-12
|           ├── bios-screenshot-1.png
|           ├── bios-screenshot-2.jpg
|           └── os-dvd.png
├── data
├── layouts
└── themes
    ├── hyde
    ├── hugo-multi-bootswatch-master
    └── irgend-ein-anderes-theme
    
```

Und wie bekommen wir jetzt was zu sehen? Das ist Inhalt der nächsten Folge.