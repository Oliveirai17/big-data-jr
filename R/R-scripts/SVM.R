#Lendo o arquivo
base = read.csv('credit-data-real.csv')

#excluindo a coluna clientid
base$clientid = NULL


#calcular a m?dia e setar com o ifelse
base2 = base
mean(base2$age)
mean(base2$age, na.rm = TRUE)
media = mean(base2$age[base2$age > 0], na.rm = TRUE)
base2$age = ifelse(base2$age < 0, media, base2$age)

summary(base2)

#Tratando valores faltantes
base3 = base2
base3[is.na(base3$age), ]
base3$age = ifelse(is.na(base3$age),media,base3$age)

summary(base3)

#Escalonamento de atributos
base3[,1:3] = scale(base3[,1:3])

#Encode da Classe (transforma variaveis categoricas em numericas - discretas)
base3$default = factor(base3$default, levels = c(0,1))

#Dividindo em Treino e Teste

#install.packages('caTools') s? instala uma vez
library(caTools)

set.seed(1)
divisao = sample.split(base3$default,SplitRatio = 0.75)

divisao

base_treino = subset(base3, divisao == TRUE)
base_teste = subset(base3, divisao == FALSE)


library(e1071)

classif_svm = svm(formula=default~.,data=base_treino,type='C-classification',kernel='linear',cost=1)
print(classif_svm)

prev_svm = predict(classif_svm,newdata = base_teste[-4])
print(prev_svm)

matriz_confusao = table(base_teste[,4],prev_svm)
print(matriz_confusao)


library('caret')

confusionMatrix(matriz_confusao)

#Kernel = polynomial
baseply = base3

classif_svmply = svm(formula=default~.,data=base_treino,type='C-classification',kernel='polynomial',cost=0.2)
print(classif_svmply)

prev_svmply = predict(classif_svmply,newdata = base_teste[-4])
print(prev_svmply)

matriz_confusaoply = table(base_teste[,4],prev_svmply)
print(matriz_confusaoply)

confusionMatrix(matriz_confusaoply)


#Kernel = radial
baserdl = base3

divisao2 = sample.split(base3$default,SplitRatio = 0.85)

base_treino2 = subset(base3, divisao2 == TRUE)
base_teste2 = subset(base3, divisao2 == FALSE)


classif_svmrdl = svm(formula=default~.,data=base_treino2,type='C-classification',kernel='radial',cost=10)


prev_svmrdl = predict(classif_svmrdl,newdata = base_teste2[-4])


matriz_confusaordl = table(base_teste2[,4],prev_svmrdl)


confusionMatrix(matriz_confusaordl)
  
#Kernel = sigmoid
basesmd = base3

classif_svmsmd = svm(formula=default~.,data=base_treino,type='C-classification',kernel='sigmoid',cost=1)


prev_svmsmd = predict(classif_svmsmd,newdata = base_teste[-4])


matriz_confusaosmd = table(base_teste[,4],prev_svmsmd)


confusionMatrix(matriz_confusaosmd)