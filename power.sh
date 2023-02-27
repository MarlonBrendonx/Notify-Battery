#! /usr/bin/env bash

#-------------------------HEADER----------------------------------------------------------------|

# AUTOR             : Marlon Brendo <marlonbrendo2013@gmail.com>
# DATA-DE-CRIAÇÃO   : 2023-02-25
# PROGRAMA          : Battery
# LICENÇA           : MIT
# DESCRIÇÃO 	      : Um simples script para verificar bateria baixa e notificar ao usuário
# GITHUB	          : https://github.com/MarlonBrendonx
#
#-----------------------------------------------------------------------------------------------|


#----------------------------------Variables----------------------------------------------------|
percentageDischarging=15
#-----------------------------------------------------------------------------------------------|


while sleep 10s;
do

power=$( upower -i /org/freedesktop/UPower/devices/battery_BAT0   )

percentage=$( grep percentage <<< $power | cut -d':' -f2  )
percentage=${percentage%%\%} 
charge=$( grep state <<< $power | cut -d':' -f2)

(( $percentage <= "$percentageDischarging" )) && [[ ${charge//[[:blank:]]/} = 'discharging' ]] && \
  notify-send "Bateria baixa" "\n Energia em ${percentage//[[:blank:]]/}%. Conecte o carregador" --icon="$PWD/bat.png" -u critical

done



