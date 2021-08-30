# Ejemplo 6. Funciones `na.omit` y `complete.cases`

# Ahora vamos a considerar el conjunto de datos `airquality`, observamos primero
# algunas de sus filas

head(airquality)
library(dplyr)

# El tipo de objeto que es y el tipo de variables que contiene

str(airquality)

# observamos la dimensión

dim(airquality)
summary(airquality)
view(airquality)

# Con la función `complete.cases` podemos averiguar cuales son aquellas filas
# que no contienen ningún valor perdido (NA) y cuales son aquellas filas
# que tienen al menos un valor perdido.

bien <- complete.cases(airquality)

# La variable bien, es un vector lógico con `TRUE` en las posiciones que 
# representan filas de `airquality` en donde no hay NA's y con `FALSE`
# en las posiciones que representan aquellas filas de `airquality` en donde
# se encontraron NA's

# Por tanto, podemos contar el número de filas en donde no hay NA´s de la 
# siguiente manera

sum(bien)

# Podemos filtrar aquellas filas sin NA's de la siguiente manera

mean(airquality$Solar.R)

s.na<-airquality[bien,]

summary(s.na)

mean(s.na$Ozone)
mean(s.na$Solar.R)

str(s.na)

data <- select(airquality, Ozone:Temp)
names(data)

apply(data, 2, mean)
apply(data, 2, mean, na.rm = T)

# `na.omit` devuelve el objeto con casos incompletos eliminados

(m1 <- apply(na.omit(data), 2, mean))

b <- complete.cases(data)

(m2 <- apply(data[b,], 2, mean))

identical(m1, m2)

##################### Reto 3.#####################################

# Descargue los archivos csv que corresponden a las temporadas 2017/2018, 2018/2019, 2019/2020 y 2020/2021 
# de la Bundesliga 1 y que se encuentran en el siguiente enlace https://www.football-data.co.uk/germanym.php

# Importe los archivos descargados a R

# Usando la función select del paquete dplyr, seleccione únicamente las columnas Date, HomeTeam, AwayTeam,
# FTHG, FTAG y FTR

# Combine cada uno de los data frames en un único data frame con ayuda de las funciones rbind y do.call

# Solución

# Primero podemos establecer un directorio de trabajo en donde se descargarán nuestros datos

suppressWarnings(suppressMessages(library(dplyr)))

# Ahora guardamos como cadena de caracteres los enlaces de los archivos que nos interesan

B1.2021 <- "https://www.football-data.co.uk/mmz4281/2021/D1.csv"
B1.1920 <- "https://www.football-data.co.uk/mmz4281/1920/D1.csv"
B1.1819 <- "https://www.football-data.co.uk/mmz4281/1819/D1.csv"
B1.1718 <- "https://www.football-data.co.uk/mmz4281/1718/D1.csv"

# Con ayuda de la función `download.file` descargamos los archivos en el directorio previamente elegido

download.file(url = B1.2021, destfile = "B1.2021.csv", mode = "wb")
download.file(url = B1.1920, destfile = "B1.1920.csv", mode = "wb")
download.file(url = B1.1819, destfile = "B1.1819.csv", mode = "wb")
download.file(url = B1.1718, destfile = "B1.1718.csv", mode = "wb")

# Importamos los datos a R

lista <- lapply(list.files(), read.csv)

# Seleccionamos únicamente las columnas de interés

lista <- lapply(lista, select, Date, HomeTeam:FTR)

data <- do.call(rbind, lista)
head(data); tail(data)


------------------------------------------------

setwd("D:/0PERSONAL KITZYA\BEDU DATA ANALYSIS/SESION 2 - 12 MAYO/archivos reto 3")   
  

dir()

fut.lista <- lapply(dir(), read.csv)
fut.lista2 <- lapply(fut.lista, select, Date:FTR)

str(fut.lista)
str(fut.lista2)

head(fut.lista2)
head(fut.lista[[1]]); head(fut.lista[[2]]); head(fut.lista[[3]]); head(fut.lista[[4]])

dim(fut.lista[[4]])

combinado <- do.call(rbind, fut.lista2)

str(combinado)
dim(combinado)

