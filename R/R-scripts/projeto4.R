#Lendo o arquivo
base = read.csv('census (2).csv')


#excluindo as colunas
base$X = NULL
base$capital.loos = NULL
base$capital.gain = NULL


#Encodes das colunas 
base1 = base

base1$sex = factor(base1$sex)

base1$workclass = factor(base1$workclass)

base1$education = factor(base1$education)

base1$marital.status = factor(base1$marital.status)

base1$occupation = factor(base1$occupation)

base1$relationship = factor(base1$relationship)

base1$race = factor(base1$race)

base1$native.country = factor(base1$native.country)

base1$income = factor(base1$income)

#Escalonamento
base2 = base1
base2[,1] = scale(base2[,1])
base2[,3] = scale(base2[,3])
base2[,5] = scale(base2[,5])
base2[,11] = scale(base2[,11])

#Dividindo em treino e teste

library('caTools')
set.seed(1)

divisao = sample.split(base2$income , SplitRatio = 0.75)
treino = subset(base2, divisao == TRUE)
teste = subset(base2, divisao == FALSE)

#Construção do modelo

library(e1071)

classif_bayesiano = naiveBayes(x=treino[-13],y=treino$income)
print(classif_bayesiano)

#Avaliação do modelo
prev_bayesiano = predict(classif_bayesiano, newdata = teste[-13])
print(prev_bayesiano)

matriz_confusao = table(teste[,13],prev_bayesiano)
print(matriz_confusao)

library(caret)
#matriz de confusao
confusionMatrix(matriz_confusao)
