+++
title 		= "Linux Mint und die Ubuntu-Backports"
description = "Aktivierung neuer Programmversionen auf älterer Linux-System-Basis in Ubuntu und Mint"
date 		= "2015-12-25T22:25:17+01:00"
linux		= ["Tipps", "Systemwartung"]

+++


## Anlaß
Ab und an wird von den Erstellern neuerer Software-Versionen darauf hingewiesen, daß die Nutzer älterer Betriebssystem-Varianten (insbesondere ältere Ubuntu-LTS-Versionen), die "Backports" installieren sollen.

### Was sind Backports?
Kurz gesagt: hier handelt es sich um Programme bzw. Pakete, die auf Basis neuerer Betriebssystem-Versionen entwickelt wurden, aber durch nachträgliche Anpassung "rückportiert" wurden, also an vorherige Betriebssystem-Stände angepaßt wurden.<!--more-->

### Ubuntu oder Mint oder was?
Für Ubuntu gibt es ein Repository, das solche rückportierten Programmpakete enthält.    
In der Paketquellenverwaltung von Linux Mint gibt es eine Option "Zurückportierte Pakete (Backport)".

![Backport](/bilder/2015-12/backports_mint.png "Backport")

Ist damit das Gleiche gemeint?

Hintergrund der Frage ist, daß "die Mint-Macher" auch eigene Programme (insbesondere Cinnamon- und Mate-Desktop, aber auch Systemverwaltungs-Tools) entwickeln.

## Antwort/Ergebnis

Mittels
```
inxi -r
```
läßt sich eine vollständige Liste der Software-Quellen anzeigen. Das sah bei mir (Linux Mint 17.2) so aus:
```
~ $ inxi -r
Repos: Active apt sources in file: /etc/apt/sources.list
   deb file:///var/local/repository ./
   Active apt sources in file: /etc/apt/sources.list.d/official-package-repositories.list
   deb http://packages.linuxmint.com rafaela main upstream import
   deb http://extra.linuxmint.com rafaela main
   deb http://archive.ubuntu.com/ubuntu trusty main restricted universe multiverse
   deb http://archive.ubuntu.com/ubuntu trusty-updates main restricted universe multiverse
   deb http://security.ubuntu.com/ubuntu/ trusty-security main restricted universe multiverse
   deb http://archive.canonical.com/ubuntu/ trusty partner
```
Nach Setzen des Hakens in der oben gezeigten Paketquellen-Verwaltung liest sich das so:
```
~ $ inxi -r
Repos: Active apt sources in file: /etc/apt/sources.list
   deb file:///var/local/repository ./
   Active apt sources in file: /etc/apt/sources.list.d/official-package-repositories.list
   deb http://packages.linuxmint.com rafaela main upstream import backport
   deb http://extra.linuxmint.com rafaela main
   deb http://archive.ubuntu.com/ubuntu trusty main restricted universe multiverse
   deb http://archive.ubuntu.com/ubuntu trusty-updates main restricted universe multiverse
   deb http://security.ubuntu.com/ubuntu/ trusty-security main restricted universe multiverse
   deb http://archive.canonical.com/ubuntu/ trusty partner
```
d. h. es ist lediglich
```
deb http://packages.linuxmint.com rafaela main upstream import
```
durch
```
deb http://packages.linuxmint.com rafaela main upstream import backport
```
ersetzt worden.

Die Option öffnet also nur die Mint-Backports ... 


Wer also die ___Ubuntu___-Backports zwingend unter Linux Mint braucht, der muß
```
deb http://de.archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse
```
per Hand hinzufügen, entweder durch Editieren der `/etc/apt/sources.list` Datei oder den Terminal-Befehl

```
add-apt-repository "deb http://de.archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse"
```

