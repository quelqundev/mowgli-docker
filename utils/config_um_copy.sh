#!/bin/bash

DEVICE="/dev/gps"
BAUD_INITIAL=460800
BAUD_NEW=460800

# Fonction pour envoyer une commande proprement
send_cmd() {
    echo -ne "$1\r\n" | sudo tee "$DEVICE" > /dev/null
    sleep 0.2
}

echo "[*] Configuration de l'UM980 via $DEVICE"

stty -F "$DEVICE" $BAUD_INITIAL raw -echo -echoe -echok
sleep 0.5

# Configuration initiale
echo "[3] Envoi des commandes de configuration initiales..."
send_cmd 'CONFIG SIGNALGROUP 3 0'
send_cmd 'MASK 12'
send_cmd 'AIDPOS,47.4079444,N,0.7051667,E,90'
send_cmd 'CONFIG RTK RELIABILITY 3 2'
sleep 2

# Sauvegarde de la config
echo "[6] Envoi de SAVECONFIG..."
send_cmd 'SAVECONFIG'
