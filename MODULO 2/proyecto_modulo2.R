
setwd("D:/0PERSONAL KITZYA/BEDU DATA ANALYSIS/PROYECTO MODULO 2")

read.csv("https://gist.githubusercontent.com/muuky123/3fe35b7a0440f894a91dedb143c9df91/raw/f31cce1144abbe1325fae96ba645bf26be1b0d70/Ventas%2520impulsa%25202020_corregido_csv.csv")

library(ggplot2)
library (plotly)
library(foreign)
library(lubridate)
library (tidyverse)
library (dplyr)

data <- as.data.frame(read.csv("https://gist.githubusercontent.com/muuky123/3fe35b7a0440f894a91dedb143c9df91/raw/f31cce1144abbe1325fae96ba645bf26be1b0d70/Ventas%2520impulsa%25202020_corregido_csv.csv"))
summary(data)
names(data)
class (data)
str(data)
na.omit(data)

mutate(data$fecha_venta, format = "YYYY/mm/dd")
data2 <- data %>% mutate_at(vars(fecha_firma,fecha_venta,inicio_obra,promesa_escritura), 
                            as.Date, format="%Y-%m-%d")
str(data2)


ggplot(data, aes(x = fuente)) + geom_bar() + 
  theme (axis.text.x = element_text(angle = 90, hjust = 1))

                                                                        
gr1 <- ggplot(data, aes(x = fuente)) + geom_bar(width=0.5, fill="purple") + 
  theme (axis.text.x = element_text(angle = 90, hjust = 1)) 

gr1 + xlab("Fuente de Prospección") + ylab ("Número de Ventas") +
ggtitle("Ventas por fuente de Prospección")


################## VENTAS POR PROYECTO #################

gr2 <- ggplot(data, aes(x = proyecto)) + geom_bar(width=0.5, fill="pink") + 
  theme (axis.text.x = element_text(angle = 90, hjust = 1)) +
  xlab("Proyecto") + ylab ("Número de Ventas") +
  ggtitle("Ventas por Proyecto")

gr2

#####  Ventas plaza  #####

gr3 <- ggplot(data2, aes(x = plaza)) + 
  geom_bar(fill="purple") +
  xlab("Plaza") + ylab ("Número de Ventas") +
  ggtitle("Ventas por Plazas")
  theme (axis.text.x = element_text(angle = 90, hjust = 1))

gr3
ggplotly(gr3)

ggp3 <- gr3 + facet_grid(.~ plaza)
ggplotly(ggp3)


#####  Prototipo más vendido  #####

data2 %>%
ggplot() + 
  aes(prototipo, stat="count" = plaza +
  geom_histogram(binwidth = 10, col="black", fill = "blue") + 
  ggtitle("Prototipos más vendidos") +
  ylab("Prototipo") +
  xlab("Vendidos") + 
  theme_light()




