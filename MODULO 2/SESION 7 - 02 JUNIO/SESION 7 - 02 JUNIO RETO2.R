url2 <- "https://www.glassdoor.com.mx/Sueldos/data-scientist-sueldo-SRCH_KO0,14.htm"
browseURL(url2)

docu <- read_html(url2)   
class(docu)

tabla <- html_nodes(docu, "table")  
tabla

tabla1 <- html_table(tabla[1], fill = TRUE)
class(tabla1)
summary(tabla1)
str(tabla1)
tabla1

dataf <- na.omit(as.data.frame(tabla1))
dataf
class(dataf)


a <- gsub("MXN","",tabla$Sueldo)
a <- gsub("[^[:alnum:][:blank:]?]", "", a)
a <- gsub("mes", "", a)
a <- as.numeric(a)
table$Sueldo <- a






library(rvest)

url <- "https://www.glassdoor.com.mx/Sueldos/data-scientist-sueldo-SRCH_KO0,14.htm"

datasc<-read_html(url)

tables<-html_nodes(datasc, "table")
table1 <- html_table(tables[1], fill = TRUE)

table.or <- na.omit(as.data.frame(table1))

str(table)
colnames(table)<- c("puesto","Sueldo")
colnames(table)
a <- gsub("MXN","",table$Sueldo)

a <- gsub("[^[:alnum:][:blank:]?]", "", a)
a
b<- gsub("mes","",a)
b
c<- gsub("año","",b)
c
table$Sueldo<- as.integer(c)
str(table)
summary(table)

max<-which.max(table$Sueldo)
min <- which.min(table$Sueldo)
table[9,2]<- table[9,2]/12
table[9,]
table[max,]
table[min,]
