+++
title 		= "Sicherungskasten und kein Ende - italienische oder chinesische Elektrik?"
description = "Glimmende Lichter am Armaturenbrett bei gezogenem Zündschlüssel - Geisterelektrik. Und dann eine Never-ending-story um den Sicherungskasten ..."
date 		= "2016-02-28"
iveco	    = ["Blogartikel", "Fahrzeugtechnik", "Elektrik"]

+++

Um Weihnachten 2010 tauchte da so ein Effekt auf am "Lkw": 

- Wenn Zündung aus, dann brennen die Diffsperrenleuchte und der Warnblinkerschalter.
- Wenn Zündung an: alles normal.

Eine genauere Untersuchung ergab dann:

1. den Stecker an der Diff-Sperre abgezogen => keine Änderung    
dann <!--more-->
2. der Reihe nach alle Sicherungen nacheinander gezogen und wieder eingesetzt, beginnend unten links.    
bei der 1. rechts oben (Si Nr. 13 - Warnblinkanlage) waren die beiden Lichter aus.    
als ich sie wieder einsetzte ... blieben sie aus.
Diff-Sperren Stecker wieder drauf => Lichter bleiben aus.
3. Ein Paar mal Zündung an - aus => Lichter wieder an    
4. Sicherung raus - rein => Lichter wieder aus

Dann hatte ich die Punkte 3 und 4 ein paar Mal wiederholt, dann blieben sie aus. Im Frühjahr verlor sich der Effekt dann wieder ... für die nächsten Jahre.

## Erneut Fehler in der Elektrik ... die Analyse
### Symptome
Im Dezember tauchte dann der Effekt, daß gelegentlich ohne Zündschlüssel die Kontrolllampe der Diff-Sperre glimmt, wieder auf - aber zusätzlich lief auch der Scheibenwischer im Intervall-Modus ... 

Irgendwelche Hinweise auf Wassereinbruch - der wohl bei diesen Modellen gelegentlich vorkommen kann - waren nicht zu erkennen.

Als nächstes hab ich mal untersucht, ob 

- meine Erinnerung, daß der Scheibenwischer zur Funktion "Zündung an" benötigt (?)
- sowie, daß das Gebläse "Zündung an" benötigt (?).

richtig ist, denn im jetzigen Zustand ist der Wischer in jeder Betriebsart zu benutzen: Intervall, Stufe 1, Stufe 2, OHNE daß der Zündschlüssel steckt.
Neben den Lichtern für Warnblinker und Diff-Sperre "leuchtet" auch die Tankanzeige bei vollem Tank auf knapp über 1/2 und das Lüftungsgebläse läßt sich einschalten und regeln, auch alles ohne Zündschlüssel.
Dann habe ich das Zündschloß mal abgehängt, da ist kein Kurzer drin, das hat keinen Einfluß.

Und: Fahrlicht läßt sich NICHT einschalten, braucht weiterhin Zündung - die Fehlfunktionen betreffen also nur Teilbereiche der Elektrik.

### Prüfung
Ein Ziehen des Relais E3 im Sicherungskasten führt dazu, daß alle o. g. Verbraucher aus sind, kein Wischer, kein Lüfter, keine Lichter und keine Tankanzeige.

Weiters: das Ding ist ein Schließer 30 - 87. Und das tut das Teil auch:
85 - 86 unter Spannung: 30 - 87 0,x Ohm
85 - 86 aus: 30 - 87 offen.
Also konnte es jetzt nur noch sein, daß E3 unbefugt Spannung bezieht.
Die kann aber nicht vom Zündschloß kommen, denn wenn dieses abgehängt wird, hat dies keinen Einfluß auf das Fehlerbild.

![](/bilder/2016-02/sk_schaltbild_e3.png)

Wenn E3 ausgebaut ist, dann kann ich an dessen Steckplatz im Sicherungskasten an 86 und 30 je 12V messen, ohne Zündung.
Stecker I auf der Rückseite des Sicherungskastens, Kontakte 6, 11, 12 bekommen 12V vom Zündschloß. Das funktioniert sauber.
Aber: Kontakt 6 ist lt. Schaltbild der einzige Zugang zu E3/86. Trotzdem liegt dort bei GEZOGENEM Stecker I 12V an.
Stecke ich jetzt wieder E3 ein, dann zieht dieses an, es bleibt die Beleuchtung Warnblinker und Diff-Sperre aus, aber Scheibenwischer und Lüfter gehen (auch ohne Zündung).

Alles deutet also auf "unbefugte Spannung" hin.

<!-- Neben den vielen Multisteckern gibt es am Sicherungskasten eine M6-Schraube mit folgenden Kabeln:

    7777 10mm² direkt von Batterie an + Anschluß ZE
    7777 6mm³ geht vom + Anschluß ZE ans Zündschloß Kl30
    7711 4mm² geht vom + Anschluß ZE über Si 25A und Relais an Heizungsgebläse
    8875 4mm² geht vom + Anschluß ZE über Si 40A zum StGr Flammstart -->

Von der Dauerplus-Schraube nach pin 86 des E3 messe ich am ausgebauten Sicherungskasten 18 Ohm, und das ist auch der Fall, nachdem ich alle Relais ausgebaut habe.
Hab dann der Reihe nach alle Sicherungen gezogen, und diejenige neben E8, mit Warnblinker gekennzeichnet, machte dem Spuk ein Ende.

## Neuer Sicherungskasten
### Gleich das erste Desaster beim Einbau
Nach der bisherigen Analyse habe ich mir also einen neuen Sicherungskasten beim Teilehändler bestellt. Als ich den dann einbauen und Dauerplus mit der vorhandenen (Klemm)Mutter anschrauben wollte - bricht doch glatt die Schraube - Totalschaden.

![](/bilder/2016-02/sk_2016_N7X0005_bolzenbruch.jpg)

Nun sah dieser Bruch der Schraube für mich nach Versprödung oder sowas aus. Daher ging das Teil erstmal zurück zum Händler.

### Vorsicht mit den Halteklammern
Der neue Sicherungskasten wird ohne die Halteklammern geliefert, mit dem er im Armaturenbrett angeschraubt wird. Diese sind als separate Einzelteile im Teilekatalog aufgeführt und sehr spröde. Beim Ausbauen muß das geeignete Maß zwischen Kraft und "sanfter Behandlung" gefunden werden (keinesfalls nur mit dem Schraubenzieher aufhebeln), denn sonst ergibt sich das folgende Ergebnis:

![](/bilder/2016-02/sk_2016_N7X0009_klammerbruch.jpg)

### Reklamation - der reparierte Kasten ist zurück
Der Hersteller hat die Reklamation nicht anerkannt und stattdessen auf die Mutter verwiesen, die sei "zusammengedrückt" worden ... aber das ist ja wohl normal für eine vollmetallische Sicherungs(Klemm)mutter (?).

![](/bilder/2016-02/sk_2016_N7X0015_klemmmutter.jpg)

Der Händler jedoch hat ein Reparaturangebot gemacht und auf Kulanz den Bolzen soweit verlängert, daß die beiden Kabelösen angeschlossen werden konnte.

![](/bilder/2016-02/sk_2016_N7X0011_bolzenreparatur.jpg)

Beim zweiten Einbau habe ich dann eine Zahnmutter verwendet.

![](/bilder/2016-02/sk_2016_N7X0016_zahnmutter.jpg)

## Die Fehlersuche geht weiter
Nachdem der neue Kasten drin war, zeigte sich die folgende Situation:

Die bekannten Effekte sind weg ... aber es gibt neue:    
Ich hab jetzt sowas wie'n Tagfahrlicht - aber als Fernlicht.

### Erneute Analyse

![](/bilder/2016-02/sk_schaltbild_e10.png)

E10 ziehen hilft zwar, kann aber nicht die Lösung sein, denn dann ist die Lichthupe außer Funktion.
Si22 hat keinen Einfluß.

Relais E10 für die Lichthupe wird direkt angesteuert vom Lichthupenschalter mit + über Si 22, um den Fehler zu erzeugen muß es entweder hängen oder es ist das falsche Relais in dem Steckplatz oder - siehe oben - es bekommt "unbefugte 12V".

An diesem Sicherungskasten messe ich nach Ausbau aller Relais, aber mit Sicherungen:
Von B2 Durchgang zu folgenden "Gruppen" oder Einzelanschlüssen:

    F3 H6 L3 G6 C5 => Kl. 15 über Si. 8
    L3 E10 => Kl. 15 über Si. 16
    I2 => Kl. 15 über Si. 14
    C9 => Kl. 15
    E7 => Kl. 15 über Si. 15

Daher muß bei "Zündung an" das obige Lichthupenrelais anziehen, denn es bekommt seine Betriebsspannung nicht, wie es sein sollte, über B2, sondern intern im Sicherungskasten direkt von Kl. 15 - ohne Umweg über den Schalter ...

## Iveco-Original-Ersatzteil
Nun hatte ich also zunächst mal genug von "Zubehörteilen", einfach auch weil die Zeit drängte und ich bei einem Originalteil das Auto eben zur Werkstatt bringen kann und das in Ordnung bringen lassen.   
Nach dem ersten Schreck ... Lieferzeit 3 Wochen, das Teil sollte von einem Händler in Belgien kommen ... war der Sicherungskasten dann doch direkt aus Italien in kurzer Zeit zu beschaffen.

### Schon wieder Fehlersuche
Als ich diesen Kasten dann eingebaut hatte, schien erstmal alles zu funktionieren, wie es sollte, bis ich beim Verlassen des Fahrzeugs noch die Hupe drückte - und ich hörte - nichts ...

Eine kurze Fehlersuche (darin hatte ich ja jetzt Übung) führte mich zur Sicherung der Hupe:

![](/bilder/2016-02/sk_2016_N7X0022_sicherung.jpg)

... und wenn an einem neuen Sicherungskasten eine neue Sicherung so aussieht mit total erodierten Kontakten und dann beim Nachmessen mit zwei Krokos an den Meßkabeln irgendwas von 7 M(!)Ohm anzeigt ... dann hab ich Verständnis, wenn eine Hupe nicht wirklich arbeiten will.

### Genuine Iveco parts
Ich hatte nach dem Zubehör-Händler-Sicherungskasten ja auch deshalb einen originalen geordert, weil ich von "billigem Nachbau" ausgegangen war. Warum?

#### der ganz richtig originale Sicherungskasten
sieht nämlich so aus:

Vorderseite

![](/bilder/2016-02/sk_2016_N7X0019_orig_vs.jpg)

Rückseite

![](/bilder/2016-02/sk_2016_N7X0018_orig_rs.jpg)

demgegenüber sehen die beiden neuen (also der vom Teilehändler ebenso wie der von Iveco) so aus:

Vorderseite

![](/bilder/2016-02/sk_2016_N7X0021_neu_vs.jpg)

Rückseite

![](/bilder/2016-02/sk_2016_N7X0020_neu_rs.jpg)

Nun kann es ja immer sein, daß sich ein Produkt oder Ersatzteil im Rahmen einer "Produktpflege" verändert, aber diese Bilder sind sehr identisch mit den tausenden von Angeboten, die man unter der Teilenummer bei Alibaba findet.

Das einzige, was die beiden Sicherungskästen vom Teilehändler und Iveco unterscheidet ist der äußere Karton.
Drin sind dieselben Kästen mit demselben Silikagel Päckchen in der selben Art und Weise in der selben Plastikfolie eingeschweißt.

Und wenn ich dann die Erfahrungen oben berücksichtige - ich werd' das Gefühl nicht los, daß Iveco inzwischen auch bei alibaba einkaufen läßt ...




