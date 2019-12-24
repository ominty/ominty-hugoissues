+++
title 		= "Dunkelfahrt"
description = "Starterbatterie wird nicht mehr geladen - wie komme ich wieder nach Hause sowie ein aha-Effekt bei der Reparatur"
date 		= "2010-10-10"
lastmod     = "2019-06-01"
iveco 		= ["Blogartikel", "Fahrzeugtechnik", "Lichtmaschine"]

+++

Am Wochenende sollte es in die Vogesen gehen, Freitag abends auf dem Hinweg wurde es alsbald dunkel, bis Sélestat war noch alles normal, aber dann begann ich mich bald darauf über die trübe Beleuchtung zu wundern. 
<!--more-->
## Es wird finster
Dramatisch wurde es dann ab dem Col du Bonhomme, wo ich das Gefühl hatte zuschauen zu können, wie meine Augen schlechter wurden, und schlußendlich verlief die Fahrt im "Tarnmodus", Licht war nur noch bei genauem Hinsehen zu erkennen.
Irgendwo mußte die Lichtmaschine den Geist aufgegeben haben, Motor wieder anlassen war illusorisch, Hilfe am Wochenende ebenso, also mußte die Devise lauten: Auto muß an für unsere Zwecke geeignetem Platz stehen, bevor nix mehr geht. Und dort angekommen sagte der Anlasser überhaupt nix mehr, als ich nach dem Abstellen nochmal kurz den Zündschlüssel drehte.

### Kurzanalyse
Bei herrlichem Sonnenschein war morgens erstmal eine Tour entlang der Crète angesagt unter dem Motto: "nix anmerken lassen".    
Aber irgendwann mußte ich mir dann doch mal Gedanken machen, wie wir hier wieder wegkommen sollten. Messung der Starterbatteriespannung erbrachte 11,8V, nicht unbedingt genug für einen sicheren Start, aber tot war die Batterie jedenfalls nicht. Das wäre auch ärgerlich, sie ist erst 2 Jahre alt. 

### "Umladen"
Und so habe ich dann durch geschickte Veränderung meiner Verkabelung Strom quasi "von hinten nach vorne gepumpt", also die Starterbatterie von der Wohnraumbatterie her geladen, deren Spannung wurde über die Solaranlage hoch gehalten.Nach 3 Stunden zeigte die Starterbatterie dann auch wieder etwas über 12V, und das sollte tags drauf hoffentlich für einen einmaligen Start reichen.

### "Solarmobil" auf dem Heimweg
Die Frage stellte sich mir sonntags morgens schon: springt das Auto an?
Gegen halb zehn waren wir vom Frühspaziergang zurück, dann gab's Frühstück, und nach dem Aufräumen die Auflösung des Wochenendquizzes: Das Auto springt an!
Und mit derselben Verkabelung von gestern (der für die Fahrt benötigte Strom wird von der Solaranlage statt von der Lichtmaschine geliefert) sind wir dann problemlos nach Hause gefahren.

## Fehlerursache
Zu Hause angekommen konnte ich mich in Ruhe auf Fehlersuche begeben:

- Lichtmaschine?
- Kabelfehler?

Nach Entfernen des Unterfahrschutzes war eine weitere Suche gar nicht mehr nötig:   
Vom B+ Anschluß der Lichtmaschine führt ein "dickes" Kabel hinüber zum Anlasser (und von dort weiter zur Batterie), und dieses Kabel war direkt an der angekrimpten Schrauböse gebrochen.

### Verkabelung
Mein Daily hat eine verstärkte Lichtmaschine mit 85A Ladestrom ab Werk. Etwas irritiert war ich, als ich feststellte, daß das besagte Kabel lediglich einen Querschnitt von 6qmm aufweist.

Lt. Tabelle sind 6mm² für max. 37A gut (nach CUNA - Commissione Tecnica di Unificazione nell'Autoveicolo), für 16mm² wären das max 75A. Das 6qmm-Kabel ist somit schon für die 55A Standard-Serien-Lichtmaschine zu schwach.

Keine Ahnung, was sich die Konstrukteure da gedacht haben ... italienische Elektrik eben ...


## Nachtrag:
Im Rahmen einer Diskussion im Forum bin ich auf folgene "Aufklärung" gestoßen:

Lt. Werkstatthandbuch des Daily 2 (1990 - 1996) liefern sowohl die Magnetti-Marelli- als auch die Bosch-Lichtmaschine den Nennstrom bei 4000/min.    
Bei 2000/min. ist's die Hälfte, bei 1000/min irgendwas über 5A.    
(Was da jetzt nicht dransteht sind die evtl. zu berücksichtigenden Übersetzungsverhältnisse der Keilriemenscheiben)

Für die Daily ab Bj. '96 gibt's keine detaillierten Kurven mehr, nur eine qualitative Pauschalkurve, die aber genauso aussieht.
Da ist aber zusätzlich auch beschrieben, daß der "Max. Current" (Maximalstrom) der aufgedruckte Nennwert ist, während der "Working Current" (Arbeitsstrom) etwa bei 2/3 davon liegen soll.

Ausgehend von der 55A(!) Standard-Lima stehen damit 37A als max. mögliche Summe aller Lastströme aller Verbraucher im Betrieb zur Verfügung (und jetzt verstehe ich auch, wieso die da 6qmm dimensioniert haben).
