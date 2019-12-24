+++
title 		= "e-plus und die Datenroaming-Falle"
description = "Nutzung der EU-Flat von Aldi Talk und die Fallen, die im Zusammenhang mit dem Kostenschutz entstehen"
date 		= "2016-11-12"
reisen     	= ["Erfahrungen", "Telekommunikation"]

+++

Seit Jahren verwende ich einen UMTS-Stick am USB-Anschluß meines Laptops und eine Aldi-Talk-Karte, um mobil im Ausland ins Internet zu kommen. Für meine Anwendungen (e-mails und Wetterinformationen ) reicht die EU-Internet-Flat für EUR 4,99 pro Woche (derzeit mit 500MB Datenvolumen) gut aus.
<!--more-->

Es gibt zwei Möglichkeiten, diese EU-Internet-Flat zu buchen:

- die Webseite [meinAldiTalk](http://www.meinalditalk.de/)
- die Kundenhotline 1155

Letztere scheidet natürlich aus, wenn man einen UMTS-Stick verwendet, es sei denn, man will alle Woche die Karte ins Telefon stecken und dann jedesmal danach die Einstellungen (Zeit/Datum/etc.) neu eingeben.

## Keine Verbindung
Nun gab es zwar ab und an das Problem, daß ich trotz guten Signals keine Verbindung herstellen konnte, aber mehrere Versuche oder etwas Warten behoben das Problem meist. Im September war ich aber dann plötzlich in der zweiten Woche in Frankreich völlig "ausgesperrt", der Netzwerk-Manager meldete zwar, daß sich mein Rechner _anmelden_ konnte beim jeweiligen ausländischen Provider, aber eben nicht _verbinden_ (telefonieren mit derselben Karte im Telefon funktionierte aber).    
Ich half mir damit über die Runden, daß ich die Karte aus dem Telefon umsteckte (anderer Provider), und für deutlich mehr Geld für den Rest der Tour zumindest einen Internetzugang hatte. Aber was war passiert?    
Ende Oktober bei einer weiteren Frankreich-Reise hab ich's dann wieder probiert - und hatte Erfolg: eplus-Roaming funktionierte wie eh und je !?.

### Der Lösung auf der Spur?
Dann hab ich mir die verschiedenen Bestätigungs-SMS angesehen:

Da kamen zunächst fast gleichzeitig

> <+491770703010> Ihr EU Internet Pkt. ist nun aktiv. Tipp: Verwalten Sie jederzeit Ihre Optionen über www.meinalditalk.de oder die ALDI TALK App.

und

> <+491770703010> Ihr EU Kostenschutz ist nun aktiv. Tipp: Verwalten Sie jederzeit Ihre Optionen über www.meinalditalk.de oder die ALDI TALK App.

6 Minuten später kam dann die eigentlich interessante Information:

> <66403> Um ungewollte Kosten zu vermeiden, haben wir für Sie neben dem EU Internet Paket ab sofort für 14 Tage den EU Kostenschutz aktiviert. Dieser verhindert die kostenpflichtige Nutzung von Daten nach Auslaufen Ihres EU Internet Pakets. Wenn Sie diesen Kostenschutz aufheben, nutzen Sie mobiles Internet im EU-Ausland für 0,23 €/MB bzw. sofern Ihnen noch Inklusiv-Datenvolumen im Rahmen einer innerdeutschen Option zur Verfügung steht, für 0,05€/MB unter Anrechnung des in der Option enthaltenen Inklusiv-Datenvolumens. Dafür antworten Sie bitte mit JA auf diese SMS (kostenfrei). Alternativ können Sie das EU Internet Paket erneut für 4,99 €/7 Tage über die kostenlose Kontohotline 1155 buchen

### Ohne Internet keine Neubuchung?
Genau gelesen wird also sofort mit dem Ablauf des gebuchten Pakets der Internetzugang gesperrt, eine Neubuchung über die Webseite ist damit natürlich nicht mehr möglich.    
Wenn also die SMS

> <+491770703010> Ihr EU Internet Pkt. ist abgelaufen und wird nicht automatisch verlängert. Sie können jederzeit erneut eine Option buchen.

kommt, dann ist die Falle bereits zugeschnappt - nichts geht mehr.

## Fazit
Wer den Aldi-Tarif im Ausland mit einem PC und UMTS-Webstick nutzen möchte, der muß

1. in jedem Fall eine Software nutzen, die auch SMS-fähig ist (ein einfacher Netzwerkmanager zur Herstellung der Verbindung reicht nicht). Für Linux bietet sich [modem-manager-gui](http://linuxonly.ru/cms/page.php?7) an.
1. im Falle des oben beschriebenen Problems nachsehen, ob die genannte SMS von `<66403>` eingegangen ist
1. diese mit `JA` beantworten
1. hoffen, daß es dann weitergeht ...

Punkt 3 konnte ich nicht selbst prüfen - die Reise war zu kurz :(
