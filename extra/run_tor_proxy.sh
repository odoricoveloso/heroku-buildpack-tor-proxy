#!/bin/bash

sleep 300 # Espera 5 minutos antes de iniciar o Tor

# Inicia o Tor como um processo em segundo plano

/app/tor/bin/run_tor_proxy &

# Aguarda o Tor iniciar
sleep 300 # Espera 5 minutos para garantir que o Tor esteja totalmente iniciado

# Loop para enviar NEWNYM a cada 2 minutos
while true; do
  # Envia o comando NEWNYM para a porta de controle do Tor
  echo -e "AUTHENTICATE \"torProxy@123\"\r\nSIGNAL NEWNYM\r\nQUIT\r\n" | nc 127.0.0.1 9051
  sleep 300 # Espera 5 minutos antes de enviar o próximo NEWNYM
  echo "Sent NEWNYM signal to Tor"
done