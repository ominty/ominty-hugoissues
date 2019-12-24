+++
title 		= "Mobile Webseiten - Hype oder Realität?"
description = "Bei der Umgestaltung meiner Webseite stellte sich mir die Frage, wie relevant denn mobiltaugliches Design in der Praxis ist - hier eine kleine Statistik"
date 		= "2017-02-28"
software 	= ["Webseiten"]
medien     	= ["Mobiles Internet"]

+++

Google mault in den Webmaster-Tools schon eine ganze Weile herum, meine Webseite wäre nicht "_mobile friendly_". Ich hab dann mit ein paar kleinen Änderungen erstmal für weitgehende Ruhe diesbezüglich gesorgt, so richtig schön war's aber nicht wirklich.  <!--more-->  
Der Komplett-Umstieg auf [Hugo](/programme/hugo.html) hat mich dann aber bewogen,  bei der Gestaltung der Templates gleich auf aktuelles responsives HTML5 umzusteigen, auf daß die Besitzer von "Fettfinger-Brettern mit Mini-Displays" (sorry, ich mag keine Touch-Screens)) nicht ganz außen vor bleiben müssen. Trotzdem wollte ich mal sehen, "was wirklich Sache ist" bei den Besuchern meiner Webseite.


## Die Daten
Mein Provider liefert mir ausgewertete Zahlen, die anonymisiert sind, aber nach verschiedenen Kriterien Aussagen zulassen:

- aufgerufene Seiten
- Herkunft der Besucher (Suchmaschine oder Link von anderer Seite (welche?))
- Browser/Betriebssystem
- Tages-/Wochen-/Monatsstatistik

### Auswertung
Um aussagekräftigere Zahlen zu bekommen, habe ich mir die letzten 3 Monate des vergangenen Jahres zusammengefaßt.    
Die ermittelten Summenzahlen habe ich nach Browser und nach Betriebssystem ausgewertet.

Zum Einsatz kam dabei die Software `gnuplot`, die ich immer wieder gerne einsetze, wenn Daten als einfache Text-Tabellen vorliegen.

### Die Ergebnisse
#### Browser-Auswertung
Dieses Diagram zeigt mir erstmal Verwunderliches: Zähle ich die Mobilbrowser (Android/PDA, Noika/PDA und Samsung/PDA) zusammen, dann kommt ein fast verschwindender Anteil an Webseitenbesuchern zusammen, der meine Seiten per mobilem Gerät besucht:

![Browser](/bilder/2017-02/webstatistik-browser.png)

Das widerspricht aber allem, was da im Internet und darüber hinaus so "herumgetönt" wird. Also ging's weiter zum zweiten Schritt:


#### Auswertung nach Betriebssystemen
![Betriebssystem](/bilder/2017-02/webstatistik-os.png)

Und hier wird's dann schon "realitätsnäher", zumindest kommen meine Zahlen den veröffentlichten Zahlen näher.    
Android und iOS kommen zusammen auf rd. 13,5% der Besucher - das ist zwar immer noch nicht die propagierte "Mehrzahl" der Webnutzer, aber vllt. liegt das auch an der Art der Inhalte hier (ich verbreite halt nicht die sprichwörtlichen "Katzenvideos", die man sich auf dem Sofa lümmelnd reinzieht).

Etwas verwundert hat mich aber der hohe Anteil von 10% Desktop-Linux-Nutzern. Lesen so viele Linux-Nutzer meine Iveco-Seiten oder liegt's an den Linux-lastigen Beiträgen hier im Blog?

Beruhigend fand ich in der Detailaufschlüsselung der Internet-Explorer-Versionen, daß die alten (</= IE8) Versionen im Bereich jeweils unter 1% liegen. Beruhigend deshalb, weil die mit dem neuen Design nicht zurechtkommen. Nutzer dieser alten Browser können zwar die Inhalte sehen, aber das Design sieht halt "_rustikal_" aus ... 