# Ejemplo 4. Lectura de archivos JSON, XML y tablas en HTML

# Comenzaremos instalando los paquetes necesarios para después cargarlos a R

install.packages("rjson")   #Siempre usar comillas en el nombre del paquete

library(rjson)            # Quitar comillas del nombre

# Json
# Vamos a leer un archivo Json de prueba alojado aquí

URL <- "https://tools.learningcontainer.com/sample-json-file.json" # Asignando el link a una variable
browseURL(URL)

JsonData <- fromJSON(file= URL)     # Se guarda el JSon en un objeto de R
JsonData$Name
class(JsonData)                     # Vemos que tipo de objeto es JsonData

str(JsonData)                       # Vemos la naturaleza de sus variables

JsonData$Mobile
# Finalmente ya que pudimos acceder al contenido del Json, también podemos 
# realizar la manipulación de los datos dentro del Json, por ejemplo:

JsonData$Mobile

sqrt(JsonData$Mobile)*2

# Para entrar a las demás variables recuerda que puedas usar el operador de $, 
# es decir, JsonData$

# XML
# Ahora vamos a leer datos XML en R, utilizando un archivo XML alojado aquí

# Lo primero es instalar y cargar el paquete XML y alojar el link en una variable 
# link, para su lectura

install.packages("XML")
library(XML)
link <- "http://www-db.deis.unibo.it/courses/TW/DOCS/w3schools/xml/cd_catalog.xml"
browseURL(link)

# Analizando el XML desde la web
xmlfile <- xmlTreeParse(link)
# Ahora ya podemos ver las propiedades del objetvo xmlfile
class(xmlfile)

summary(xmlfile)
head(xmlfile)
# También gracias al xmlTreeParse podemos extraer los datos contenidos en el archivo

#Extraer los valores xml
topxml <- xmlSApply(xmlfile, function(x) xmlSApply(x, xmlValue))
class(topxml)

# Colocandolos en un Data Frame
xml_df <- data.frame(t(topxml), row.names= NULL)
class(xml_df)

str(xml_df) # Observar la naturaleza de las variables del DF
# Convertiremos incluso las variables de PRICE y YEAR en datos numéricos para 
# poder realizar operaciones con este dato

xml_df$PRICE <- as.numeric(xml_df$PRICE) 
xml_df$YEAR <- as.numeric(xml_df$YEAR)

mean(xml_df$PRICE)
mean(xml_df$YEAR)
# Todo esto se puede realizar en un solo paso utilizando el siguiente comando

data_df <- xmlToDataFrame(link)
head(data_df)

class(data_df)
str(data_df)
data_df$PRICE <- as.numeric(xml_df$PRICE) 
data_df$YEAR <- as.numeric(xml_df$YEAR)

data_df %>% group_by(ARTIST)

# Tablas en HTML
# Comenzamos instalando el paquete rvest el cual nos permitirá realizar la 
# lectura de la tabla en el HTML

install.packages("rvest")
library(rvest)
# Introducimos una dirección URL donde se encuentre una tabla

theurl <- "https://solarviews.com/span/data2.htm"
browseURL(theurl)

file <- read_html(theurl)    # Leemos el html
class(file)
# Selecciona pedazos dentro del HTML para identificar la tabla

tables <- html_nodes(file, "table")  
tables
# Hay que analizar 'tables' para determinar cual es la posición en la lista 
# que contiene la tabla, en este caso es la no. 4

# Extraemos la tabla de acuerdo a la posición en la lista

table1 <- html_table(tables[4], fill = TRUE)
class(table1)
summary(table1)
str(table1)

table <- na.omit(as.data.frame(table1))   # Quitamos NA´s que meten filas extras 
# y convertimos la lista en un data frame para su manipulación con R
class(table)
str(table)  # Vemos la naturaleza de las variables
# Por último realizamos una conversión de una columna tipo chr a num, se pueden 
# hacer las conversiones que se requieran

table$Albedo <- as.numeric(table$Albedo)
str(table)

sqrt(na.omit(table$Albedo))


########################### Reto 2 ##############################

library(rvest)

theurl <- "https://www.glassdoor.com.mx/Sueldos/data-scientist-sueldo-SRCH_KO0,14.htm"

file<-read_html(theurl)

tables<-html_nodes(file, "table")
# Hay que analizar 'tables' para determinar cual es la posición en la lista que contiene la tabla, en este caso es la no. 4 

table1 <- html_table(tables[1], fill = TRUE)


table <- na.omit(as.data.frame(table1))

str(table)

#Removiendo caracteres inncesarios 
a <- gsub("MXN","",table$Sueldo)
a <- gsub("[^[:alnum:][:blank:]?]", "", a)
a <- gsub("mes", "", a)
a <- as.numeric(a)
table$Sueldo <- a

#Removiendo caracteres inncesarios
b <- gsub("Sueldos para Data Scientist en ", "", table$Cargo)
table$Cargo <-b

#Máximo sueldo
max.sueldo <- which.max(table$Sueldo)
table[max.sueldo,]

#Mínimo sueldo
min.sueldo <- which.min(table$Sueldo)
table[min.sueldo,]


