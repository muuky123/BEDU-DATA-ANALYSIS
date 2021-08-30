SELECT * FROM ventas1;
select etapa, proyecto from ventas1;
select distinct fuente from ventas1;
SELECT * FROM ventas2 where fuente = "telemarketing";
SELECT * FROM ventas2 where fuente in ("telemarketing", "telemarketing 1", "telemarketing 2");

#¿Cuántas son las ventas totales por la fuente telemarketing?
SELECT fuente, 
count(*) as 'cantidad ventas' 
FROM ventas2 
where fuente in ("telemarketing", "telemarketing 1", "telemarketing 2", "telemarketing 3") 
group by fuente;

#¿Cual es el importe total vendido por plaza?
select Plaza, sum(precio) as 'importe total' 
from ventas2 where precio 
group by Plaza;


# Cantidad de ventas por asesor y el importe total de sus ventas
select vendedor, count(vendedor) as 'cantidad ventas', sum(precio) as 'importe total vendido'
from ventas2
where precio
group by vendedor;

#Promedio del precio de las viviendas por plaza y proyecto
select proyecto, avg(precio) as 'precio promedio'
from ventas2
where precio
group by proyecto;


select * from ventas2;

select fecha_venta
from ventas2;

SELECT DATE_FORMAT(fecha_venta,'%m') AS mes FROM ventas2;
SELECT DATE_FORMAT(fecha_venta,'%y') AS mes FROM ventas2;
AlTER TABLE ventas2 MODIFY fecha_venta DATE;



