#!/bin/bash

if [ $# -lt 6 ]
then 
    echo "Usage: $0 <arquivo_eventos> <usr> <senha> <banco_de_dados> <servidor_mysql> <servidor_http>"
    exit
fi

EVENT_FILE=$1
USER=$2
PASSWORD=$3
DATABASE=$4
SERVERMYSQL=$5
SERVERHTTP=$6

for line in `cat $EVENT_FILE`; do

    chave=`uuid`
    nome=`echo "$line" | awk -F ';' '{print $1}'`
    data=`echo "$line" | awk -F ';' '{print $2}'`
    horainicio=`echo "$line" | awk -F ';' '{print $3}'`
    horafim=`echo "$line" | awk -F ';' '{print $4}'`
    local=`echo "$line" | awk -F ';' '{print $5}'`
    observacoes=`echo "$line" | awk -F ';' '{print $6}'`

    mysql -h $SERVERMYSQL -u $USER -p$PASSWORD -D $DATABASE -e "INSERT INTO evento (id, nome, data, horario_inicio, horario_fim, local, observacoes) VALUES ('$chave','$nome','$data','$horainicio', '$horafim', '$local', '$observacoes')"

    qrencode -o "qrcode/$nome.png" "$SERVERHTTP?code=$chave"

done