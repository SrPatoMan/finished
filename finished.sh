#!/bin/bash
#By Manuel Ramos

## DISCORD (Rellenar si usas Discord) ##
WEBHOOK_DISCORD=""

## TELEGRAM (Rellenar si usas Telegram)##
BOT_TOKEN=""
CHAT_ID=""

PLATFORM="discord" # PONER telegram o discord (segun la plataforma que uses, por defecto discord)

if [[ -z "$WEBHOOK_DISCORD" && -z "$BOT_TOKEN" ]];then
echo -e "\n[!] NO HAS ESTABLECIDO NINGUN WEBHOOK DE DISCORD O BOT DE TELEGRAM!!\n"
echo -e "[+] Abre el script e introduce tu webhook de telegram o tu bot discord"
exit
fi

"$@"
exit_code=$?
herramienta=$1

if [ $exit_code -eq 0 ];then
mensaje="[+] |   $herramienta   | ha finalizado con exito"
else
mensaje="[-] |   $herramienta   | ha finalizado de manera no exitosa"
fi


if [ $PLATFORM == 'discord' ];then
curl -X POST -H 'Content-Type: application/json' -d "{\"content\": \"$mensaje\"}" "$WEBHOOK_DISCORD"
fi

if [ $PLATFORM == 'telegram' ];then
curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" -d chat_id=$CHAT_ID -d text="$mensaje" >/dev/null 2>&1
fi
