+++
title 		= "Hugo und PHP?"
date 		= "2017-02-04"
description = "Webseitengenerator Hugo: wie binde ich PHP-Scripte ein? Ein Workaround ohne externe Dienste"
keywords    = "Hugo, Webseite, PHP, Kommando, Script, upload, ftp"
software 	= ["Webseiten"]
programme	= ["Hugo"]
+++

Eine Crux mit statischen Webseiten ist ... sie sind statisch. Und genau daraus ergeben sich ja auch die [entscheidenden Vorteile] (/blog/2015-12-22-statisches-blog-mit-hugo.html) dieses Webseitentyps. Was aber, wenn dann doch so ein "kleines Bißchen Dynamik" reinkommen soll, wie z. B. ein Kontaktformular?<!--more-->

## Gängige Lösung - und Alternativen
### externer Anbieter
Üblicherweise wird bei statischen Webseiten die Einbindung von externen Diensten als Lösung angegeben. Im Zeitalter der globalen Datenkraken will das aber nicht jeder den Nutzern seiner Webseite zumuten. Es muß also anders gehen.

### Alternative: Lokales Script zur Formularverarbeitung im Hintergrund
Wenn der eigene Webserver Scriptsprachen wie PHP oder Perl ausführt, dann kann eine solche Formularverarbeitung auch unter eigener Regie durchgeführt werden.     
Die ins Formular eingegebenen Daten werden an das Script übergeben, das dann die Weiterverarbeitung, z. B. den Versand einer mail, übernimmt. Das kann im Hintergrund geschehen.

So wirklich schön ist das aber auch nicht:

- die Überprüfung auf erforderliche Angaben ist nicht einfach und schon gar nicht zuverlässig (Java-Script beispielsweise kann im Browser abgeschaltet werden).
- die Rückmeldung an den Benutzer (z. B. die Anzeige der Inhalte bereits korrekt ausgefüllter Felder oder die Erfolgsmeldung über den erfolgreichen Versand einer mail) funktioniert auch nicht.

Also hab ich mir überlegt, wie ich PHP-Code in eine Hugo-generierte Webseite "einschleusen" kann.

## Auf dem eigenen Server laufendes Script in statische Seite integrieren
### Ziele
Es soll folgendes möglich sein:

- Benutzereingaben in ein Webformular
- Prüfung auf dem Webserver auf
    - Vollständigkeit
    - korrekte Eingaben
- Rückmeldung an den Benutzer bei Fehlern, dabei Speicherung der bereits korrekten Eingaben
- Rückmeldung an den Benutzer bei erfolgreichem Abschluß der Aktion
- das Ganze optisch eingebettet in das Design der Webseite
- wartungsarm, d. h. Template-Änderungen (Design, Navigationselemente) sollen automatisch auch auf die interaktiven Seiten übernommen werden.

### Voraussetzungen
Hier soll eine Lösung in der Scriptsprache PHP beschrieben werden

1. der Webserver muß also PHP verstehen 
1. der PHP-Code sowie das Formular muß in ein normales Markdown-Dokument eingetragen werden, das im `content` -Verzeichnis liegt. Dadurch wird es von Hugo in ein Template übernommen (also optisch und strukturell in die Webseite eingebettet)
1. nach dem Übertragen auf den Server muß das Script auch ausgeführt werden können

#### Einbetten von PHP in ein Markdown-Dokument
Hugo übersetzt beim Rendern (Exportieren) einer Webseite den in Markdown geschriebenen Inhalt in HTML. Aber: bereits in HTML vorliegende Teile werden unverändert übernommen. Dabei ist zu beachten:

1. reines Markdown wird übersetzt
1. HTML wird "durchgereicht"
1. HTML innerhalb Markdown: Das Markdown wird übersetzt, das darin eingebettete HTML wird übernommen
1. ABER: Markdown (oder etwas beliebig anderes) innerhalb HTML: wird "durchgereicht"

Ein normales Seitendokument sieht so aus:

```
+++
title 		= "Ein Blog mit Hugo erstellen - Teil 2"
date 		= "2015-12-28T22:25:17+01:00"
categories 	= ["Webseiten"]
tags 		= ["Hugo", "Tutorial"]

+++

und hier steht dann der Inhalt der Seite
```
Würde man jetzt im Seiteninhalt einfach Programmcode notieren, dann bestünde die Gefahr, daß Hugo versucht, daraus HTML zu erstellen und damit den Code zu verstümmeln.

Deshalb setzte ich den kompletten Seiteninhalt in einen `div`-Container:
```
+++
title 		= "Kontaktformular"
date 		= "2015-12-28T22:25:17+01:00"
categories 	= ["Webseiten"]
tags 		= ["Hugo", "Tutorial"]

+++
<div>
 
 <?php
require_once("../php/phpmailer/class.phpmailer.php");
require_once("../php/phpmailer/class.smtp.php");
	
//Programmablauf
if ($_POST['Submit']) 
{
            // Formularverarbeitung
            *** einiger Programmcode ***
             //mail-Übermittlung
                // Rückgabe auf den Benutzerbildschirm
                formDisp();
                formMail();
  }
?>

<form action="<?php echo $PHP_SELF; ?>" method="POST" accept-charset="UTF-8">
<fieldset><i>Ansprechpartner/-in</i><br>
<label>Name:</label>  <input name="Name" value="" size="25" maxlength="80" type="Text"><br>
<label>e-mail:</label>    <input name="eMail" value="" size="25" maxlength="80" type="Text"><br>
</fieldset>
<p>Ihre Mitteilungen oder Wünsche:</p>
<textarea name="Mitteilung" cols="35" rows="5" wrap="virtual"></textarea>
<input name="Submit" value="Abschicken" type="Submit">
</form>

</div> 
```
 Die fertige Datei wird als Markdown-Dokument im `content`Verzeichnis abgelegt, z. B. als `kontakt.md`.
 
#### Erstellen der Seite
Führt man Hugo jetzt aus, dann wird diese Seite genauso wie jede andere Inhaltsseite in ein Template eingebettet und als HTML-Datei in den `public`-Ordner exportiert, es entsteht also die Datei `kontakt.html`.

#### Seite fit machen für den Server
Damit der PHP-Inhalt dieser Seite jetzt auf dem Webserver ausgeführt werden kann, muß

- entweder der Webserver angewiesen werden, PHP in normalen HTML-Dokumenten auszuführen. Das ist aber nicht die beste Lösung, denn
    - nicht jeder Kunde kann das auf dem Webspace seines Providers einstellen
    - wird der Webserver belastet, weil er jede Datei, die er ausliefert, nach PHP durchsucht. Das verlangsamt die Auslieferung der Seiten und damit wird ein Hauptvorteil statischer Seiten torpediert.
- oder die Datei in eine PHP-Datei umbenannt werden

<!-- , in Linux mittels
```
mv -v ./public/kontakt.html ./public/kontakt.php
```

#### Server fit machen für den Trick
Sämtliche internen Links innerhalb der Hugo-generierten Webseiten verweisen nach wie vor auf `kontakt.html` anstelle der vorhandenen Datei `kontakt.php`. Das führt auf dem Webserver natürlich dem allseits beliebten Fehler `error 404 - not found`, die Freude jeden Websurfers.    
Daher muß die Datei `kontakt.html` umgeleitet werden, dies wird durch einen Eintrag in der Datei `.htaccess` bewerkstelligt:
```
Redirect permanent /kontakt.html  http://www.domain.tld/kontakt.php
``` -->

Die zweite Variante ist sehr einach zu bewerkstelligen, denn Hugo kennt die Seitenvariable `.Url`. Damit läßt sich im Seitenkopf (Frontmatter) einer Seite deren Pfad und Name "überschreiben" mittels einer zusätzlichen Zeile mit der Angabe `url = "{Pfad/Dateiname}"`.

```
+++
title 		= "Ein Blog mit Hugo erstellen - Teil 2"
date 		= "2015-12-28T22:25:17+01:00"
url         = "/kontakt/formular.php"
categories 	= ["Webseiten"]
tags 		= ["Hugo", "Tutorial"]

+++

>>>Seiteninhalt<<<
```
So läßt sich die Datei `kontakt.md` zum Beispiel als `http://www.domain.tld/kontakt/formular.php` ausgeben. Alle internen Links in den von Hugo erstellten Menüs verweisen dann automatisch auf das richtige Ziel.

## Zusammenfassung
Um auf einer durch einen statischen Webseitengenerator, hier: Hugo, erstellten Webseite wenige interaktive Einzelseiten unterzubringen, bietet sich folgende Behelfslösung an:

- Markdown-Dokument anlegen
- fertiges Formular in HTML und  Formularverarbeitung als PHP-Quelltext komplett in einen `div`-Container einbetten und diesen in das Markdown  Dokument kopieren
- `url` in den Seitenkopf notieren
- Seite rendern lassen und auf den Server laden

<!-- - die entstandene `seite.html` in `seite.php` umbenennen.
- auf dem Server per `.htaccess` eine Seitenumleitung einrichten -->