# Danyllo Henrique Verri Santana
# data: 10/05/2021

# Leitura da base de dados
base = read.csv('census.csv')

# Atributo "x" removido removido do dataset, pois não é util como variavel categórica.
base$X = NULL
base$capital.gain = NULL
base$capital.loos = NULL

# Escalonamento das variaveis numéricas
base[,1] = scale(base[,1])
base[,3] = scale(base[,3])
base[,5] = scale(base[,5])
base[,11] = scale(base[,11])

#  Encode das variaveis categóricas (workclass, education, marital, occupation,
#  relationship, race, sex, native.country, income))'''

base$workclass = factor(base$workclass)
base$education = factor(base$education)
base$marital.status = factor(base$marital.status)
base$occupation = factor(base$occupation)
base$relationship = factor(base$relationship)
base$race = factor(base$race)
base$sex = factor(base$sex)
base$native.country = factor(base$native.country)
base$income = factor(base$income)

# Treinamento e Teste
library(caTools)
set.seed(1) # Setando a semente dos valores aleatórios
divisao = sample.split(base$income, SplitRatio = 0.66) # Divisão treino e teste
base_treino = subset(base, divisao == TRUE)
base_test = subset(base, divisao == FALSE)

# FASE 1: Construção do modelo
library(e1071) # Import do package

# Modelo NaiveBayes utilizado no dataset pré-processado
classif_bayesiano = naiveBayes(x=base_treino[-5], y=base_treino$income)
print(classif_bayesiano) # Impressão do resultado

# Avaliação do modelo
prev_bayesiano = predict(classif_bayesiano, newdata = base_test[-1])
print(prev_bayesiano)

# Matriz confusão
matriz_confusao = table(base_test[ , 13], prev_bayesiano) # Matriz confusão atravez da previsão bayesiana
print(matriz_confusao)

# Import da biblioteca de avaliação de matriz confusão
library(caret)

confusionMatrix(matriz_confusao) # Avaliação da matriz
