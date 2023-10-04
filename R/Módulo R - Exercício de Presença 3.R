library(dplyr)
library(nycflights13)
library(readr)

#install.packages("readr")

# Carregar a base de dados de voos
flightsdata <- flights
?flights


# Com o auxílio das funções do pacote dplyr, faça o que se pede:
#getwd()
# (1) Selecione 5 variáveis da base de dados flights e salve no objeto dados
dados <- flightsdata[ , c(1,2,3,4,5)]


# (2) Renomeie as variáveis do dataframe dados e salve no objeto dados1
dados <- dados %>% 
  rename("c1" = "year", "c2" = "month", "c3" = "day", "c4" = "dep_time",
         "c5" = "sched_dep_time")
dados1 <- as.data.frame(dados)

# (3) Ordene o dataframe dados1 de acordo com uma variável de sua escolha e
# salve no objeto dados2
order_var <- order(dados1$c1)
dados2 <- dados1[order_var, ]


# (4) Filtre o dataframe dados2 para remover linhas de seu interesse e
# salve no objeto dados3
dados3 <- dados2[c(100001:336776),]


# (5) Modifique uma coluna do seu interesse do dataframe dados3 e
# salve no objeto dados_final
dados_final <- as.data.frame(dados3)
dados_final$c4[is.na(dados_final$c4)] <- mean(dados_final$c4, na.rm = TRUE)


# (6) Repita esse processo utilizando o operador %>%
dados_new <- as.data.frame(dados3)
dados_new %>% replace(is.na(.), mean(dados3$c4))
