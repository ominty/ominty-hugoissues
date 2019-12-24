+++
type        = "php"
title 		= "Suchergebnisse"
linktitle   = "Suchergebnisse"
url         = "/suchen.php"
date 		= "2017-01-01"
description = "Ergebnisse der Site-Suche auf privat.albicker.org"
keywords    = "Suchergebnisse"
weight      = 1
+++
<div>
<?php 
//ob_start(); // auf manchen Servern kann es erforderlich sein, diese Zeile zu entkommenieren
include("wdw_suche/search_config.php");
if (isset($_GET["q"]) && $_GET["q"] != "") {	
	$search_anzeige = stripslashes(htmlspecialchars($_GET["q"], ENT_COMPAT, "UTF-8", false)); // PHP 5.4
} else {
	$search_anzeige = $value;
}
?>
</div>

<div id="suchform">
	<form  id="search" method="get" action="<?php echo htmlentities($_SERVER['PHP_SELF']); ?>"   onsubmit="return showWait();">
		<p><label for="suchbegriff">Im Projekt suchen:</label><br />

<input type="text" name="q" id="suchbegriff" value="<?php echo $search_anzeige ?>" size="13" title=" Suchbegriff hier eingeben " onblur="if(this.value=='')this.value='<?php echo $search_anzeige ?>';" onfocus="if(this.value=='<?php echo $value ?>')this.value='';" />

		<input type="submit" value="Los !" />
		
            <!-- der Throbber (die Warten-Grafik) http://mentalized.net/activity-indicators/ -->
            <script type="text/javascript">
            // <![CDATA[
                  document.write ('<img id="wait" height="16" width="16" src="wdw_suche/throbber3.gif" alt="bitte warten" />');
            // ]]>
            </script>

		</p>
	</form>
</div>

<div id="output">
	<?php include("wdw_suche/search.php");?>
</div>


