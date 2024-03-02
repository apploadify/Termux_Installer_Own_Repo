#!/bin/bash

echo 'alias sh_install="/data/data/com.termux/files/home/install.sh"' > ~/.bash_profile

# Basis-URL, von der die Skripte heruntergeladen werden
BASE_URL="https://apploadify.github.io/mirror/"

# Überprüfen, ob ein Argument angegeben wurde
if [ $# -eq 0 ]; then
    echo "Usage: $0 ScriptName"
    exit 1
fi

# Der Name des Skripts ohne die .sh-Erweiterung
SCRIPT_NAME=$1

# Vollständige URL zusammenbauen
FULL_URL="${BASE_URL}${SCRIPT_NAME}.sh"

# Skript herunterladen
echo "Downloading ${SCRIPT_NAME}.sh from ${FULL_URL}..."
curl -O $FULL_URL

if [ $? -ne 0 ]; then
    echo "Failed to download ${SCRIPT_NAME}.sh"
    exit 2
fi

# Ausführbare Berechtigungen erteilen
chmod +x "${SCRIPT_NAME}.sh"

# Skript ausführen
echo "Executing ${SCRIPT_NAME}.sh..."
./"${SCRIPT_NAME}.sh"

# Überprüfen, ob das Skript erfolgreich ausgeführt wurde
if [ $? -eq 0 ]; then
    echo "${SCRIPT_NAME}.sh executed successfully."
else
    echo "Failed to execute ${SCRIPT_NAME}.sh"
fi