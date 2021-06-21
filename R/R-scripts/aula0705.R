#usando o R como calculadora
a = sqrt(9)
b = sqrt(3*3^2)
c = sqrt((3*3)^2)
d = prod(2,2)
e = prod(2,2,3,4)
f = log(3)
g = log(3,10)
h = factorial(4)

#Objetos e R
idades = c(18,22,37,10,55,21,30,28)
nomes = c('Gabriela','Nelson','Fabrizio')

#exibir
idades
nomes

#tamanhos
length(idades)
length(nomes)

#calculos com vetores
max(idades)
min(idades)
sum(idades)
mean(idades)
idades * 2
idades / 2

#atribuindo os resultados a variáveis
max_idades = max(idades)
min_idades = min(idades)
soma_idades = sum(idades)
media_idades = mean(idades)
idades_x_2 = idades * 2
idades_div_2 = idades / 2


#Acessando posições específicas
idades[4]
nomes[3]

#Acessando mais de uma posição específica
nomes[c(1,2)]

#Adicionando novos valores ao vetor
nomes[4] = 'Gaby'
nomes = c(nomes,'Nel')
nomes[length(nomes)+1] = 'Fa'

#Alterando o valor de uma posição específica
nomes[1] = 'Gaby'

#Excluir um valor
nomes[-1]
idades[-3]

#Gerar dados com distribuição uniforme
nros = runif(10,0,1)
hist(nros)

#ordenar os dados gerados
sort(nros)
sort(nros, decreasing = TRUE)

#outros gráficos
barplot(nros)
plot(nros)
pie(nros)
points(nros, col='blue')
stripchart(nros)

#Transformando vetores em matrizes
vet1 = c(1,2,3,4,5)
vet2 = c(6,7,8,9,0)
cbind(vet1,vet2)
rbind(vet1,vet2)

#Criando e manipulando objetos
matriz = cbind(vet1,vet2)

rowSums(matriz)
colSums(matriz)
rowMeans(matriz)
colMeans(matriz)
mean(matriz)


#Transformando vetores em dataframes
vet1 = c(1,2,3,4,5)
vet2 = c(6,7,8,9,0)
vet3 = c("a","b","c","d","e")
data.frame(vet1,vet2,vet3)





