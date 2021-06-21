#1-) perguntar ao usuário 3 números inteiros, calcular a média, mínimo e máximo e mostrar estes resultados no cmd - imprimir no console - (exclusivamente para o CAU -> calcular também o desvio padrão)

#2-) após finalizar o primeiro, fazer a seguinte modificação: 
#Passos
#2.1-pedir para um usuário digitar um número inteiro
#2.2 perguntar se o usuário gostaria de inserir mais algum número
#2.3 caso a resposta do item 2.2 seja verdadeira, voltar para o passo 2.1. Caso contrário, calcular soma, mínimo e máximo dos valores já inseridos e mostrar estes resultados no cmd - imprimir no console

#/bin/bash
read -p "digite o primeiro numero: " NUMUM
read -p "digite o segundo numero: " NUMDOIS
read -p "digite o terceiro numero: " NUMTRES


#echo $(($NUMUM + $NUMDOIS + $NUMTRES))

echo "===== MÉDIA ====="
SOMA=$(($NUMUM + $NUMDOIS + $NUMTRES))
MEDIA=$(($SOMA / 3))
echo "A média dos tres números digitados é: $MEDIA"

echo "==== MÍNIMO ===="
MENOR=$NUMUM

if [ $NUMDOIS -lt $MENOR ]
then
    MENOR=$NUMDOIS
fi

if [ $NUMTRES -lt $MENOR ]
then
    MENOR=$NUMTRES
fi

# if [ $NUMUM -lt $NUMDOIS ]
# then
#     if [ $NUMUM -lt $NUMTRES ]
#     then
#         MENOR=$NUMUM
#     fi
# else 
#     if [ $NUMDOIS -lt $NUMUM ]
#     then
#         if [ $NUMDOIS -lt $NUMTRES ]
#         then
#             MENOR=$NUMDOIS
#         fi
#     fi
# fi

# if [ $NUMTRES -lt $NUMUM ]
# then
#     if [ $NUMTRES -lt $NUMDOIS ]
#     then
#         MENOR=$NUMTRES
#     fi
# fi

echo "O valor mínimo é $MENOR"

echo "====MÁXIMO===="
MAIOR=$NUMUM

if [ $NUMDOIS -gt $MAIOR ]
then
    MAIOR=$NUMDOIS
fi

if [ $NUMTRES -gt $MAIOR ]
then
    MAIOR=$NUMTRES
fi

echo "O valor máximo é $MAIOR"

# if [ $NUMUM -gt $NUMDOIS ]
# then
#     if [ $NUMUM -gt $NUMTRES ]
#     then
#         MAIOR=$NUMUM
#     fi
# else 
#     if [ $NUMDOIS -gt $NUMUM ]
#     then
#         if [ $NUMDOIS -gt $NUMTRES ]
#         then
#             MAIOR=$NUMDOIS
#         fi
#     fi
# fi

# if [ $NUMTRES -gt $NUMUM ]
# then
#     if [ $NUMTRES -gt $NUMDOIS ]
#     then
#         MAIOR=$NUMTRES
#     fi
# fi




echo "=== PASSO 2 ==="

#2-) após finalizar o primeiro, fazer a seguinte modificação: 
#Passos
#2.1-pedir para um usuário digitar um número inteiro
#2.2 perguntar se o usuário gostaria de inserir mais algum número
#2.3 caso a resposta do item 2.2 seja verdadeira, voltar para o passo 2.1. Caso contrário, calcular soma, mínimo e máximo dos valores já inseridos e mostrar estes resultados no cmd - imprimir no console


ARRAY=()

read -p "Digite um número: " NUMRESP
ARRAY+=($NUMRESP)

X=1

while [ $X -eq 1 ]
do
    read -p "Deseja digitar outro número? (1 = SIM / 0 = NÃO)  " RESP

    if [ $RESP -eq 1 ]
    then
        read -p "Digite outro número " NUMDIGI
        ARRAY+=($NUMDIGI)
    else
        X=0
        echo "=== SAINDO ==="
    fi
done

echo "Números digitados ${ARRAY[*]}"

echo "==== SOMA DOS VALORES DIGITADOS ===="

SOMAARRAY=0

for each in "${ARRAY[@]}"
do
    SOMAARRAY=$(($SOMAARRAY + $each))
done

echo "A soma dos valores digitados é: $SOMAARRAY"

echo "==== MENOR VALOR DIGITADO ===="

MINIMOARRAY=${ARRAY[0]}

for each in "${ARRAY[@]}"
do
    if [ $each -lt $MINIMOARRAY ]
    then
        MINIMOARRAY=$each
    fi
done

echo "O menor valor digitado é: $MINIMOARRAY"

echo "==== MAIOR VALOR DIGITADO ===="

MAXIMOARRAY=${ARRAY[0]}

for each in "${ARRAY[@]}"
do
    if [ $each -gt $MINIMOARRAY ]
    then
        MAXIMOARRAY=$each
    fi
done

echo "O maior valor digitado é: $MAXIMOARRAY"


echo "==== TCHAU!! ====="
