USE tienda;
# Para filtrar los registros que cumplan una condición 
# SELECT [lista de campos o * para todos] FROM empleado WHERE <condicion>;
SELECT * FROM empleado WHERE apellido_paterno='Risom';
# SELECT funcion(campo o campos para aplicar la funcion) FROM <tabla>
SELECT SUM(precio) FROM articulo;
SELECT AVG(precio) FROM articulo;
SELECT MAX(precio) FROM articulo;
SELECT SUM(precio) as "Total Articulos", MAX(precio), MIN(precio) FROM articulo;

SELECT SUM(salario) FROM puesto WHERE id_puesto IN (
SELECT id_puesto FROM puesto order by id_puesto DESC limit 5);

SELECT nombre, ROUND((precio + iva) * cantidad, 2) as "Precio Total" FROM articulo;

SELECT COUNT(DISTINCT nombre) FROM articulo;

SELECT round(SUM(salario),2) FROM puesto;
SELECT round(SUM(salario),2) as ultimos_cinco FROM puesto ORDER BY id_puesto DESC LIMIT 5;

# SubQuery o Subconsulta
# Obtener el ID de los ultimos 5 puestos
SELECT id_puesto FROM puesto ORDER BY id_puesto DESC LIMIT 5;
# obtener el sueldo de cada uno de esos ultimos 5 puestos, y sumarlo
SELECT SUM(salario) FROM ( 
SELECT salario FROM puesto ORDER BY id_puesto DESC LIMIT 5) as SubQuery;

# Cuanto le pago a todos los empleados que son "Junior Executive"
SELECT * FROM puesto WHERE nombre='Junior Executive';
# Busco los empleados que tengan el puesto Junior Executive
# Cuando se utiliza el operador IN el grupo de valores de busqueda debe tener solo una columna
SELECT * 
FROM empleado
WHERE id_puesto IN (
SELECT id_puesto
FROM puesto 
WHERE nombre='Junior Executive'
);

# ¿Cuál es el nombre de los empleados cuyo sueldo es menor a 20,000?
SELECT * 
FROM empleado
WHERE id_puesto IN
(SELECT id_puesto
FROM puesto
WHERE salario < 20000);

# ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
SELECT id_empleado, min(total_ventas), max(total_ventas)
FROM
(SELECT clave, id_empleado, count(*) as total_ventas
FROM venta
GROUP BY clave, id_empleado) AS subQuery
group by id_empleado;

# ¿Cuál es el nombre del puesto de cada empleado?
SELECT concat(nombre, ' ', apellido_paterno) AS Nombre, (SELECT nombre FROM puesto WHERE id_puesto=e.id_puesto) AS Puesto
FROM empleado AS e;




