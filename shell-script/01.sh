#!/bin/bash
echo "shell script"
HORA=$(date +%H)
MINUTO=$(date +%M)

echo $HORA:$MINUTO

read -p "Por favor digite algo:" ENTRADA
echo $ENTRADA

echo "O parametro passado pelo terminal é: $1"

PARAM=$#

if [ $PARAM -eq 0 ]
then
    echo "Parametro incorreto"
    exit 1
fi

if [ 10 -gt $1 ] 
then 
    echo "10 é maior ou igual a $1"
else
    echo "10 é menor ou igual a $1"
fi     

for i in 1 2 3 4 5 6 7
do 
    echo "O valor de i é: $i"
done

while [ 10 -gt $1 ]
do
    echo "Repetindo"
    sleep 3
done