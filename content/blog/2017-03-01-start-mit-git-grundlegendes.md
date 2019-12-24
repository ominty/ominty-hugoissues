+++
title       = "git für Nicht-Programmierer - Die Grundlagen"
date        = "2017-03-01"
description = "Was ist git? Wozu brauche ich das? Wie bekomme ich das zum Laufen?"
keywords    = "git, Versionskontrolle, "
software    = ["Webseiten", "Programmieren"]
programme   = ["git"]
publishdate = "2017-03-01"

+++

Seit einiger Zeit arbeite ich mit Hugo. Je tiefer ich in die Möglichkeiten einsteige, desto mehr wird es dann und wann nötig, sich mit anderen und - bei vermuteten oder tatsächlichen Programmfehlern - den Entwicklern auszutauschen.<!--more--> Oftmals kommt dann die Aufforderung: 

> Schick mir mal einen Link zu einem Source-Repository

Als Nicht-Programmierer war mir diese Welt immer fremd - aber nun kam ich nicht drumherum, mich mal mit der Materie auseinander zu setzen.    
Ich möchte hier einen Schnelldurchgang der notwendigen Schritte und Befehle darstellen, wer sich näher mit `git` beschäftigen will, kann [hier](https://git-scm.com/book/de/v1) oder [hier](http://gitbu.ch/index.html) in aller Ausführlichkeit nachlesen.

## Ein Repository
### Definition
Ein Repository kann man als Verzeichnis auf einem Datenträger oder Projekt auffassen, das aber unter einer externen Verwaltung steht. Diese Verwaltung kann der Speicherung und Beschreibung von Zusatzdaten zu digitalen Objekten oder auch der Sicherung von Schnappschüssen (Zustände zu definierten Zeitpunkten) zur Kontrolle von Änderungen (Versionskontrolle) dienen. 

### Anwendung
Die Versionskontrolle ist insbesondere bei der Software-Entwicklung notwendig, denn man kann z. B. erfolglose Versuche einer Weiterentwicklung jederzeit wieder verwerfen und auf die letzte funktionierende Version zurückkehren.

Man kann sich das vorstellen wie die Funktion "Rückgängig" in vielen Desktop-Programmen. Im Unterschied dazu funktioniert das hier aber auch, wenn in einer Vielzahl von Dateien Änderungen, auch jeweils mehrere, vorgenommen wurden. Alle diese Dateien können dann auf einen gemeinsamen Ausgangszustand zurückgesetzt werden.

### github
`git` ist nicht _github_. `git` ist ein Programm, das auf dem eigenen Rechner ausgeführt wird. _github_ ist dagegen eine Plattform im Internet, auf die mittels `git` zugegriffen werden kann.     
Die Hugo-Entwickler und auch die Entwickler der Themes arbeiten über diese Plattform [github](https://github.com/). Dort kann man sich kostenlos anmelden und ein oder mehrere ___öffentliche Repositories___ anlegen, in denen man dann Daten speichern kann. Das können Software-Quelltexte sein, aber auch die Quelltexte eines Webauftritts z. B.

Und hier wird's jetzt interessant: zur Besprechung von Problemen oder Programmfehlern kann man den Entwicklern auf diese Art und Weise die Markdown-Dateien, die Bilder, das Theme mit den Templates etc. komplett zugänglich machen, sodaß diese das Problem untersuchen können.

## Wie arbeitet (man mit) `git`?

Nun, zunächst nicht viel anders als ohne ...    
Ob man nun an einem Computerprogramm, an einem Template für einen Internetauftritt oder an einem e-book arbeitet - immer wird man zunächst ein Verzeichnis auf seinem lokalen Rechner einrichten (sog. _Arbeitsverzeichnis_), in dem sich alle für das Projekt notwendigen Dateien, ggf. in einer geeigneten Unterverzeichnis-Struktur, befinden. Und diese Dateien werden mit den dafür geeigneten Programmen, z. B. Editoren, bearbeitet und dann wieder gespeichert. 

Bis hierher ist von `git` noch überhaupt nichts zu bemerken. `git` "schwebt" quasi über dem Arbeitsverzeichnis mit wachsamem Auge, und der Bearbeiter/Entwickler kann nun immer dann, wenn er z. B. einen Arbeitsschritt an seinem Projekt erledigt hat, `git` zum Einsatz bringen, um diesen zu sichern.

Die zugrunde liegende Struktur sieht so aus:

![Struktur von git](/bilder/2017-03/git-diagramm.png)

### Working Tree/Working Directory
Das _Arbeitsverzeichnis_ von `git`. Hier "wird gearbeitet", s.o.     
Oft findet man dafür auch die Bezeichnung Working Directory.

### Repository
Das Repository ist eine Datenbank, in der `git` die verschiedenen Zustände jeder Datei eines Projekts über die Zeit hinweg ablegt. So ein (Zwischen)Zustand einer oder mehrerer Dateien wird immer dann gespeichert, wenn der Bearbeiter des Projekts - wie oben erwähnt - eine (Teil)Aufgabe oder Arbeitsschritt erledigt hat und diese(n) sichern will.    
Diese Zwischenstände werden als _Commit_ verpackt und abgespeichert.

### Index, auch: Staging Area
Der Index ist eine Zwischenstufe zwischen Working Tree und Repository und stellt quasi eine Art "Merkzettel" dar, welche Dateien fertig bearbeitet sind für eine Zwischensicherung, also welche Änderungen an welchen Dateien in den nächsten _Commit_ verpackt werden sollen.

### Commit
Veränderungen am Working Tree, also z.B. modifizierte oder neue Dateien, werden im Repository als Commits gespeichert. Ein Commit enthält sowohl diese Veränderungen selbst als auch Metadaten, wie den Autor der Veränderungen, Datum und Uhrzeit, und eine Nachricht (Commit Message), die die Veränderungen beschreibt. Ein Commit referenziert immer den Zustand aller verwalteten Dateien zu einem bestimmten Zeitpunkt. 

Die verschiedenen `git`-Kommandos dienen dazu, Commits zu erstellen, zu manipulieren, einzusehen oder die Beziehungen zwischen ihnen zu verändern.

<!-- ### HEAD
Eine symbolische Referenz auf den neuesten Commit im aktuellen Branch. Von dieser Referenz hängt ab, welche Dateien Sie im Working Tree zur Bearbeitung vorfinden. Es handelt sich also um den „Kopf“ bzw. die Spitze eines Entwicklungsstrangs. -->

