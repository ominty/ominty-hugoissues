+++
title =  "Mal wieder Media-PC, Umstellung auf debian"
date =   "2016-11-23"
description = "Beweggründe für den Wechsel von Fedora zurück zu Debian/Ubuntu auf dem Media-PC und Hinweise zur arbeitssparenden Installation per Script"
keywords      = "Linux, Debian, Fedora, Media-PC, Installation, Script"
categories = ["Linux"]
tags = [ "Linux-Erfahrungen", "Systemwartung" ]
draft       = true

+++

Seit Januar 2013 läuft mein Media-PC jetzt auf Fedora Linux. Eigentlich funktioniert das ganz gut, wenn da nicht der schnelle Release-Zyklus von Fedora wäre: alle halbe Jahre gibt es eine neue Version, nach 2 "verpaßten" updates ist eine Neuinstallation fällig, weil ein update nicht mehr funktioniert, und jeweils nach kurzer Zeit wird das Repository abgeschaltet, sodaß eine Nachinstallation von Programmen auch nicht mehr (einfach) möglich ist. Nach 4 Jahren hatte ich die Hoffnung, ... <!--more--> daß meine [damaligen Probleme](/post/2013-01-06-media-pc-die-zweite/) mit eingefrorener Oberfläche in debian behoben sein könnten, und so war es an der Zeit, über einen "Wechsel zurück" nachzudenken.

## Zurück zu debian
### Warum debian?
Nun, alle meine anderen PC's laufen ebenfalls auf dieser Grunddistribution, und wenn ich mich nur mit einem Paketmanagement-System beschäftigen muß, dann wird's für mich einfacher und zeitsparender. Außerdem gibt's mit  [debian-testing](https://www.debian.org/releases/testing/) ein sog. "rolling release", das System aktualisiert sich also permanent selbst, ein update zu einer neuen Hauptversion ist nicht mehr nötig. Das ist dann zwar nicht die superstabile offizielle Basis, die für Server etc. gerne verwendet wird, aber für meine Anwendung als Unterhaltungs-PC sollte das schon gehen.

### Der Wechsel selbst
gestaltete sich unproblematisch, ich hab mir (wie eigentlich immer) die [Netinstall-CD aus dem angebotenen ISO-Image](https://www.debian.org/devel/debian-installer/) gebrannt, von dieser den Rechner gestartet, die nötigen Einstellungen getätigt: IP-Adresse für die Netzwerkverbindung, Benutzernamen und Paßwörter, Sprache/Tastaturbelegung etc. festgelegt, die auf der Platte vorhandenen Partitionen für System, /swap und /home im Installer zugeordnet (Achtung, __keinen__ Haken setzen bei "formatieren" der /home-Partition, sonst sind die Daten weg!) und bin dann schlafen gegangen.   
Am nächsten Morgen hatte ich den fertigen Basis-PC vor mir, alles funktionierte soweit.

## Programme einrichten
Nun geht's an die Einrichtung der anderen Programme, die noch nötig sind. Diese notiere ich in einem Shell-Script mit, dann läßt sich das bei einer evtl. nötigen Neuinstallation (neue Hardware z. B.) ebenfalls automatisieren:


### Script zur Programminstallation

    #!/bin/bash
    
    # zu root wechseln im Terminal
    # sudo su
    # anschließend in Verzeichnis [cd /home/{benutzer}/Pfad/zum/Script/] wechseln und script ausführen [sh installscript.sh]
    # am Ende root-terminal schließen
    # exit
    
    # Verbindung zu anderen Rechnern
    apt-get install -y sshfs openssh-server
    
    #Desktop
    apt-get install -y shutter nemo nemo-media-columns
    
    #Fernsehen/VDR
    apt-get install -y w-scan vlc dvbcut
    
    #Multimedia
    apt-get install -y jajuk audacity mp3splt mp3splt-gtk ripperx lame flac easytag soundconverter openshot openshot-doc frei0r-plugins photofilmstrip  
    
    #File-Tools
    apt-get install -y pyrenamer fslint filezilla cfv cksfv testdisk mat 
    
    #Netzwerk
    apt-get install -y clamav clamtk vnstati wireshark 
    
    #Internet
    apt-get install -y chromium-browser lftp webhttrack gpodder python-mygpoclient python-eyed3 #gpodder und Python-Pakete gehören zusammen
    
    #System
    apt-get install -y gparted
    
    # ppm einbinden
    add-apt-repository -y ppa:freefilesync/ffs			#freefilesync
    add-apt-repository -y ppa:rebuntu16/avidemux+unofficial		#avidemux für ubuntu 16.04
    
    apt-get update
    
    # entweder zusätzliche Software hier installieren oder mit der Software-Wiederherstellung erledigen, s.u.
    apt-get install -y freefilesync
    apt-get install -y avidemux2.6	#avidemux-plugins-gtk










### rechnerspezifisches Grundscript

    #!/bin/bash
    
    # zu root wechseln im Terminal
    # sudo su
    # anschließend in Verzeichnis [/home/{benutzername}/Linux-Software/Scripte] wechseln und script ausführen [sh installscript_mobi.sh]
    # am Ende root-terminal schließen
    # exit
    
    # Benutzer zu benötigten Gruppen hinzufügen
    #diejenigen Gruppen, die nur auf diesem Rechner benötigt werden
    
    # ppm einbinden
    
    apt-get update
    
    # entweder zusätzliche Software hier installieren oder mit der Software-Wiederherstellung erledigen, s.u.
    apt-get install -y modem-manager-gui
    
    # Hardware
    apt-get install b43-fwcutter firmware-b43-installer
    
    # allgemeine Installationsanweisungen einbinden
    . /home/{benutzername}/Linux-Software/Scripte/repo-installscript.sh
    . /home/{benutzername}/Linux-Software/Scripte/installscript.sh
    
    # andere Rechner einbinden
    echo "sshfs#192.168.5.100:/home/{benutzername}  /home/{benutzername}/PC_Rechner  fuse  users,noauto,uid=1000,gid=1000 0 0" >> /etc/fstab
    echo "sshfs#192.168.5.200:/home/{benutzername}  /home/{benutzername}/PC_Bla2  fuse  users,noauto,uid=1000,gid=1000 0 0" >> /etc/fstab
    echo "sshfs#medcenter@192.168.5.185:/home/medcenter  /home/{benutzername}/PC_Media  fuse  users,noauto,uid=1000,gid=1000 0 0" >> /etc/fstab
    #echo 'sshfs#medcenter@192.168.5.185:/home/medcenter  /home/{benutzername}/PC_Media  fuse  users,noauto,uid=1000,gid=1000 0 0' | sudo tee -a /etc/fstab
    # Ubuntuusers Wiki: 
    # Das Filesystem eines anderen Rechners über fuse/ssh zum Einbinden vorbereiten (später genügt "mount /lokaler/mountpoint"
    #sshfs#username@rechnername:/Pfad/auf_Fremdrechner /lokaler/mountpoint fuse uid=1000,gid=100,umask=0,allow_other,defaults,noauto 0 0
    mount -a #Neueinlesen der fstab
    
    # Am Ende der fstab muss immer noch eine Leerzeile kommen, sonst erhält man die Fehlermeldung: no final newline at the end of /etc/fstab
    

### Programme aus dem Repository nachinstallieren


    #!/bin/bash
    
    # enthält Paket-Installationsanweisungen und wird von rechnerspezifischem Script aufgerufen und eingebunden
    
    #Desktop
    apt-get install -y shutter gnome-web-photo gnome-clocks
    
    #Multimedia
    apt-get install -y audacity mp3splt mp3splt-gtk ripperx lame flac easytag soundconverter openshot openshot-doc frei0r-plugins photofilmstrip avidemux avidemux-plugins-gtk 
    
    #File-Tools
    apt-get install -y pyrenamer fslint filezilla testdisk mat nemo nemo-media-columns



### Programme aus dem Repository nachinstallieren

    #!/bin/bash
    
    # enthält allgemeine Installationsanweisungen und wird von rechnerspezifischem Script aufgerufen und eingebunden
    
    # weitere Benutzer z. B. für Videopodcasts
    adduser bilddateien 
    usermod -aG bilddateien,cdrom,plugdev bilddateien  #Gruppen durch Komma ohne Leerzeichen trennen
    
    # Benutzer zu benötigten Gruppen hinzufügen
    #vboxsf	#diejenigen Gruppen, die auf allen Rechnern benötigt werden
    
    # ppm einbinden
    add-apt-repository -y ppa:pmjdebruijn/darktable-release		#darktable
    add-apt-repository -y ppa:dhor/myway				#macrofusion
    add-apt-repository -y ppa:freefilesync/ffs			#freefilesync
    apt-add-repository -y ppa:hoglet/timeit				#timeit
    apt-add-repository -y ppa:otto-kesselgulasch/gimp-edge		#preview von gimp 2.10
    ppa-purge -y ppa:otto-kesselgulasch/gimp-edge
    add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable		#QGIS
    
    #testweise, weil USSD Probleme macht mit Version aus Repository
    add-apt-repository -y ppa:linuxonly/modem+manager+gui		#aktuelle Version von Modem-Manager GUI
    add-apt-repository -y ppa:linuxonly/modemmanager		#gepatchter Modemmanager wg. USSD
    
    apt-get update
    
    # entweder zusätzliche Software hier installieren oder mit der Software-Wiederherstellung erledigen, s.u.
    apt-get install -y darktable
    apt-get install -y macrofusion
    apt-get install -y freefilesync
    apt-get install -y timeit
    apt-get install -y qgis
    
    #testweise, weil USSD Probleme macht mit Version aus Repository
    apt-get install -y modem-manager-gui
    apt-get install -y modemmanager
    killall ModemManager
    
    # Audio-Einstellungen
    apt-get install -y pavucontrol paprefs pavumeter
    
    # Voraussetzungen für Applet ScreenShot+Desktop Record 1.4
    apt-get install -y libav-tools
    ln -s /usr/bin/avconv /usr/bin/ffmpeg 
    
    # Verbindung zu anderen Rechnern
    apt-get install -y sshfs
    apt-get install -y openssh-server
    
    # lokales Repository erstellen und einbinden
    apt-get install dpkg-dev
    mkdir /var/local/repository  
    cd /home/{benutzername}/Linux-Software/LokalRepo/binary #Schattenverzeichnis in home => ins Verzeichnis wechseln, weil der Index relativ ist
    dpkg-scanpackages ./ > Packages && gzip -f Packages
    cp -u -v /home/{benutzername}/Linux-Software/LokalRepo/binary/* /var/local/repository #kopiert neuere oder fehlende Dateien
    
    echo "deb file:///var/local/repository ./" >> /etc/apt/sources.list
    apt-get update
    
    # zusätzliche Software hier installieren
    apt-get install -y ipscan
    apt-get install -y xnview
    apt-get install -y checksumcontrol-2.4
    apt-get install -y hugo 
    
    # lokale Software
    cd /home/{benutzername}/Linux-Software/Source/pyExifToolGUI-0.5
    ./install_remove.py install
    
    # Thunderbird-Konfiguration
    #in der Thunderbird-Konfiguration (Bearbeiten -> Einstellungen -> Erweitert -> Konfiguration bearbeiten) den Wert “mail.websearch.open_externally” auf “true” umstellen, dann geht bei “im Web suchen nach:” gleich der Browser auf. 
    #https://support.mozilla.org/de/kb/suchmaschine-zu-opensearch-hinzufuegen
    #Nach Erstellen des Ordners "searchplugins" im Profilordner und dem Einfügen der Datei "google.xml" in den Ordner "searchplugins" muss man allerdings noch im Konfig-Editor, wie von dir beschrieben, in den beiden Einstellungen
    #browser.search.defaultenginename
    #browser.search.order.1
    #Bing durch Google ersetzen und TB neu starten. 
    
    # Netzwerk-Konfig-Files: /etc/NetworkManager/system-connections





