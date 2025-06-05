#!/bin/bash

/app/tor/bin/run_tor_proxy &

# Aguarda o Tor iniciar
sleep 10

# Loop para enviar NEWNYM a cada 2 minutos
while true; do
  # Envia o comando NEWNYM para a porta de controle do Tor
  echo -e "AUTHENTICATE \"torProxy@123\"\r\nSIGNAL NEWNYM\r\nQUIT\r\n" | nc 127.0.0.1 9051
  sleep 120
done