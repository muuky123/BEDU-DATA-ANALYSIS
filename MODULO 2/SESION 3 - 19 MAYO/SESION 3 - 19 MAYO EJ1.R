# Desarrollo

# Comenzando con gráficos simples; vamos a utilizar el dataset mtcars.

# Instalamos el paquete (si es necesario) y lo cargamos

library(ggplot2)

# Primero recordamos cuales son las variables que contiene el dataset

names(mtcars)

# Graficamos las variables cyl en el eje x y hp en y, observa el comando geom_point()
install.packages("plotly")
library(plotly)

g<- ggplot(mtcars, aes(x=cyl, y = hp, colour = gear )) + 
  geom_point()  # Tipo de geometría, intenta utilizar alguna otra

ggplotly(g)

# Agregando carácteristicas de tema y facewrap

names(mtcars)
ggplot(mtcars, aes(x=cyl, y = hp, colour = mpg )) + 
  geom_point() +   
  theme_gray() +   # Temas (inteta cambiarlo)
  facet_wrap("cyl")  # Lo divide por el núm de cilindros

cars<-mtcars

cars$names<-nom.autos

nom.autos<-row.names(mtcars)  #nombre de los carros

# Agregando nombres a los ejes x, y

names(cars)
p <-ggplot(mtcars, aes(x = cyl, y = hp, colour = mpg )) + 
  geom_point() +   
  theme_gray() +   # Temas (inteta cambiarlo)
  facet_wrap("cyl") +  # Lo divide por el núm de cilindros
  xlab('Núm de cilindros') +  # Nombre en los ejes
  ylab('Caballos de Fuerza')

p

ggplotly(p)

q <-ggplot(cars, aes(x = cyl, y = hp, colour = names )) + 
  geom_point() +   
  theme_gray() +   # Temas (inteta cambiarlo)
  facet_grid("am")  # Lo divide por el núm de cilindros
  
  q
  
  ggplotly(q)
  
  cor(mtcars$hp , mtcars$cyl)
  

# Adicionalmente se pueden realizar otros tipos de gráficos, estos se verán en los próximos ejemplos.

