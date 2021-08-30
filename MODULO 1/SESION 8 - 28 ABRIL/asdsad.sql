Select * from covid;
select count(*) from covid;

#¿Cuál es país con mayor número de casos?
select Region, sum(confirmed) as 'Confirmados'
from covid 
group by region
order by confirmados desc
limit 1;

#¿Cuál es el país con mayor número de muertes?
select Region, sum(deaths) as 'Muertos'
from covid 
group by region
order by Muertos desc
limit 1;

#Nota: Ten en cuenta que puede haber países o regiones repetidas.


select count(*) from influenza;
Select * from influenza;

#¿Cuál fue el país con mayor número de muertes?
select Country, sum(deaths) as 'Muertes'
from influenza
group by Country
order by Muertes desc
limit 1;

#¿Cuál fue el país con menor número de muertes?
select Country, sum(Deaths) as 'Muertes'
from influenza
where deaths <> 0
group by Country
order by Muertes asc
limit 1;

#¿Cuál fue el país con el mayor número de casos?
select Country, sum(Cases) as 'Casos'
from influenza
group by Country
order by Casos desc
limit 1;

#¿Cuál fue el país con el menor número de casos?
select Country, sum(Cases) as 'Casos'
from influenza
where cases <> 0
group by Country
order by Casos asc
limit 1;

#¿Cuál fue el número de muertes promedio?
select avg(deaths)
from influenza;

#¿Cuál fue el número de casos promedio?
select avg(cases)
from influenza;

#Top 5 de países con más muertes
select Country, sum(deaths) as 'Muertes'
from influenza
group by Country
order by Muertes desc
limit 5;

#Top 5 de países con menos muertes
select Country, sum(Deaths) as 'Muertes'
from influenza
where deaths <> 0
group by Country
order by Muertes asc
limit 5;
