# De inicio necesitamos saber cómo están confiurada nuestras tablas
DESCRIBE empleado;
SHOW COLUMNS FROM empleado;
SHOW KEYS FROM empleado;

SELECT
*
FROM
empleado JOIN puesto ON empleado.id_puesto = puesto.id_puesto;

SELECT
e.id_empleado, e.nombre, e.apellido_paterno, e.nombre
FROM
puesto AS p JOIN empleado AS e
ON e.id_puesto = p.id_puesto;

#¿Cuál es el nombre de los empleados que realizaron cada venta?
SHOW KEYS FROM venta;
SHOW KEYS FROM empleado;
DESCRIBE empleado;
DESCRIBE venta;
Select V.id_venta, E.Nombre
From venta V
join empleado E on V.id_empleado = E.id_empleado;

### correcto ###

SELECT clave, nombre, apellido_paterno
FROM venta AS v
JOIN empleado AS e
ON v.id_empleado = e.id_empleado
ORDER BY clave;



#¿Cuál es el nombre de los artículos que se han vendido?
SHOW KEYS FROM venta;
Select V.id_venta, A.Nombre
From venta V
join articulo A on V.id_articulo = A.id_articulo;

### correcto ###

SELECT clave, nombre
FROM venta AS v
JOIN articulo AS a
ON v.id_articulo = a.id_articulo
ORDER BY clave;



#¿Cuál es el total de cada venta?
Select V.id_venta, A.Nombre, A.precio + A.iva as 'Total de cada venta'
From venta V
join articulo A on V.id_articulo = A.id_articulo;

### correcto ###

SELECT clave, round(sum(precio),2) AS total
FROM venta AS v
JOIN articulo AS a
	ON v.id_articulo = a.id_articulo
GROUP BY clave
ORDER BY clave;

SELECT clave, round(sum(a.precio + a.iva),2) AS total
FROM venta AS v
JOIN articulo AS a
	ON v.id_articulo = a.id_articulo
GROUP BY clave
ORDER BY clave;

## el 2 de la función, es para indicar que queremos 2 decimales



#OBTENER LA INFORMACIÓN DEL TICKET, O SEA DESCRIPCIÓN Y PRECIO DE CADA ARTÍCULO EN UNA VENTA
#PARA GUARDAR UN QUERY COMO VISTA:
CREATE VIEW ticket_kitzya AS (
SELECT 
v.clave AS no_ticket, v.fecha, a.nombre, a.precio, a.iva, CONCAT(e.nombre, ' ', e.apellido_paterno) AS empleado_atendio
FROM venta AS v
JOIN articulo AS a
	ON v.id_articulo = a.id_articulo
JOIN empleado AS e
	ON v.id_empleado = e.id_empleado );
    

SELECT * FROM ticket_kitzya;

#PARA CONOCER TODAS LAS VISTAS QUE HAY ALMACENADAS:
SHOW FULL TABLES WHERE table_type = 'VIEW';

#CREATE OR REPLACE 



#Obtener el puesto de un empleado.
CREATE VIEW equipo6_q1 AS (
SELECT 
p.nombre AS puesto, CONCAT(e.nombre, ' ', e.apellido_paterno) AS empleado 
FROM empleado AS e
JOIN puesto AS p
	ON e.id_puesto = p.id_puesto);
    
    SELECT * FROM equipo6_q1;

#Saber qué artículos ha vendido cada empleado.
CREATE VIEW equipo6_q2 AS (
SELECT 
v.id_articulo, a.nombre AS articulo, CONCAT(e.nombre, ' ', e.apellido_paterno) AS empleado 
FROM venta AS v
JOIN articulo AS a
	ON v.id_articulo = a.id_articulo
JOIN empleado AS e
	ON v.id_empleado = e.id_empleado
ORDER BY CONCAT(e.nombre, ' ', e.apellido_paterno));

    SELECT * FROM equipo6_q2;

#Saber qué puesto ha tenido más ventas.
#CREATE VIEW equipo6_q3 AS (
SELECT 
p.nombre AS puesto, CONCAT(v.clave) total 
FROM venta AS v
JOIN empleado AS e
	ON v.id_empleado = e.id_empleado
JOIN puesto AS p
	ON e.id_puesto = p.id_puesto
GROUP BY p.nombre;
