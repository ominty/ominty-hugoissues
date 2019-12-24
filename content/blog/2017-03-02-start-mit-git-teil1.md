+++
title       = "git für Nicht-Programmierer - Teil 1 - Installation und Einrichtung"
date        = "2017-03-02"
description = "Was benötige ich, um git zu installieren? Was muß ich nach der Installation tun? "
keywords    = "git, Versionskontrolle, "
software    = ["Webseiten", "Programmieren"]
programme   = ["git"]
tutorials   = ["git"]
publishdate = "2017-03-02"

+++


`Git` ist - [wie bereits gesagt](2017-03-01-start-mit-git-grundlegendes.html) - ein Programm, das auf dem eigenen Rechner ausgeführt wird und im Gegensatz zu anderen, zentralisierten Systemen jedem Entwickler den vollständigen Programmcode lokal zur Verfügung stellt, eigene Änderungen kann er dann lokal einpflegen und, wenn er sicher ist, seine Aufgabe erledigt zu haben, diese mittels des Programms git über eine zentrale Plattform wie z. B. github seinen Programmier-Kollegen zur Verfügung stellen.<!--more-->

Aber, weil `git` auch vollständig lokal arbeitet, kann man es natürlich auch für seine eigenen kleinen privaten Projekte nutzbringend einsetzen. Ich demonstriere das an den Quelltexten dieser Homepage, die bekanntermaßen mittels [Hugo](/programme/hugo.html) erstellt wird.

## Installation
Unter Linux ist `git` in den gängigen Distributionen als Programmpaket enthalten, Nutzer von debian-basierten Distributionen brauchen nur

```
sudo apt-get install git
```
im Terminal ausführen und `git` ist installiert.

Windows-Nutzer lesen bitte [hier nach](https://git-for-windows.github.io/).

## Einrichtung

```
{benutzername}@{rechnername} ~/Webseiten/homepage $ git config --global user.name "{github-username}"
{benutzername}@{rechnername} ~/Webseiten/homepage $ git config --global user.email  "email@domain.tld"
```
Diese Daten werden in der Datei `~/.gitconfig` gespeichert.

### Das eigene Homepage-Verzeichnis `git`-fähig machen
Zunächst wechselt man im Terminal in das Arbeitsverzeichnis, hier also das Verzeichnis, in dem die Dateien und Unterverzeichnisse der Homepage/des Blogs liegen:
```
~ $ cd /home/{Benutzername}/Webseiten/homepage 
```
und dort führt man dann aus:
```
~/Webseiten/homepage $ git init
Initialisierte leeres Git-Repository in /home/{Benutzername}/Webseiten/homepage/.git/
```
`git` erstellt also _im Arbeitsverzeichnis_ ein _verstecktes Unterverzeichnis_ `.git` sowie eine Rohstruktur in diesem Unterverzeichnis, indem es alle seine Daten ablegt, incl. der archivierten Historie der Dateien, mit denen man gearbeitet hat - auf diese Weise lassen sich alte Versionen leicht wieder herstellen und man kann Vergleiche zwischen den Versionen ansehen.

![git erstellt ein verstecktes Verzeichnis](/bilder/2017-03/git-repository-verzeichnis.png)

### Ausgangsbasis in `git` erstellen

Im nächsten Schritt muß man alle seine Dateien im Arbeitsverzeichnis `git` quasi "bekannt machen":
```
{benutzername}@{rechnername} ~/Webseiten/homepage $ git add -A
```
und dann `git` auffordern, einen _Start-Schnappschuss_ des aktuellen Zustandes der Dateien des Projekts zu erstellen:
```
{benutzername}@{rechnername} ~/Webseiten/homepage $ git commit -m 'initial version'
[master (Basis-Commit) 85a196c] initial version
 239 files changed, 5959 insertions(+)
 create mode 100644 archetypes/default.md
 create mode 100644 config.toml
 create mode 100644 content/_index.md
 create mode 100644 content/blog/2015-11-24-usb-geraete-abchecken.md
 create mode 100644 content/blog/2015-12-22-statisches-blog-mit-hugo.md
 create mode 100644 content/blog/2015-12-24-sudo-gksudo-und-die-dateirechte.md
 create mode 100644 content/blog/2015-12-25-laden-mit-lichtmaschine.md
 create mode 100644 content/blog/2015-12-25-linux-mint-und-ubuntu-backports.md
 create mode 100644 content/bl.....
 ```
 Daraus sieht man, daß _ALLES_, was in diesem Verzeichnis ist, der Versionskontrolle unterzogen wird, und zu diesem Zweck natürlich im Repository-Archiv vorgehalten werden muß. Das ist z. B. für "_statische_" Files wie Bilder oder pdf-Dokumente im Falle einer Homepage nicht unbedingt notwendig, deshalb kann man diese ___vor___ dem ersten `commit` ausschließen.    
Man erstellt also ein `.gitignore`-File:
```
{benutzername}@{rechnername} ~/Webseiten/homepage $ touch .gitignore
```
und kann dort alles eintragen, was _nicht_ von `git` kontrolliert werden soll:
```
## General Exclusion Rules for Type 'Homepage'

# backup files
*~

# these rules exclude documents for download
*.ps
*.eps
*.pdf

# figures alltogether
*.jpg
*.png
*.gif
*.tif
*.tiff
```
Im Falle meiner privaten Homepage reduzierte sich so das Volumen des `.git`-Verzeichnisses auf rund ein Zehntel.

Und weil z. B. Hugo und ähnliche statische Webseitengeneratoren ihr _Ausgabe_-Verzeichnis ebenfalls im Projektverzeichnis liegen haben, ein Ausgabeverzeichnis (dessen Inhalt ja bei jedem Aktualisieren der Webseite komplett neu erstellt wird) im Gegensatz zum eigentlichen Quelltext aber nix in der Versionsüberwachung zu suchen hat, sollte man in diesem Fall in  `.gitignore` noch folgende Zeile hinzufügen:
```
# Hugo public folder excluded since this is an OUTPUT folder
public/
```
## Und wie weiter?
`git` ist eingerichtet und hat einen ersten Start-Zustand des Verzeichnisses, in dem gearbeitet wird, angelegt. Nun kann die Arbeit am Projekt losgehen.    
Welche Schritte dabei notwendig sind, daß `git` diese Arbeit korrekt mitverfolgt und seine Fähigkeiten unterstützend anbieten kann, das wird Gegenstand des 2. Teils sein.

