library(dplyr)
library(ggplot2)


# A partir da base de dados mpg e com o auxílio das funções do pacote ggplot2,
# faça o que se pede:
require(ggplot2)
mpgdata <- mpg

# Crie um dataframe dados_grafico com as variáveis quantitativas motor, mpgc e
# mpgr e mais 2 variáveis qualitativas de sua escolha
?mpg
names(mpg) = c("manufacturer", "model", "engine", "year", "cylinders",
               "transmission", "drivetrain", "mpgc", "mpgr", "fuel", "type")

data_plot <- mpg[ , c(3,4,5,8,9)]


## Para cada uma das variáveis qualitativas, faça um gráfico de barras
barplot(table(data_plot$engine))
barplot(table(data_plot$year))
barplot(table(data_plot$cylinders))
barplot(table(data_plot$mpgc))
barplot(table(data_plot$mpgr))


# Para cada uma das variáveis quantitativas, faça um histograma
ggplot(data_plot, aes(x=engine)) + geom_histogram()
ggplot(data_plot, aes(x=year)) + geom_histogram()
ggplot(data_plot, aes(x=cylinders)) + geom_histogram()
ggplot(data_plot, aes(x=mpgc)) + geom_histogram()
ggplot(data_plot, aes(x=mpgr)) + geom_histogram()


# Explore a associação entre cada uma das variáveis do dataframe dados_grafico
# com a variável mpgr
ggplot(data_plot, aes(x = engine, y = mpgr)) +
  geom_point()

ggplot(data_plot, aes(x = factor(year), y = mpgr)) +
  geom_boxplot()

ggplot(data_plot, aes(x = cylinders, y = mpgr)) +
  geom_point()

ggplot(data_plot, aes(x = mpgc, y = mpgr)) +
  geom_point()
