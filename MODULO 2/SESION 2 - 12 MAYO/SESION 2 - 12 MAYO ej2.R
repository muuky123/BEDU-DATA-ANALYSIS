# 2.1 Características de los objetos (str sobre df, summary, head y view) y funciones

# Función str

# str es una función que muestra de manera compacta la estructura interna 
# de un objeto de R. Por ejemplo, si usamos como argumento de str el 
# conjunto de datos iris que podemos encontrar en R

str(iris)

unique(iris$Species)

# entonces la salida de la instrucción nos muestra el tipo de objeto, 
# número de observaciones y de variables, así como el tipo de dato al 
# que corresponde cada variable.

# Función summary

# La función summary es una función genérica usada para obtener resumenes 
# de diferentes objetos de R, por ejemplo

summary(1:100)
summary(mtcars)
summary(iris)
?mtcars
str(mtcars)

# También es útil para obtener resumenes de los resultados de diferentes
# ajustes a modelos

set.seed(57)
x <- rnorm(35)
e <- rnorm(35)
y <- 5 + 2*x + e
modelo <- lm(y~x)
summary(modelo)

# Función head

# La función head devuelve la primera parte de un data frame, tabla, 
# matriz, vector o función. Por ejemplo, al usar el data frame mtcars
# como argumento de la función head, se devolverán únicamente las
# primeras seis filas del data frame

head(mtcars)

# la función tail funciona de manera similar, pero en lugar de devolver
# la primera parte de un objeto, devuelve la última parte de este,
# por ejemplo, al ejecutarse la siguiente instrucción

tail(mtcars)

# se devolverán las últimas seis filas del data frame

# Función view

# La función View aplicada a un objeto de R como un data frame, 
# invoca un visor de datos al estilo de una hoja de cálculo, por ejemplo

View(iris)

# Función que calcula la moda

# En R también podemos crear nuestras propias funciones, por ejemplo

nombre <- function(nombre del vector)

moda <- function(vector){
  f.abs <- table(vector) # frecuencias absolutas
  max.f.abs <- max(f.abs) # obtenemos la máxima frecuencia absoluta
  pos.max <- which(f.abs == max.f.abs) # posición(es) de la(s) máxima(s) frecuencia(s) absoluta(s)
  print("La(s) moda(s) es(son): ")
  print(names(f.abs[pos.max]))
  paste("Con una frecuencia de: ", unique(as.vector(f.abs[pos.max])))
}

x <- sample(1:100, 100, replace = T) # Tomamos una muestra aleatoria de tamaño 100 con reemplazo de los primeros 100 números naturales
table(x) # obtenemos las frecuencias absolutas de los valores de la muestra
f.abs <-table(x)
max.f.abs<-max(f.abs)
pos.max <- which(f.abs==max.f.abs)

names(f.abs[pos.max])
paste("la moda es" moda)   

moda(x) # obtenemos la moda de los valores de la muestra


################### Reto 2.  #####################3

# Considere el data frame `mtcars` de `R` y utilice las funciones `str`, 
# `summary`, `head` y `View` para observar las características del objeto
# y tener una mayor comprensión de este.

# Crea una función que calcule la mediana de un conjuntos de valores, sin utilizar la función median

# Solución

# 1. 

str(mtcars)
summary(mtcars)
head(mtcars)
View(mtcars)

# 2. 

mediana <- function(vector){
  n <- length(vector) # Número de elementos del vector
  vector <- sort(vector) # Ordenamos los valores de menor a mayor
  if(n%%2 == 0){ # Si el número de elementos es par hacemos lo siguiente
    paste("La mediana es: ", mean(vector[c(n/2, n/2+1)])) 
  } else{ # De otra manera hacemos lo siguiente
    paste("La mediana es: ", vector[round(n/2)])
  }
  
}

mediana(1:10)
mediana(1:11)

  
  ----------------------------------------------------------
  
  medianna <- function(vector){
    
    Ordenado <- sort(vector,decreasing = FALSE )
    x <- length(vector)
    if (x%%2==0){
      
      print(mean(Ordenado[c(x/2, x/2+1)]))
      
    }else{
      
      print(Ordenado[round(x/2)])
      
    }
    
  }

  
  medianna(1:11)
  
  