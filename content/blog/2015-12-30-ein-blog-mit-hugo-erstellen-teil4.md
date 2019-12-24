+++
title 		    = "Ein Blog mit Hugo erstellen - Tutorial Teil 4 - Betriebsmodi von Hugo"
date 		    = "2015-12-30T22:25:17+01:00"
description     = "Hugos Betriebsmodi: Server-Mode und Rendering-Mode. Was bedeutet das? Welcher Mode wird wofür benötigt? Es wird die Live-Vorschau beim Erstellen von Artikeln beschrieben sowie der Export zur fertigen Webseite für den Webserver im www"
keywords        = "Hugo, Webseite, Rendering, Server, Vorschau, Live"
software 	    = ["Webseiten", "Blog"]
programme	    = ["Hugo"]
tutorials 		= ["Hugo"]

+++

In der letzten Folge ging es um das Erstellen von Inhalten mithilfe von in der Auszeichnungssprache _markdown_ geschriebenen Dokumenten, heute soll es um die Erzeugung und Darstellung der Seiten aus den einzelnen Bausteinen in Hugo gehen.

## Betriebsmodi von Hugo
Hugo kennt zwei Modi, den

- Server-Mode: er dient der Darstellung der Live-Seiten bei der Erstellung der einzelnen Beiträge
- Rendering-Mode: er dient der Erstellung der fertigen html-Dokumente, die dann auf den Server gelanden werden können
<!--more-->

### Server-Mode zur Live-Anzeige der Entwurfsseiten
Aus dem Arbeitsverzeichnis (siehe Teil 2) wird Hugo wie folgt aufgerufen:

    ~/home/{Benutzername}/Webseiten/blog $ hugo server --theme=hugo-multi-bootswatch-master --watch --buildDrafts

Dem eigentlichen Befehl `hugo server` werden als Optionen mitgegeben:

- --theme: der Name des Themes, das für die Optik gewählt wurde (entspricht dem Unterverzeichnisnamen des Themes, das im Ordner `themes` der Hugo-Verzeichnis-Struktur liegen muß). Alternativ läßt sich auch eine Zeile `theme = "{theme-name}"` in die `config.toml` einfügen.    
- --watch: bedeutet, daß Hugo die Dokumenten-Ordner laufend überwacht und den Browser zum Aktualisieren der Seite veranlaßt, wenn ein geändertes Dokument gespeichert wird
- --buildDrafts: auch Seiten, die im Kopf als Entwurf `draft = true` markiert sind, werden angezeigt.

Der Server antwortet
```
2 of 2 drafts rendered
0 future content
16 pages created
2 paginator pages created
8 tags created
5 categories created
in 51 ms
Watching for changes in ~/home/{Benutzername}/Webseiten/blog/{data,content,layouts,static,themes}
Serving pages from memory
Web Server is available at http://localhost:1313/blog/ (bind address 127.0.0.1)
Press Ctrl+C to stop
```
mit Angaben, wieviele und welche Seiten erzeugt wurden und nennt zum Schluß die Adresse, die in den Browser eingegeben werden kann, um die Seite zu sehen, in meinem Fall hier: `http://localhost:1313/blog/`    
Mit `Strg - C` kann der Server wieder gestoppt werden.

Wird eine geänderte Seite abgespeichert, dann meldet sich Hugo mit
```
Change detected, rebuilding site
2015-12-27 00:15 +0100
```
wiederum gefolgt von der Statistik der neu erstellten Seiten.    
Gleichzeitig wird der Browser veranlaßt, die Seite automatisch neu zu laden.

### Rendering-Mode
Bisher hat Hugo nur im Arbeitsspeicher gearbeitet und die aus den Markdown-Dokumenten übersetzten Seiten live angezeigt.

Um die Seiten im www veröffentlichen zu können, benötigen wir aber "echte" html-Dokumente, die wir auf den Webserver laden können.    
Diese werden wiederum durch Aufruf von Hugo aus dem Arbeitsverzeichnis, diesmal mittels
```
~/home/{Benutzername}/Webseiten/blog $ hugo --theme=hugo-multi-bootswatch-master
```
erzeugt.
Hier wird logischerweise auf die Option `--buildDrafts` verzichtet (wir wollen ja nur fertige Seiten veröffentlichen), und auch die Option `--watch` wird nicht benötigt.

## Veröffentlichung der fertigen Seite
Das Ergebnis dessen, was Hugo im Rendering-Mode erzeugt hat, liegt im Hugo-Verzeichnis `public` und dessen Unterverzeichnissen.

Der Inhalt von (unter Annahme der Verzeichnis-Pfade aus Teil 2) 

    ~/home/{Benutzername}/Webseiten/blog/public
    
bzw., für Windows,

    C:\Dokumente und Einstellungen\{Benutzername}\Eigene Dateien\Webseiten\blog\public
    
ist komplett auf den Webserver zu übertragen, üblicherweise mittels eines ftp-Programms.    
Hilfreich sind dabei solche ftp-Programme, die die Verzeichnisse auf dem Webserver und dem lokalen Rechner vergleichen können und nur die Änderungen übertragen. Das spart Übertragungszeit und -volumen.

Damit ist die Grundlagen-Einführung in Hugo beendet, ich werde mich jetzt erstmal wieder der Erstellung von Artikeln widmen. 
   
Langfristig würde ich mir wünschen, das Blog dem Layout der Homepage anzupassen, d. h. es muß ein individuelles Theme her.    
Wenn es eines Tages soweit ist, dann werde ich auch das hier beschreiben - versprochen!
