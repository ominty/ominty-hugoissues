+++
title 		= "Bordbatterie: Laden mit der Lichtmaschine"
description = "Welcher Anteil am Stromverbrauch ist durch die Lichtmaschine während der Fahrt zu decken? Messungen mit der einfachen Trennrelais-Lösung"
date 		= "2015-12-25"
wohnmobile	= ["Blogartikel", "Elektrik", "Lichtmaschine"]

+++

Eigentlich stand eine längere Reise an. Und weil in den letzten Jahren mein Stromverbrauch eher gestiegen ist, war mal eine genauere Betrachtung der Verhältnisse rund um die Bordbatterie-Lademöglichkeit per Lichtmaschine/Trennrelais an der Reihe, denn um diese Jahreszeit kommt dieser Option eine mitunter entscheidende Bedeutung zu.
<!--more-->

## Versuchsdurchführung
### Startbedingungen
In einem möglichst genau definierten und trotzdem realitätsnahen Szenarium sollte der maximal mögliche Ladestrom ermittelt werden. Zur Vorbereitung des Versuchs wurde zunächst 

- die Starterbatterie mittels  eines CTEK Batterielade- und Ladungserhaltungsgeräts vollgeladen
- der Wohnbatterie aus vollgeladenem Zustand 2 Tagesbedarfe entnommen für Heizung und Kühlschrank
- sodann Ladegerät und Verbraucher abgeschaltet und beide Batterien 6h im Ruhezustand belassen

### Messung

![Meßaufbau](/bilder/2015-12/trennrelais.png)

| Erläuterung | Versuch 1: ohne Motor | Versuch 2: mit Motor |
|---|--:|--:|
|Starterbatterie Us|12,8V|14,4V|
|Bordbatterie Uw|12,0V|12,2V|
|Anfangsstrom|2A|-|
|Strom nach 1min|-|8A|
|Us nach 1min|-|14,4V|
|Uw nach 1min|-|12,7V|
|Strom nach 3min|1A|-|
|Strom nach 5min|0,6A|-|
|Us nach 5min|12,35V|-|
|Uw nach 5min|12,15V|-|

zu Versuch 2/mit Motor: Us = 14,4V __drehzahlunabhängig__, da Ausgangsbedingung: Batterie "randvoll"

## Diskussion der Ergebnisse
Bei laufendem Motor ergibt sich zum Zeitpunkt 1 Minute einen Leitungswiderstand:

    (14,4 - 12,7)V / 8A = 0,21 Ohm

Bereinigt um das Amperemeter (0,1 Ohm, gemessen) ergibt sich umgekehrt ein maximal möglicher Strom 

    (14,4 - 12,7)V / (0,21 - 0,1)Ohm = 15,1A

 der aber schnell auf die Hälfte fällt, weil die Wohnbatterie in der Spannung steigt.
Das würde täglich mindestens 2 Stunden Fahrt bei 14,4V Starterbatteriespannung bedeuten. Ist die Starterbatterie nicht ab Motorstart sofort vollgeladen, muß die Ladedauer entspr. erhöht werden.

Woraus ergibt sich der relativ hohe "Leitungswiderstand"?

- Verlegt sind etwa 2 x 4m Kabel mit 6qmm Querschnitt, das ergibt rechnerisch einen Widerstand von 0,023 Ohm
- der Rest von `(0,21 - 0,023) Ohm = 0,187 Ohm` verteilt sich auf je eine Sicherung an den beiden Batterien und die Kontakte und Kabelanschlüsse von Trennrelais und Batteriehauptschalter.

## Schlußfolgerungen:
Um in vernünftiger Zeit über die Lichtmaschine die Bordbatterie zu laden, ergibt sich als Alternative nur ein Ladebooster (B2B-Ladegerät). Dieser lädt die Bordbatterie mit konstantem Strom, z. B. 20A bis zur Ladeendspannung und akzeptiert einen gewissen Spannungsbereich am Eingang, der auch unter der momentanen Bordbatteriespannung liegen kann. Damit wird der Ladestrom unabhängig von kleinen Spannungsabfällen in den Verbindungsleitungen und der Lichtmaschinen-Drehzahl.    
Nachteil: der Ladebooster hat einen endlichen Wirkungsgrad, dessen Eingangsstrom kann in der Größenordnung 50% über dem Ausgangs- = Ladestrom liegen (im Beispiel wären das 30A).

<!-- Bei allen Rechnungen ist der "Ladewirkungsgrad" der Batterie (5 - 20% Verlängerung) noch nicht mit berücksichtigt. -->

Update: Wie sich das auf der Fahrt/in der Praxis auswirkt, habe ich in einem [weiteren Beitrag](/blog/2016-11-03-laden-mit-lichtmaschine.html) dargestellt.
