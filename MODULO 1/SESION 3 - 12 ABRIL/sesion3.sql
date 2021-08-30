
# PARA CONOCER LA INFORMACIÒNS SOBRE TODAS LAS LLAVES QUE TENGA LA TABLA
SHOW KEYS FROM empleado;

SELECT 
e.id_empleado, e.nombre, e.apellido_paterno, p.nombre
FROM
puesto AS p JOIN empleado AS e
ON 
e.id_puesto = p.id_puesto 


#    ¿Cuál es el nombre de los empleados que realizaron cada venta?
DESCRIBE venta;

DESCRIBE empleado;


SELECT v.clave, e.nombre, e.apellido_paterno
FROM venta AS v
JOIN empleado AS e
ON v.id_empleado = e.id_empleado
ORDER BY v.clave;


#    ¿Cuál es el nombre de los artículos que se han vendido?
SELECT v.clave, e.nombre
FROM articulo AS a
JOIN venta AS v
  ON v.id_articulo = a.id_articulo
ORDER BY v.clave;


#    ¿Cuál es el total de cada venta?
SELECT v.clave, round(sum(a.precio + a.iva),2) AS total
FROM venta AS v
JOIN articulo AS a
  ON v.id_articulo = a.id_articulo
GROUP BY v.clave
ORDER BY v.clave;

select * from venta Limit 25;



# obtener la información del "ticket" (la descripcion y precio de cada articulo en una venta)
# para guardar un query como una vista:
CREATE VIEW ticket_jan AS (
SELECT
v.clave AS No_Ticket, v.fecha, a.nombre, a.precio, a.iva, CONCAT(e.nombre, ' ', e.apellido_paterno) AS Empleado_atendio 
FROM 
venta AS v
JOIN articulo AS a
    ON v.id_articulo = a.id_articulo
JOIN empleado AS e
    ON v.id_empleado = e.id_empleado )
    

# para conocer todas las vistas que hay almacenadas
SHOW FULL TABLES WHERE table_type = 'VIEW';

# CREATE OR REPLACE, sirve para modificar la definición previa de una vista
CREATE OR REPLACE VIEW ticket_jan AS (
SELECT
v.clave AS No_Ticket, v.fecha, a.nombre, a.precio, a.iva, CONCAT(e.nombre, ' ', e.apellido_paterno) AS Empleado_atendio 
FROM 
venta AS v
JOIN articulo AS a
    ON v.id_articulo = a.id_articulo
JOIN empleado AS e
    ON v.id_empleado = e.id_empleado )

    
 #   Obtener el puesto de un empleado
CREATE VIEW q1_puestos AS
(
SELECT 
concat(e.nombre, ' ', e.apellido_paterno), p.nombre
FROM 
empleado e
JOIN puesto p
  ON e.id_puesto = p.id_puesto
);

SELECT * FROM q1_puestos;
    
 #   Saber qué artículos ha vendido cada empleado.
CREATE VIEW q2_articulos AS
SELECT v.clave, concat(e.nombre, ' ', e.apellido_paterno) nombre, a.nombre articulo
FROM venta v
JOIN empleado e
  ON v.id_empleado = e.id_empleado
JOIN articulo a
  ON v.id_articulo = a.id_articulo
ORDER BY v.clave;

SELECT * FROM q2_articulos;


 #   Saber qué puesto ha tenido más ventas.
CREATE VIEW q3_ventas AS
SELECT p.nombre, count(v.clave) total
FROM venta v
JOIN empleado e
  ON v.id_empleado = e.id_empleado
JOIN puesto p
  ON e.id_puesto = p.id_puesto
GROUP BY p.nombre;
    
SELECT * FROM q3_ventas ORDER BY total DESC LIMIT 1



