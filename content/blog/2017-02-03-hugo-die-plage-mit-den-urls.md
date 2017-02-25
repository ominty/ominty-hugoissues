+++
title 		= "Hugo und die Plage mit den URLs"
date 		= "2017-02-03"
description = "Relative und/oder absolute Links - falsch eingesetzt können Inhalte oder Layout-Bestandteile fehlen. Hier erkläre ich die Einstellungen in Hugo."
keywords      = "Hugo, URL, relativ, absolut, Link"
categories 	= ["Webseiten"]
tags 		= ["Hugo", "Tipps"]
+++

Eine Webseite im Internet anzugucken - ist nix besonderes, dazu sind die ja da. Hugo erstellt eine statische Webseite, es liegen fertige Files auf der Festplatte. Eigentlich sollte man diese auch direkt im Browser anschauen <!--more--> können, aber:    
(Für das Verständnis ist die Kenntnis der ersten 4 Teile des [Tutorials](/tags/hugo.html) notwendig) 

## "Die eierlegende Wollmilchsau"
So eine mit Hugo erstellte Webseite sollte also idealerweise

1. von einem Webserver erreichbar sein (und natürlich vollständig funktionieren, also alle Inhalte anzeigen), wenn man die Adresse aufruft (üblicherweise in der Form `http://www.domain.end`).
1. auch dann erreichbar sein, wenn die Webseite in einem (meist user-spezifischen) Unterverzeichnis, also z. B. `http://www.domain.end/benutzer0815/` liegt, das kommt bei Universitäten z. B. vor.
1. und zu guter Letzt funktionieren, wenn die Files von einem mobilen Datenträger auf einem beliebigen Rechner aufgerufen werden.

### Das Problem
Im [Teil 3](/blog/2015-12-29-ein-blog-mit-hugo-erstellen-teil3.html) des Tutorials, hatten wir gesehen, daß die Inhalte in Hugo in Verzeichnissen organisiert sind:

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

Die Themes mit den Seitenvorlagen sind ihrerseits auch wieder in Unterverzeichnissen organisiert.

Nun ist also sicherzustellen, daß nach dem Zusammenbauen, also dem 'Rendern' der Webseite alle Verweise sowohl auf andere Seiten als auch einzubindende Dateien wie z. B. Grafiken, CSS-Dateien etc. funktionieren, und zwar unabhängig davon, ob sie aus den Inhaltsseiten oder Template-Bestandteilen wie z. B. dem Seitenkopf oder der Fußzeile aufgerufen werden.

## Welche Hilfsmittel stellt Hugo zur Verfügung?
Grundsätzlich ist zu unterscheiden, ob es um 

- die Seiteninhalte oder 
- um Links zu Inhalten in den Seitenvorlagen (Templates) 

geht.

### Seiteninhalte
In der Konfigurationsdatei `config.toml` stelle ich ein:

```
+++
...
uglyURLs = true
relativeURLs = true
canonifyURLs = false
+++
```

1. Die erste Angabe bewirkt, daß die Adressen zu den einzelnen Seiten den vollständigen Dateinamen incl. der Endung enthalten, also z. B. eine Markdown-Datei `/content/blog/urls.md` wird umgesetzt nach `/public/blog/urls.html` und wäre im Internet erreichbar unter `http://www.domain.end/blog/urls.html`. 

   Die Standard-Einstellung "true" würde eine Adresse der Form `http://www.domain.end/blog/urls/` erzeugen. Wenn man genau hinschaut, dann ist das lediglich ein 'Trick', denn `/urls/` ist ein Verzeichnis, in dem eine Datei `index.html` steckt. Ein Webserver ist so konfiguriert, daß er dies Datei automatisch ausliefert, wenn man das Verzeichnis aufruft, von einem USB-Stick aber kann das nicht funktionieren.

2. Die zweite Angabe bewirkt, daß ein Link z. B. in einer Seite `/post/blog/urls.html` (in der dritten Verzeichnis-Ebene), der von dort auf `/kontakt.html` (1. Verzeichnis-Ebene) verweist, von Hugo in  `../../kontakt.html` 'übersetzt' wird.

3. Die dritte Einstellung entspricht der Hugo-Standard-Einstellung. In der Einstellung `true` würden alle relativen Adressen durch Voranstellen der `baseURL` in absolute Adressen verwandelt. 

### Seitenvorlagen / Templates
#### Inhaltsseiten verlinken
Hugos Template-System beruht grundsätzlich auf zwei Arten von Templates:

1. Einzelseiten (`single.html`): Hierin werden die Inhaltsseiten angezeigt, die als Markdown-Dokumente erstellt worden sind. Als automatisch generierte Links können hier auftreten:
    - Navigationselemente (nächste/vorige Seite) sowie ggf. 
    - die Links zu den Listenseiten der vergebenen Kategorien und Schlagworten
1. Listenseiten (`list.html`): Basierend auf dieser Vorlage werden Auflistungen der vorhandenen Artikel erstellt, z. B. sortiert nach Datum, gefiltert nach Kategorie oder Schlagwort o. ä. Als automatisch generierte Links können hier auftreten:
    - Links zu den jeweils gelisteten Einzelartikeln
    - Navigationselemente für das vor- und zurückblättern von Unterseiten der Listen, wenn diese viele Artikel enthalten

In allen diesen Fällen wird üblicherweise die Variable `.Permalink` verwendet, die den Link zum jeweiligen Element speichert. Für "portable" Seiten muß an allen diesen Stellen stattdessen die Variable `.RelPermalink` eingesetzt werden, die den _relativen_ Link zum Element speichert.

#### Gestaltungselemente einbinden
Um Gestaltungselemente wie Logos oder CSS-Dateien in Templates einzubinden, aber auch unterstützende Scripte, helfen die [Funktionen](https://gohugo.io/templates/functions/#urls) `absURL` und `relURL` weiter. 

Ist z. B. in der Konfiguration (hier: config.toml) definiert:
```
+++
baseURL = "http://www.domain.end/blog/"
...
+++
```
und wird in der Vorlage z. B. auf eine CSS-Datei verwiesen    
Beispiel im `<head>` Bereich eines Templates:
```
        <link rel="stylesheet" href="{{ "/css/formatierungen.css" | relURL }}">
```
dann wird bei Angabe in der Form

-  `{{ "/css/formatierungen.css" | absURL }}` die vollständige Adresse `http://www.domain.end/css/formatierungen.css` schon in der HTML-Datei hinterlegt (die damit nicht mehr lokal ohne Internetanschluss auf dem eigenen Rechner funktioniert).
- `{{ "/css/formatierungen.css" | relURL }}` in der fertigen HTML-Datei den Pfad `./css/formatierungen.css` ergeben und im Browser abgerufen
    - vom Webserver zur korrekten Adresse `http://www.domain.end/blog/css/formatierungen.css` führen.
    - auf einem lokalen Rechner z. B. aus einem Verzeichnis `/home/{benutzer}/webseite/`, in dem die HTML-Dateien des fertigen Webauftritts liegen, zu der Adresse `/home/{benutzer}/webseite/css/formatierungen.css` führen und ebenfalls korrekt angezeigt werden.
    
Bei vielen fertig verfügbaren Templates ist dieser Punkt vernachlässigt, sodaß diese nicht oder nur unvollständig funktionieren, wenn man die fertigen HTML-Dateien einfach so - ohne Webserver - im Browser aufruft.

## Zusammenfassung:
Um eine mit Hugo erzeugte Webseite "portabel" zu machen, d. h. sie so zu gestalten, daß sie _von jedem Speicherort auf jedem beliebigen Datenträger oder Server aufgerufen werden kann und vollständig funktioniert_, ist auf folgende Grundvoraussetzungen zu achten:

1. richtige Grundeinstellungen in der Konfigurationsdatei:
`uglyURLs = true`, `relativeURLs = true` und `canonifyURLs = false`
1. In den Inhaltsseiten im Markdown darauf achten, relative Pfade in dieser Form anzugeben: `/Pfad/zur/Datei.Endung`
1. In den Templates/Seitenvorlagen zur Erstellung von Links zu den Einzelartikeln aus Listen heraus die Variable `.RelPermalink` anstelle von `.Permalink` verwenden
1. Für die Einbindung anderer Dateien in Templates/Seitenvorlagen die Funktion `relURL` verwenden, z. B. für die Einbindung eines Stylesheets in der Form `{{ "/css/formatierungen.css" | relURL }}`
1. Und zu guter Letzt: an keiner Stelle darf die Variable `.BaseURL` auftauchen ...
