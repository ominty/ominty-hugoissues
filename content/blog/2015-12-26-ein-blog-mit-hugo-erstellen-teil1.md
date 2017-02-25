+++
title 		= "Ein Blog mit Hugo erstellen - Tutorial Teil 1 - Installation"
date 		= "2015-12-26T22:25:17+01:00"
description = "Kurze Beschreibung, wie Hugo installiert wird unter Linux und Windows. Ebenfalls beschrieben wird ein kurzer Probelauf"
keywords      = "Hugo, Webseite, Installation, Probelauf, Windows, Linux"
categories 	= ["Webseiten"]
tags 		= ["Hugo", "Tutorial"]

+++

Hugo ist zwar ein großartiges Tool, aber die Dokumentation dazu richtet sich - Stand heute - eher an Programmierer als an "Otto-Normal-Blogger" und ist gänzlich in englischer Sprache gehalten.    
Auch deutschsprachige Tutorials sind bisher nicht vorhanden. Daher möchte ich hier die Schritte beschreiben, mit deren Hilfe ich dieses Blog erstellt habe.

## Installation

Da es sich bei Hugo um ein "System" handelt, das alle Seiten des Blogs lokal auf dem heimischen Rechner erstellt, muß natürlich auf dem heimischen Rechner eine Software "installiert" werden. Das gestaltet sich aber sehr einfach:<!--more-->

### Installation unter Windows
Auf der [Projektseite der Entwickler](https://github.com/spf13/hugo/releases) (ggf. nach unten scrollen) lassen sich die 32-`hugo_0.1x_windows_386_32-bit-only.zip` und 64-bit- `hugo_0.1x_windows_amd64.zip`Versionen von Hugo als ZIP-File herunterladen. Nach dem Entpacken der .zip-Datei steht eine gleichnamige .exe-Datei bereit, die ich in das einfache `hugo.exe` umbenenne.    
Im Terminal (Start - Programme - Zubehör - Eingabeaufforderung) gibt man "Path" ein:
```
C:\Dokumente und Einstellungen\Benutzername>path
PATH=C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem
```
Es werden als Antwort einige Verzeichnisse gelistet, in _eines_ davon (der Einfachheit halber `C:\WINDOWS`) schiebt man die entpackte "hugo.exe".    
Damit ist die Installation beendet, es werden keine Systemkonfigurationen etc. geändert, der Rechner bleibt "sauber". Zur Deinstallation wird die Datei einfach wieder gelöscht.

### Installation unter Linux
Für Debian-/Ubuntu-/Mint-Systeme steht ein .deb-Paket zum Download bereit: `hugo_0.15_amd64.deb` bzw. `hugo_0.15_i386.deb`, das über den Paketmanager installiert bzw. deinstalliert werden kann.

## Probelauf
Das korrekte Funktionieren kann über die folgende Terminaleingabe getestet werden, hier am Beispiel eines Linux-Rechners:
```
~ $ hugo
ERROR: 2015/12/26 Unable to locate Config file. Perhaps you need to create a new site. Run `hugo help new` for details Unsupported Config Type ""
ERROR: 2015/12/26 No 'baseurl' set in configuration or as a flag. Features like page menus will not work without one.
CRITICAL: 2015/12/26 No source directory found, expecting to find it at /home/benutzer/content
```
oder unter Windows:
```
C:\Dokumente und Einstellungen\Benutzername>hugo
ERROR: 2015/12/26 Unable to locate Config file. Perhaps you need to create a new
 site. Run `hugo help new` for details Unsupported Config Type ""
ERROR: 2015/12/26 No 'baseurl' set in configuration or as a flag. Features like
page menus will not work without one.
CRITICAL: 2015/12/26 No source directory found, expecting to find it at C:\Dokum
ente und Einstellungen\Administrator\content
```
Das bedeutet nichts anderes, als daß Hugo gefunden wurde, Hugo seinerseits aber keine Homepage oder Blog findet und kein zugehöriges Konfigurationsfile. 

Das ist Inhalt der nächsten Folge.