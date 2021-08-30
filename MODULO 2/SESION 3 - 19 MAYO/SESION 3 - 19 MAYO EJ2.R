library(dplyr) # Para usar el operador %>%
library(ggplot)
library(ggplot2)
data <- read.csv("D:/0PERSONAL KITZYA/BEDU DATA ANALYSIS/SESION 3 - 19 MAYO/boxp.csv")
head(data)
names(data)

install.packages("ggplot2")

# Utilizando la función hist

hist(data$Mediciones)
summary(data)

hist(data$Mediciones, breaks = seq(0,300, 20), 
     main = "Histograma de Mediciones",
     xlab = "Mediciones",
     ylab = "Frecuencia")

# Ahora utilizando ggplot para apreciar los resultados de las dos funciones

# Evitar el Warning de filas con NA´s

data <- na.omit(data) 

ggplot(data, aes(Mediciones)) +
  geom_histogram(binwidh = 15)  #forma tradicional de hacer graficar

g<-data %>%
  ggplot() + 
  aes(Mediciones) +
  geom_histogram(binwidth = 15) #es otra manera de hacer el histograma

g
ggplotly(g)

table(data$Mediciones)

# Agregando algunas etiquetas y tema, intenta modificar algunas de las opciones para que aprecies los resultados

data %>%
  ggplot() + 
  aes(Mediciones) +
  geom_histogram(binwidth = 10, col="black", fill = "blue") + 
  ggtitle("Histograma de Mediciones") +
  ylab("Frecuencia") +
  xlab("Mediciones") + 
  theme_light()

# Tanto hist(), como ggplot() + aes() + geom_histogram() son útiles para generar los histogramas, tu decide cual te funciona mejor.



