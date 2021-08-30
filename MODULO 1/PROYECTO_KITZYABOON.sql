SELECT * FROM ventas2;
use db_kitzya;

# ¿Cuántos clientes tienen el apellido "Lopez"?
SELECT * FROM ventas2 WHERE nombre like '%Lopez%';

# ¿Cuántas son las ventas totales por la fuente telemarketing?
SELECT fuente, 
count(*) as 'cantidad ventas' 
FROM ventas2 
where fuente in ("telemarketing", "telemarketing 1", "telemarketing 2", "telemarketing 3") 
group by fuente;

# ¿Cual es el importe total vendido por plaza?
select Plaza, sum(precio) as Importe_total 
from ventas2 where precio 
group by Plaza;

# Cantidad de ventas por asesor y el importe total de sus ventas
select vendedor, count(vendedor) as cantidad_ventas, sum(precio) as importe_total_vendido
from ventas2
where precio
group by vendedor
order by cantidad_ventas desc;

# Promedio del precio de las viviendas por proyecto y total de sus ventas
select proyecto, avg(precio) as precio_promedio, count(plaza) as Ventas_totales
from ventas2
where precio
group by proyecto
order by ventas_totales desc;

#¿Cuántas ventas fueron de contado?
select cajon, count(*) as total
from ventas2
where cajon in ("contado");

#¿Cuál es el prototipo más vendido?
select prototipo, count(*) as vendidos
from ventas2
group by prototipo
order by vendidos desc;

#¿Cuál es la fuente de prospección que más ventas generó?
select fuente, count(*) as total_ventas
from ventas2
group by prototipo
order by total_ventas desc;

#¿Cuántas ventas se realizaron en el mes de enero?
select count(fecha_venta)
from ventas2
where fecha_venta between '2020-01-01' and '2020-01-31';

#¿Qué precio tiene cada modelo del proyecto "Capittala"?
Select * from 
	(select prototipo, precio 
    from ventas2 
    where proyecto = "capittala" 
    group by prototipo) CA;
    
# ¿Qué tipo de financiamiento (vts) es el más empleado en el proyecto "Sonterra"?
   Select * from 
	(select proyecto, vts as financiamiento, count(vts) as Total
    from ventas2 where proyecto = "Sonterra" group by vts) vts
    order by total desc;

CREATE VIEW datosclientes as select id_cliente, nombre, vendedor, fuente, id_venta
from ventas2;

CREATE VIEW detallesventa as select id_venta, id_cliente, proyecto, plaza, prototipo, fecha_venta, precio, vts, cajon
from ventas2;

select * from datosclientes as dc join detallesventa as dv
on dc.id_cliente = dv.id_cliente;

#¿Quién es el vendedor de cada uno de los clientes y su fuente de prospección?
SELECT vendedor, nombre as cliente, fuente
FROM datosclientes as dc JOIN detallesventa as dv
ON dc.id_cliente = dv.id_cliente
order by vendedor desc;

