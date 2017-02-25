+++
date = "2015-12-23T22:24:40+01:00"
title = "Kontakt: Adresse, e-M@il, ..."
linktitle = "Kontakt"
weight = "1"

+++

<div>
<br>
<p>John Doe<br>
Hollyfield 14<br>
Washington, D.C 20547</p>
<p>Am einfachsten bin ich zu erreichen per e-mail (alle Felder m&#252;ssen ausgef&#252;llt sein):</p>

<div id="<?php echo $form_display; ?>">

	<div id="kontakt_form">
		<form action="kontakt.php" method="POST" accept-charset="UTF-8">
		<!--<legend>Mail an den Verfasser</legend>-->
			<fieldset><i>Kontaktdaten</i><br>
				<label class="li">Name:</label> <input name="Name" value="" size="25" maxlength="80" type="Text"><br>
				<label class="li">e-mail:</label> <input name="eMail" value="" size="25" maxlength="80" type="Text"><br>
				<label class="li">Betreff:</label> <input name="Betreff" value="" size="25" maxlength="80" type="Text"><br>
			</fieldset>
		
		<p>Hier bitte die Nachricht eingeben:<br><small>(Das Textfeld kann an der rechten unteren Ecke vergrößert werden)</small></p>
			<textarea name="Nachricht" cols="35" rows="5" wrap="virtual"></textarea>
			<!--<fieldset></fieldset>-->
			<input name="Submit" value="Abschicken..." type="Submit">
			<!--<input type="reset" name="reset" value="Eingaben löschen">-->
		</form>
	</div>

</div>

<!--
/* Formularanzeige Style-Sheet*/
div#form_off {
        display : none;
}
div#form_on {
        display : inline;
}
-->

</div>