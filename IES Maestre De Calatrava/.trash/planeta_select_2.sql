/* =========================================
   BLOQUE 2: Agregaciones y Agrupaciones
   (GROUP BY sin HAVING)
   ========================================= */

-- 21) Distancia promedio de planetas descubiertos por 'Transit'
SELECT AVG(distancia_años_luz) AS distancia_promedio
FROM planetas
WHERE metodo_descubrimiento = 'Transit';

-- 22) Cuántos planetas en total por cada método de descubrimiento
SELECT metodo_descubrimiento,
       SUM(numero_planetas) AS total_planetas
FROM planetas
GROUP BY metodo_descubrimiento;

-- 23) Masa máxima y mínima encontrada en cada año
SELECT anio_descubrimiento,
       MAX(masa_planeta) AS masa_max,
       MIN(masa_planeta) AS masa_min
FROM planetas
GROUP BY anio_descubrimiento
ORDER BY anio_descubrimiento;

-- 24) Año y cuántos se descubrieron ese año, solo 'Radial Velocity'
SELECT anio_descubrimiento,
       COUNT(*) AS total_planetas
FROM planetas
WHERE metodo_descubrimiento = 'Radial Velocity'
GROUP BY anio_descubrimiento
ORDER BY anio_descubrimiento;

-- 25) Suma total de la masa agrupada por número de planetas del sistema
SELECT numero_planetas,
       SUM(masa_planeta) AS suma_masa
FROM planetas
GROUP BY numero_planetas
ORDER BY numero_planetas;

-- 26) Promedio del periodo orbital por método, solo planetas descubiertos después de 2010
SELECT metodo_descubrimiento,
       AVG(periodo_orbital) AS periodo_promedio
FROM planetas
WHERE anio_descubrimiento > 2010
GROUP BY metodo_descubrimiento
ORDER BY metodo_descubrimiento;

-- 27) Cuántos planetas tienen distancia nula en cada año
SELECT anio_descubrimiento,
       COUNT(*) AS total_distancia_null
FROM planetas
WHERE distancia_años_luz IS NULL
GROUP BY anio_descubrimiento
ORDER BY anio_descubrimiento;

-- 28) Distancia máxima por método, excluyendo planetas con masa desconocida
SELECT metodo_descubrimiento,
       MAX(distancia_años_luz) AS distancia_max
FROM planetas
WHERE masa_planeta IS NOT NULL
GROUP BY metodo_descubrimiento
ORDER BY metodo_descubrimiento;

-- 29) Número de planetas descubiertos por año, solo años pares (orden desc)
SELECT anio_descubrimiento,
       COUNT(*) AS total_planetas
FROM planetas
WHERE MOD(anio_descubrimiento, 2) = 0
GROUP BY anio_descubrimiento
ORDER BY anio_descubrimiento DESC;

-- 30) Agrupar por método y año, contando planetas; ordenar método asc y año desc
SELECT metodo_descubrimiento,
       anio_descubrimiento,
       COUNT(*) AS total_planetas
FROM planetas
GROUP BY metodo_descubrimiento, anio_descubrimiento
ORDER BY metodo_descubrimiento ASC,
         anio_descubrimiento DESC;

-- 31) Media de distancia por número de planetas del sistema, ordenado por media desc
SELECT numero_planetas,
       AVG(distancia_años_luz) AS distancia_media
FROM planetas
GROUP BY numero_planetas
ORDER BY distancia_media DESC;

-- 32) Cuántos métodos distintos se usaron cada año
SELECT anio_descubrimiento,
       COUNT(DISTINCT metodo_descubrimiento) AS metodos_distintos
FROM planetas
GROUP BY anio_descubrimiento
ORDER BY anio_descubrimiento;

-- 33) Masa promedio por método, solo planetas con distancia entre 10 y 100 años luz
SELECT metodo_descubrimiento,
       AVG(masa_planeta) AS masa_promedio
FROM planetas
WHERE distancia_años_luz BETWEEN 10 AND 100
GROUP BY metodo_descubrimiento
ORDER BY metodo_descubrimiento;

-- 34) Periodo orbital más largo por año para planetas solitarios (numero_planetas = 1)
SELECT anio_descubrimiento,
       MAX(periodo_orbital) AS periodo_max
FROM planetas
WHERE numero_planetas = 1
GROUP BY anio_descubrimiento
ORDER BY anio_descubrimiento;

-- 35) Cuántos 'Transit' por década (ej. 2014 -> 2010)
SELECT (TRUNC(anio_descubrimiento / 10) * 10) AS decada,
       COUNT(*) AS total_transit
FROM planetas
WHERE metodo_descubrimiento = 'Transit'
GROUP BY (TRUNC(anio_descubrimiento / 10) * 10)
ORDER BY decada;

-- 36) Desviación estándar del periodo y de la masa agrupada por método
SELECT metodo_descubrimiento,
       STDDEV(periodo_orbital) AS std_periodo,
       STDDEV(masa_planeta)    AS std_masa
FROM planetas
GROUP BY metodo_descubrimiento
ORDER BY metodo_descubrimiento;

-- 37) Suma de distancias, desglosado por si numero_planetas > 3
SELECT CASE
         WHEN numero_planetas > 3 THEN 'MAYOR_A_3'
         ELSE '3_O_MENOS'
       END AS grupo_sistema,
       SUM(distancia_años_luz) AS suma_distancia
FROM planetas
GROUP BY CASE
           WHEN numero_planetas > 3 THEN 'MAYOR_A_3'
           ELSE '3_O_MENOS'
         END
ORDER BY grupo_sistema;

-- 38) Año de mayor masa promedio, excluyendo métodos que empiezan por 'A'
SELECT anio_descubrimiento,
       masa_promedio
FROM (
  SELECT anio_descubrimiento,
         AVG(masa_planeta) AS masa_promedio
  FROM planetas
  WHERE metodo_descubrimiento NOT LIKE 'A%'
  GROUP BY anio_descubrimiento
  ORDER BY masa_promedio DESC
)
FETCH FIRST 1 ROW WITH TIES;

-- 39) Cuántos registros por método donde distancia NO es nula y masa NO es nula
SELECT metodo_descubrimiento,
       COUNT(*) AS total_registros
FROM planetas
WHERE distancia_años_luz IS NOT NULL
  AND masa_planeta IS NOT NULL
GROUP BY metodo_descubrimiento
ORDER BY metodo_descubrimiento;

-- 40) Año y periodo orbital mínimo, máximo y promedio, por año,
--     solo para 'Microlensing' o 'Imaging'
SELECT anio_descubrimiento,
       MIN(periodo_orbital) AS periodo_min,
       MAX(periodo_orbital) AS periodo_max,
       AVG(periodo_orbital) AS periodo_promedio
FROM planetas
WHERE metodo_descubrimiento IN ('Microlensing', 'Imaging')
GROUP BY anio_descubrimiento
ORDER BY anio_descubrimiento;