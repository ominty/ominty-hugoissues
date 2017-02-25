+++
title 		= "Homepage überarbeitet"
date 		= "2017-01-29"
description = "Neustart dieser Homepage, warum - was - wie? Es geht um Inhalte, Form und Technik unter der Haube"
keywords      = "Hugo, Webseite, Neustart"
categories 	= ["Webseiten"]
tags 		= ["Hugo", "Tipps"]
+++

Ein paar Dinge kommen zusammen:  <!--more-->

1. es ist Winter
1. das Blog läuft jetzt über ein Jahr ohne Probleme
1. Google hat vor längerer Zeit gemault, meine Homepage sei nicht "mobiltauglich"
1. je größer/umfangreicher ein Internet-Auftritt wird, desto schwerer ist er manuell "zu bändigen"
1. ich muß andere Internetauftritte ebenfalls überarbeiten

und so habe ich mich entschlossen,  diese Homepage als "Testobjekt" zu nutzen und nicht nur das Blog, sondern komplett auf [Hugo](/tags/hugo.html) umzustellen.

## Das Konzept

### Wie es bisher war
Nun, das Schreiben der Seiten oder Beiträge nimmt mir auch keine noch so tolle Technik ab. Nur ist es so, daß es damit nicht getan ist.

Bisher habe ich (bis vor 3 Jahren) einen uralten HTML-Editor genutzt, der 1999 von Uli Meybohm als Freeware (für Windows) zur Verfügung gestellt wurde. Das Programm überdauerte alle Betriebssystem-Wechsel von Windows 1998 über 2000 nach XP, und auch in Windows 7 ließ sich das Teil noch (mit leichten Abstrichen) benutzen.

Was mich nach einer Alternative umschauen ließ, war aber die sich weiter entwickelnde "Umwelt" des Webs in Form neuerer Standards wie XHTML oder in letzter Zeit HTML5, und da war bei dem alten Editor dann doch zuviel händische Nacharbeit nötig.

Als Alternative hab ich dann [Bluefish](http://bluefish.openoffice.nl/) entdeckt, ein Programm, das

- es nicht nur für Windows, sondern auch für mein Hauptbetriebssystem Linux gibt
- aktiv weiterentwickelt wird und aktuelle Standards unterstützt.

Eigentlich hätte ich also meine Arbeitsweise nicht ändern brauchen, denn mit dem neuen Programm ... aber ...

### Was könnte besser sein?
Eine neue Seite erstellen - und dann an -zig Stellen die Links anpassen - das ist "Sträflingsarbeit". 

> Je umfangreicher der Wartungsaufwand wird, desto weniger Lust hat man, tatsächlich neue Inhalte zu erstellen.

Als Lösung werden überall `Content Management Systeme` wie Wordpress etc. genannt. Dabei handelt es sich um Systeme, die auf einem Server laufen und dem Autor versprechen, die "Sträflingsarbeit" abzunehmen, man kann über ein Browserfenster die Artikel eintippen und den Rest übernimmt die Software. Man spricht von _dynamischen Webseiten_.

Aber auch hier gilt der obige Merksatz:     
Denn eigentlich wird nur eine "Sträflingsarbeit" durch eine andere ersetzt, und die heißt: Systempflege. Es müssen regelmäßig

- backups erstellt werden (es gibt ja keine fertigen Artikel mehr, sondern nur Fragmente, die in einer Datenbank gelagert werden und bei Aufruf zu einer Seite zusammengebaut werden. Gehen die Datenbank-Inhalte verloren, dann ist das mit Totalverlust des Webauftritts gleichzusetzen)
- Sicherheitsupdates eingespielt werden (die Software ist ja frei aus dem Internet zugänglich und daher besonders gefährdet, im "Erfolgsfall" für den Angreifer heißt das i. d. R. Totalverlust für den Betreiber).

Nachdem ich auf `bilddateien.de` mit so einem System Erfahrungen sammeln konnte, habe ich mich vor einem Jahr für den Auftritt hier zu einem Test eines [statischen Webseiten-Generators](/blog/2015-12-22-statisches-blog-mit-hugo.html) entschlossen, die Wahl fiel auf _Hugo_.

## Die Lösung
Ich nenne das eine _statische dynamische Webseite_.     
Was wie ein Widerspruch in sich klingt, ist aber für mich die Lösung der obigen Probleme:

### Die Vorgehensweise
1. ich erstelle die Inhalte als "formatierte Textdokumente" in [Markdown](/blog/2016-01-10-markdown-spickzettel-referenz.html). Das ist schnell zu erlernen und ergibt leicht zu lesende übersichtliche Dokumente, und wer dazu noch eine Unterstützung durch eine Software nutzen will, der greift zu einem der verfügbaren Editoren wie z. B. [uText](http://appspezis.de/utext-linux/) oder [CuteMarkEd](https://cloose.github.io/CuteMarkEd/) und hat dann gleich noch eine Live-Vorschau, wie das Dokument am Ende aussehen kann (das genaue Aussehen bestimmen die individuellen Formatierungs-Vorgaben der Webseite, Stichwort: CSS).     
![uText screenshot](/bilder/2017-01/utext_screenshot.png  "uText screenshot")      
Das ist aber eigentlich nicht nötig, denn das kann Hugo im [Servermode](/blog/2015-12-30-ein-blog-mit-hugo-erstellen-teil4.html) auch.
1. Es sind ein paar Seitenvorlagen nötig, die das Aussehen der späteren Webseite bestimmen, wie das bei den CMS-Systemen wie Wordpress auch der Fall ist, _Themes_ genannt.
1. Dann wird __auf dem heimischen Rechner__ die Software (hier: _Hugo_) gestartet und erstellt (das ist der _dynamische_ Vorgang) aus den Textfiles und den Vorlagen die fertige Webseite mit allen Links zwischen den Seiten etc., die dann in einem eigenen Verzeichnis abgelegt wird.
1. diese jetzt _statischen_ Files werden auf einen beliebigen Webserver kopiert und sind jetzt abrufbar, und das _schnell_ (der Webserver braucht nichts mehr zusammenbauen) und _sicher_ (der Webserver ist mangels CMS-Software und Datenbank deutlich weniger angreifbar).

### Das Ergebnis

- Das Erstellen der Vorlagen hat mich einige Zeit und Mühe gekostet (Einarbeitungszeit, die braucht man aber auch für jedes CMS, wenn man individuelles Design der Webseite bevorzugt). 
- Das Importieren der alten Seiten war dagegen sehr schnell erledigt, Anpassungen per "Bearbeiten - Suchen - Ersetzen" über alle Seiten hinweg in der Regel einfach.    
Hugo "frißt" alte HTML-Dokumente relativ klaglos (wenn sie einigermaßen fehlerfrei geschrieben waren)
- Und jetzt hab ich eine einfach zu handhabende Webseite, die es mit geringem Aufwand ermöglicht
    - Seiten hinzuzufügen oder zu entfernen
    - das Erscheinungsbild des kompletten Internetauftritts zu ändern (z. B. an die Anforderungen neuer Geräte oder Displaygrößen anzupassen)

## Und jetzt?
Ich glaube, das Ganze hat nach ein paar Tagen Arbeit eine Form, die  ich "auf die Menschheit loslassen" kann.

An der einen oder anderen Stelle mag es vielleicht noch etwas haken, dann bitte ich um Nachsicht. Mir ist auch klar, daß die "Inhaltsverzeichnis"-Seiten _nicht_ sehr _schön_ aussehen - vllt. fällt mir hier noch etwas ein - das ist dann relativ einfach: Vorlage austauschen und fertig ... :) .

Derzeit denke ich noch über Verbesserungen nach wie z. B. eine integrierte Suchfunktion - kommt Zeit, kommt Lösung.

Wichtig war mir, daß 

- einerseits die Inhalte wieder zur Verfügung stehen, und
- andererseits ich jetzt auf einer Plattform arbeiten kann, die es mir leichter möglich macht, Änderungen und Verbesserungen umzusetzen.

In diesem Sinne wünsche ich weiter viel Spaß mit der Seite, möge jeder das finden, was ihm weiterhilft.