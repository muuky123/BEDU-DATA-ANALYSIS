# Ejemplo 2. Matrices

# Objetivo

# Crear nuevas matrices
# Extraer datos dentro de una matriz
# Calcular sus dimensiones
# Realizar operaciones básicas entre matrices

# Requisitos

# Tener instalados R y RStudio
# Haber estudiado el Prework

# Desarrollo

# Se debe seguir el código propuesto y tratar de compreder que es lo que realiza

# Crear Matrices. 

(m <- matrix(1:9, nrow = 3, ncol = 3))
(m <- matrix(1:9, 3, 3))

# Extrayendo la primera entrada

m[1,1]
m[3,2]

# Extrayendo la primer columna, con todas sus filas

m[ ,1] #todas las filas
m[3, ] #fila 3, todas las columnas
m[ ,2] #todas las filas de la culmna 2

# ¿Qué sucede si se suma un vector y una matriz?

(sum.vecmat <- c(1, 2) + m)

# Creando otra matriz

(n <- matrix(2:7, 4, 6))
#llena columna x columna y va repitiendo

# Podemos conocer la dimensión de la matriz así

dim(n) #primera entrada nos da referencia a las filas y la segunda a las columnas

# Extrayendo subconjuntos de la matriz

n[n > 6] #me da los números mayores a 6

# Ahora veremos como localizar la posición de las entradas anteriores

which(n > 6) #cuáles son las posiciones dentro de la matriz (tabla) de los números mayores a 6

# Uniendo Vectores para formar una matriz

a <- 2:6
b <- 5:9
a+b

# Construyendo la matriz utilizando la función cbind, para unirlos por culumna

ab <- cbind(a,b)
class(ab)
t(ab)
t(t(ab))
ab

# Construyendo la matriz utilizando la función rbind, para unirlos por fila

n<-rbind(a,b)
n

# Aplicando una función a las filas o columnas de una matriz (mean, sort)

mc <- apply(n, 2, mean)
mf <- apply(n, 1, mean)
apply(n, 1, sort)

round (mc,0)

apply(n,2,sort)

mean(n)

# Algunas operaciones básicas de matrices

# Producto matricial: A %*% B
# Producto elemento a elemento: A*B
# Traspuesta: t(A)
# Determinante: det(A)
# Extraer la diagonal: diag(A)
# Resolver un sistema de ecuaciones lineales (( Ax=b )): solve(A,b)
# Inversa: solve(A)
# Autovalores y autovectores: eigen(A)