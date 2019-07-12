# sistema de gestão de presenças em eventos

## pre-requisitos:

* qrencode
* zbar-tools
* curl
* mysql-server instalado com um base de dados chamada trps criada
* python3

## como rodar o servidor:

Instalação das dependencias para sistemas baseados em debian:
``` ./install.sh ```

Inicialização do banco de dados:
``` ./inicia_banco.sh <usr> <senha> <banco_de_dados> <servidor_mysql> ```

Preenchimento dos eventos do arquivo eventos.csv:
``` ./registra_eventos.sh eventos.csv <usr> <senha> <banco_de_dados> <servidor_mysql> <servidor_http:porta> ```

Rodar servidor http:
``` python3 servidor_evento.py <usr> <senha> trps <servidor_mysql> ```

## funcionamento do cliente:

* qrcode: caminho para o arquivo de QRCode
* nome, matricula, cpf, email: informações sobre o participante

### como rodar:

``` ./cliente.sh <qrcode> <nome> <matricula> <cpf> <email> ```