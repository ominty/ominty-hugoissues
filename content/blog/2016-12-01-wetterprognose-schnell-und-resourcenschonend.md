+++
title 		= "Wetterprognosen - schnell und resourcenschonend"
description = "einfacher Weg für eine Wettervorhersage im Linux-Terminal - sogar mit Grafik :) "
date 		= "2016-12-01"
keywords    = "Linux, Wetter, Terminal, Prognose"
reisen      = ["Wetterprognose"]
linux		= ["Tipps"]

+++

Reisen mit einem gehörigen Outdoor-Anteil sind wetterabhängig. Eine aktuelle Wetterprognose macht die Planung leichter. Klassische Reisewetterberichte sind aber nicht mehr verfügbar, seit die Rundfunkanstalten ihre weitreichenden Sender abgeschaltet haben.    
Mobilfunktarife werden in Europa zwar langsam angenehmer, aber außerhalb wird die Rechnung <!--more-->schnell "schmerzhaft". Daher greife ich seit vielen Jahren ganz gerne auf die [Meteogramme der Wetterzentrale](http://www.wetterzentrale.de/show_diagrams.php?lat=49.0000&lon=8.4000&model=gfs&country=de&var=210&run=6&lid=OP&zip=&bw=) zurück, die als kleine Grafiken eine mittelfristige Prognose ermöglichen.

Nun bin ich heute im [Mintguide-Blog](https://mintguide.org/) auf eine nette Alternative gestoßen: das Linux-Terminal.

Eingabe von 

    ~ $ curl wttr.in/Karlsruhe

liefert zum Beispiel die 3-Tages-Prognose für Karlsruhe:

![3-Tages-Wetterprognose im Linux-Terminal](/bilder/2016-12/wetter_terminal_20161201.png)

... spaßig ...

Wer kein Linux und kein Terminal zur Verfügung hat, der kann auch wie gewohnt den Browser benutzen, z. B. liefert [http://wttr.in/Karlsruhe](http://wttr.in/Karlsruhe) dieselbe 3-Tages-Ansicht wie oben für Karlruhe ganz normal wie jede andere Webseite auch in einem Browserfenster.    
Ohne Ortsangabe wird offenbar der nächstgelegene Ort zum Internet-Einwahlknoten anhand der IP-Adresse des Anschlusses automatisch gewählt.