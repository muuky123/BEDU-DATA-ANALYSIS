# EJEMPLO 6. Loops y pseudocódigo: for, while, if, else, if-else

# Objetivo
# Conocer la inicialización de variables
# Ejecutar un loop, for, while, if y if-else

# Requisitos
# R, RStudio
# Prework

# Desarrollo
# Durante este ejemplo se darán las bases para inicializar una variable que sea utilizada dentro de un loop, adicionalmente se utilizaran los comandos while, if y if-else para poder utilizarlos adecuadamente

# Este ejemplo elevará al cuadrado las primeras 10 entradas de un vector generado aleatóriamente de 20 entradas

w <- rnorm(20)              
print("Este loop calcula el cuadrado de los 10 primeros elementos del vector w")

# inicializando la varialbe wsq

wsq <- 0

for(i in 1:20) {
  wsq[i] <- w[i]**2
  print(wsq[i])
              }

# Los bucles WHILE comienzan comprobando una condición. Si esta es verdadera, entonces se entra al cuerpo del bucle. Una vez completada una ejecución de este bloque, se comprueba la condición nuevamente y así sucesivamente hasta que la comprobación de la condición de falso.

# while(<condicion>) {
#                     código
#                     ...
#             }

# Ejemplo:

count <- 0
while(count < 10) {
 
  count <- count + 1
  print(count)
                  }

# Pseudocódigo para IF - ELSE

# if(<condicion>) {
## bloque de código
# }

## Continua con el resto del código

# if(<condicion>){
## bloque de código
#               } else {
## otro bloque de código
#                      }

# if(<condition1>) {
## bloque de código
#                 } else if(<condicion2>) {
## otro bloque de código
#                                        } else {
## otro bloque de código
#                                               }

# Ejemplo

x <- runif(1, 0, 10) ## creamos un número aleatorio entre 0 y 10
if(x > 5) {
  y <- TRUE
} else {
  y <- FALSE
}
x; y


if(x > 5) {
  paste(round(x,2), ">",5, "Entonces es:", TRUE)
} else {
  paste(round(x,2), "<",5, "Entonces es:", FALSE)
}
x; y

if(x > 5) {
  paste( round(x, 2), ">",5, "Entonces es:", TRUE, "no se cumple que x>5")
} else {
  paste(round(x, 2), "<",5, "Entonces es:", FALSE, "no se cumple que x<5")
}



# De este modo estamos asignando un valor a una variable en función del valor de otra. Lo que se debe tener en cuenta es que la condición debe retornar un valor TRUE o FALSE.




########## Reto 2  #################

amazon.best <- read.csv("https://raw.githubusercontent.com/ecoronadoj/Sesion_1/main/Data/bestsellers%20with%20categories.csv")

# Convirtiendo el DF a transpuesto y en un data frame 
tAmazon <- as.data.frame(t(amazon.best))

# Usando el nombre de los libros como el nombre de las columnas
colnames(tAmazon) <- tAmazon[1,]

row.names(tAmazon)

# libro con mayor precio
which.max(tAmazon["Price",])

# libro con menor precio
which.min(tAmazon["Price",])


############ Reto 3 #####################33

# generando el vector de 44 posiciones aleatorio

ran <- rnorm(44)
ran

# creando el loop que eleva al cubo y suma 12 a cada posición 
el <- vector()
for (i in 1:15) {
  el[i] <- (ran[i]^3) + 12
  print(el)
}

# Se almacenan los valores en un data frame
df.al <- data.frame(ran = ran[1:15], 
                    val = el)
df.al
class(df.al)

# pseudocódigo 

# ran <- {se genera el vector con rnorm de 44 entradas}
# 
# el <- {se inicializa un vector donde se almacenará el resultado}
# 
# for (contador desde 1 hasta 15 ){
#   el[contador] <- operación aritmética
#   se imprime el resultado (el)
# }