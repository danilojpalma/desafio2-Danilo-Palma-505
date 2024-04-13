1. ¿Cuántos registros hay?

SELECT COUNT(*) AS total_registros
FROM INSCRITOS;

Resultado

 total_registros
-----------------
               16
(1 fila)

2. ¿Cuántos inscritos hay en total?

SELECT SUM(cantidad) AS total_inscritos
FROM INSCRITOS;

Resultado

 total_inscritos
-----------------
             774
(1 fila)

3. ¿Cuál o cuáles son los registros de mayor antigüedad?

SELECT * FROM INSCRITOS
WHERE fecha = (SELECT MIN(fecha) FROM INSCRITOS);

Resultado

 cantidad |   fecha    | fuente
----------+------------+--------
       44 | 2021-01-01 | Blog
       56 | 2021-01-01 | Página
(2 filas)


4. ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de ahora en adelante)

SELECT 
    fecha, 
    SUM(cantidad) AS inscritos_por_dia
FROM INSCRITOS
GROUP BY fecha;

Resultado

   fecha    | inscritos_por_dia
------------+-------------------
 2021-02-01 |               120
 2021-08-01 |               182
 2021-05-01 |                88
 2021-04-01 |                93
 2021-06-01 |                30
 2021-07-01 |                58
 2021-03-01 |               103
 2021-01-01 |               100
(8 filas)

5. ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?

SELECT 
    fecha, 
    SUM(cantidad) as inscritos_por_dia
FROM INSCRITOS
GROUP BY fecha
ORDER BY inscritos_por_dia DESC
LIMIT 1;


Resultado

   fecha    | inscritos_por_dia
------------+-------------------
 2021-08-01 |               182
(1 fila)
