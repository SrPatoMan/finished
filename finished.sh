#!/bin/bash
#By Manuel Ramos

GREEN='\033[0;32m'
RED='\033[0;31m'

WEBHOOK_DISCORD="" # PON AQUI TU WEBHOOK DE DISCORD
WEBHOOK_TELEGRAM="" # PON AQUI TU WEBHOOK DE TELEGRAM
PLATFORM="" # PONER telegram o discord (segun la plataforma que uses)

"$@"
exit_code=$?


if [ $exit_code -eq 0 ];then
mensaje="${GREEN}[+] El proceso ha finalizado con exito"
else
mensaje="${RED}[-] El proceso ha finalizado de manera no exitosa"
fi

echo -e $message

if [ $PLATFORM -eq 'discord' ];then
curl -X POST -H 'Content-Type: application/json' -d '{"content": "$mensaje"}' "$WEBHOOK_DISCORD"
fi

if [ $PLATFORM -eq 'telegram' ];then
## PONER PETICION CURL AL WEBHOOK DE TELEGRAM
fi