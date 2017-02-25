+++
title = "Eine Webseite mit Hugo erstellen - Tutorial Teil 1 - Inhalte strukturieren"
date = "2017-01-23"
description = "Struktur einer Webseite für den Einsatz von Hugo, es werden erläutert: Verzeichnisse, Bereiche, Dokumententypen"
keywords      = "Hugo, Webseite, Struktur, Verzeichnis, Template, Theme, Menü"
categories = ["Webseiten"]
tags = ["Hugo", "Tutorial"]
+++

Nach über einem Jahr "Testbetrieb" meines neuen Hugo-Blogs innerhalb meiner alten Homepage (die mit nur kleinen Änderungen am Layout seit jetzt über 10 Jahren online ist), und weil auch auf meiner Seite die Zugriffe mit Geräten mit kleinen Displays zunehmen, habe ich mich entschlossen, den kompletten Webauftritt neu zu organisieren.
Und wenn ich ohnehin schon an einem neuen HTML5-Template arbeite, dann kann ich auch gleich neben dem Blog _die komplette Homepage_ in Hugo integrieren. Dieser Artikel beschreibt die Voraussetzungen seitens Hugo und die daraus resultierende Vorgehensweise.   
Für das Verständnis ist die Kenntnis der ersten 4 Teile des [Tutorials](/tags/hugo.html) notwendig.<!--more-->

## Struktur der Inhalte in Hugo
Hugo geht davon aus, daß der Autor einer Webseite seine Inhalte bewußt in (z. B. thematische) Bereiche unterteilt. Üblicherweise nutzt man dazu Unterordner, d. h. im Ordner `content` könnte es so aussehen:

```
.
├── config.toml
├── archetypes
├── content
|   ├── _index.md
|   ├── iveco-technik
|   ├── iveco-womo
|   ├── hunde
|   ├── blog
|   └── kontakt
├── static
├── data
├── layouts
└── themes
```

Die auf der obersten Ebene des `content`-Verzeichnisses liegende Datei `_index.md` ist dazu gedacht, spezielle Inhalte der Startseite der Homepage/des Internetauftritts zu speichern.

### sections
Hugo faßt die Unterverzeichnisse, hier `iveco-technik`, `iveco-womo`, `hunde`, `blog`, `kontakt` als eigenständige _Inhaltsbereiche_, sog. _sections_ auf. Daraus lassen sich zwei Funktionen ableiten:

1. Templates:
Über Template-Vorlagen läßt sich das Aussehen der einzelnen Inhaltsseiten für die jeweiligen Bereiche unterschiedlich, aber innerhalb eines Bereichs einheitlich, festlegen.
1. Menüs:
Aus den Bereichen läßt sich automatisch ein Hauptmenü erzeugen, das die jeweiligen Startseiten der einzelnen Bereiche anzeigt und verlinkt.

#### Templates
Damit Hugo aus den Inhaltsseiten im Verzeichnis `content` überhaupt Webseiten generiert, bedarf Hugo sog. _Templates_. Das sind Seitenvorlagen, in die die jeweiligen Texte und Bilder aus den erstellten markdown-Dokumenten an vorbestimmte Stellen eingefügt werden. Ich hatte im [Teil 2]( /blog/2015-12-28-ein-blog-mit-hugo-erstellen-teil2.html) kurz darauf Bezug genommen und auf fertige Hugo-Templates verwiesen.

Aus dem oben Gesagten folgt jetzt, daß sich die Verzeichnis-Struktur der Inhalte auch im Template-Verzeichnis (hier: `private-homepage`) widerspiegeln muß:

```
.
├── config.toml
├── archetypes
├── content
├── data
├── layouts
├── static
└── themes
    ├── hyde
    ├── hugo-multi-bootswatch-master
    └── private-homepage
        ├── _default
        ├── iveco-technik
        ├── iveco-womo
        ├── hunde
        ├── blog
        └── kontakt
```

Würde ich mich jetzt entscheiden, daß z. B. die Bereiche `iveco-technik`, `iveco-womo` und `hunde` alle im gleichen Erscheinungsbild dargestellt werden sollen, dann könnte ich diese Verzeichnisse im `themes`-Verzeichnis weglassen. Hugo sucht dann nach einem Ersatz-Template im Ordner `_default` und wendet dieses dann für alle Seiten aus den genannten Bereichen an.

#### Menüs
Hierzu für den Moment nur soviel: Mithilfe der Hugo-eigenen Template-Sprache (Go html/template library) können aus den Sections die Variablen gewonnen werden, die für die Erstellung von Menü-Einträgen nötig sind:

```
- URL string
- Name string
- Menu string
- Identifier string
- Pre template.HTML
- Post template.HTML
- Weight int
- Parent string
- Children Menu
```

Evtl. wird dazu eine eigene Folge dieses Tutorials entstehen, bis dahin sei auf die (englischsprachige) [Referenz](https://gohugo.io/extras/menus#what-is-a-menu) verwiesen.

### type
Wie beschrieben sucht Hugo die Formatvorlagen für die Inhalte anhand der jeweiligen `section` aus, und falls diese nicht vorhanden sind, greift er auf die `_default`-Vorlagen zurück. Was aber nun, wenn ich innerhalb mehrerer Bereiche einzelne Seiten mit abweichendem Layout erstellen möchte, z. B. je eine Bildergalerie in den Iveco-Bereichen und im Bereich Hunde?

Hugo ermöglicht es, jeder Datei im Seitenkopf (`frontmatter`) einen _Inhaltstyp_ zuzuordnen. Anhand dieses _type_ ist es nun möglich, innerhalb einer _section_ auf ein abweichendes Layout zuzugreifen.

```
+++
type = "bildergalerie"
title = "Viele schöne Iveco-Bilder"
date = "2016-12-28T22:25:17+01:00"
categories = ["Webseiten"]
tags = ["Hugo", "Tutorial"]
+++
```

Nun müssen im "Themes-Verzeichnis", hier im Theme `private-homepage`, ein Ordner `bildergalerie` und in diesem die Seitenvorlagen für das "Spezial-Layout Bildergalerie" erstellt werden

```
.
├── config.toml
├── archetypes
├── content
├── data
├── layouts
├── static
└── themes
    ├── hyde
    ├── hugo-multi-bootswatch-master
    └── private-homepage
        ├── _default
        ├── iveco-technik
        ├── iveco-womo
        ├── hunde
        ├── blog
        ├── kontakt
        └── bildergalerie
```

__Schlußfolgerung:__
Solange mit den Standard-Layouts in den Bereichen oder überhaupt für die gesamte Webseite gearbeitet wird, kann im Dateikopf der Markdown-Dokumente auf die `type`-Deklaration verzichtet werden. Hugo sucht sich dann die bereichsspezifische Seitengestaltung oder das Standard-Layout (in dieser Reihenfolge) aus.
Soll aber für einzelne Seiten ein spezielles Layout genutzt werden, dann wird dies durch Einfügen einer eigenen `type`-Anweisung möglich.


Und wie wird jetzt ein Theme mit den jeweiligen Templates für die einzelnen Seiten(bereiche/-typen) erstellt?
Das wird Gegenstand einer weiteren Folge.

