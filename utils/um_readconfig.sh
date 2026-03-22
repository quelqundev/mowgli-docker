#!/bin/bash

DEVICE="/dev/gps"
BAUD=460800

# Fonction pour envoyer une commande proprement
send_cmd() {
    echo -ne "$1\r\n" | sudo tee "$DEVICE" > /dev/null
    sleep 0.2
}

echo "[*] Lecture de la Configuration de l'UM980 via $DEVICE"

# Réinitialisation (FRESET)
echo "[1] Envoi de \$CONFIG..."
send_cmd '$CONFIG'

