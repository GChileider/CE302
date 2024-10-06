Queimadas_Q1 <- read.csv("C:/Users/Gabriel Chileider/Downloads/Queimadas1.csv")
head(Queimadas_Q1)
Queimadas_Q2 <- read.csv("C:/Users/Gabriel Chileider/Downloads/Queimadas2.csv")
head(Queimadas_Q2)
Queimadas_Q3 <- read.csv("C:/Users/Gabriel Chileider/Downloads/Queimadas3.csv")
head(Queimadas_Q3)

str(Queimadas_Q1)
str(Queimadas_Q2)
str(Queimadas_Q3)


# Unindo os três bancos de dados
Queimadas <- rbind(Queimadas_Q1, Queimadas_Q2, Queimadas_Q3)
head(Queimadas)

str(Queimadas)


dim(Queimadas)


write.csv(Queimadas, "C:/Users/Gabriel Chileider/Downloads/Queimadas.csv", row.names = FALSE)


#Imprima na tela as 9 primeiras observações.

head(Queimadas, 9)

#Imprima as últimas 3 observações.

tail(Queimadas, 3)

#Quantas observações temos?

nrow(Queimadas)

#Quantas variáveis temos?

ncol(Queimadas)

#Apresente o sumário dos dados.

summary(Queimadas)

#Apresente a estrutura dos dados.

str(Queimadas)

#Quantos biomas estão sendo afetados?

length(unique(Queimadas$bioma))

#tipos de biomas?

unique(Queimadas$bioma)

#Qual a média de avg_numero_dias_sem_chuva para os estados da região sul e da região norte?

install.packages("dplyr")
library(dplyr)
estados_sul <- c("PARANÁ", "SANTA CATARINA", "RIO GRANDE DO SUL")

estados_norte <- c("AMAZONAS", "RORAIMA", "AMAPÁ", "PARÁ", "TOCANTINS", "RONDÔNIA", "ACRE")

#média de avg_numero_dias_sem_chuva  estados sul
Queimadas %>% 
  filter(estado %in% estados_sul) %>% 
  summarise(media = mean(avg_numero_dias_sem_chuva, na.rm = TRUE))

#Outro jeito 
mean(Queimadas$avg_numero_dias_sem_chuva[Queimadas$estado %in% estados_sul], na.rm = TRUE)

#média de avg_numero_dias_sem_chuva  estados norte

Queimadas %>% 
  filter(estado %in% estados_norte) %>% 
  summarise(media = mean(avg_numero_dias_sem_chuva, na.rm = TRUE))

#outro jeito
mean(Queimadas$avg_numero_dias_sem_chuva[Queimadas$estado %in% estados_norte], na.rm = TRUE)


#agora media de avg_numero_dias_sem_chuva dos estados da região sul e da região norte ao mesmo tempo

Queimadas %>% 
  filter(estado %in% c(estados_sul, estados_norte)) %>% 
  summarise(media = mean(avg_numero_dias_sem_chuva, na.rm = TRUE))

#Outro jeito

mean(Queimadas$avg_numero_dias_sem_chuva[Queimadas$estado %in% c(estados_sul, estados_norte)], na.rm = TRUE)

