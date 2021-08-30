# EJEMPLO 4. Descarga y lectura de data sets.

# Objetivo
# Fijar y conocer ruta de trabajo
# Lectura de ficheros CSV, locales y en repositorio
# Manejo de objetos

# Requisitos
# R, RStudio
# Prework
# Desarrollo

# Ejecutar las líneas de comando y tratar de comprender que realiza cada parte de sus entradas

# Se pueden obtener diversos data sets de Kaggle, visita el sitio para que te familiarices
# La siguiente es una base de datos de los libros más vendidos en Amazon del 2009 - 2019

# Obtenemos la ruta del directorio de trabajo

getwd()

# Fijando el directorio de trabajo

setwd("D:/0PERSONAL KITZYA/BEDU DATA ANALYSIS/SESION 2 - 12 MAYO") 
# Depende del usuario

# La función read.csv será util para leer fichero .csv

read.csv("bestsellers with categories.csv") # El archivo csv debe estar en el directorio de trabajo

# se puede asignar a un objeto el fichero leido anteriormente

books <- read.csv("bestsellers with categories.csv")
book2 <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-con-R-2021/main/Sesion-01/Data/bestsellers%20with%20categories.csv")

tail(books, 10) #los últimos registros
head(books, 10) #los primeros 10 registros dentro del data frame

tail(books, 10); head(books, 10)

str(books)

#Punto y coma sirve para unir 2 comando

tail(amazon.books); str(amazon.books)


# También se puede leer el fichero directamente desde una URL

data.url <- read.csv("https://www.football-data.co.uk/mmz4281/2021/SP1.csv")
tail(data.url); str(data.url)

# Calculamos la dimensión de la base de datos

dim(books)

# El tipo de objeto se puede saber utilizando class()

class(books)
tamazon <- t(books)
tamazon <- as.data.frame(tamazon)
names(books)
names(tamazon)<-books$Name

which.max(tamazon[ , ])
which.min(tamazon["price", ])


################# Reto 1  #################

# leyendo el fichero desde el repositorio

netflix <-read.csv("https://raw.githubusercontent.com/ecoronadoj/Sesion_1/main/Data/netflix_titles.csv")

# dimensión del data frame
dim(netflix)
class(netflix)
head(netflix,1)

# titulos que se estrenaron despues del 2015 

net.2015 <- netflix[netflix$release_year > 2015, ]

# escritura del archivo
write.csv(net.2015, "res.netflix.csv")
write.csv(net.2015, file = "res.netflix2.csv", row.names = FALSE, quote = TRUE)

dir()




