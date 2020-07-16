#
# Exercícios do Livro "Six Sigma with R Statistical Engineering for Process Improvement"
# página 46
#

# Ex 2.2

# declara os vetores com os dados
FailureTime <- c(0.29, 0.32, 1.21, 0.95, 0.14, 2, 0.81, 0.88)
Temp <- c(63.89, 63.38, 65.05, 62.31, 68.04, 59.12, 62.80, 61.89)
Factory <- c("A", "B", "C", "C", "B", "B", "A", "B")

# constrói um dataframe com estes vetores
sol_ex2.2 <- data.frame(FailureTime, Temp, Factory = as.factor(Factory))

# mostra um resumo dos dados
print(summary(sol_ex2.2))

# grava um arquivo CSV com o conteudo do dataframe
write.csv(sol_ex2.2, file = "ch02/ch02_ex2_2_r.csv")

# Ex 2.3

# Plota Scatter um gráfico da Temp vs FailureTime
plot(
  sol_ex2.2$Temp, # eixo x: coluna Temp do dataframe 
  sol_ex2.2$FailureTime, # eixo y: coluna FailureTime do dataframe 
  main ="Temp vs FailureTime", # título do gráfico
  xlab = "Temp",  # título eixo x
  ylab = "FailureTime", # título eixo y
  col = "blue", # cor do símbolo
  pch = 17, # 17 -> triângulo - tipo do símbolo (25 opções)
  cex = 2.0, # multiplicador do tamanho dos simbolos, default=1
  cex.axis = 1.5, # multiplicador do tamanho do texto dos eixos, default=1
  cex.main = 2.5, # multiplicador do tamanho do texto do título, default=1
  cex.lab = 1.5, # multiplicador do tamanho do texto do título dos eixos, default=1
)

# Plota um gráfico tipo 'box plot'
boxplot(
  sol_ex2.2$FailureTime ~ sol_ex2.2$Factory,
  main ="FailureTime vs Factory", # título do gráfico
  xlab = "Factory",  # título eixo x
  ylab = "FailureTime",  # título eixo y
  col = "light blue",
  cex.axis = 1.5, # multiplicador do tamanho do texto dos eixos, default=1
  cex.main = 2.5, # multiplicador do tamanho do texto do título, default=1
  cex.lab = 1.5, # multiplicador do tamanho do texto do título dos eixos, default=1    
)

# Plota um gráfico tipo 'histograma'
hist(
  sol_ex2.2$Temp,
  main ="Histograma - Temp", # título do gráfico
  xlab = "Temp",  # título eixo x
  ylab = "Frequency",  # título eixo y  
  col = "light yellow",
  cex.axis = 1.5, # multiplicador do tamanho do texto dos eixos, default=1
  cex.main = 2.5, # multiplicador do tamanho do texto do título, default=1
  cex.lab = 1.5, # multiplicador do tamanho do texto do título dos eixos, default=1
)

# Ex 2.4

# Plota uma tabela com o numero de itens de cada fábrica
table(sol_ex2.2$Factory)

# Vector com as temperaturas correspondentes em que FailureTime é menor que 1
sol_ex2.4 <- sol_ex2.2$Temp[sol_ex2.2$FailureTime < 1]
sol_ex2.4