#bibliotecas
library(caTools)
library(e1071)
library(caret)

#criando vetores de numeros inteiros
#a = c(1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37,39)
#b=c(3,5,7,9,12,15,17,19,20,21,21,20,19,17,15,12,9,7,5,3)
a=c(1,3,5,7,9 ,11,13,15,17,19,21,23,25,27,29,31,33,35,37,39)
b=c(3,5,7,9,12,15,17,19,20,21,21,20,19,17,15,12,11,12,13,15)

#juntando os vetores em um dataframe
treino = data.frame(a,b)
print(treino)

#Plotando
plot(treino,pch=16, col='blue')

#construindo o modelo de regressao linear
model_linear = lm(b ~ a, treino)

#predições
pred_linear = predict(model_linear,treino)

points(treino$a, pred_linear, col='red', pch = 4)

mae_linear = mean(sqrt((treino$b - pred_linear)^2))

mse_linear = mean((treino$b - pred_linear)^2)

rmse_linear =sqrt(mean((treino$b - pred_linear)^2))

rmse_linear

#aplicando o modelo em uma base de teste

#c=c(2,4,6,8 ,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40)
#d=c(4,6,8,10,12,15,17,19,20,21,20,19,17,15,12,10,8,6,4,2)

c=c(2,4,6,8 ,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40)
d=c(4,6,8,10,12,15,17,19,20,21,20,19,17,15,12,11,12,13,15,17)

teste = data.frame(c,d)

points(teste$c, teste$d, col = "red", pch=16)


pred_linear_2 = predict(model_linear, teste)

points(teste$c, pred_linear, col = "black", pch=4)

rmse_linear_2 = sqrt(mean((teste$d - pred_linear_2)^2))

rmse_linear_2

#SVM

model_svm = svm(b ~ a , treino)
pred_svm = predict(model_svm, treino)

points(treino$a, pred_svm, col = "black", pch=4)

rmse_svm = sqrt(mean((treino$b - pred_svm)^2))

pred_svm2 = predict(model_svm, teste)

points(teste$c, pred_svm2, col = "pink", pch=4)

rmse_svm2 = sqrt(mean((teste$d - pred_svm2)^2))

rmse_svm2  