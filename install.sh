#
#

if ! which notify-send 2>&1 > /dev/null
then

  echo "[*] Instalando notify-send" 
  sudo apt install libnotify-bin

fi

if sudo cp power.sh /usr/local/bin/
then
  echo "[*] Script copiado para /usr/local/bin"
else
  echo "[*] Ops!! Não foi possível copiar o script"
  exit 1
fi


if sudo cp notify_send_battery.service /lib/systemd/system/
then

  echo "[*] Serviço no systemd adicionado"
  if sudo systemctl daemon-reload && sudo systemctl enable notify_send_battery && sudo systemctl start notify_send_battery
  then
    echo "[*] Serviço no systemd carregado e ativado"
  else
    echo "[*] Não foi possível carregar e ativar o serviço no systemd"
    exit 1
  fi

fi

echo "[*] Instalação finalizada!"



