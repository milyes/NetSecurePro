#!/bin/bash
echo "[NetSecurePro] Détection de clé USB en cours..."
while true; do
    if lsusb | grep -q "ID"; then
        echo "[NetSecurePro] Clé USB détectée. Lancement du tunnel distant..."
        bash cloudflare_start.sh &
        termux-open-url http://127.0.0.1:8000
        break
    fi
    sleep 2
done
