+++
title 		= "Kabelquerschnitte - italienische Elektrik"
description = "Vergleich der Sicherungsstärke und zugehörigen Kabelquerschnitte bei meinem Iveco"
date 		= "2012-08-10"
lastmod     = "2019-06-01"
iveco 		= ["Blogartikel", "Fahrzeugtechnik", "Lichtmaschine"]

+++

Da hatte ich vor einiger Zeit festgestellt:

> In den Modellen bis 1996 ist die Magnetkupplung des Kühlerventilators offenbar mit 7,5A abgesichert. In meinem Daily (Bj. '97) ist die Sicherung 25A. Hintergrund: über dieselbe Sicherung läuft - wenn vorhanden - der elektrische Fensterheber. Dafür sind die Kabelquerschnitte zur Magnetkupplung aber eindeutig zu dünn (für 25A).

<!--more-->
Nun die nächste Überraschung: ich hab 'ne Lichtmaschine mit 85A ab Werk. Vor einiger Zeit [ist das Kabel gebrochen](/blog/2010-10-10-dunkelfahrt.html), hab mir also neue Crimpösen besorgt (sicherheitshalber für 10 und 16qmm).
Ich baute also den Kühler aus (damit ich mit der großen Crimpzange drankomme) und stelle fest: popliges 6qmm-Kabel ...

Nach der [VDE-Tabelle](http://www.njumaen.de/t4tt/pdf/kabelquerschnitte.pdf) sind (Gruppe drei) sind bei max. 30Grad 55A zulässig (bei höheren Temperaturen (Motorraum) wird's weniger).

In der Tabelle S.12 im Handbuch "Hinweise u. techn.Codes" sind für 6mm² max 37A (nach CUNA - Commissione Tecnica di Unificazione nell'Autoveicolo), für 16mm² max 75A zulässig. Damit ist das verlegte Kabel schon für die 55A Standard-Lichtmaschine zu schwach.

Merkwürdige Dimensionierungskünstler ...

### Folgen
Ich hatte erst kürzlich einen WAECO DCDC Wandler zum Laden der Bordbatterie installiert, der frißt bis über 30A. Das hatte ich zunächst als unproblematisch angesehen, wegen der verstärkten Lichtmaschine ab Werk sollte genug Strom zur Verfügung stehen.
Aber: Volle Beleuchtung winters mit Gebläse an, Radio etc. sind allein schon über 20A, d. h. mit dem Wandler kommen da leicht 50A DAUER-Belastung zusammen ... und das liefert meine Lichtmaschine dann auch bei Autobahnfahrt bei 3000/min ...     
... aber diese 50 A stellen dann die __Dauer__belastung für das 6qmm-Drähtchen dar - das möchte ich dann doch lieber vermeiden.




### Nachtrag:
Im Rahmen einer Diskussion im Forum bin ich auf folgene "Aufklärung" gestoßen:

Lt. Werkstatthandbuch des Daily 2 (1990 - 1996) liefern sowohl die Magnetti-Marelli- als auch die Bosch-Lichtmaschine den Nennstrom bei 4000/min.    
Bei 2000/min. ist's die Hälfte, bei 1000/min irgendwas über 5A.    
(Was da jetzt nicht dransteht sind die evtl. zu berücksichtigenden Übersetzungsverhältnisse der Keilriemenscheiben)

Für die Daily ab Bj. '96 gibt's keine detaillierten Kurven mehr, nur eine qualitative Pauschalkurve, die aber genauso aussieht.
Da ist aber zusätzlich auch beschrieben, daß der "Max. Current" (Maximalstrom) der aufgedruckte Nennwert ist, während der "Working Current" (Arbeitsstrom) etwa bei 2/3 davon liegen soll.

Ausgehend von der 55A(!) Standard-Lima stehen damit 37A als max. mögliche Summe aller Lastströme aller Verbraucher im Betrieb zur Verfügung (und jetzt verstehe ich auch, wieso die da 6qmm dimensioniert haben).

