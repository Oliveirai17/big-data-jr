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


library(caTools)
library(e1071)
library('caret')

classIdx = ncol(base3)
folds = createFolds(base3[,classIdx],10,FALSE)

melhor_acuracia = 0
fold_melhor_acuracia = -1
melhor_base_treino = 0
melhor_base_teste = 0
melhor_modelo = 0

for (i in 1:10){
  base_treino = (base3[folds != i,])
  base_teste = (base3[folds == i, ])
  
  classif_svm = svm(formula = default ~ ., data = base_treino, type = 'C-classification',kernel = 'linear', cost = 10)
  prev_svm = predict(classif_svm, newdata = base_teste[-4])
  matriz_confusao = table(base_teste[ , 4], prev_svm)
  result_cm = confusionMatrix(matriz_confusao)
  print(result_cm)
  
  result_cm = confusionMatrix(matriz_confusao)
  resumo_cm = result_cm$overall
  print(resumo_cm)
  acuracia_cm = resumo_cm['Accuracy']
  print(acuracia_cm)
  
  if(acuracia_cm > melhor_acuracia){
    melhor_acuracia = acuracia_cm
    fold_melhor_acuracia = i
    melhor_base_teste = base_teste
    melhor_base_treino = base_treino
    melhor_modelo = classif_svm
  }
  
}


print(melhor_acuracia)
print(fold_melhor_acuracia)
print(melhor_base_treino)
print(melhor_base_teste)
print(melhor_modelo)


