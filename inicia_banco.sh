#!/bin/bash

if [ $# -lt 4 ]
then 
    echo "Usage: $0 <usr> <senha> <banco_de_dados> <servidor_mysql>"
    exit
fi

USER=$1
PASSWORD=$2
DATABASE=$3
SERVERMYSQL=$4

mysql -h $SERVERMYSQL -u $USER -p$PASSWORD -D $DATABASE -e 'CREATE TABLE IF NOT EXISTS `evento` ( `id` varchar(64) NOT NULL, `nome` varchar(128) DEFAULT NULL, `data` date DEFAULT NULL, `horario_inicio` time DEFAULT NULL, `horario_fim` time DEFAULT NULL, `local` varchar(128) DEFAULT NULL, `observacoes` text, PRIMARY KEY (`id`));'
mysql -h $SERVERMYSQL -u $USER -p$PASSWORD -D $DATABASE -e 'CREATE TABLE IF NOT EXISTS `presenca` ( `id` int(11) NOT NULL AUTO_INCREMENT, `qrcode` varchar(45) DEFAULT NULL, `nome` varchar(45) DEFAULT NULL, `matricula` varchar(45) DEFAULT NULL, `cpf` varchar(14) DEFAULT NULL, `email` varchar(128) DEFAULT NULL, `codevento` varchar(64) DEFAULT NULL, PRIMARY KEY (`id`), KEY `fk_presenca_1_idx` (`codevento`),  CONSTRAINT `presenca_evento` FOREIGN KEY (`codevento`) REFERENCES `evento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION);'




