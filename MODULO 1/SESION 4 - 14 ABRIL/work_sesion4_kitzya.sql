#CRUD
# C. - Create
# R. - Read
# U. - Update
# D. - Delete

# 1. Crear las BD con la instrucción; 
#CREATE DATABASE IF NOT EXISTS midb; se usa if not exists para prevenir que cause un error si ya existe una BD con ese nombre
CREATE DATABASE IF NOT EXISTS midb;

USE midb;

# 2. crear la(as) tablas con la instrucción:
CREATE TABLE IF NOT EXISTS mitable (
id INT,
color TEXT 
); 
# La creación de de una tabla requiere siempre de la definición de las columnas (campos)
CREATE TABLE IF NOT EXISTS mitable ( id INT, color TEXT );

#TIPOS DE DATOS
# INT - guarda números enteros
# DOUBLE - guarda números con decimales 
# TEXT - cadenas de texto de longitud variable hasta 65000 caracteres (espacio total)
# VARCHAR - se necesita especificar el tamaño MAXIMO del campo y solo se ocupa el espacio de los caracteres realmente insertados
	# Ejemplo: RFC: VARCHAR(13)
# DATE - Permite guardar fechas en formato: YYYY-MM-DD. -> (transformacion) dd/mm/yy   -> (formato USA)  mm/dd/yy 
#TIMESTAMP - Permite guardar fecha y hora en formato: YYYY-MM-DD HH:MM:SS


CREATE DATABASE IF NOT EXISTS DB_kitzya;
USE DB_kitzya;
CREATE TABLE IF NOT EXISTS DB_kitzya ( id INT, color TEXT );

# 3. "crear" registros: Instruccion
INSERT INTO DB_kitzya VALUE (3, 'PINK');

# Modificar la tabla para agregar la llave primaria
ALTER TABLE db_kitzya ADD PRIMARY KEY (id); 

SELECT * FROM db_kitzya;

# READ - LEER TABLAS SON TODAS LAS FUNCIONES QUE HEMOS VISTO
	# SELECT  
    # FROM	
    # WHERE
    # DESCRIBE 
    
# UPDATE 
# modificar la tabla para agregar la llave primaria
ALTER TABLE db_kitzya ADD PRIMARY KEY (id); 

# DELETE
# Elimina la tabla completa
-DROP TABLE db_kitzya;

# vaciar la información de la tabla pero no eliminar la tabla
-TRUNCATE TABLE  db_kitzya;

# DELETE .- eliminar algunos registros, que cumplan con un criterio
-DELETE FROM db_kitzya; #Eliminar todos los registros, pero no reinicia los autonumericos 
-DELETE FROM db_kitzya WHERE (id > 50);  #Elimina todos los registros menores que 50 

SELECT * FROM db_kitzya.users;
