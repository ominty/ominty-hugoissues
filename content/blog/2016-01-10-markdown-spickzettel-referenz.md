+++
title 		= "Markdown-Spickzettel - eine Kurzreferenz"
date 		= "2016-01-09"
description = "Eine Zusammenstellung der Formatierungsmöglichkeien von Inhaltsseiten mit Markdown"
keywords      = "Hugo, Webseite, Markdown, Formatierung"
categories 	= ["Webseiten"]
tags 		= ["Referenz", "Hugo"]

+++

Markdown ist eine einfach zu erlernende und auch zu merkende [Auszeichnungssprache](https://de.wikipedia.org/wiki/Auszeichnungssprache). Mit ihr können Texte formatiert werden, die dann einerseits auch für den Menschen als Quelltext (also direkt im Editor betrachtet) halbwegs "verdaulich" aussehen, andererseits leicht in andere Auszeichnungssprachen - für das Internet im Wesentlichen `html` - umgewandelt werden können.

Ich habe mir hier für meinen persönlichen Gebrauch die in diesem Blog verwendeten Formatierungen zusammengestellt. Vielleicht hilft's ja dem einen oder anderen.

<!--more-->

## Grundsätzliches
Verwendet wird Markdown in vielen Websystemen wie z. B. Blog-Software, um dem Schreiber das schnelle Erstellen von Texten zu ermöglichen, ohne ständig mit der Maus in einem sog. WYSIWYG-Editor herumklicken zu müssen.

Der grau hinterlegte Kasten zeigt dabei jeweils, wie das Beispiel im Editor geschrieben aussieht, der Kasten darunter zeigt dann das Ergebnis an, wie es nach Durchlaufen der jeweiligen Software im Browser darstellt wird.

### Textbetonungen
```
Dies ist ein _kursiver Text_ mit __fetten Wörtern__, aber auch ___fett kursiven Abschnitten___.
```
<div class="kasten">Dies ist ein <i>kursiver Text</i> mit <b>fetten Wörtern</b>, aber auch <b><i>fett kursiven Abschnitten</i></b>.</div>

Anstelle der Unterstriche `_` können auch Sterne `*` verwendet werden:
```
Dies ist ein *kursiver Text* mit **fetten Wörtern**, aber auch ***fett kursiven Abschnitten***.
```

### Textstrukturierung
#### Überschriften
Anm.: Zwischen einem Textabsatz und einer darauf folgenden Überschrift muß eine Leerzeile eingeschoben werden.
```
# Überschrift erster Ordnung (Seitentitel)
## Überschrift zweiter Ordnung (Kapitelüberschrift)
### Überschrift dritter Ordnung
#### Überschrift vierter Ordnung
```
<div class="kasten">
<h1>Überschrift erster Ordnung (Seitentitel)</h1>
<h2>Überschrift zweiter Ordnung (Kapitelüberschrift)</h2>
<h3>Überschrift dritter Ordnung</h3>
<h4>Überschrift vierter Ordnung</h4>
</div>

Wie die jeweilige Überschrift dann konkret dargestellt wird, das hängt von den Formatierungsanweisungen des jeweiligen Templates der Webseite ab, hier werden z. B. die Überschriften erster und zweiter Ordnung mit horizontalen Linien hervorgehoben, die Überschrift erster Ordnung zusätzlich auch noch hellgrau hinterlegt.

#### Zeilenumbrüche und Absätze
```
Ein einfacher Zeilenumbruch     
erfolgt durch Einfügen von 2 oder mehr Leerzeichen am Zeilenende.

Ein neuer Absatz entsteht durch Einfügen einer Leerzeile.
```
<div class="kasten"><p>Ein einfacher Zeilenumbruch <br>    
erfolgt durch Einfügen von 2 oder mehr Leerzeichen am Zeilenende.</p>

<p>Ein neuer Absatz entsteht durch Einfügen einer Leerzeile.</p></div>


#### Listen
Hinweis: _vor_ und _nach_ einer Liste muß i. d. Regel eine Leerzeile eingefügt werden.

Zunächst die __ungeordnete__ Liste:
```
- ein Listenpunkt
- noch ein Listenpunkt
- und ein weiterer Listenpunkt
```
<div class="kasten">
<ul>
	<li>ein Listenpunkt</li>
	<li>noch ein Listenpunkt</li>
	<li>und ein weiterer Listenpunkt</li>
</ul>
</div>

Anstelle der Bindestriche `-` können auch Sterne `*` verwendet werden. Wichtig ist das Leerzeichen zwischen dem Symbol und dem darauffolgenden Text des Listenpunktes.

Die __geordnete__ Liste weist eine Zählung auf:

```
1. ein Listenpunkt
3. noch ein Listenpunkt
2. und ein weiterer Listenpunkt
```
<div class="kasten">
<ol>
	<li>ein Listenpunkt</li>
	<li>noch ein Listenpunkt</li>
	<li>und ein weiterer Listenpunkt</li>
</ol>
</div>

Wie man sieht, spielt die Reihenfolge der Nummerierung keine Rolle. Somit kann man auch jederzeit Listenpunkte "dazwischen schieben" - oder auch gänzlich auf eine Zählung verzichten und allen Punkte einfach ein `1. ` voranstellen.


### Verweise
#### Hyperlinks
Keine Internetseite ohne Links, also muß es auch Möglichkeiten dazu in Markdown geben:
```
Dies ist ein [Link auf diese Seite](http://privat.albicker.org/blog/2016-01-10-markdown-spickzettel-referenz.html).
```
<div class="kasten">
<p>Dies ist ein <a href="http://privat.albicker.org/blog/2016-01-10-markdown-spickzettel-referenz.html">Link auf diese Seite</a>.</p>
</div>

#### Mediendaten einfügen bzw. anhängen
```
Ein Bild wird eingefügt durch diesen Verweis:
![Alternativtext](/Pfad/zum/Bild.jpg "Bildtitel")
```
<div class="kasten">
<p>Ein Bild wird eingefügt durch diesen Verweis:</p>
<img src="/bilder/2016-01/bilddateien.png" alt="Alternativtext" title="Bildtitel">
</div>

Dabei wird der Alternativtext benutzt, wenn das Bild nicht angezeigt wird (der Benutzer z. B. die Anzeige von Bildern im Browser sperrt oder aber sich den Text vorlesen läßt), der Bildtitel wird in vielen Browsern angezeigt, wenn mit der Maus über das Bild gefahren wird.

```
Ein Dokument wird wie ein Link zu einer Webseite über einen [Verweistext](/Pfad/zum/Dokument.pdf) aufgerufen.
```
<div class="kasten">
<p>Ein Dokument wird wie ein Link zu einer Webseite über einen <a href="/docs/2016-01/Dokument.pdf">Verweistext</a> aufgerufen.</p>
</div>

### Text-Trenner: horizontale Linie
wird durch 3 oder mehr `*` oder `-` erzeugt, z. B. so:
```
*****
```
und das bewirkt dann eine einfache durchgezogene Linie auf der ganzen Seitenbreite:
<div class="kasten">
<hr>
</div>

### Besondere Textarten
#### Zitate
werden mit einem vorangestellten `>` markiert. Sie können dabei ein- oder mehrzeilig sein, das `>` muß dabei nicht wiederholt werden.    
Voraussetzung: es wird nur der Zeilenumbruch (mehrere Leerzeichen am Ende der Zeile, siehe oben) verwendet und nicht ein neuer Absatz begonnen (Leerzeile).
```
> Never change a running system.
Never run a changing system.
Change a never running system.   
```
<div class="kasten">
<blockquote>Never change a running system.<br>
Never run a changing system.<br>
Change a never running system.</blockquote>
</div>


#### Programmcode
Code kann ein- oder mehrzeilig sein: einzeilig oder nur einzelne Befehlswörter können bsp. im laufenden Text eingebunden sein:
```
dies ist ein `einzeiliger Programmcode` im laufenden Text
```
Der Programmcode wird dabei vom Apostroph "<code>`</code>" eingeschlossen.
<div class="kasten">
<p>dies ist ein <code>einzeiliger Programmcode</code> im laufenden Text</p>
</div>

Mehrzeiliger Programmcode wird meist verwendet, um ganze Programmblöcke zu dokumentieren:
```
    languageCode = "de-DE"
    title = "Seiten, die die Welt (nicht) braucht"
    relativeURLs = true
    uglyURLs = false
    theme = "privat"
```
Der ganze Programmzeilen-Block wird um einen Tab = 4 Leerzeichen eingerückt (innerhalb von Listen müssen das 8 Leerzeichen sein). Dargestellt wird das dann so:
<div class="kasten">
<pre><code>languageCode = "de-DE"
title = "Seiten, die die Welt (nicht) braucht"
relativeURLs = true
uglyURLs = false
theme = "privat"</code></pre>
</div>

Anstatt den Block einzurücken, kann er auch oben und unten mit je einer Zeile aus drei Apostrophen <code>```</code> eingegrenzt werden.

Auch hier gilt - wie bei den Überschriften: Wie die jeweilige Textart dann konkret dargestellt wird, das hängt von den Formatierungsanweisungen des jeweiligen Templates der Webseite ab.

## Nützliche Erweiterungen
### Tabellen
sind in der ursprünglichen Markdown-Syntax offenbar nicht enthalten. Es gibt aber Erweiterungen, Hugo versteht z. B. auch den "_Github-Flavor_", und danach sieht eine Tabelle so aus:
```
    | Links ausgerichtet | Mittig ausgerichtet | Rechts ausgerichtet |
    |:------------------ |:-------------------:| -------------------:|
    | Inhalt             | Inhalt              | Inhalt              |
    | Inhalt             | Inhalt              | Inhalt              |
```
und das wird dann so dargestellt:
<div class="kasten">

| Links ausgerichtet | Mittig ausgerichtet | Rechts ausgerichtet |
|:------------------ |:-------------------:| -------------------:|
| Inhalt             | Inhalt              | Inhalt              |
| Inhalt             | Inhalt              | Inhalt              |

</div>