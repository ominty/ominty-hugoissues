+++
title 		= "darktable für Windows"
description = "darktable ist ursprünglich ein Linux-Programm, eine MAC-Variante ist ebenfalls verfügbar. Nun hat sich ein engagierter OS-Entwickler daran gemacht, eine Windows-Version zu erproben und zur Verfügung zu stellen"
date 		= "2016-02-11"
software 	= ["Fotografie"]
programme	= ["darktable"]

+++

Ich hatte [bereits beschrieben]( http://privat.albicker.org/blog/2013-07-26-darktable-und-die-folgen.html), daß ich u. a. aufgrund der Foto-Software [darktable]( http://www.darktable.org) zu Linux gewechselt bin.    
Und weil unter den Reisenden ja auch viele Foto-Ambitionierte sind, möchte ich hier kurz auf eine Neuigkeit im Umfeld des _Open-Source-Projekts_ ___darktable___ eingehen: Es gibt jetzt auch eine erste Version für Windows ... 
<!--more-->

## Was ist darktable?
### Funktionen
Darktable ist ein open-source-Programm, das den [fotografischen "Workflow"](http://www.bilddateien.de/fotografie/digital-workflow.html) (= Arbeitsablauf) abbildet. Es beinhaltet dazu:

- einen leistungsfähigen RAW-Konverter
- einen "Leuchttisch", um Fotos zu sichten, bewerten und verschlagworten
- eine "Dunkelkammer", um Fotos auszuarbeiten und zu optimieren

Am ehesten ist darktable mit dem kommerziellen Lightroom zu vergleichen.
Darktable ist ursprünglich eine Linux-Anwendung. Seit 2012 gibt es jedoch einen Entwickler, der sich um [Mac OS X](http://www.darktable.org/2012/08/experimental-darktable-os-x-image) kümmert.

### Das Entwicklerteam
Zum Kern-Entwicklerteam gehören [eineinhalb Dutzend Leute](http://www.darktable.org/contact), die aus Interesse und technischer Neugier diese Software auf die Beine gestellt haben.    
Alle arbeiten mit Linux als Betriebssystem. Und aus diesen Gründen gibt/gab es bisher auch [keine Windows-Version](http://www.darktable.org/2015/07/why-dont-you-provide-a-windows-build).

### Installationsfiles
oder Hinweise zur Installation können auf der Unterseite [install](http://www.darktable.org/install) gefunden werden - für diverse Linux-Distributionen und MacOS.

Dabei erstellt das darktable-Entwicklerteam den "rohen Quelltext", für die Erstellung der Installationsfiles sind sog. "Maintainer" zuständig, die neben der Bereitstellung der Installationsfiles (Kompilieren) auch für die Fehleranalyse der spezifischen Fehler der jeweiligen Plattform zuständig sind. 

Es geht also i. d. R. nicht darum, "mal eine Version zu erstellen", sondern um dauerhafte Unterstützung der Plattform. 

## Windows-Version?
Eben weil darktable "open source" ist, steht der Quellcode für jedermann frei zur Verfügung. Daher hat sich jetzt ein weiterer engagierter Mensch, [Partha Bagchi]( https://plus.google.com/+ParthaBagchi), mit diesem Quellcode beschäftigt und zunächst eine Installationsdatei (.exe) für 64bit-Windows-Systeme erstellt, sozusagen als "Proof of Concept", als Beweis, daß der Ansatz funktioniert.

![darktable für windows screenshot](/bilder/2016-02/darktable-win.png)

Feedback nimmt Partha per [Google Plus](https://plus.google.com/+ParthaBagchi/posts/H2MNQ1GgBck) oder per e-mail (siehe seine [Webseite](http://www.partha.com)) entgegen.
<!-- https://discuss.pixls.us/t/darktable-on-windows-parthas-build-thread/290/4 -->

### Installation
Den Windows-Installer kann man bei Partha auf seiner [Webseite](http://www.partha.com) herunterladen. Die heruntergeladene .exe-Datei muß einfach ausgeführt und den Anweisungen gefolgt werden.   
Darktable erzeugt seine Profildateien im Verzeichnis

    C:\Users\{benutzername}\AppData\Roaming\Darktable2.0\

Dort werden die Programmeinstellungen, der Thumbnail-Cache und die Datenbank für die Daten der importierten Bilder abgelegt.

### Bekannte Probleme
Darktable für Windows enthält nicht alle Funktionalitäten der letzten 2.0-Hauptversion von darktable. Es fehlen bisher

- Tethering-Support (Fernsteuerung von Kameras vom PC aus)
- Druckmodul (Ausgabe für einen Drucker mit entspr. Anwendung von Druckerprofilen etc.)
- Geotagging (Synchronisation der Bilder mit externen GPS-Daten und Anzeige in einer Karte)

Ferner gibt es derzeit noch Probleme mit der Spracheinstellung der Bedienoberfläche. In Windows und MacOS wird automatisch die Sprache des Desktops gewählt. Daher fehlt darktable ein Einstellmenü für die Sprache.    
In der Windows-Version funktioniert dies bisher noch nicht, daher wird die Voreinstellung "englisch" gestartet.

## Abschließender Hinweis
Weil - wie oben beschrieben - niemand aus dem Kern-Entwickler-Team Windows als Betriebssystem nutzt, können diese Leute auch nicht bei der Fehlerbehebung helfen. Wer die Windows-Version nutzt, sollte sich daher ausschließlich mit Partha zu dieser Version austauschen.    
Er wird bei Windows-spezifischen Problemen ggf. Abhilfe schaffen können - oder identifizieren können, was generelle Probleme sind und diese ggf. an die Entwickler-Mannschaft weitergeben.

Und denkt immer daran: sowohl die Entwickler als auch Partha stecken ihre Freizeit in dieses tolle Projekt - und das sollte wir als Benutzer respektieren und nicht nur ungeduldig Forderungen stellen ...

<!-- Darktablerc
    C:\Users\balbicker\AppData\Roaming\Darktable2.0
    C:\Users\balbicker\AppData\Roaming\Darktable\2.0 -->
    
## Die weitere Entwicklung
Hierzu gibt es einen [eigenen Artikel](/blog/2016-10-16-darktable-fuer-windows-2.html)





