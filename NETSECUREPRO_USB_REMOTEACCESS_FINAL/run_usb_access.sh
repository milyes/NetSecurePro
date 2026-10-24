#!/bin/bash

echo "[🔐] Initialisation de NETSECUREPRO_USB_REMOTEACCESS..."

# Étape 1 – Déverrouillage
if [ -f "./unlock.sh" ]; then
    echo "[🔓] Exécution du script de déverrouillage..."
    bash ./unlock.sh
fi

# Étape 2 – Lancement interface Web
if [ -f "./netsecure_usb_interface.html" ]; then
    echo "[🌐] Ouverture de l’interface Web locale..."
    termux-open ./netsecure_usb_interface.html 2>/dev/null || xdg-open ./netsecure_usb_interface.html
fi

# Étape 3 – Lancement du module USB distant
if [ -f "./usb_remote_launcher.sh" ]; then
    echo "[🚀] Lancement du module d’accès distant USB..."
    bash ./usb_remote_launcher.sh
fi

# Étape 4 – Détection USB intelligente (si souhaitée)
if [ -f "./auto_usb_detect.py" ]; then
    echo "[🔍] Détection automatique du périphérique USB..."
    python3 ./auto_usb_detect.py
fi

echo "[✅] Module USB RemoteAccess prêt à l’emploi !"
