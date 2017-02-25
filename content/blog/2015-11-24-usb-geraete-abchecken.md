+++
title 		= "USB-Geräte abchecken"
date 		= "2015-11-24T22:25:17+01:00"
categories 	= ["Linux"]
tags 		= ["Linux-Tipps", "Hardware"]

+++

Macht ein frisch angeschlossenes USB-Gerät Probleme, so verhilft folgender Terminal-Befehl zu einer ersten Aussage:

    sudo lsusb -v

listet ausführlich alle angeschlossenen und erkannten USB-Geräte,<!--more-->
der Befehl liefert aber keine Aussage, ob das jeweilige Gerät auch funktionieren kann, ist also nur ein Hinweis, ob das Teil überhaupt "einen Ton abgibt" ...

    usb-devices

wirft ebenfalls einen Haufen Infos raus, anders formatiert, aber im Prinzip dieselbe Aussage.