+++
title       = "Weihnachten 2012 - Media-PC, die zweite"
description = "Neuaufbau eines Media-PC auf Linux-Basis - und das Mysterium der Distributionen"
date        = "2013-01-06T12:20:15"
linux       = ["Erfahrungen", "Migration" ]

+++

Die allgemeine Fernsehgebühr, Rundfunkbeitrag genannt, naht. Und wenn ich schon zahlen soll, dann möchte ich (zumindest theoretisch) in der Lage sein, die Inhalte wahrnehmen zu können.    
Das ist aber nur ein Grund. Durch mein Hobby Fotografie sind mir in der letzten Zeit immer wieder tolle Video-Podcasts, aber auch Zeitraffer-Filme, alles natürlich in HD-Qualität und mit super Sound, untergekommen, kurz: es wird Zeit, daß meine "Media-Mühle" bildtauglich wird, um diese hochwertigen Inhalte nicht am Schreibtisch-Monitor mit 22", sondern in vernünftiger Größe, entspannt vom Sofa aus, und den Ton über die Stereoanlage genießen zu können.
<!--more-->

## Hardware-Aufrüstung

Beibehalten wurden Gehäuse und Netzteil sowie Brenner und Soundkarten. Das Mainboard wurde durch ein Upgrade-Kit der Firma Reichelt (Gigabyte-Mainboard Z77-DS3H) ersetzt, ein Gigabyte-Mainboard mit i7-Prozessor und 16GB RAM sowie Onboard-Grafik, fertig montiert und getestet. Bequemer kann's eigentlich nicht sein. Zusätzlich habe ich mir im Januar 2013, nachdem alles lief, einen 40" Flach-Fernseher als Monitor angeschafft.    
Während das alte Board schon bei der Wiedergabe einer einfachen DVD überfordert war, lieferte ein kurzer Test mit gleichzeitiger Wiedergabe von HD-Video von der Festplatte, Fernsehprogramm vom Astra, Mediathek aus dem Internet, Musik vom Audioplayer, Schnitt eines weiteren Videos mit Transcodieren, und dem Wackeln an einem der Fenster mit der Maus eine Auslastung über alle Prozessorkerne von nicht einmal 20% - so macht das Spaß!

## Software-Kämpfe oder: Distri-Esotherik, Teil 1

Zur neuen Hardware gehörte natürlich auch neue Software: Ich wollte den Rechner mit dem aktuellen, stabilen Debian 6.0 "Squeeze" ausstatten, aber: Da das Board mit UEFI-Bios ausgestattet ist, ging das nicht, ich mußte auf die "Testing" Version von Debian ausweichen.    
Das ließ sich dann wenigstens installieren, aber: der Rechner startete nicht! Die Lösung zu finden war dann nicht ganz einfach, offenbar installiert niemand ein Linux-System auf einem nackten Rechner, denn alle Hinweise in den einschlägigen Foren behandeln nur den Fall: "Ich habe Win-xyz auf dem Board abc und möchte Linux als Dual-boot ...". Es ging dann doch irgendwann, aber: der neue Gnome-Desktop hatte jeweils eine Lebensdauer von wenigen Minuten bis max. 2 Stunden, ehe der Rechner so einfror, daß nur hartes Abschalten half. Fehler-Logs, aus denen man was lernen konnte: keine, der Rechner fror anscheinend so plötzlich ein, daß er nicht mehr dazu kam, irgendwelche Fehler zu protokollieren.

Irgendwann hatte ich "die Schnauze voll" (der Urlaub war mehr oder weniger erfolglos rumgegangen) und ich hörte (als letzte Chance vor der Installation von Windows - eine Investitionsruine kam nicht in Frage) auf die Empfehlung eines Bekannten, es mal mit Fedora zu probieren.    
Kurz gesagt: Fedora 17 drauf (war die aktuellste Version) - und die Kiste läuft ... monatelang ohne Abschalten ... und läuft und läuft und läuft ...

Warum? Was ist anders? Das hab ich nie rausgefunden, deshalb läuft das für mich unter "Distri-Esotherik".