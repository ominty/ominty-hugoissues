+++
title       = "Ein Theme für Hugo erstellen - Tutorial Teil 1 - Das Rohgerüst und die Startseite"
date        = "2017-02-25"
description = "Es wird erläutert, wie ein Theme grundsätzlich aufgebaut ist und wie ein einfaches Template für eine Startseite erstellt werden kann"
keywords    = "Hugo, Webseite, Struktur, Verzeichnis, Template, Theme, Menü"
software 	= ["Webseiten"]
programme	= ["Hugo"]
tutorials	= ["Hugo"]

+++

In diesem Teil des Tutorials soll es um die ersten Schritte gehen, um ein eigenes Theme mit unterschiedlichen Templates zu erstellen.

Für das Verständnis ist die Kenntnis der ersten 5 Teile der [Tutorial-Serie](/tutorials/hugo.html) notwendig.<!--more-->

## Ein Rohskelett eines Themes erstellen
Im Terminal wird (siehe Teil 2) in das Arbeitsverzeichnis des Blogs oder der Homepage gewechselt und dort das Grundgerüst eines Themes erstellt:     
(_das Theme soll erweiterungsfähig gehalten werden, deshalb heißt das Basisverzeichnis nicht mehr `blog`, sondern `homepage`, und das bisherige Verzeichnis `blog` habe ich in ein Unterverzeichnis verschoben_)
```
~/home/{Benutzername}/Webseiten/homepage $ hugo new theme tutorial
```
bzw. für Windows-User:
```
C:\Dokumente und Einstellungen\{Benutzername}\Eigene Dateien\Webseiten\homepage> hugo new theme tutorial
```
Hugo legt dann im Ordner `themes` einen Unterordner `tutorial` an mit einigen - teilweise noch leeren - Verzeichnissen und einigen leeren Dateien.
```
.
├── config.toml
├── archetypes
├── content
├── data
├── layouts
├── static
└── themes
    └── tutorial
        ├── archetypes
        |   └── default.md
        ├── layouts
        |   ├── _default
        |   |   ├── list.html
        |   |   └── single.html
        |   ├── partials
        |   |   ├── header.html
        |   |   └── footer.html
        |   ├── 404.html
        |   ├── index.html
        |   └── rss.xml
        └── static
            ├── css
            └── js
```
Dieses neue Theme wird jetzt in der Konfigurationsdatei `config.toml` als Standard-Theme eingetragen:
```
theme = "tutorial"
``` 

## Die Template-Dateien im Ordner _Themes_
sind - wie bereits gesagt - zunächst noch leer. Um im Browser irgendwas angezeigt zu bekommen, wird zunächst ein __HTML-Grundgerüst__ benötigt, in das dann Inhalte eingefügt werden können. So eine Basisseite ist z. B. bei [selfhtml](https://wiki.selfhtml.org/wiki/CSS/Anwendung_und_Praxis/flexibles_Layout) zu finden, sie genügt modernen Ansprüchen, basiert auf HTML5 und ist mobiltauglich.

### Das HTML-Grundgerüst
Um die Erstellung eines universellen Themes zu erläutern, verwenden wir ein Basisgerüst, das folgende Elemente enthält:

- Kopfbereich für Logo, Titelzeile oder ähnliches
- darunter befindliche Navigationsleiste für die Bereiche der Homepage/des Blogs
- einen Inhaltsbereich
- eine Seitenleiste (z. B. für zusätzliche Navigation innerhalb des Bereichs)
- Fußleiste für Copyright-Notizen oder ähnliches

Das könnte dann so aussehen:

```
<!doctype html>
<html lang="de">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Homepage zu verschiedenen Themen</title>
</head>
 
<body>
  <header>
    <img src="logo.gif" alt="logo">
    <h1>Titel</h1>
    <nav>
      <ul>
	<li><a href="#index.html">Startseite</a></li>
	<li><a href="#blog.html">Blog</a></li>
	<li><a href="#wohnmobil.html">Wohnmobil</a></li>    
	<li><a href="#hunde.html">Hunde</a></li>    
	<li><a href="#kontakt.html">Kontakt</a></li>
      </ul>
    </nav>
  </header>
 
  <main>
    <article>
      <h1>Testseite</h1>
      <p>Um im Browser irgendwas angezeigt zu bekommen, wird zunächst ein <strong>HTML-Grundgerüst</strong>
benötigt, in das dann Inhalte eingefügt werden können. So eine Basisseite ist z. B. bei <a href="https://wiki.selfhtml.org/wiki/CSS/Anwendung_und_Praxis/flexibles_Layout">selfhtml</a> zu finden, sie genügt modernen Ansprüchen, basiert auf HTML5 und ist mobiltauglich.</p>
   </article>
 
  <aside>
    <h2>Weiterführende Links</h2>
    <ul>
      <li><a href="#seite_1.html">Seite 1</a></li>
      <li><a href="#seite_2.html">Seite 2</a></li>
      <li><a href="#seite_3.html">Seite 3</a></li>
    </ul>
  </aside>
  </main>
 
  <footer>
     <p>© 2017 by {Benutzername}</p>
  </footer>
</body>
</html>
```
Diesen HTML-Quelltext wird zunächst in die noch leere Datei `/themes/tutorial/layouts/index.html` kopiert. Das ist das Template (also die Seitenvorlage) für die Startseite.

Der Aufruf von Hugo im Servermode
```
~/home/{Benutzername}/Webseiten/homepage $ hugo server -w
```
liefert die bekannte Ausgabe:
```
Web Server is available at http://localhost:1313/ (bind address 127.0.0.1)
```
und der Aufruf der Adresse `http://localhost:1313/` im Browser zeigt dann diese sehr roh aussehende Seite an.    
Die Bereiche `header`, `nav`, `article`, `aside` und `footer` werden einfach untereinander angezeigt. Wie daraus mithilfe von CSS eine _schöne_ Seite wird, ist in dem genannten Tutorial bei selfhtml ausführlich beschrieben und hier nicht das Thema.    
An dieser Stelle soll schrittweise gezeigt werden, wie aus den Markdown-Dateien eine benutzbare Webseite wird. 

### "Inbetriebnahme" der Startseite
Für diesen Teil des Tutorials wird folgende Struktur der Webseite vorausgesetzt:

```
.
├── config.toml
├── archetypes
├── content
|   ├── _index.md
|   ├── wohnmobil
|   ├── hunde
|   ├── blog
|   └── kontakt
├── static
├── data
├── layouts
└── themes
```
Die Datei `/content/_index.md` repräsentiert dabei das Markdown-Gegenstück zur Startseite. Im ersten Schritt muß diese daher mit Inhalt gefüllt werden:

```
+++
title       = "Willkommen bei unserem Hugo-Tutorial"
date        = "2017-02-23"
+++

Um im Browser irgendwas angezeigt zu bekommen, wird zunächst ein **HTML-Grundgerüst** benötigt, in das dann Inhalte eingefügt werden können. So eine Basisseite ist z. B. bei [selfhtml](https://wiki.selfhtml.org/wiki/CSS/Anwendung_und_Praxis/flexibles_Layout) zu finden, sie genügt modernen Ansprüchen, basiert auf HTML5 und ist mobiltauglich.
```
In dieser Datei sind nun 3 Dinge festgelegt: 

1. der Seitentitel
1. das Erstelldatum
1. ein Inhaltstext

und um diese jetzt auf der Startseite angezeigt zu bekommen, muß die obige `html`-Datei `/themes/tutorial/layouts/index.html` so bearbeitet werden, daß dort Titel, Datum und Inhalt jeweils Variablen eingefügt werden:

```
<!doctype html>
<html lang="de">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>{{ .Title }}</title>
</head>
 
<body>
  <header>
    <img src="logo.gif" alt="logo">
    <h1>{{ .Title }}</h1>
    <nav>
      <ul>
	<li><a href="#index.html">Startseite</a></li>
	<li><a href="#blog.html">Blog</a></li>
	<li><a href="#wohnmobil.html">Wohnmobil</a></li>    
	<li><a href="#hunde.html">Hunde</a></li>    
	<li><a href="#kontakt.html">Kontakt</a></li>
      </ul>
    </nav>
  </header>
 
  <main>
    <article>
      <h1>{{ .Title }}</h1>
      {{ .Content }}
      <p>erstellt am  {{ .Date.Format .Site.Params.DateForm }}</p>
    </article>
 
  <aside>
    <h2>Weiterführende Links</h2>
    <ul>
      <li><a href="#seite_1.html">Seite 1</a></li>
      <li><a href="#seite_2.html">Seite 2</a></li>
      <li><a href="#seite_3.html">Seite 3</a></li>
    </ul>
  </aside>
  </main>
 
  <footer>
     <p>© 2017 by {Benutzername}</p>
  </footer>
</body>
</html>
```
Dabei fällt auf:

1. überall (im Beispiel 3x), wo der Seitentitel auftauchen soll, wird die Variable `{{ .Title }}` eingesetzt
1. der Seiteninhalt wird durch die Variable `{{ .Content }}` ersetzt
1. das Erstelldatum wird durch den Ausdruck `{{ .Date.Format .Site.Params.DateForm }}` bezeichnet, dieser beinhaltet sowohl das Datum selbst als auch eine Anweisung zu dessen Formatierung.

Einen Überblick über alle zur Verfügung stehenden Variablen gibt es in der [HUGO-Dokumentation](http://gohugo.io/templates/variables/).

Wird in der Datei `config.toml` eine Zeile der Form
```
DateForm = "02.01.2006"
```
eingefügt, dann erscheint das Datum in der Form `TT.MM.YYYY`, wie wir das hier im deutschsprachigen Europa gewöhnt sind.

### Die erste Template-Seite ist erstellt!
Wird Hugo im Servermode 
```
~/home/{Benutzername}/Webseiten/homepage $ hugo server -w
```
aufgerufen und der Browser auf die Adresse `http://localhost:1313/` gelenkt, dann kann man das Ergebnis betrachten. Änderungen in der Datei `/content/_index.md` (Titel, Datum, Seiteninhalt) werden mit jedem Abspeichern und Aktualisieren des Browsers sofort übernommen.    


## Zusammenfassung
Ein Template besteht aus einer leeren HTML-Datei, in der an den passenden Stellen Variablen plaziert sind, die Inhalte aus den Markdown-Dokumenten übernehmen.

In diesem Teil des Tutorials ging es um die Grundlagen und die Erstellung eines Templates, mit dem die ersten Inhalte der Startseite einer Homepage angezeigt werden können. Die Erstellung von Templates für weitere Inhaltsseiten ist Gegenstand einer weiteren Folge in dieser Reihe.

