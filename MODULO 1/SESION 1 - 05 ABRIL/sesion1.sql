# SQL es el lenguaje que se utiliza con manejadores de bases de datos relacionales
# Structured Query Language 
# "querys" cualquier instrucción en lenguaje SQL que podamos ejecutar en un SGBDR
# root.- Super usuario dentro de la BD 

# 1. Especificar que base de datos queremos usar
USE tienda;

# 2.- Conocer que tablas hay en la BD
SHOW tables;

# 3.- Conocer como está definida alguna tabla en especifico
DESCRIBE empleado;
DESCRIBE venta;

# 4.- obtener información de una tabla
# SELECT [lista de campos o * para todos] FROM nombreDeLaTabla
 
 SELECT * FROM empleado;
 
 SELECT nombre, apellido_paterno 
 FROM empleado;
 
# Timestamp '2021-04-05 21:19:59'

 SELECT * FROM empleado;
 
 # LIMITAR EL NUMERO DE REGISTROS DEVUELTOS EN EL RESULT:  LIMIT <n> (los "n" primeros registros)
 SELECT * FROM empleado LIMIT 5;
 
 # Los "primeros registros" puede ser un concepto algo abstracto, porque eso depende de cómo estén ordenados los registros. Por lo general
 # se van a ordenar conforme se van insertando en la tabla, pero si queremos ordenarlos de forma especifica por medio de algún campo
 # usaremos la cláusula ORDER BY:
 SELECT * FROM empleado ORDER BY apellido_paterno LIMIT 5;
 
 # ORDER BY por default va a ordenar ascendente, si queremos invertir ese órden, utilizaremos "DESC" después del nombre del campo
 SELECT * FROM empleado ORDER BY id_empleado DESC LIMIT 5;
 
 
 
