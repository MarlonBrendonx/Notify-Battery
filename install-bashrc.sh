#! /usr/bin/env bash

dest="/usr/local/bin"

if sudo cp power.sh "$dest"
then
	echo "[*] Serviço copiado para $dest"
else
  echo "[*] Opss! Não foi possível copir o serviço pra $dest"
fi

if echo "/usr/bin/env bash /usr/local/bin/power.sh &" >> ~/.bashrc
then

  if source ~/.bashrc
  then
    echo "[*] Serviço finalizado com sucesso"
  fi

fi
