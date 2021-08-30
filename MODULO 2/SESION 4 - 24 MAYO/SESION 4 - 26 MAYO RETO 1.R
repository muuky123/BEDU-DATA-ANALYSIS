# Reto 1. Distribuciones binomial, normal y t de Student

#### Distribución binomial

# Consideremos un experimento binomial con n = 35 pruebas idénticas e independientes, en donde la probabilidad de éxito en cada prueba es p = 0.51. Encuentre lo siguiente: 

# 1. La probabilidad de observar exactamente 10 éxitos
# 2. La probabilidad de observar 10 o más exitos
# 3. El cuantil de orden 0.5
# 4. Genere una muestra aleatoria de tamaño 1000 de esta distribución, construya una tabla de frecuencias relativas con los resultados y realice el gráfico de barras de los resultados que muestre las frecuencias relativas.

# **Solución**

dbinom(x = 10, size = 35, prob = 0.51)
pbinom(q = 9, size = 35, prob = 0.51, 
       lower.tail = FALSE) 
qbinom(p = 0.5, size = 35, prob = 0.51)

set.seed(756)
mue <- rbinom(n = 1000, size = 35, prob = 0.51)
muedf <- as.data.frame(table(mue)/length(mue))
tail(muedf)

ggplot(muedf, aes(x = mue, y = Freq)) + 
  geom_bar (stat="identity", position = "dodge")



#### Distribución normal

# Considere una variable aleatoria normal con media 110 y desviación estándar 7. Realice lo siguiente:

# 1. Grafique la función de densidad de probabilidad
# 2. Encuentre la probabilidad de que la v.a. sea mayor o igual a 140
# 3. Encuentre el cuantil de orden 0.95
# 4. Genere una muestra aleatoria de tamaño 1000 y realice el histograma de frecuencias relativas para esta muestra

# **Solución**

x <- seq(80, 140, 0.1)
y <- dnorm(x = x, mean = 110, sd = 7)

datosx <- data.frame(x, y)

dat <- ggplot(datosx, aes(x, y)) + geom_line()
dat

pnorm(140, mean = 110, sd = 7, lower.tail = FALSE)
qnorm(0.95, mean = 110, sd = 7)

set.seed(19)
mue2 <- rnorm(1000, mean = 110, sd = 7) 
mue2df <- as.data.frame(mue2)

ggplot(mue2df, aes(mue2)) + 
  geom_histogram(colour = 'red', 
                 fill = 'blue',
                 alpha = 0.8, # Intensidad del color fill
                 binwidth = 3.5) + 
  geom_density(aes(y = 3.5*..count..))+
  geom_vline(xintercept = mean(mue2), 
             linetype="dashed", color = "black") + 
  ggtitle('Histograma para la muestra normal') + 
  labs(x = 'Valores obtenidos', y = 'Frecuencia')+
  theme_dark() +
  theme(plot.title = element_text(hjust = 0.5, size = 16))
