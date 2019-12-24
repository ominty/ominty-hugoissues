+++
title       = "Weihnachten 2008 - (ernsthafter) Linux-Einstieg mit dem Projekt Media-PC"
date        = "2008-12-28T12:20:15"
description = "Aufbau eines Media-PC als Einstiegsweg in die Linux-Nutzung"
linux       = ["Erfahrungen", "Migration" ]

+++

Ein altes ASRock-Mainboard mit einem Athlon-Prozessor liegt herum, ebenso ein paar andere Komponenten: Festplatten, Gehäuse, Grafik- und Soundkarten. Was tun damit?

So wurde die Idee des "Media-PCs" geboren. Ein Desktop-Gehäuse mit einem hochwertigen Netzteil wurde mit den genannten Komponenten gefüllt, doch dann kam das nächste Problem: Freie Windows-Lizenzen hatte ich keine mehr. Eine kurze Internet-Recherche brachte mich dann zu Linux.

## Software

Ich entschied mich für ein Debian-Linux, damals war Debian Etch (4.0r4) aktuell. <!--more--> Die Software-Ausstattung bestand aus Firefox für z. B. den Zugriff auf Jamendo, Liferea für Audio-Podcasts der Rundfunkanstalten, Jajuk als Musik-Abspieler, Audacity für die Digitalisierung meiner analogen Tonkonserven: Schallplatten, Toncassetten. Mittels EasyTAG habe ich die digitalisierten Tonkonserven mit Metadaten versehen. Kaffeine brachte mir in Verbindung mit einer Parabolantenne und einer PCI-DVB-S-Karte die Radio-Sender vom Astra ins Haus. Fernsehen? Mit der Prozessorleistung keine Chance! Also reichte ein kleiner 15"-Monitor als Display für die Bedienung.

## Probleme

Meine gute alte Terratec 128PCI Soundkarte erwies sich als hervorragend für die Wiedergabe, leider ließ sie sich nicht dazu überreden, Ton "stotterfrei" aufzunehmen. Die Karte wurde richtig erkannt und auch das richtige Kernel-Modul geladen - es half nichts. Also mußte eine weitere Soundkarte (diesmal eine Soundblaster) her, um diesen Part zu übernehmen: tolle Sache: Da brauche ich also 2 Soundkarten, damit wenigstens Aufnahme und Wiedergabe funktionieren (die Onboard-Soundkarte war die dritte - und die funktionierte auch, aber die ist nicht wirklich HIFI-tauglich).    
Ein weiteres ständiges Ärgernis war meine Nvidia-Grafik-Karte. In mühevoller Handarbeit ist es mir gelungen, den Original-Treiber zu installieren, sodaß wenigstens etwas mehr als VGA-Grafik - und auch 3D-Unterstützung - ging. Das hatte aber zwei Nebenwirkungen:

1.    mit jedem Kernel-Update startete der Rechner nurmehr mit einer Konsole, der X-Server war zerschossen
2.    Das Nvidia-Einstell-Tool überschrieb die Xorg.conf komplett, anstatt nur den Video-Teil zu aktualisieren. Folge: Plötzlich war die Tastaturbelegung wieder amerikanisch! Und wenn das Paßwort dann z. B. den Buchstaben "z" enthält, dann artet das in eine längere Fehler-Stocher-Such-Tour aus, weil die grafische Anmeldung nicht mehr funktioniert ...


## Resümee

Nach der Devise "Never change a running system" hab ich irgendwann die Updates ignoriert (und einige Zeit später war auch der Unterstützungszeitraum seitens Debian abgelaufen), die Kiste lief dann einfach stabil und "geräuschlos" (im Sinne von störungsfrei, nicht etwa ohne Audio ;-) ) vor sich hin, bis sie Ende 2012 technisch aufgerüstet wurde.

