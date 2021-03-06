# Danyllo Henrique Verri Santana
# data: 10/05/2021

# Leitura da base de dados
base = read.csv('census.csv')

# Atributo "x" removido removido do dataset, pois n�o � util como variavel categ�rica.
base$X = NULL
base$capital.gain = NULL
base$capital.loos = NULL

# Escalonamento das variaveis num�ricas
base[,1] = scale(base[,1])
base[,3] = scale(base[,3])
base[,5] = scale(base[,5])
base[,11] = scale(base[,11])

#  Encode das variaveis categ�ricas (workclass, education, marital, occupation,
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
set.seed(1) # Setando a semente dos valores aleat�rios
divisao = sample.split(base$income, SplitRatio = 0.66) # Divis�o treino e teste
base_treino = subset(base, divisao == TRUE)
base_test = subset(base, divisao == FALSE)

# FASE 1: Constru��o do modelo
library(e1071) # Import do package

# Modelo NaiveBayes utilizado no dataset pr�-processado
classif_bayesiano = naiveBayes(x=base_treino[-5], y=base_treino$income)
print(classif_bayesiano) # Impress�o do resultado

# Avalia��o do modelo
prev_bayesiano = predict(classif_bayesiano, newdata = base_test[-1])
print(prev_bayesiano)

# Matriz confus�o
matriz_confusao = table(base_test[ , 13], prev_bayesiano) # Matriz confus�o atravez da previs�o bayesiana
print(matriz_confusao)

# Import da biblioteca de avalia��o de matriz confus�o
library(caret)

confusionMatrix(matriz_confusao) # Avalia��o da matriz
