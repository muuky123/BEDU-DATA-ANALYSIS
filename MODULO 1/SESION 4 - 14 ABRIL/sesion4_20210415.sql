# CRUD 
# C.- create
# R.- read
# U.- update
# D.- delete

# CREATE
# 1.Crear una base de datos
CREATE DATABASE IF NOT EXISTS miDB;
# Después de que creamos la base de datos hay que especificar que la vamos a usar
USE miDB;
# 2.Crear una tabla
# CREATE TABLE IF NOT EXISTS <nombreDeLaTabla> ( <definición de los campos> );
# la creación de una tabla requiere siempre de la definición de las columnas (campos)
CREATE TABLE IF NOT EXISTS 	miTABLE (
	id INT,
    color TEXT
);
# tipos de datos:
# INT .- Numeros enteros
# DOUBLE .- Numeros con parte decimal
# TEXT .- Cadenas de texto de longitud variable hasta 65000 caracteres (se usa el espacio total)
# rfc TEXT - ( esta columna siempre va a ocupar 65000 caracteres en el disco, aunque no tenga información )
# CHAR .- Se necesita especificar el tamaño del campo (se usa el espacio total)
# rfc CHAR(500) - ( esta columna siempre va a ocupar 500 caracteres en el disco, aunque no tenga información )
# VARCHAR .- Se necesita especificar el tamaño MAXIMO del campo, y solo se ocupa el espacio de los caracteres realmente insertados
# rfc VARCHAR(500) - ( esta columna va a ocupar el espacio de los caracteres que realmente se guarden )
# DATE .- Permite guardar fechas en formato: YYYY-MM-DD. -> (transformacion) dd / mm / YY
# TIMESTAMP.- Permite guardar fechas y horas en formato: YYYY-MM-DD HH:MM:SS
# 3.Crear registros (insertar)
# La instruccion INSERT INTO permite agregar un registro a una tabla, considerando que la lista de valores debe coincidir
# con la definición de dicha tabla
INSERT INTO miTABLE VALUES (3, 'BLUE');
# si no se van a insertar todos los valores, se debe especificar la lista de los campos que si se van a insertar, 
# pero los campos que se omitan deberán tener un valor por defeco
INSERT INTO miTABLE (color) VALUES ('RED'); # ojo, daría un error porque el campo "id" no tiene un valor por defecto asi que no se puede quedar vacío

# READ
# para leer datos de la tabla usamos las instrucciones SELECT que ya conocemos
select * FROM miTABLE;

# UPDATE
# Actualizar (modificar) una tabla existente
ALTER TABLE miTABLE ADD COLUMN fruta VARCHAR(20) DEFAULT NULL;
# modificar la tabla para agregar la llave primaria
ALTER TABLE miTABLE ADD PRIMARY KEY (id);
# modificar la información en la tabla
UPDATE miTABLE SET color='DORADO', fruta='naranja' WHERE id=2;

# DELETE
# para eliminar registros de una tabla
DELETE FROM miTABLE WHERE id=3;
# eliminar la tabla completa
DROP TABLE miTABLE;
# eliminar solo la información pero no el esquema (la definición)
TRUNCATE TABLE miTABLE;


