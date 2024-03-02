#!/bin/bash

echo 'alias sh_search="/data/data/com.termux/files/home/search.sh"' > ~/.bash_profile

# Basis-URL, in der nach Dateien gesucht wird
BASE_URL="https://apploadify.github.io/mirror/"

# Überprüfen, ob ein Argument angegeben wurde
if [ $# -eq 0 ]; then
    echo "Usage: $0 FileName"
    exit 1
fi

# Der Name der gesuchten Datei ohne die .sh-Erweiterung
FILE_NAME=$1

# Vollständige URL zusammenbauen
FULL_URL="${BASE_URL}${FILE_NAME}.sh"

# HTTP-Statuscode abrufen (ohne Ausgabe auf die Konsole)
HTTP_STATUS=$(curl --output /dev/null --silent --head --fail --write-out "%{http_code}" "$FULL_URL")

# Überprüfen, ob die Datei gefunden wurde oder nicht
if [ "$HTTP_STATUS" -eq 200 ]; then
    echo "${FILE_NAME}.sh located."
else
    echo "Package not located."
fi