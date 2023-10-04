library(dplyr)
library(ggplot2)

# A partir da base de dados mpg e com o auxílio das funções do pacote ggplot2,
# faça o que se pede:

require(ggplot2)
mpgdata <- mpg

# Crie um dataframe dados_ajuste com a variável mpgr e mais 2 variáveis
# quaisquer da base mpg
?mpg
names(mpg) = c("manufacturer", "model", "engine", "year", "cylinders",
               "transmission", "drivetrain", "mpgc", "mpgr", "fuel", "type")

data_adjustment <- mpg[ , c(3,4,9)]


# Faça uma análise das variáveis individualmente
ggplot(data_adjustment, aes(x = mpgr)) +
  geom_histogram(bins = 8)

ggplot(data_adjustment, aes(x = engine)) +
  geom_histogram(bins = 15)

ggplot(data_adjustment, aes(x = factor(year))) +
  geom_bar()

# Explore a associação entre cada uma das variáveis do dataframe dados_ajuste
# com a variável mpgr
ggplot(data_adjustment, aes(x = engine, y = mpgr)) +
  geom_point()

ggplot(data_adjustment, aes(x = factor(year), y = mpgr)) +
  geom_boxplot()


# Ajuste modelos de regressão

data_adjustment %>% group_by(year) %>% summarise(mean(mpgr))

reg_a = lm(mpgr ~ factor(year), data = data_adjustment)
summary(reg_a)

reg_e = lm(mpgr ~ engine, data = data_adjustment)
summary(reg_e)

reg_e_a = lm(mpgr ~ engine + factor(year), data = data_adjustment)
summary(reg_e_a)


# Escolha o melhor modelo através do AIC
AIC(reg_a, reg_e, reg_e_a)
