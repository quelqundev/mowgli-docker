#!/bin/bash

DEVICE="/dev/gps"

# Fonction pour envoyer une commande proprement
send_cmd() {
    echo -ne "$1\r\n" | sudo tee "$DEVICE" > /dev/null
    sleep 0.2
}

send_cmd 'MODE ROVER SURVEY MOW'
sleep 1

# Sauvegarde de la config
echo "[6] Envoi de SAVECONFIG..."
send_cmd 'SAVECONFIG'
