#!/bin/bash
echo "Entrez le mot-clé pour déverrouiller l'accès IA :"
read key
if [ "$key" == "unlock_ai" ]; then
    echo "[✔] Accès autorisé"
    bash usb_remote_launcher.sh
else
    echo "[✘] Mot-clé incorrect"
fi
