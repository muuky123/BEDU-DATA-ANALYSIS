# Comenzamos leyendo un fichero, el cual contiene información sobre dos 
# grupos de control G1 y G2, a los cuales se les realizó a cada uno una 
# medición en 3 momentos diferentes C1, C2 y C3
library(dplyr) # para usar mutate
data <- read.csv("D:/0PERSONAL KITZYA/BEDU DATA ANALYSIS/SESION 3 - 19 MAYO/boxp.csv")

# Revisamos el encabezado del fichero y el nombre de sus variables o columnas

head(data)
names(data)
summary(data)
str(data)

# Observamos algunos datos estadísticos sobre las variables

summary(data)

# Como estamos ante la presencia de NA´s los eliminamos con complete.cases() y solamente seleccionamos aquellos sin NAsy convertimos en factores la variableCategoriayGrupo`

bien <- complete.cases(data)
data <- data[bien,]

data <-na.omit(data)

data <- mutate(data, Categoria = factor(Categoria), Grupo = factor(Grupo))


# Finalmente realizamos el boxplot

ggplot(data, aes(x = Categoria, y = Mediciones, fill = Grupo)) + 
  geom_boxplot() +
  ggtitle("Boxplots") +
  xlab("Categorias") +
  ylab("Mediciones")


# Agregamos el nombre de las etiquetas para los grupos G1 y G2

ggplot(data, aes(x = Categoria, y = Mediciones, fill = Grupo)) + 
  geom_boxplot() +
  scale_fill_discrete(name = "Dos Gps", labels = c("G1", "G2")) + 
  ggtitle("Boxplots") +
  xlab("Categorias") +
  ylab("Mediciones") 

f<-ggplot(data, aes(x = Categoria, y = Mediciones)) + 
  geom_boxplot() +
  scale_fill_discrete(name = "Dos Gps", labels = c("G1", "G2")) + 
  ggtitle("Boxplots") +
  xlab("Categorias") +
  ylab("Mediciones") +
  facet_wrap("grupo")

f

rlang::last_error()
rlang:last_error()

library(plotly)
ggplotly(f)
