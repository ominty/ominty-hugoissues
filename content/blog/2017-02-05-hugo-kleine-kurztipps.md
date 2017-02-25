+++
title 		= "Hugo - kleine Kurztipps"
date 		= "2017-02-05"
description = "Eine kleine Sammlung von Codeschnipseln und Hinweisen, die immer mal wieder nützlich sein können"
keywords      = "Hugo, Webseite, Datum, Format, Variablen"
categories 	= ["Webseiten"]
tags 		= ["Hugo", "Tipps"]
+++

Ich möchte hier eine kleine Sammlung anlegen von Dingen, die mir bei der Arbeit mit Hugo _in die Quere gekommen_ sind. Die Sammlung wird wohl immer wieder mal erweitert werden ...

## Datum/Zeit formatieren
Wird Hugo mit einem Standard-Thema verwendet, dann erscheinen Datumsangaben meist in der Form<!--more-->

> Mon, Jan 2, 2006

Das ist auf deutschsprachigen Webseiten nicht schön. Tages- und Monatsnamen zu übersetzen ist mit gewissem Programmier-Aufwand verbunden, aber es ist einfach, das Datum in die eher gewohnte Form

> 02.01.2006 

zu bringen.

In der `Go language` ist ein [Referenzdatum](https://golang.org/pkg/time/#pkg-constants) definiert:

    Mon Jan 2 15:04:05 MST 2006
    
Durch einfaches Umstellen oder Weglassen der einzelnen Komponenten kann man sich  sein Wunschformat _zurechtrücken_ und in der seitenweiten Konfigurationsdatei `config.toml` festlegen:
```
[params]
    DateForm = "02.01.2006"
```
In den Templates wird dann jeweils an den Stellen, an denen das Artikel-Datum erscheinen soll (aus dem jeweiligen Seitenkopf des zugehörigen Markdown-Dokuments), zum Beispiel folgendes notiert:

    veröffentlicht am {{ .Date.Format .Site.Params.DateForm }}
      
und es erscheint z. B. für diesen Artikel zum Tage der Erstveröffentlichung:

> veröffentlicht am 05.02.2017

... das ist einfach.

## Falsches Template? Erstmal Variablen ermitteln
Hugo verfügt über klare Richtlinien, welches Template für die Darstellung welchen Inhalts verwendet wird. Manchmal wundert man sich trotzdem, warum "das falsche Template" gewählt wird.

Hier hilft es, erstmal die entsprechenden Variablen der jeweiligen Seite zu ermitteln, um zu erfahren, "_was sich Hugo so denkt_". Diese habe ich zu einer kleinen HTML-formatierten Tabelle zusammengestellt, die an geeigneter Stelle in einem Template eingefügt werden kann:

```
<table>
<tr><td>Site-Titel: </td><td>{{ .Site.Title }}</td></tr> <!-- Titel aus config.toml -->
<tr><td>Seitentitel (.Title): </td><td>{{ .Title }}</td></tr> <!-- Einzelseite, aus Frontmatter entnommen -->
<tr><td>Art der Seite (.Kind): </td><td>{{ .Kind }}</td></tr> <!-- page, home, section, taxonomy oder taxonomyTerm -->
<tr><td>Sektion: </td><td>{{ .Section }}</td></tr> <!-- gibt den Bereich aus -->
<tr><td>Type: </td><td>{{ .Type }}</td></tr> <!-- gibt den Typ aus -->
<tr><td>Home: </td><td>{{ .IsHome }}</td></tr> <!-- wahr, falls Homepage -->
<tr><td>Node: </td><td>{{ .IsNode  }}</td></tr> <!-- wahr, falls die Seite ein "Node" ist -->
<tr><td>Content: </td><td>{{ .IsPage }}</td></tr> <!-- wahr, falls es eine Inhaltsseite ist -->
<tr><td>nächste Seite: </td><td>{{ .Next }}</td></tr> <!-- nächste Seite nach Datum -->
<tr><td>nächste Sect.Seite: </td><td>{{ .NextInSection }}</td></tr> <!-- nächste Seite im Bereich nach Datum -->
<tr><td>vorher. Seite: </td><td>{{ .Prev }}</td></tr> <!-- vorherige Seite nach Datum -->
<tr><td>vorher. Sect.Seite: </td><td>{{ .PrevInSection }}</td></tr> <!-- vorherige Seite im Bereich nach Datum -->
<tr><td>Permalink: </td><td>{{ .Permalink }}</td></tr> <!-- absoluter Permalink -->
<tr><td>Rel. Permalink: </td><td>{{ .RelPermalink }}</td></tr> <!-- relativer Link als Permalink -->
<tr><td>URL: </td><td>{{ .URL }}</td></tr> <!-- aktuelle Adresse der Seite -->
</table>
```
Die Ausgabe für diese Blogseite lautet im Hugo-Server-Mode zum Beispiel:

> Site-Titel: 	Iveco Daily 4x4, Hunde und multithematisches Blog - Bernhard Albicker     
Seitentitel (.Title): 	Hugo - kleine Kurztipps     
Art der Seite (.Kind): 	page     
Sektion: 	blog    
Type: 	blog     
Home: 	false    
Node: 	false      
Content: 	true     
nächste Seite: 	Page("Hugo und PHP?")    
nächste Sect.Seite: 	Page("Soso, die NATO fühlt sich bedroht")     
vorher. Seite: 	Page("Soso, die NATO fühlt sich bedroht")    
vorher. Sect.Seite: 	Page("Hugo und PHP?")     
Permalink: 	http://localhost:1313/blog/2017-02-05-hugo-kleine-kurztipps.html     
Rel. Permalink: 	/blog/2017-02-05-hugo-kleine-kurztipps.html     
URL: 	/blog/2017-02-05-hugo-kleine-kurztipps.html      


