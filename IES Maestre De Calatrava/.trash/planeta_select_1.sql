/* ================================
   BLOQUE 1: Filtrado y Cálculos
   (Sin agrupación)
   ================================ */

-- 1) Método y año de planetas descubiertos en el siglo XXI (2001+)
SELECT metodo_descubrimiento, anio_descubrimiento
FROM planetas
WHERE anio_descubrimiento >= 2001;

-- 2) Planetas con masa conocida y distancia desconocida (NULL)
SELECT *
FROM planetas
WHERE masa_planeta IS NOT NULL
  AND distancia_años_luz IS NULL;

-- 3) Descubiertos por 'Radial Velocity' o 'Imaging' a más de 100 años luz
SELECT *
FROM planetas
WHERE metodo_descubrimiento IN ('Radial Velocity', 'Imaging')
  AND distancia_años_luz > 100;

-- 4) Descubiertos entre 2005 y 2010 (incl.) y periodo < 10 días
SELECT *
FROM planetas
WHERE anio_descubrimiento BETWEEN 2005 AND 2010
  AND periodo_orbital < 10;

-- 5) Columna masa_tierra = masa_planeta * 317.8 para masa_planeta < 0.5
SELECT p.*,
       (masa_planeta * 317.8) AS masa_tierra
FROM planetas p
WHERE masa_planeta < 0.5;

-- 6) Método contiene 'Timing' y pertenecen a sistemas con más de 2 planetas
SELECT *
FROM planetas
WHERE metodo_descubrimiento LIKE '%Timing%'
  AND numero_planetas > 2;

-- 7) Descubiertos por 'Transit' con distancia conocida, ordenar por distancia desc
SELECT *
FROM planetas
WHERE metodo_descubrimiento = 'Transit'
  AND distancia_años_luz IS NOT NULL
ORDER BY distancia_años_luz DESC;

-- 8) Planetas NO descubiertos ni por 'Transit' ni por 'Radial Velocity'
SELECT *
FROM planetas
WHERE metodo_descubrimiento NOT IN ('Transit', 'Radial Velocity');

-- 9) Antes de 2000 con masa > 1.0 OR después de 2010 con masa < 0.1 (con paréntesis)
SELECT *
FROM planetas
WHERE (anio_descubrimiento < 2000 AND masa_planeta > 1.0)
   OR (anio_descubrimiento > 2010 AND masa_planeta < 0.1);

-- 10) “Densidad de información”: concatenar periodo, masa y distancia para año 2014
SELECT id,
       'periodo='   || NVL(TO_CHAR(periodo_orbital), 'NULL') ||
       ', masa='    || NVL(TO_CHAR(masa_planeta), 'NULL') ||
       ', distancia='|| NVL(TO_CHAR(distancia_años_luz), 'NULL') AS info
FROM planetas
WHERE anio_descubrimiento = 2014;

-- 11) Top 5 planetas más lejanos descubiertos por 'Microlensing'
SELECT *
FROM planetas
WHERE metodo_descubrimiento = 'Microlensing'
  AND distancia_años_luz IS NOT NULL
ORDER BY distancia_años_luz DESC
FETCH FIRST 5 ROWS ONLY;

-- 12) Planetas donde periodo_orbital > distancia_años_luz
SELECT *
FROM planetas
WHERE periodo_orbital IS NOT NULL
  AND distancia_años_luz IS NOT NULL
  AND periodo_orbital > distancia_años_luz;

-- 13) Año de descubrimiento par y número de planetas en el sistema impar
SELECT *
FROM planetas
WHERE MOD(anio_descubrimiento, 2) = 0
  AND MOD(numero_planetas, 2) = 1;

-- 14) Masa nula O periodo nulo, pero distancia conocida
SELECT *
FROM planetas
WHERE (masa_planeta IS NULL OR periodo_orbital IS NULL)
  AND distancia_años_luz IS NOT NULL;

-- 15) Método y distancia redondeada a 0 decimales para planetas a menos de 20 años luz
SELECT metodo_descubrimiento,
       ROUND(distancia_años_luz, 0) AS distancia_redondeada
FROM planetas
WHERE distancia_años_luz < 20;

-- 16) 'Imaging' con periodo > 365 y distancia < 50
SELECT *
FROM planetas
WHERE metodo_descubrimiento = 'Imaging'
  AND periodo_orbital > 365
  AND distancia_años_luz < 50;

-- 17) Planetas descubiertos a partir de 2010 (incluido)
SELECT *
FROM planetas
WHERE anio_descubrimiento >= 2010;

-- 18) Planetas con exactamente 1, 4 o 6 planetas en su sistema
SELECT *
FROM planetas
WHERE numero_planetas IN (1, 4, 6);

-- 19) Cuadrado del periodo orbital para planetas descubiertos en 2002
SELECT p.*,
       POWER(periodo_orbital, 2) AS periodo_cuadrado
FROM planetas p
WHERE anio_descubrimiento = 2002;

-- 20) Ordenar por número de planetas (desc) y luego año (asc)
SELECT *
FROM planetas
ORDER BY numero_planetas DESC,
         anio_descubrimiento ASC;