# 2.1 Medidas de Tendencia Central, de Posición y de Dispersión

# Medidas de Tendencia Central

# En R utilizamos la función mean para calcular la media de un conjunto de
# mediciones, por ejemplo

x = c(4000, 9000, 9000, 10000); mean(x)

# Para calcular la mediana, utilizamos la función median, por ejemplo

median(x)

# Si lo que deseamos es obtener la moda de un conjunto de mediciones, una 
# alternativa es instalar el paquete DescTools en R mediante la instrucción
# install.packages("DescTools"), luego utilizamos la función Mode del paquete
# DescTools

install.packages("DescTools")
library(DescTools)
Mode(x) # mode es diferente de Mode (Case sensitive)

# Medidas de Posición

# En R utilizamos la función quantile para obtener cuantiles muestrales. Por
# ejemplo

x <- c(29, 13, 62, 4, 63, 96, 1, 90, 50, 46)
x.sort <- sort(x,decreasing = F)
x.sort

quantile(x, 0.25) # cuantil del 25%
quantile(x, c(0.25,0.50,0.75)) # Cuartiles
quantile(x, seq(0.1,0.9, by = 0.1)) # Deciles

# Medidas de Dispersión

# Podemos calcular el rango intercuartílico en R con la función IQR, 
# por ejemplo,

IQR(x)
plot(x)

# o bien

quantile(x, probs = 0.75) - quantile(x, probs = 0.25)

# La varianza y desviación estándar muestral en R las calculamos con las 
# siguientes instrucciones respectivamente

var(x)
sd(x)
sd(x)**2 
mean(x)
median(x)

summary(x) #parametros rapidos de un vector

###########  Reto 1   ##############

# Considere el siguiente vector

set.seed(134)

x <- round(rnorm(1000, 175, 6), 1)

# 1. Calcule, la media, mediana y moda de los valores en x
# 2. Obtenga los deciles de los números en x
# 3. Encuentre el rango intercuartílico, la desviación estándar y varianza muestral

# Solución

library(DescTools)

mean(x); median(x); Mode(x)
quantile(x, probs = seq(0.1, 0.9, 0.1))
IQR(x); sd(x); var(x)


