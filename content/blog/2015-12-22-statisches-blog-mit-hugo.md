+++
title 		= "Statische Webseiten/Blogs mit Hugo"
date 		= "2015-12-22T22:25:17+01:00"
description = "Was ist ein Generator für statische Webseiten? Worin unterscheidet er sich von einem System wie z. B. dem verbreiteten Wordpress? Welche Vor-/Nachteile haben die beiden Varianten?"
keywords      = "Hugo, Webseite, statisch, Template, Vorteil, Nachteil, Wartung, Ladezeit, Backup"
categories 	= ["Webseiten"]
tags 		= ["Hugo", "Blog"]

+++
Seit wenigen Jahren scheinen "Generatoren für statische html-Seiten" sich wachsender Beliebtheit zu erfreuen.

Prinzip: der Benutzer schreibt seine Beiträge als z. B. [markdown](https://de.wikipedia.org/wiki/Markdown#Auszeichnungsbeispiele)-Dokument (wie auch in vielen Blog-Systemen üblich) in Textfiles in einem definierten Verzeichnis.
Der "Seitengenerator" überwacht dieses Verzeichnis, baut bei Änderungen an einem dieser Dokumente die Seite neu zusammen und bietet sie aktualisiert im Browser zur Kontrolle an.    
Ist alles fertig, kann man die fertigen/geänderten Seiten per ftp auf den Webspace hochladen.<!--more-->

Vorteile:

- keine Software auf dem Server    
Das bedeutet, daß es unmöglich ist, eine Homepage über Schwachstellen im System (z. B. dem breit eingesetzten Wordpress), das die Seiten aufbereitet, zu kapern oder "hacken".
- deutlich kürzere Ladezeiten beim Leser    
Bei einem Seitenaufruf wird die fix und fertig auf dem Server liegende Seite an den aufrufenden Browser geschickt. In einem Blog- oder CMS-System werden die Seiten beim Aufruf erstmal aus den Templates (= Designvorlagen für die Seitengestaltung) und den eigentlichen Inhalten, die aus einer Datenbank abgerufen werden, zusammengebaut. Das dauert ... 
- Die "Wartung" des Internetauftritts ist deutlich einfacher und zeitsparender.    
Es sind keine regelmäßigen Datenbank-Backups etc. nötig, es müssen nicht ständig Software-Patches einspielt werden (und die Webseite des Anbieters verfolgt werden, um die Ankündigung nicht zu verpassen) etc.    


Nachteile:

- die Seiten sind eben "statisch", interaktive Elemente wie z. B. Kommentarfunktionen müssen extern eingebunden werden. Da dabei fremde Dienstleister ins Spiel kommen, ist das nicht unbedingt jedermanns Sache.

### Dieses Blog:

Da ich diese Homepage einfach gehalten habe bisher, wollte ich auch für das neue ergänzende Blog mir nicht einen "technischen Overkill" einhandeln und habe mich daher entschlossen, dieses neue Blog mal als Testplattform für [Hugo](http://gohugo.io/) zu verwenden. Und natürlich werde ich versuchen, meine Erfahrungen hier zu dokumentieren.

<!-- https://davidwalsh.name/introduction-static-site-generators -->