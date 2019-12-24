+++
title       = "Elektroinstallation im Innenausbau - Reisemobil auf Iveco Turbo Daily 4x4 Basis"
linktitle   = "Elektrik"
date        =  "2010-03-24"
description = "Beschreibung der Elektroinstallation - bei Inbetriebnahme 1997 sowie die zwischenzeitlichen Modifikationen. Beschrieben sind Batterie, Ladegerät, Solaranlage und Regler sowie Windgenerator"
keywords    = "Wohnmobil, Reisemobil, Strom, Batterie, Solaranlage, Windgenerator"
wohnmobile	= ["Homepage", "Elektrik", "Solar", "Wind"]
weight      = 9
+++

<!--INHALT Beginn-->
<h3>Vorgaben:</h3>
<ul>
<li>Unabhängigkeit vom Stromnetz von April bis Oktober incl.</li>
<li>Betriebs eines Kompressorkühlschranks</li>
<li>Licht, Radio, Wasserpumpe als &quot;Kleinverbraucher&quot;</li>
</ul>
<p>In den Jahren des Betriebs (1997 bis ca. 2006) erhöhten sich die Anforderungen:</p>
<ul>
<li>eine Vielzahl von Kleinverbrauchern mit Ladegeräten: Telefon, GPS, Digitalkamera etc.</li>
<li>Rechnerbetrieb (sog. CarPC bzw. Laptop), ein Rechner kann schnell der nach dem Kühlschrank zweitgrößte Verbraucher sein.</li>
<li>Vermehrt Reisen in weniger sonnenreiche Gebiete und auch im Winterhalbjahr</li>
</ul>
<h2>Ursprüngliche Installation</h2>
<h3>Kernbaugruppen</h3>
<ul>
<li>3 Stck. Solarmodule <a title="Datenblatt" target="docs" href="/docs/iveco-womo/kyocera_la441g66s.pdf">Kyocera 66W/44Zellen LA441G66S</a><br>
Leerlaufspannung 26,3V, Betriebsspannung 20,7V</li>
<li>Solarladeregler <a title="Beschreibung" target="docs" href="/docs/iveco-womo/reusolar_mpt3.pdf">MPT 3c</a> von <a title="Link zur Firma" target="web" href="http://www.mste-solar.de/">Meyer Solar</a></li>
<li>Batterie Deta Solar 190Ah</li>
<li>Trennrelais</li>
</ul>

<ul>
<li>Kühlschrank WAECO Coolmatic MDC-65</li>
<li>später: Ladegerät Schaudt LA 204 Z (10A)</li>
</ul>
<h3>Kriterien zur Auswahl und Erfahrungen</h3>
<p>Ein normales Solarmodul besteht anstelle der 44 Zellen der obigen Kyocera-Module nur aus 36 Zellen. Die dadurch niedrigere Arbeitsspannung von knapp über 17V kann unter ungünstigen Bedingungen (heiße Länder, horizontale Montage, Windstille) durch extrem hohe Modultemperaturen soweit abfallen, daß die Ladeschlußspannung üblicher Bleiakkus von 14,4V nicht mehr erreicht wird, d. h. die Batterien werden nicht mehr voll (in endlicher Zeit).<br>
Andererseits sind die 44Zellen-Module, die über genügend Spannungsreserve verfügen, nicht gut für den Betrieb mit billigen Shunt-Reglern geeignet, da unter Normalbedingungen mehr als 6 Volt (multipliziert mit dem Modulstrom) nutzlos &quot;verheizt&quot; werden.<br>
Die damalige Firma Reusolar war die einzige, die auf meine detaillierten Anfragen zu der Anlagenauslegung im Einzelnen antwortete und nicht einfach nur Kataloge schickte - und mich auf diese Zusammenhänge aufmerksam machte und den zu dieser Zeit relativ neuen MPT-Regler empfahl. Das Teil arbeitete 12 Jahre ohne Ausfälle. Was mich im Laufe der Zeit aber störte war die Tatsache, daß ich nie mehr als 13,8 ... 13,9V an der Batterie beobachtete, dies ist zwar die korrekte Spannung für Erhaltungsladung, aber nicht die Spannungsgrenze für Vollladung (diese liegt - zeitlich begrenzt - bei 14,4°C).<br>
Im Zuge einer generellen Überarbeitung der Anlage habe ich diesen Regler aber durch ein moderneres Gerät ersetzt, welches zusätzliche Optionen kennt, u. a. Impulslademodus zur Batterieregenerierung (siehe unten).</p>

<h2>Erweiterungen und Modifikationen 2009/2010</h2>
<h3>Kernbaugruppen</h3>
<ul>
<li>Solarregler <a title="Beschreibung" target="docs" href="/docs/iveco-womo/110372-an-01-de-mppt_solarladeregler_20a.pdf">MPPT 30A</a> incl. <a title="Beschreibung" target="docs" href="/docs/iveco-womo/110358-an-01-de-fernbedienung_fuer_mppt_solarregler.pdf">Fernanzeige</a> von <a title="Link zur Firma" target="web" href="http://deutsch.ivt-hirschau.de/">IVT</a></li>
<li>Batterie Booster Waeco Perfect Charge DC20</li>
<li>Windgenerator <a target="docs" title="Datenblatt" href="/docs/iveco-womo/airx-ws.pdf">Air-X</a></li>
</ul>

<h3>Ausgangssituation</h3>
<h4>Räumliche Verteilung</h4>
<p>An <a href="einrichtung.html">anderer Stelle</a> habe ich den Grundriß der Koffereinrichtung beschrieben. In diesem Zusammenhang ist Folgendes von Bedeutung:</p>
<ul>
<li>Die Batterie befindet sich im Sockel des Sideboards vorn rechts</li>
<li>Der Kompressorkühlschrank befindet sich im rechten Flügel der Winkelküche, also an der linken Wand</li>
<li>Kleinverbraucher und Steckdosen an der rechten Wand werden von einem Verteiler im Batteriekasten versorgt</li>
<li>Kleinverbraucher und Steckdosen an der linken Aufbau- und der Rückwand werden von einem Verteiler hinter dem Kühlschrank versorgt</li>
</ul>
<p>Bisher verliefen alle Hauptstromleitungen direkt von den Batterieklemmen in einer Stärke von 6mm<sup>2</sup>: Leitungen vom und zum Solarregler, Leitung vom Ladegerät, Leitung vom Trennrelais, Leitungen zu den beiden Verteilerblöcken, Leitung zum Kühlschrank. Das heißt, daß von der Batterie zur hinten linken Kofferecke 2 Leitungspaare parallel liefen.</p>

<h4>Modifikationen der Verkabelung</h4>
<img class="re" src="/bilder/iveco-womo/zentralelektrik_di090413.jpg" width="450" height="257" border="0" alt="neuer Zentralverteilerblock mit Ladegerät"><p>Im Zuge der notwendigen Einspeisung des Windkraftgenerators mußte eine wesentlich stärkere Leitung von der Rückwand zur Batterie verlegt werden. Das nahm ich zum Anlaß, die zentrale Verteilung neu aufzubauen, das Ergebnis ist im Bild zu sehen (ebenfalls auf der Grundplatte montiert: das Ladegerät für &quot;Landstrom&quot;).<br>
Ein paar 25mm<sup>2</sup>-Leitungen mit 80A abgesichert verbindet die Batterie (Polklemmen mit M10-Kabelanschluß. Anmerkung: Kabelquerschnitte oberhalb 25mm<sup>2</sup> müssen mit M8 oder stärker verschraubt werden) mit massiven Verteilerschienen. Von hier führt eine 35mm<sup>2</sup>-Leitung zur Kofferrückseite (hier ist für den Querschnitt nicht die Strombelastbarkeit das Kriterium, sondern der ohmsche Widerstand). Im Gegenzug sind die beiden Leitungspaare für Kühlschrank und hinteren Verteiler entfallen; hat der Kühlschrank jetzt einen niederohmigeren Anschluß, was besonders bei schwächerer Batterie die immer wieder wahrnehmbaren Mehrfachstarts verhindert.<br>
Alle anderen Hauptstromleitungen (vord. Verteiler, Solarregler, Trennrelais bzw. Booster, Ladegerät) führen jetzt ebenfalls auf die Verteilerschienen und sind dort einzeln zu trennen (und durch Benutzung von Kunststoffschrauben und -unterlegscheiben auch im &quot;abgeklemmten&quot; Zustand mechanisch sauber zu fixieren).<br>
Durch diese Maßnahmen ist es ferner problemlos möglich, die bis zu 35A vom Windgenerator unter dem Küchenblock einzuspeisen und zur Batterie zu führen.
<br class="clear"></p>

<h3>Kriterien zur Auswahl</h3>
<h4>Solarregler:</h4>
<p>Hier bildeten die folgenden Überlegungen die Ausgangsbasis:<!--<font color="#FF0000">Entwurf, noch in Arbeit</font>--></p>
<ul>
<li>Ein neuer Regler bietet modernere Technologien (z. B. Ladekennlinie IUoU, Pulsladung), von denen ich mir eine höhere Batterielebensdauer verspreche</li>
<li>Die vorhandenen Solarmodule sind Exoten, eine Ersatzbeschaffung im Falle der Beschädigung eines oder mehrerer Module bzw. altersbedingten Ausfalls ist nicht möglich. Deshalb soll der neue Regler flexibel einsetzbar sein.</li>
<li>Es sollte eine Überwachung der Parameter möglich sein (Spannungen und Ströme)</li>
</ul>
<p>Aufgrund des Preis-Leistungs-Verhältnisses fiel die Wahl letztlich auf das Gerät von IVT.</p>

<h4>Windgenerator:</h4>
<img class="re" src="/bilder/iveco-womo/airx_di100049.jpg" width="300" height="300" border="0" alt="Windgenerator in Arbeitsposition"><!--<p><font color="#FF0000">Entwurf, noch in Arbeit</font></p>  -->
<p>Gesucht wurde ein Windgenerator, der</p>
<ul>
<li>möglichst hohe Leistung bietet</li>
<li>möglichst geringe Anlaufwindstärken benötigt</li>
<li>hinreichend transportabel ist</li>
<li>bei sehr hohen Windstärken nicht einfach abschaltet, sondern - wenn auch reduziert - weiterläuft</li>
</ul>
<p>Zum Zeitpunkt der Recherche (2009/2010) erfüllte der Air-X die genannten Anforderungen am besten.</p>
<p>Hinweis zur Verkabelung: Der Spannungsregler sitzt im Generator selbst (und dort wird auch die Ladeschlußspannung festgestellt), deshalb wurde die Außenverkabelung (2x4m) zur Vermeidung von Spannungsabfällen in Form von 25mm<sup>2</sup> Schweißleitungen ausgeführt, als Steckverbinder werden die bewährten Dinse-Stecker und -Kupplungen verwendet.</p><br class="clear">

<h4>Batterie-Booster</h4>
<p><font color="#FF0000">Entwurf, noch in Arbeit</font></p>
<p>&nbsp;</p>

<h3>Erfahrungen mit der modifizierten Anlage</h3>
<h4>Solarregler</h4>
<p>Es macht Spaß, die mitgeplotteten Meßwerte als Diagramm auszudrucken und mit dem persönlichen Eindruck des Wetters zu vergleichen ... :-)<br>
Konkrete Werte: Im dritten März-Drittel liefert die o. g. Anordnung von Solarpaneelen in Zentralfrankreich einen max. Ladestrom von 8A bei Batterieklemmenspannungen im Bereich 13,5 ... 14V, Einstrahlwinkel der Sonne liegt bei etwa 45°.<br>
Eine Woche später in Südfrankreich betrugen die Maximalströme zwischen 11 und 12A.</p>
<p>Die folgenden 4 Diagramme wurden an einem sonnigen Tag Ende März in der Gegend Colmar-Belfort-Besancon aufgenommen:</p>
<table >
<tr>
 <td colspan="2">Tagesdiagramm <small>(rot: Spannung, grün: Strom)</small></td>
</tr>
<tr>
 <td><img src="/bilder/iveco-womo/solar_solar_tag.png" width="422" height="316" border="0" alt=""></td>
 <td><img src="/bilder/iveco-womo/solar_batt_tag.png" width="422" height="316" border="0" alt=""></td>
</tr>
<tr>
 <td valign="top"><small>Eingangswerte: Ab 07:00Uhr ist die Solarspannung hoch genug, daß begonnen werden kann, Leistung zu entnehmen. Dabei belastet der Regler die Solarmodule gerade so stark, daß die Spannung von der Leerlaufspannung (26V) in den Punkt maximaler Leistung (20...22V) einbricht.<br>
 Ab 10:30 ... 11:00 Uhr Pufferbetrieb (siehe rechts)</small></td>
 <td valign="top"><small>Ladewerte: Mit zunehmendem Ladestrom steigt die Batteriespannung, bis sie gegen 11:00Uhr die Ladeendspannung erreicht hat. Dann setzt der Pufferbetrieb ein, in dem immer dann hohe Ströme auftreten, wenn der Batterie Energie entnommen wird, z. B. der Kompressorkühlschrank läuft. In der übrigen Zeit ist der Ladestrom sehr klein (&lt;1A). Entsprechend dem Batterieladestrom verhält sich im linken Bild auch der Solarstrom, während die Solarspannung zwischen dem Wert der Leerlaufspannung und dem der optimalen Leistung pendelt.</small></td>
</tr>
<tr>
 <td colspan="2">30-Minuten-Ausschnitt des Pufferbetriebs <small>(rot: Spannung, grün: Strom)</small></td>
</tr>
<tr>
 <td><img src="/bilder/iveco-womo/solar_solar_30min.png" width="422" height="316" border="0" alt=""></td>
 <td><img src="/bilder/iveco-womo/solar_batt_30min.png" width="422" height="316" border="0" alt=""></td>
</tr>
<tr>
 <td colspan="2"><small>Diese beiden Diagramme stellen einen Ausschnitt aus den beiden obigen Darstellungen dar. Übereinstimmend sieht man sowohl auf der Eingangs-(Solarmodul-)Seite als auch auf der Ausgangs-(Batterie-)Seite des Solarreglers, wie sich Phasen hoher Spannung und niedrigem Strom mit Phasen hohen Stroms, aber eingebrochener Spannung abwechseln. &quot;Taktgeber&quot; ist hier i. W. der Kompressorkühlschrank.</small></td>
</tr>
<tr>
 <td colspan="2">Erhaltungsladung <small>(rot: Spannung, grün: Strom)</small></td>
</tr>
<tr>
 <td><img src="/bilder/iveco-womo/solar_solar_voll.png" width="422" height="316" border="0" alt=""></td>
 <td><img src="/bilder/iveco-womo/solar_batt_voll.png" width="422" height="316" border="0" alt=""></td>
</tr>
<tr>
 <td colspan="2"><small>Diese beiden Diagramme (Ende Mai, Raum Karlsruhe) zeigen bis 10:12 Uhr das Verhalten bei voller Batterie (Erhaltungsladung), ab 10:12 Uhr ist hier der Kompressorkühlschrank als Verbraucher in Betrieb, damit gleichen die Kurven wieder den obigen Diagrammen.</small></td>
</tr>
</table>

<p><b>Weitere Artikel</b> zum Thema "Solaranlage" und Erfahrungen dazu in <a href="/wohnmobile/solar.html" name="Artikel zur Solaranlage" title="Artikel zur Solaranlage">>>> meinem Blog</a></p>

<!--<p>Sollte am einfachsten so gehen:
Das ganze in 'ne Tabellenkalkulation, jeweils zwei aufeinanderfolgende Zeiten voneinander abziehen und mit entweder dem Stromwert oder dem Mittelwert zweier aufeinanderfolgender Stromwerte (I1) multiplizieren. Dann alle diese Teilergebnisse addieren. </p>-->

<!--<p>In der Beispielkurve ergibt sich eine Ladestrommenge von 39Ah. Dabei ist zu berücksichtigen, daß von Sonnenaufgang bis 11:00 bereits 16Ah geladen wurden, dann war die Batt. so voll, daß der Regler den Strom runtergefahren hat und nur noch den jeweils nötigen Strom für den Kühlschrank "nachgeschoben" hat, wenn dieser lief (deshalb ist die grüne Linie so breit).
Wäre die Batterie leerer gewesen, so würde sich eine deutlich höhere Ladestrommenge als die gemessenen 39Ah - irgendwo in der Gegend 55Ah - ergeben haben.
</p>-->


<h4>Windgenerator</h4>
<p>In der Testphase (März/April 20xx in Frankreich/Spanien/Portugal) sind mir folgende Dinge aufgefallen:</p>
<ul>
<img class="re" src="/bilder/iveco-womo/airx-mast_di100039.jpg" width="300" height="199" border="0" alt="Gummigelagerte Mastbefestigung"><li>Geräuschentwicklung: Im Fahrzeug ist deutlich vernehmbar das Surren des Generators (aus der Tonhöhe könnte man auf die Windgeschwindigkeit schließen), wenn dieser Leistung abgibt. Der Schiebemast ist über Bügel, die mit einem Gummischlauch überzogen sind, am Stahl-Lastenträger-Rahmen an der Rückwand des Koffers befestigt (Anm: die rostigen Stahlteile werden noch feuerverzinkt). <br>
Die Blattgeräusche gehen im allgemeinen Windgeräusch um den Koffer fast unter.</li><br class="clear">
<li>Eisregen/gefrierende Nässe setzt sich auch bei Betrieb unter sturmähnlichen Bedingungen (d. h. bei hoher Drehzahl des Rotors) auf den Rotorblättern ab und bringt diesen durch Zerstörung der Aerodynamik zum Stillstand</li>
<li>Ich benötige einen Windmesser: In den Cevennen hab ich mich über die - subjektiv - geringe Leistung gewundert trotz heftigen Windes. Die nebenan arbeitenden Großwindanlagen arbeiteten unverdrossen vor sich hin, deren Rotorblätter sind aber auch verstellbar. Ich vermute, daß die Windstärke zu groß war und der Air-X in den gebremsten Sturmmodus geschaltet hat, dann bringt er nur noch einen Bruchteil der Leistung ... reicht über Nacht gerade so, um Heizungsgebläse und Kühlschrank zu puffern.<br>
Zweite Erkenntnis: ich benötige in diesem Leitungszweig einen Strommesser. Ohne einen solchen sind sinnvolle Aussagen zur Effizienz der Windanlage nicht zu machen.</li>
<li>Wenn mit einem lauten &quot;Klack&quot; das Summen des Generators verstummt und der Rotor steht: nicht erschrecken, dann ist i. d. R. die Batterie voll ...</li>
<li>Bei ordentlichem Wind hört man nachts immer das gleiche Wechselspiel: Kühlschrank geht an, etwas zeitversetzt läuft der Windgenerator an. Wenn der Kühlschrank wieder abschaltet dauert es noch ein Weilchen, bis der Windgenerator mit dem schon erwähnten &quot;Klack&quot; ebenfalls wieder steht. Morgens hat dann die Solaranlage nix mehr zu tun, der Solarregler erwacht und geht gleich in den Erhaltungslademodus (13,8 ... 13,9V).</li>
<li>Man muß sich klar sein, daß ein Windgenerator am Fahrzeug nur die zweitbeste Möglichkeit ist: An der portugiesischen Atlantikküste hatte ich unmittelbar oberhalb einer Klippe fast Flaute, derweil nur 800m von mir entfernt landeinwärts an einem 20m höheren Standort, aber auf einem 10m hohen Mast bei einem Ferienhaus ein baugleicher Generator kräftig Strom lieferte.</li>
<li>Man lasse sich auch nicht von Großwindkraftanlagen zu falschen Schlüssen verleiten:<br>
Die Dinger arbeiten, auch aufgrund ihrer Höhe, bei Boden-Windstärken unverdrossen vor sich hin, bei denen der Air-X noch nicht einmal dran denkt, überhaupt anzulaufen.</li>
</ul>
<p>Aus den Erfahrungen im Laufe der Zeit mit der Windkraftanlage habe ich für mich den Begriff <i><b>"Windqualität"</b></i> geprägt:</p>
<ul>
<li>Windstärke (das ist klar)</li>
<li>Konstanz der Windstärke (wechselnd starke, böige Winde bringen immer wieder Drehzahleinbrüche und damit deutliche Ertragseinbußen)</li>
<li>Konstanz der Windrichtung (jeder Richtungswechsel und damit einhergehendes Nachführen des Windrades bringt deutliche Drehzahleinbrüche und damit Ertragseinbußen)</li>
</ul>
<p>Fazit für mich: Die Anlage ist OK als Zusatz-Stromerzeugung an Küsten (Frühjahr in der Normandie mit wechselhaftem Wetter: Schlechtwetterfronten gehen meist mit Wind einher), auf Gebirgspässen, oder z. B. im Winter in der Camargue oder allg. Provence, wenn Mistral bläst. Alles in allem sehr spezielle Anwendungen, manchmal aber "das entscheidende Plus", das ein "energetisches Überleben" möglich macht.</p>
<p><b>Weitere Artikel</b> zum Thema "Windgenerator" und Erfahrungen dazu in <a href="/wohnmobile/wind.html" name="Artikel zum Windgenerator" title="Artikel zum Windgenerator">>>> meinem Blog</a></p>


<!-- Die Windgeräusche des Propellers hörst Du selbst bei offener Dachluke kaum.
In der Tat ist es das Laufgeräusch des Generators/"Dynamos" selber, das am Meisten nervt, das ist ein Ton zwischen 200 und 1000Hz, abhängig von der Drehzahl, der sich tatsächlich auf den Koffer überträgt und dann aus allen Richtungen (also nicht ortbar) auf die Insassen "einwirkt" ... frown
Abhilfe: ich lass das Teil meist laufen, wenn ich unterwegs oder draußen zugange bin laugh

(für die letzten beiden Punkte ist die "Tonübertragung" schon hilfreich zur Einschätzung wink ).


Klar wäre ein Moppel billiger, aber z. B. in den Schweizer Alpen hab ich schon erlebt, wie Wohnmobilisten deswegen angegangen wurden von Passanten, während bei mir die "mit aufgesperrtem Maul" drumrumgestanden sind ... und dann eine Unterhaltung über Ertrag, Verwendung, Erfahrungen etc. dieser "regenerativen Energie" begonnen - sowas ist eben heutzutage "positiv besetzt". -->

<!-- Original geschrieben von: Setrine
bist Du viel in stürmischen Gegenden unterwegs? Des Windgenerators wegen,
würdest ihn wiederkaufen und und wie sieht's mit dem Wirkungsgrad aus?

Zu den Einsatzgegenden hab ich weiter oben schon geschrieben, und sonst:

- wieder kaufen: ja, ggf. einen anderen Typ (Superwind 350).
Warum?
1. weil meine 200W Solaranlage vor 17Jahren richtig dimensioniert war, damals gab's aber auch noch Seewetter- und Reisewetter-Berichte im Radio. Heute ist ein Rechner fast Pflichtausstattung, und der ist nach Kompressor-Kühlschrank der zweitgrößte Verbraucher und geht maßgeblich in die Energiebilanz ein.
2. weil die Lebensdauer der üblichen Bordbatterien maßgeblich von der Entladetiefe abhängt. Da ich "im Zielgebiet" nicht viel fahre, versuche ich alle anderen Möglichkeiten zur Energieerzeugung zu nutzen, um die Batterie "möglichst lange möglichst voll" zu halten.

- Wirkungsgrad?
Ertrag gegen Windstärke? keine Ahnung, aber ein elektrischer Generator liegt i. A. über 90%, und welchen Anteil die Rotorblätter aus dem Wind entnehmen? keine Ahnung.
Ertrag gegen Kosten? Wenn ich mir diese Frage stellen würde ... dann dürfte ich nicht so reisen wollen wie ich das tue -->

<h4>Batterie-Booster</h4>
<p>... der erste hat bei einem Probelauf nach 4min. unter Abgabe von Rauchzeichen den Dienst quittiert, vom Ersatzgerät ist das Lochbild - trotz Langlöchern - soweit außer Toleranz, daß ich ihn erst viel später wieder montiert habe. Er hat zwar funktioniert, aber wegen der [italienischen Elektrik](/blog/2012-08-10-kabelquerschnitte-italienische-elektrik.html), sprich dem mickrigen Kabel ab der Lichtmaschine, hab ich ihn nicht dauerhaft eingesetzt ... und im Jahr 2018 [wieder rausgeworfen](/blog/2018-09-15-ladebooster-ja-oder-nein.html).</p>

<h3>Sonstiges Berücksichtigenswertes:</h3>
<p>Aufgrund der stark verbesserten Ladetechnik ist es notwendig, die in der Vollladephase in der Batterie entstehenden (explosiven) Gase gezielt abzuführen. Dazu habe ich mir ein Entlüftungsset installiert.<br>
Bezugsquelle: <a title="Link zum Anbieter" target="f" href="http://www.winkler.de">Fa. Winkler</a><br>
Bestellnummer: 721 000 125 00, Preis in der Region von 30 EUR netto.</p>
<!--INHALT Ende-->