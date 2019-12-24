+++
title 		= "Warum ich proprietäre Formate meide"
description = "Problematik firmenspezifischer Dateiformate am Beispiel Microsoft Word und Harvard Graphics im Rückblick der vergangenen 20 Jahre"
date 		= "2017-01-08"
keywords    = "Dateiformat, proprietär, offen, Protokoll, Microsoft Word, Harvard Graphics"
software    = ["Office"]
programme   = ["MS Word", "LibreOffice", "Harvard Graphics"]

+++

## Begrifflichkeiten:
Was sind proprietäre (Daten)Formate und Protokolle?    
Nun, [Wikipedia](https://de.wikipedia.org/wiki/Propriet%C3%A4r) schreibt dazu:
<!--more-->
Im Abschnitt "Verschiedene Bedeutungen" heißt es unter Punkt 2.2:

>Protokolle, Dateiformate und Ähnliches werden als „proprietär“ bezeichnet, wenn sie nicht oder nur mit Schwierigkeiten von Dritten implementierbar und deshalb nicht zu öffnen oder zu lesen sind, weil sie z. B. lizenzrechtlich, durch herstellerspezifisches Know-how oder durch Patente beschränkt sind. Beispiele für proprietäre Dateiformate sind das MS-Word-Format, das WMA-Format oder Dateiformate der Lotus Smartsuite. Beispiele für nicht proprietäre, offene Formate sind die OpenDocument-Formate, Ogg Vorbis, das Portable-Network-Graphics-Format und das HTML-Format.

Und weiters im Abschnitt 3:

>Traditionell werden im IT-Bereich solche Dateiformate, Protokolle usw. aber auch Hardware als proprietär bezeichnet, die nicht allgemein anerkannten Standards entsprechen, also eigene Entwicklungen sind. Beispiele hierfür sind die Cisco VoIP-Telefone mit Skinny-Protokoll und die Software Skype. Proprietäre Formate werden einerseits zur Vereinfachung und damit Verminderung des Implementierungsaufwands verwendet, wenn Standards zu aufwändig wären. Oft werden sie aber auch zur Abgrenzung von Standards und damit als zusätzliche Einnahmequelle von Lizenzgebühren genutzt, z. B. bei Herstellern von Arbeitsspeicher und bei einigen Softwareherstellern.


also: proprietär im IT-Sprachgebrauch bezeichnet _Datenformate (zum Speichern von Daten)_ oder _Protokolle (zum Übertragen von Daten zwischen verschiedenen Anwendern)_, die nicht allgemein zugänglichen Standards entsprechen, sondern firmenspezifische Eigenheiten haben und entweder nicht offengelegt (also geheim gehalten) oder durch Patente von der Anwendung durch andere "geschützt" sind.

### Auswirkungen
Der Benutzer ist damit vom Wohlwollen des entspr. IT-Anbieters abhängig, ob und ggf. wie lange er seine _gespeicherten Daten_ noch lesen kann, weil diese Daten eben nicht durch Fremdsoftware nutzbar sind - dies ist in meinen Augen höchst gefährlich.    
Das oben genannte OpenDocument-Format wird z. B. von den Programmen OpenOffice, LibreOffice etc. für Schrift-, Tabellen- und Präsentationsdokumente verwendet.

Im Fall der _Übertragung von Daten_ ist das ebenso leicht einzusehen:
- Ich kann mit jedem Telefon jeden Herstellers mit jedem anderen Telefonteilnehmer, der ebenfalls ein beliebiges Endgerät hat, telefonieren.
- Verwende ich aber z. B. Skype, um per Internet zu telefonieren, dann kann ich das nur tun mit anderen Teilnehmern, die ebenfalls Skype verwenden/installiert haben auf dem Rechner und sich dort angemeldet haben - Teilnehmer anderer Dienste bleiben außen vor.

## Bedeutung in der Praxis
### Meßdaten
In den 90er Jahren habe ich viele aufgenommene Meßwerte in das damals populäre Präsentations-Programm [Harvard Graphics](https://de.wikipedia.org/wiki/Harvard_Graphics) eingetippt - das war eine riesige Fleißarbeit. Die entsprechenden Files existieren heute noch, und vor einiger Zeit hätte ich gerne darauf zurückgegriffen, um diese Daten in anderem Zusammenhang erneut zu verwenden - es fand sich keine Software, die dieses Format noch lesen kann.

Ob der Nach-Nach-Nachfolger [des heutigen Eigentümers Serif](http://www.serif.com/harvard-graphics/) das Format ggf. lesen und evt. auch noch exportieren kann, das läßt sich nicht ermitteln, auf der Herstellerseite heißt es nur:

>Currently, Harvard Graphics software is only available to customers in the USA.

### Textdokumente
Ebenfalls in den 90ern war bereits Microsoft Word ein verbreitetes Textbearbeitungs-Programm, damals noch in der Version 5.0 für DOS (mit der Dateiendung `.TXT`). Auch hier gilt: heute nicht mehr lesbar.     
Hier könnte man sich helfen, indem man sich ein Word-für-Windows 2.0 auf einen Rechner mit älterem Betriebssystem installiert und die vorhandenen Dateien dann in das [RTF-Format (offengelegt)](https://de.wikipedia.org/wiki/Rich_Text_Format) speichert - auch das ist natürlich eine Fleißarbeit. 

![Word5-Datei öffnen in Winword2](/bilder/2017-01/winword2-datei-oeffnen.png)

![Word5-Datei speichern als .rtf](/bilder/2017-01/winword2-datei-rtf-speichern.png)

Dieses läßt sich dann problemlos mit z. B. Open-/LibreOffice öffnen - dann sollte man die Datei auch gleich als [OpenDokument Text](https://de.wikipedia.org/wiki/OpenDocument) `.odt` abspeichern.
     
Und auch mit späteren Word-Dokumenten (Versionen 2 bis 6) für Windows und bereits der Endung `.DOC` gibt es in heutigen Office-Versionen massive Probleme, denn Microsoft selbst schränkt die Lesbarkeit "aus Sicherheitsgründen" ein:

>Dieser Fehler tritt auf, wenn Sie einen Microsoft Office-Dateityp öffnen, der von den Zugriffsschutzeinstellungen des Sicherheitscenters blockiert ist. Gehen Sie folgendermaßen vor, um diesen Dateityp zu aktivieren:   
Klicken Sie auf die Registerkarte Datei.   
Klicken Sie unter Hilfe auf Optionen.   
Klicken Sie auf Vertrauensstellungscenter, und klicken Sie anschließend auf Einstellungen für das Vertrauensstellungscenter.   
Klicken Sie im Vertrauensstellungscenter auf Dateiblockierungseinstellungen.   
Deaktivieren Sie die Registrierungsrichtlinieneinstellung, um Dokumente mit diesem Dateityp zu speichern.   
Weitere Informationen finden Sie im Microsoft Knowledge Base-Artikel 922850.

Hier ist es in den meisten Fällen einfacher, gleich Open-/Libre-Office zu verwenden, die Datei zu öffnen und dann wieder im OpenDocument-Format abzuspeichern ... aber das ist auch nur möglich, weil die dortigen Entwickler viel Geduld und Energie aufgewendet haben, das Microsoft-eigene Format und dessen Eigenheiten quasi "zu knacken", um einen entsprechenden Daten-Übersetzer schreiben zu können.
      
... und so ein Konverter fehlt mir für meine Harvard-Graphics-Files eben bis heute ...