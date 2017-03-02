#!/bin/bash

# Hugo-internes Veröffentlichungs-Verzeichnis leeren
rm -r ./public
# backup-Files ~ löschen
rm $(find . -name '*~*')

# aktualisierte Seite zur Veröffentlichung erstellen
hugo

