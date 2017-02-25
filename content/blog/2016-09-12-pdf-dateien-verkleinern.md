+++
title 		= "PDF-Dateien verkleinern"
date 		= "2016-09-12"
categories 	= ["Software"]
tags     	= ["Programme"]

+++

Das "papierlose Büro" erzeugt jede Menge Dateien, die aus Papierdokumenten entstehen. Meist werden die entsprechenden Dokumente wie z. B. Vertragsunterlagen, Rechnungen etc. auf einen Multifunktionsdrucker gelegt und mit Standardeinstellungen (wer will sich schon durch die Menüs klicken?) direkt als PDF-Dateien gespeichert.   
Das Ergebnis: Dateien, die riesig sind mit einem Schriftbild, das "verwaschen" aussieht. Das muß anders gehen.
<!--more-->

## Das Problem
### Einscannen von Textdokumenten
Schwarzer Text auf weißem Grund - so sehen die meisten Dokumente aus. Um sowas abzuspeichern reicht bereits 1Bit pro Bildpunkt aus: '0' für 'weiß', '1' für 'schwarz'. Die Standardeinstellung für Multifunktionsdrucker im Scan-Modus ist aber meist "Farbe" mit 24bit/Pixel. Nicht nur, daß das reine Verschwendung ist, es sorgt auch dafür, daß die Texte dann immer etwas weichgezeichnet ("verwaschen") aussehen.   
Um nicht allzu riesige Dateien zu bekommen, reduzieren die meisten Anwender dann die Auflösung (auf 150dpi oder weniger), was der Kantenschärfe des Schriftbildes weiter abträglich ist. 

Nun bieten diese Multifunktionsmaschinen oft folgende (oder ähnliche) Einstellmöglichkeiten:

- Vorlagenart: meist __'Text'__, 'Bild' oder 'gemischt', hier ist 'Text' richtig
- Qualität oder so ähnlich: 'Farbe', 'Graustufen', __'Schwarz/Weiß'__, hier ist letzteres richtig
- und schließlich läßt sich noch die Auflösung einstellen, hier sind meist Werte zwischen 75 und __400dpi__ möglich. Wird hier der __höchste__ Wert (aber keinesfalls über 600dpi) gewählt, gibt das die glatteste Darstellung der Buchstabenkanten.

Versuche haben gezeigt, daß mit den obigen Einstellungen in höchster Auflösung deutlich bessere Ergebnisse auf Textseiten erzielt werden konnten als bei Standardeinstellungen, und das bei wesentlich kleineren Dateigrößen.
   
### Größenreduktion bereits vorliegender Dokumente
Wenn nun aber das Dokument schon in "verwaschener" Form als riesige Datei vorliegt - wie läßt sich das dann nachträglich "verschlimmbessern", um das Dokument z. B. in eine e-mail-taugliche Größe zu bringen?

Wenn es gelänge, die Bildinhalte, also die gescannten Textseiten, aus dem pdf-Dokument herauszulösen, dann könnte man diese nachbearbeiten, indem man einen Schwellwert für den Grauwert vorgibt, ab dem von "schwarz" nach "weiß" umgeschaltet wird. Diese bearbeiteten Bildinhalte müssen dann wieder zu einer pdf-Datei "zusammengebaut" werden.

Anm.: So können auch Artefakte durch mißglückte JPG-Komprimierungen (_MERKE:_ speichere Grafik-Dateien, die Textscans enthalten, __niemals als JPG-Datei__ ab) teilweise wieder eliminiert werden.

## Der erste Ansatz
### Im Netz ...
geistert unter dem Stichwort "pdf verkleinern" immer wieder dieser Befehl herum:

<!-- gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dDownsampleColorImages=true -dColorImageResolution=300 -dNOPAUSE  -dBATCH -sOutputFile="${file%.*}"_out.pdf "$file" -->

    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf input.pdf

`-dPDFSETTINGS` bietet folgende Einstellungen:

- /screen (nur für Bildschirmanzeige – 72 dpi)
- /ebook (geringe Qualität – 150 dpi)
- /printer (hohe Qualität – 300 dpi)
- /prepress: (hohe Qualität mit hoher Farbtreue – 300 dpi)

Das führt aber nicht wirklich weiter, weil es am Grundproblem nix ändert, sondern lediglich die Qualität verschlechtert - siehe oben: "Weichzeichner".    
Dieser Befehl ist ggf. nützlich für Kataloge oder Prospekte, die direkt aus einem z. B. Layout-Programm erzeugt wurden und in gemischter Form echte (also nicht eingescannte) Texte und eben auch Bilder beinhalten. Hier werden dann nur die Bilder (die den größten Anteil am Datenvolumen haben) verkleinert.   
Kennzeichen solcher Dateien: Fährt man mit der Maus über eine Textzeile, so läßt sich diese markieren wie in einer Textverarbeitung.

### Wandeln der Textgrafiken mittels Ghostscript
Mittels ghostscript kann z. B. auch so

    gs -dSAFER -dBATCH -dNOPAUSE -r300 -sDEVICE=pngmono -sOutputFile="${file%.*}"-%03d.png "$file"
    
oder anstelle `-sDEVICE=pngmono` die Ausgangsformate `-sDEVICE=tiffg3` oder `-sDEVICE=tiffg4` eine Schwarz-Weiß-Ausgabe erzeugt werden. Diese enthält zwar nur schwarze oder weiße Punkte als Ausgabe, wenn aber das Eingangsbild Grau-Werte enthält, dann werden die entsprechenden Bereiche gerastert wie ein Zeitungsbild, was eine "zerrissene" Struktur von Buchstaben ergibt. Damit scheidet diese Methode ebenfalls aus.

## Die endgültige Lösung
Nach der Analyse der obigen Probleme entstand dann ein Bash-Script, das die beiden Tools [GhostScript](https://www.gnu.org/software/ghostscript/) und [ImageMagick](http://imagemagick.org/script/index.php), hier insbesondere das Tool [Convert](http://www.imagemagick.org/script/convert.php), verwendet.  
Außerdem habe ich das Script gleich so ausgebaut, daß es alle Dateien, die in einem Verzeichnis liegen, der Reihe nach abarbeitet und Dateien, die in Zwischenschritten entstehen, gleich wieder "aufräumt".

### Das Script
Hier zunächst der gesamte Quelltext:

    for file in *.pdf
    do
    	gs -dSAFER -dBATCH -dNOPAUSE -r300 -sDEVICE=pnggray -sOutputFile="${file%.*}"-%03d.png "$file"
    	for image in *.png
    	do 
    		convert "$image" -negate -threshold 30% -negate "${image%.*}"_bw.png
    		rm "$image"
    	done
    	convert *.png "${file%.*}"_bw.pdf
    	rm *.png	
    done
    

### Erläuterungen zum Script

-  `gs -dSAFER -dBATCH -dNOPAUSE -r300 -sDEVICE=pnggray -sOutputFile="${file%.*}"-%03d.png "$file"` trennt mittels ghostscript aus dem/den .pdf-File(s) die Einzelseiten heraus, wandelt diese in Graustufen-Bilder mit 300dpi Auflösung und speichert sie mit fortlaufender 3-stelliger Index-Nummer als .png-Datei ab.
-  `convert "$image" -negate -threshold 30% -negate "${image%.*}"_bw.png` wandelt mittels ImageMagick die Graustufen-Bilder in "harte" Schwarz/Weiß-Bilder um, `threshold` gibt dabei den Grauwert an, ab dem "schwarz" erkannt wird
-  `rm "$image"` löscht die Graustufen-Bilder
-  `convert *.png "${file%.*}"_bw.pdf` erzeugt mittels ImageMagick aus den S/W-.png-Dateien ein einzelnes .pdf mit der Dateinamens-Erweiterung "_bw". Die korrekte Seitenreihenfolge funktioniert bis zu 999 Seiten, bei größeren Dokumenten muß der laufende Index auf 4 Stellen erweitert werden
-  `rm *.png` löscht die verbliebenen .png-Dateien

## Schlußbemerkung
Die Beschreibung bezieht sich auf Linux. Die Tools [GhostScript](https://www.gnu.org/software/ghostscript/) und [ImageMagick](http://imagemagick.org/script/index.php) stehen aber auch für Windows und MacOS zur Verfügung, sodaß dieses Verfahren, möglicherweise unter Anpassung des Scripts, auch dort einsetzbar sein dürfte.