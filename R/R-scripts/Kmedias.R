library (datasets)
base_iris = iris

library(ggplot2) # biblioteca para graficos

ggplot(iris,aes(Petal.Length,Petal.Width,color=Species))+geom_point()

set.seed(20)
#define um valor para a semente
#a função kmeans recebe apenas os parâmetros relacionados a petal
#definimos 3 clusters, sabemos que são apenas 3 categorias

irisClusters = kmeans(iris[,3:4],3,nstart = 20)
irisClusters

table(irisClusters$cluster, iris$Species)

irisClusters$cluster = as.factor(irisClusters$cluster)
ggplot(iris,aes(Petal.Length, Petal.Width, color = irisClusters$cluster)) + geom_point()



