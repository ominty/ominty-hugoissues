+++
title 		= "Ich mag uglyURLs"
date 		= "2017-02-14"
description = "Hugo kann uglyURLs oder prettyURLs ausgeben. Ich bevorzuge erstere und erkläre, warum das aus meiner Sicht sinnvoll ist"
keywords    = "Hugo, URL, ugly, pretty, Link"
categories 	= ["Webseiten"]
tags 		= ["Hugo", "Tipps"]
+++

Ich weiß nicht, wer diese Begrifflichkeiten geprägt hat: "ugly URL" (häßliche Adresse) und im Gegensatz dazu die "pretty URL". Aufgefallen sind mir die Begrifflichkeiten zuerst <!--more--> in der Dokumentation zu den statischen Webseitengeneratoren Jekyll und Hugo.

Was verbirgt sich dahinter?    
Eine "ugly URL" ist eine Seitenadresse der Form `www.domain.tld/dateiname.html`, also der Dateiname wird mit Endung in der Adresse angegeben. Eine "pretty URL" würde demgegenüber so aussehen: `www.domain.tld/dateiname/`.

Vielleicht bin ich ein _alter Knochen_, aber mir ist es herzlich egal, ob da eine Endung steht oder nicht. Viel mehr fallen für mich die folgenden Punkte in's Gewicht:

- Pretty URLs werden erzeugt, indem man eine Datei `index.html` in einem Ordner mit dem Namen `dateiname` quasi "versteckt". Folge: für jede Seite hat man einen Ordner, und darin liegen dann jeweils lauter gleichnamige `index.html`-Dateien - nicht gerade übersichtlich.
- will ich die (statische) Webseite von einem lokalen Datenträger abrufen, dann geht gar nix, denn der Link zu einer Seite endet ja am Verzeichnis, und es bedarf eines Webservers, der daraus den Schluß zieht, daß er die `index.html`-Datei an den Browser schicken soll. Ein USB-Stick weiß das nicht, so eine Seite ist also nicht _portabel_.
- und den dritten Grund lieferte mir gestern Google - und deshalb schreibe ich diesen Beitrag: Bei einem Blick in die Webmaster-Tools stellte ich fest, daß Google sich über _doppelte Seiten_, konkret _doppelte Titel_ beschwert.    
Google sieht also das Verzeichnis und die `index.html` als jeweils eigene Seite an - wenn das keine negativen Auswirkungen auf die Suchergebnisse hat ...

```
Pages with duplicate title tags 	2Pages
Markdown-Spickzettel - eine Kurzreferenz · Seiten, die die Welt (nicht) braucht
/blog/post/2016-01-10-markdown-spickzettel-referenz/
/blog/post/2016-01-10-markdown-spickzettel-referenz/index.html
```

