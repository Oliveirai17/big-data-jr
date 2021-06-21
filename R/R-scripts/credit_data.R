#Lendo o arquivo
base = read.csv('credit-data-real.csv')

#excluindo a coluna clientid
base$clientid = NULL

#exibir as descricoes das colunas
summary(base)

#idade negativa
base[base$age < 0,]

#idade negativa colunas de 1 ate 2
base[base$age < 0,1:2]

#idades negativas e (&) N?O(!) NA
base[base$age < 0 & !is.na(base$age),]

idades_inv = base[base$age < 0 & !is.na(base$age),]

#excluir coluna
base1 = base
base1$age = NULL

#Excluir linhas
base2 = base
base2 = base2[base2$age > 0,]

#colocar na m?o
base3 = base
base3[16,2] = 28

#calcular a m?dia e setar com o ifelse
base4 = base
mean(base4$age)
mean(base4$age, na.rm = TRUE)
media = mean(base4$age[base4$age > 0], na.rm = TRUE)
base4$age = ifelse(base4$age < 0, media, base4$age)

#Tratando valores faltantes
base5 = base4
base5[is.na(base5$age), ]
base5$age = ifelse(is.na(base5$age),media,base5$age)

summary(base5)

#Escalonamento de atributos
base6 = base5
# base6 = scale(base6) #PERIGOSO!!
base6[,1:3] = scale(base6[,1:3])

#Encode da Classe (transforma vari?veis categ?ricas em num?ricas - discretas)
base6$default = factor(base6$default, levels = c(0,1))


#Dividindo em Treino e Teste

#install.packages('caTools') s? instala uma vez
library(caTools)

set.seed(1)
divisao = sample.split(base6$default,SplitRatio = 0.75)

divisao

base_treino = subset(base6, divisao == TRUE)
base_teste = subset(base6, divisao == FALSE)


#Constru??o do modelo
install.packages('e1071')
library(e1071)

classif_bayesiano = naiveBayes(x = base_treino[-4], y = base_treino$default)
print(classif_bayesiano)

#Avalia??o do modelo
prev_bayesiano = predict(classif_bayesiano, newdata = base_teste[-4])
print(prev_bayesiano)

matriz_confusao = table(base_teste[,4],prev_bayesiano)
print(matriz_confusao)

#Total de acertos: VP + VN
#Percentual de acertos: ((VP + VN) / 500) * 100
#Total de erros: FP + FN
#Percentual de erros: ((FP + FN) / 500) * 100


install.packages('caret')
library(caret)

confusionMatrix(matriz_confusao)






