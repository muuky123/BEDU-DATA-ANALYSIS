use tienda;
# SELECT * FROM empleado WHERE <condicion>; 
SELECT * FROM EMPLEADO WHERE apellido_paterno="Risom";

SELECT SUM(precio) FROM articulo; 

# Usando la base de datos tienda, escribe consultas que permitan responder las siguientes preguntas.
# ¿Qué artículos incluyen la palabra Pasta en su nombre?
SELECT * FROM articulo WHERE nombre LIKE '%Pasta%';

# ¿Qué artículos incluyen la palabra Cannelloni en su nombre?
SELECT * FROM articulo WHERE nombre LIKE '%Cannelloni%';

# ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
SELECT * FROM articulo WHERE nombre LIKE '%-%';

# ¿Cuál es el promedio de salario de los puestos?
SELECT AVG(salario) FROM puesto;

# ¿Cuántos artículos incluyen la palabra Pasta en su nombre?
SELECT COUNT(*) FROM articulo WHERE nombre LIKE '%Pasta%';

# ¿Cuál es el salario mínimo y máximo?
SELECT MIN(salario) as Minimo, MAX(salario) as Maximo FROM puesto;

# ¿Cuál es la suma del salario de los últimos cinco puestos agregados?
SELECT round (SUM(salario),2) FROM puesto ORDER BY id_puesto DESC LIMIT 5;


SELECT SUM(salario) FROM (SELECT salario FROM puesto ORDER BY id_puesto DESC LIMIT 5) AS x;


SELECT id_puesto FROM puesto ORDER BY id_puesto DESC LIMIT 5;

SELECT SUM(salario) FROM (
SELECT salario FROM puesto ORDER BY id_puesto DESC LIMIT 5) as SubQuery;


SELECT *
FROM empleado
WHERE id_puesto IN (
SELECT id_puesto
FROM puesto
WHERE nombre='junior executive' 
);


# ¿Cuál es el nombre de los empleados cuyo sueldo es menor a 20,000?
SELECT nombre
FROM empleado
WHERE id_empleado IN (
SELECT id_puesto
FROM puesto
WHERE salario < 20000);

# ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
SELECT id_empleado, MIN(total_ventas), MAX(total_ventas)
FROM 
(SELECT clave, id_empleado, count(*) as total_ventas 
FROM venta
GROUP BY clave, id_empleado) AS SubQuery
GROUP BY id_empleado;


# ¿Cuál es el nombre del puesto de cada empleado?
SELECT concat(nombre,'   ', apellido_paterno) AS Nombre, (SELECT nombre FROM puesto WHERE id_puesto=e.id_puesto) AS Puesto
FROM empleado AS e;

