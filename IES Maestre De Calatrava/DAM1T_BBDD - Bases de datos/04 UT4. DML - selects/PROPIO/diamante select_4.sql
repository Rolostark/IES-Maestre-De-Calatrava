-- 1. Muestra todos los datos de los 100 primeros diamantes registrados en la tabla.
SELECT * FROM diamantes FETCH FIRST 100 ROWS ONLY;
-- (Nota: Si tu versión de Oracle es anterior a la 12c, puedes usar: SELECT * FROM diamantes WHERE ROWNUM <= 100;)

-- 2. Muestra los distintos tipos de corte (corte) que existen en la base de datos sin repeticiones.
SELECT DISTINCT corte FROM diamantes;

-- 3. Lista todos los colores (color) únicos que puede tener un diamante según esta tabla.
SELECT DISTINCT color FROM diamantes;

-- 4. Obtén las distintas categorías de claridad presentes en los datos.
SELECT DISTINCT claridad FROM diamantes;

-- 5. Selecciona únicamente el identificador, los quilates y el precio de todos los diamantes.
SELECT id, quilates, precio FROM diamantes;

-- 6. Cuenta cuál es el número total de filas almacenadas en la tabla.
SELECT COUNT(*) FROM diamantes;

-- 7. Muestra el identificador y las dimensiones físicas tridimensionales (longitud_x, ancho_y, profundidad_z) de todos los diamantes.
SELECT id, longitud_x, ancho_y, profundidad_z FROM diamantes;

-- 8. Calcula cuál es el precio mínimo y el precio máximo de todos los diamantes del catálogo.
SELECT MIN(precio) AS precio_minimo, MAX(precio) AS precio_maximo FROM diamantes;

-- 9. Descubre cuál es el peso en quilates más bajo y más alto registrado en la tabla.
SELECT MIN(quilates) AS quilates_minimo, MAX(quilates) AS quilates_maximo FROM diamantes;

-- 10. Muestra todos los datos de aquellos diamantes que tienen un color exactamente igual a 'D'.
SELECT * FROM diamantes WHERE color = 'D';

-- 11. Calcula el precio promedio de los diamantes agrupados por su tipo de corte.
SELECT corte, AVG(precio) AS precio_promedio FROM diamantes GROUP BY corte;

-- 12. Agrupa los diamantes por color y muestra solo aquellos colores que tienen más de 5000 diamantes en total.
SELECT color FROM diamantes GROUP BY color HAVING COUNT(*) > 5000;

-- 13. Muestra los diamantes que pesan más de 2 quilates y cuyo precio es estrictamente superior a 10000.
SELECT * FROM diamantes WHERE quilates > 2 AND precio > 10000;

-- 14. Calcula el peso promedio en quilates agrupado por claridad, pero muestra únicamente las claridades cuyo peso promedio sea superior a 0.8.
SELECT claridad, AVG(quilates) AS quilates_promedio FROM diamantes GROUP BY claridad HAVING AVG(quilates) > 0.8;

-- 15. Lista los diamantes donde alguna de sus dimensiones físicas (longitud_x, ancho_y o profundidad_z) no esté registrada (sea nula).
SELECT * FROM diamantes WHERE longitud_x IS NULL OR ancho_y IS NULL OR profundidad_z IS NULL;

-- 16. Calcula el valor total monetario (suma de precios) de los diamantes agrupados por color.
SELECT color, SUM(precio) AS valor_total FROM diamantes GROUP BY color;

-- 17. Agrupa por corte y muestra el precio promedio, pero solo para aquellos cortes cuyo precio medio supere los 4000.
SELECT corte, AVG(precio) AS precio_promedio FROM diamantes GROUP BY corte HAVING AVG(precio) > 4000;

-- 18. Muestra los diamantes con corte 'Ideal', ordenados por precio de mayor a menor.
SELECT * FROM diamantes WHERE corte = 'Ideal' ORDER BY precio DESC;

-- 19. Muestra las combinaciones exactas de corte y color que tienen más de 1000 diamantes registrados.
SELECT corte, color FROM diamantes GROUP BY corte, color HAVING COUNT(*) > 1000;

-- 20. Calcula el promedio de la profundidad_porc y de la tabla_porc agrupado por cada tipo de corte.
SELECT corte, AVG(profundidad_porc) AS prom_profundidad, AVG(tabla_porc) AS prom_tabla FROM diamantes GROUP BY corte;

-- 21. Muestra el identificador y calcula el volumen aproximado (multiplicando x, y, z) de aquellos diamantes donde ninguna de las tres dimensiones sea nula.
SELECT id, (longitud_x * ancho_y * profundidad_z) AS volumen_aproximado FROM diamantes WHERE longitud_x IS NOT NULL AND ancho_y IS NOT NULL AND profundidad_z IS NOT NULL;

-- 22. Calcula el precio máximo agrupado por claridad, mostrando solo aquellas claridades donde el precio máximo no supere los 15000.
SELECT claridad, MAX(precio) AS precio_maximo FROM diamantes GROUP BY claridad HAVING MAX(precio) <= 15000;

-- 23. Muestra el precio mínimo agrupado por corte, pero teniendo en cuenta exclusivamente los diamantes de más de 1 quilate antes de hacer la agrupación.
SELECT corte, MIN(precio) AS precio_minimo FROM diamantes WHERE quilates > 1 GROUP BY corte;

-- 24. Selecciona los diamantes que tienen un color 'E' o 'F' y una claridad 'VVS1' o 'VVS2'.
SELECT * FROM diamantes WHERE color IN ('E', 'F') AND claridad IN ('VVS1', 'VVS2');

-- 25. Calcula el promedio de la tabla_porc agrupado por corte, filtrando el resultado para mostrar solo los cortes con un promedio general superior a 57.
SELECT corte, AVG(tabla_porc) AS prom_tabla FROM diamantes GROUP BY corte HAVING AVG(tabla_porc) > 57;

-- 26. Cuenta cuántos diamantes hay agrupados por claridad, excluyendo antes del conteo a aquellos diamantes que tengan la longitud_x nula.
SELECT claridad, COUNT(*) AS total_diamantes FROM diamantes WHERE longitud_x IS NOT NULL GROUP BY claridad;

-- 27. Agrupa los diamantes por color y muestra aquellos colores donde el diamante más pequeño del grupo (mínimo de quilates) sea mayor a 0.2.
SELECT color FROM diamantes GROUP BY color HAVING MIN(quilates) > 0.2;

-- 28. Muestra los diamantes donde la profundidad física (profundidad_z) sea numéricamente mayor que la longitud (longitud_x).
SELECT * FROM diamantes WHERE profundidad_z > longitud_x;

-- 29. Suma el total del precio agrupado por claridad, mostrando solo aquellas claridades cuya suma total recaudada supere los 10.000.000.
SELECT claridad, SUM(precio) AS total_recaudado FROM diamantes GROUP BY claridad HAVING SUM(precio) > 10000000;

-- 30. Calcula el promedio del volumen aproximado (x * y * z) agrupado por color, ignorando para el cálculo a los diamantes que tengan dimensiones nulas.
SELECT color, AVG(longitud_x * ancho_y * profundidad_z) AS volumen_promedio FROM diamantes WHERE longitud_x IS NOT NULL AND ancho_y IS NOT NULL AND profundidad_z IS NOT NULL GROUP BY color;

-- 31. Muestra el precio promedio agrupado por corte, pero solo de aquellos cortes donde la diferencia entre el diamante más caro y el más barato de dicho corte sea mayor a 10000.
SELECT corte, AVG(precio) AS precio_promedio FROM diamantes GROUP BY corte HAVING (MAX(precio) - MIN(precio)) > 10000;

-- 32. Calcula el precio por quilate (precio dividido entre quilates) para los diamantes con corte 'Premium', mostrando el ID y el resultado calculado.
SELECT id, (precio / quilates) AS precio_por_quilate FROM diamantes WHERE corte = 'Premium';

-- 33. Agrupa los diamantes por su profundidad_porc (redondeada a cero decimales) y muestra aquellos porcentajes que agrupan a más de 500 diamantes.
SELECT ROUND(profundidad_porc, 0) AS prof_porc_redondeada, COUNT(*) AS cantidad FROM diamantes GROUP BY ROUND(profundidad_porc, 0) HAVING COUNT(*) > 500;

-- 34. Muestra los diamantes cuya tabla_porc sea exactamente 55 o 60.
SELECT * FROM diamantes WHERE tabla_porc IN (55, 60);

-- 35. Agrupa por corte y muestra la longitud_x promedio, pero solo para los cortes donde este promedio sea estrictamente mayor a 6.
SELECT corte, AVG(longitud_x) AS prom_longitud_x FROM diamantes GROUP BY corte HAVING AVG(longitud_x) > 6;

-- 36. Obtén la dimensión máxima de longitud_x agrupada por cada tipo de corte.
SELECT corte, MAX(longitud_x) AS max_longitud_x FROM diamantes GROUP BY corte;

-- 37. Calcula el ratio resultante de dividir el precio promedio entre los quilates promedio agrupado por color, mostrando solo los colores donde este ratio supera los 3500.
SELECT color, (AVG(precio) / AVG(quilates)) AS ratio FROM diamantes GROUP BY color HAVING (AVG(precio) / AVG(quilates)) > 3500;

-- 38. Selecciona los diamantes con un porcentaje de profundidad (profundidad_porc) comprendido entre 60 y 62, que además cuesten menos de 2000.
SELECT * FROM diamantes WHERE profundidad_porc BETWEEN 60 AND 62 AND precio < 2000;

-- 39. Filtra los diamantes que cuestan más de 5000, agrúpalos por claridad y muestra solo aquellas claridades que retengan más de 200 diamantes con ese precio.
SELECT claridad FROM diamantes WHERE precio > 5000 GROUP BY claridad HAVING COUNT(*) > 200;

-- 40. Calcula el número total de diamantes agrupados por color, pero solo tomando en consideración aquellos diamantes que tienen la tabla_porc registrada (no nula).
SELECT color, COUNT(*) AS total_diamantes FROM diamantes WHERE tabla_porc IS NOT NULL GROUP BY color;

-- 41. Agrupa por color y claridad combinados, calculando el precio promedio y mostrando solo los grupos cuyo precio promedio esté entre 3000 y 4000.
SELECT color, claridad, AVG(precio) AS precio_promedio FROM diamantes GROUP BY color, claridad HAVING AVG(precio) BETWEEN 3000 AND 4000;

-- 42. Muestra el identificador, el corte y el precio de los 5 diamantes más caros de la tabla.
SELECT id, corte, precio FROM diamantes ORDER BY precio DESC FETCH FIRST 5 ROWS ONLY;

-- 43. Calcula la profundidad_z máxima agrupada por corte, mostrando únicamente los cortes donde dicha profundidad máxima supere el valor de 5.
SELECT corte, MAX(profundidad_z) AS max_profundidad_z FROM diamantes GROUP BY corte HAVING MAX(profundidad_z) > 5;

-- 44. Encuentra el precio promedio de los diamantes agrupados por corte y color simultáneamente.
SELECT corte, color, AVG(precio) AS precio_promedio FROM diamantes GROUP BY corte, color;

-- 45. Agrupa los diamantes por su peso exacto en quilates y muestra aquellos pesos que pertenecen exactamente a un único diamante en toda la base de datos.
SELECT quilates FROM diamantes GROUP BY quilates HAVING COUNT(*) = 1;

-- 46. Filtra los diamantes de color 'D', agrúpalos por corte y muestra solo los cortes cuyo precio promedio en ese color sea superior a 3000.
SELECT corte FROM diamantes WHERE color = 'D' GROUP BY corte HAVING AVG(precio) > 3000;

-- 47. Calcula el precio mínimo agrupado por claridad, mostrando solo las claridades donde este precio mínimo sea inferior a 400.
SELECT claridad, MIN(precio) AS precio_minimo FROM diamantes GROUP BY claridad HAVING MIN(precio) < 400;

-- 48. Suma los quilates totales agrupados por color, y muestra solo los colores donde la suma total de quilates exceda la cantidad de 5000.
SELECT color, SUM(quilates) AS total_quilates FROM diamantes GROUP BY color HAVING SUM(quilates) > 5000;

-- 49. Agrupa por corte y muestra aquellos cortes donde la cantidad de diamantes con longitud_x nula sea mayor a cero (pista: compara la cuenta total del grupo con la cuenta de la columna).
SELECT corte FROM diamantes GROUP BY corte HAVING COUNT(*) > COUNT(longitud_x);

-- 50. Calcula el precio máximo y el promedio de quilates agrupado por corte, mostrando solo los cortes donde el máximo de precio sea mayor a 18000 y además el promedio de quilates sea menor a 1.
SELECT corte, MAX(precio) AS precio_maximo, AVG(quilates) AS prom_quilates FROM diamantes GROUP BY corte HAVING MAX(precio) > 18000 AND AVG(quilates) < 1;