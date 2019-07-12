
if [ $# -lt 5 ]
then 
    echo "Usage: $0 <qrcode> <nome> <matricula> <cpf> <email>"
    exit
fi

IMG=$1
NOME=$2
MATRICULA=$3
CPF=$4
EMAIL=$5

INFO=`zbarimg $IMG | cut -d ':' -f 2,3`
URL=`echo "$INFO" | awk -F '?' '{print $1}'`
CODE=`echo "$INFO" | awk -F '?' '{print $2}'`

curl --data "nome=$NOME&matricula=$MATRICULA&cpf=$CPF&email=$EMAIL&$CODE" $URL