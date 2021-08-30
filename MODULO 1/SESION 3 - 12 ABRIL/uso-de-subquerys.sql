# SINTAXIS BASICA PARA CUALQUIER QUERY
SELECT
<LISTA DE CAMPOS>
FROM
<ORIGEN DE LOS REGISTROS>
[ WHERE

GROUP BY

ORDER BY

LIMIT ]

# LO QUE ESTA ENTRE CORCHETES ES OPCIONAL
# LO QUE ESTA ENTRE "PICO PARENTESIS" ES OBLIGATORIO


SELECT
*
FROM
empleado

where apellido_paterno LIKE 'G%'
ORDER BY id_empleado
LIMIT 10;

# CASO 1: un Subquery puede aparecer como parte de la lista de campos:
SELECT
<LISTA DE CAMPOS>, (
    SELECT
    <LISTA DE CAMPOS>
    FROM
    <ORIGEN DE LOS REGISTROS> ) as Subquery

FROM
<ORIGEN DE LOS REGISTROS>

# CASO 2: un Subquery puede ser el origen de los datos:
SELECT
<LISTA DE CAMPOS>
FROM
    ( SELECT
    <LISTA DE CAMPOS>
    FROM
    <ORIGEN DE LOS REGISTROS> ) as Subquery

# CASO 3: un Subquery puede ser el criterio de filtrado de los registros:
SELECT
<LISTA DE CAMPOS>
FROM
<ORIGEN DE LOS REGISTROS>

WHERE un_campo IN
    (SELECT
    <LISTA DE CAMPOS>
    FROM
    <ORIGEN DE LOS REGISTROS>)
