use neptuno;
SELECT * FROM proveedores;

#muestra como esta configurada esa tabla
describe distribuidores;

#muestra las llaves configuradas
show keys from productos;

select * from productos join categorias
on productos.idcategoria = categorias.idcategoria;

#subquery: permite obtener un resulset (tabla) que se usará como base para configurar otro resultset

SELECT Apellidos, Nombre, Cargo,(SELECT CONCAT(Nombre,' ',Apellidos) FROM empleados WHERE E.Jefe=IdEmpleado) as Jefe FROM empleados as E;

SELECT Apellidos, Nombre, Cargo,
	(SELECT CONCAT(nombre,' ',apellidos) 
	from empleados where e.jefe=idempleado) as jefe 
from empleados as e;










#############¿Cuál es la cantidad mínima y máxima de ventas de cada proyecto?

(
select proyecto, count(*) as total_ventas
from ventas2
group by prototipo
order by total_ventas asc
Limit 1
)
Union all
(
select proyecto, count(*) as total_ventas
from ventas2
group by prototipo
order by total_ventas desc
Limit 1
);


SELECT proyecto, min(total_ventas), max(total_ventas)
FROM
(SELECT plaza, proyecto, count(*) as total_ventas
FROM ventas2
GROUP BY plaza, proyecto) AS total_ventas
group by proyecto;
