+++
title       = "Kontakt: Adresse, e-M@il, ..."
linktitle   = "Kontakt"
url         = "/kontakt/formular.php"
date        = "2019-11-12T22:24:40+01:00"
weight      = "1"

+++

<em>Postanschrift</em>
<p>Bernhard Albicker<br>
Im Stöckmädle 14<br>
D 76307 Karlsbad</p>
<p>Am einfachsten bin ich zu erreichen per e-mail (alle Felder müssen ausgefüllt sein):</p>


{{< php >}}

<?php
// Version 0.961
require_once("../php/phpmailer/class.phpmailer.php");
require_once("../php/phpmailer/class.smtp.php");
require_once("../php/_param.php");
require_once("../php/functions.php");
	
//Variablen initialisieren
$GLOBALS['form_logfile']   = $mail_logfile;
$GLOBALS['form_spambench'] = $mail_spambench;
$GLOBALS['form_pflicht']   = $mail_pflicht;
$GLOBALS['form_feld'] 	   = $mail_feld;
$GLOBALS['form_fields']    = "";
$GLOBALS['formkey'] 	   = "";
$GLOBALS['formvalue'] 	   = "";

$GLOBALS['datenOK']  = 0;       //Ausgehen von Ungültigkeit der Daten
$GLOBALS['misuseOK'] = 1;       //Ausgehen von Mißbrauch
$GLOBALS['spamOK']   = 1;       //Ausgehen von Spam
$GLOBALS['emailOK']  = 1;       //Ausgehen von gültiger e-mail-Adresse

$GLOBALS['formmail_$mail_debug']   	= $mail_debug;

$GLOBALS['formmail_mail_encrypt']   = $mail_encrypt;
$GLOBALS['formmail_mail_port']   	= $mail_port;
$GLOBALS['formmail_mail_host']   	= $mail_host;
$GLOBALS['formmail_mail_user']   	= $mail_user;
$GLOBALS['formmail_mail_passwd']   	= $mail_passwd;


$GLOBALS['formmail_to_email']   = $mail_to_email;
$GLOBALS['formmail_to_name']   	= $mail_to_name;
$GLOBALS['formmail_subj'] 		= $mail_subj;
$GLOBALS['formmail_cc']   		= $mail_cc;
$GLOBALS['formmail_bcc']  		= $mail_bcc;
$GLOBALS['formmail_from_email'] = "";
$GLOBALS['formmail_from_name'] 	= "";
$GLOBALS['formmail_abs']  		= $mail_abs;
$GLOBALS['formmail_bestaet']	= $mail_bestaet;
$GLOBALS['formmail_conf'] 		= $mail_conf;
$GLOBALS['formmail_answ'] 		= $mail_answfile;
$GLOBALS['formmail_misuse']		= $mail_misuse;

$form_display = "form_on";

//Programmablauf
if ($_POST['Submit']) {}
  else
    {statLog();}       //Seitenzählung bei Seitenaufruf ohne "Submit" (erstmaliges Betreten der Seite)

if ($_POST['Submit'])
  {
    // Der Submit - Button wurde gedrückt -> die Werte müssen eingelesen werden
    formRead();
    if ($mail_logseq == 2) {formLog();}       //Alle Formulareinsendungen mitschreiben

    //-> Formular wird auf korrekte Feldübermittlung geprüft
    formKorr();
    formStopFS();
    switch ($GLOBALS['misuseOK'])
      {
        case 1:
          formMisuse();
          if ($mail_logseq == 1) {formLog();}    //Logfile-Eintrag
          $form_display = "form_off";
          break;
        case 0:
          //-> die Werte müssen überprüft und bei Vollständigkeit verarbeitet werden
          formCheck();
      }


    if ($GLOBALS['datenOK'])
      {
        formCheckMail();
        if ($GLOBALS['emailOK'])
          {
            //Prüfung auf unerlaubte Eingaben
            formSpam();

            //Formularspezifische Strings für die mails
            $GLOBALS['formmail_from_email'] = $GLOBALS['formvalue'][array_search('eMail', $GLOBALS['formkey'])];
			$GLOBALS['formmail_from_name'] 	= "* " . $GLOBALS['formvalue'][array_search('Name', $GLOBALS['formkey'])] . " *";	//Klartext-Name des Absenders
            $GLOBALS['formmail_subj'] 		= $GLOBALS['formmail_subj'] . " - " . $GLOBALS['formvalue'][array_search('Betreff', $GLOBALS['formkey'])];	//Betreffszeile
            
            //mail-Übermittlung
            if ($GLOBALS['spamOK'] == 0)
              {
                // Rückgabe auf den Benutzerbildschirm
                formDisp();
                formMail();
                statLog();       //Seitenzählung bei erfolgter Mail
                $form_display = "form_off";
              }
            else
              {
                //Logfile-Eintrag
                if ($mail_logseq == 1) {formLog();}
                // Rückgabe auf den Benutzerbildschirm
                formMisuse();
                $form_display = "form_off";
              }
          }
      }
    // und fertig...
  }
?>


<div id="<?php echo $form_display; ?>">

	<div id="kontakt_form">
		<form action="<?php echo $PHP_SELF; ?>" method="POST" accept-charset="UTF-8">
		<!--<legend>Mail an den Verfasser</legend>-->
			<fieldset><i>Kontaktdaten</i><br>
				<label class="li">Name:</label> <input name="Name" value="<?php formFeld($fieldname = "Name"); ?>" size="25" maxlength="80" type="Text"><br>
				<label class="li">e-mail:</label> <input name="eMail" value="<?php formFeld($fieldname = "eMail"); ?>" size="25" maxlength="80" type="Text"><br>
				<label class="li">Betreff:</label> <input name="Betreff" value="<?php formFeld($fieldname = "Betreff"); ?>" size="25" maxlength="80" type="Text"><br>
			</fieldset>
		
		<p>Hier bitte die Nachricht eingeben:</p><p class="small">(Das Textfeld kann an der rechten unteren Ecke vergrößert werden)</p>
			<textarea name="Nachricht" cols="35" rows="5" wrap="virtual"><?php formFeld($fieldname = "Nachricht"); ?></textarea>
			<!--<fieldset></fieldset>-->
			<input name="Submit" value="Abschicken..." type="Submit">
			<!--<input type="reset" name="reset" value="Eingaben löschen">-->
		</form>
	</div>

</div>

{{< /php >}}

<p class="small">Mit dem vorstehenden Kontaktformular können Sie Ihre Anfrage an uns richten. Ihre Daten werden über unseren Provider per eMail an uns weitergeleitet.<br>Durch Absenden der Mail erklären Sie sich damit einverstanden, daß Ihre mail- und IP-Adressen einmalig zur Vermeidung von Spam mit einer externen Datenbank abgeglichen werden.<br><!--  und nach Beantwortung umgehend gelöscht, sofern keine gesetzlichen Aufbewahrungspflichten bestehen. Eine Nutzung zu einem anderen Zweck oder eine Datenweitergabe an Dritte findet nicht statt. Sie können Ihre Einwilligung zur Datenerhebung und Datennutzung jederzeit durch Nachricht an uns widerrufen. Im Falle des Widerrufs werden Ihre Daten umgehend gelöscht.  -->Bitte entnehmen Sie weitere Informationen unserer <a href="/kontakt/datenschutz.html">Datenschutzerklärung</a>.</p>


<!--
/* Formularanzeige Style-Sheet*/
div#form_off {
        display : none;
}
div#form_on {
        display : inline;
}
-->

