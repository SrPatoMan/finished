#!/bin/bash
#By Manuel Ramos

WEBHOOK_DISCORD="" #PON AQUI TU WEBHOOK DE DISCORD

WEBHOOK_TELEGRAM="" # PON AQUI TU WEBHOOK DE TELEGRAM

PLATFORM="discord" # PONER telegram o discord (segun la plataforma que uses)

if [[ -z "$WEBHOOK_DISCORD" && -z "$WEBHOOK_TELEGRAM" ]];then
echo -e "\n[!] NO HAS ESTABLECIDO NINGUN WEBHOOK!!\n"
echo -e "[+] Abre el script e introduce tu webhook de telegram o discord"
exit
fi

"$@"
exit_code=$?
herramienta=$1

if [ $exit_code -eq 0 ];then
mensaje="[+] $herramienta ha finalizado con exito"
else
mensaje="[-] $herramienta ha finalizado de manera no exitosa"
fi


if [ $PLATFORM == 'discord' ];then
curl -X POST -H 'Content-Type: application/json' -d "{\"content\": \"$mensaje\"}" "$WEBHOOK_DISCORD"
fi

#if [ $PLATFORM == 'telegram' ];then
## PONER PETICION CURL AL WEBHOOK DE TELEGRAM
#fi
