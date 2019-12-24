+++
title 		= "DVB-S Radioprogramme zu mp3 konvertieren - im Batch auf die Schnelle"
description = "Von Astra aufgenommene Radiosendungen (gespeichert als Transportstrom) im Batch-Modus in Player-freundliche Formate (hier: mp3) konvertieren"
date 		= "2016-03-05"
medien   	= ["Podcast"]
programme	= ["ffmpeg", "ProjectX"]

+++

[An anderer Stelle](/blog/2016-01-23-das-becker-mexico-hat-ausgedient.html) hatte ich beschrieben, daß ich mein Kurzwellen-Autoradio gegen ein mp3-fähiges ersetzt hatte, da die Versorgung mit in für mich verständlichen Sprachen ausgestrahlten Programmen weitgehend eingestellt ist.   
Also nehme ich auf Reisen neben Musik auch Features und Hörspiele mit, die sich im Laufe des Jahres als Aufnahmen von den diversen Rundfunkanstalten auf meiner Festplatte ansammeln. Aber: diese Dateien liegen in einem für mein Kenwood "unverdaulichen" Format vor.
<!--more-->

_Kaffeine_, das Programm, das ich für den Empfang der Astra-Programme nutze, speichert den [mpeg-Transportstrom](https://de.wikipedia.org/wiki/MPEG-Transportstrom) ab, die Dateien bekommen die Endung `.m2t`. Um die  archivieren und abspielen zu können, müssen sie zunächst "entpackt" werden. Dazu nutze ich das Java-Programm _ProjectX_.

Habe ich jetzt aber sehr viele Dateien, so ist es nützlich, _ProjectX_ innerhalb eines Scripts aufzurufen, das ein Verzeichnis auf Transportstrom-Dateien absucht und diese alle automatisch verarbeitet.

    #!/bin/bash
    for file in *{.ts,.m2t} ; do
        echo "Konvertiere $file"
        DIR=$(dirname "$file")
        FILENAME=$(basename "$file")
        NAME=`echo $FILENAME | cut -d'.' -f1`
        java -jar /home/{Benutzername}/Pfad/zu/ProjectX.jar "$file"
    done
    echo "Fertig!";

Die Befehle müssen im Texteditor eingegeben werden und dann als eine Datei `dateiname.sh` abgespeichert werden, ich speichere sie in dem Verzeichnis, in dem die zu bearbeitenden Transportstrom-Dateien liegen.   
Im Terminal wechsle ich dann in das Verzeichnis (`cd /Pfad/zu/Audiofiles`) und führe das Script mit `sh dateiname.sh` aus.

Das Ergebnis sind i. d. R. Dateien im Format MP2 (seltener auch AC3). Diese konvertiere ich dann ebenfalls automatisiert in das gängige MP3-Format mithilfe von _ffmpeg_:

    #!/bin/bash
    for file in *.mp2; do
        echo "Erzeuge mp3 aus $file" 
        ffmpeg -i "$file" -b:a 128k -ar 44100 "${file%.*}.mp3"; 
    done 
    echo "Fertig!";
    
_ffmpeg_ nutzt für die Erstellung von mp3-Dateien die _libmp3lame_ und übersetzt die Parameter für Bitrate `-b:a 128k` und Datenrate `-ar 44100` dorthin.  

Während das erste Script einstündige Hörspiele im Abstand von mehreren Sekunden ausspuckt, arbeitet der Rechner am zweiten Script bei guter Prozessorauslastung schon mal ein paar Stunden für 100 Dateien der genannten Größe.

Zum Schluss müssen die Dateien nur noch auf einen geeigneten Datenträger (USB-Stick) kopiert werden und können problemlos als "Schlechtwetter-Unterhaltung" auf dem Radio wiedergegeben werden.  

__Nachtrag__: Wenn ich mich nach dem Anhören entschließe, einzelne der Dateien aufheben zu wollen, dann konvertiere ich ggf. nochmal mit dem zweiten Script von MP2 nach MP3, aber mit höherer Bitrate (z. B. 192kBit/s).   
In jedem Fall beschneide ich Anfang und Ende exakt. Dazu nutze ich _mp3splt-gtk_, das eine grafische Oberfläche bietet und die Audiodateien verlustfrei schneidet, weil keine erneute Kodierung beim Schneiden erfolgt.

<!-- Audio options:
-aframes number     set the number of audio frames to record
-aq quality         set audio quality (codec-specific)
-ar rate            set audio sampling rate (in Hz)
-ac channels        set number of audio channels
-an                 disable audio
-acodec codec       force audio codec ('copy' to copy stream)
-vol volume         change audio volume (256=normal)
-af filter list     audio filters -->


