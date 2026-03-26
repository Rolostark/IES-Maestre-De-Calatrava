/* DMLS_EJ03 - Titanic (parte 2/4) */

-- 1. Ciudades de embarque distintas (sin repetidas)
SELECT DISTINCT ciudad_embarque
FROM titanic;

-- 2. Edades distintas de los que sobrevivieron, ordenadas de menor a mayor
SELECT DISTINCT edad
FROM titanic
WHERE superviviente = 1
  AND edad IS NOT NULL
ORDER BY edad ASC;

-- 3. Pasajeros con edad desconocida (NULL) y que sobrevivieron
SELECT *
FROM titanic
WHERE edad IS NULL
  AND superviviente = 1;

-- 4. Pasajeros con cubierta asignada (no NULL) y tarifa < 20
SELECT *
FROM titanic
WHERE cubierta IS NOT NULL
  AND tarifa < 20;

-- 5. Pasajeros que NO son de primera clase y embarcaron en 'Cherbourg'
SELECT *
FROM titanic
WHERE clase <> 1
  AND ciudad_embarque = 'Cherbourg';

-- 6. Mujeres de primera clase O hombres de tercera clase (con paréntesis)
SELECT *
FROM titanic
WHERE (genero = 'female' AND clase = 1)
   OR (genero = 'male'   AND clase = 3);

-- 7. Pagaron > 200 O (iban en primera clase y sobrevivieron)
SELECT *
FROM titanic
WHERE tarifa > 200
   OR (clase = 1 AND superviviente = 1);

-- 8. Viajaban solos (sin padres/hijos/hermanos/cónyuges) y tenían < 18 años
SELECT *
FROM titanic
WHERE padres_hijos = 0
  AND hermanos_conyuges = 0
  AND edad < 18;

-- 9. Hombres > 60 O mujeres < 20
SELECT *
FROM titanic
WHERE (genero = 'male'   AND edad > 60)
   OR (genero = 'female' AND edad < 20);

-- 10. Sobrevivieron y NO embarcaron en 'Southampton'
SELECT *
FROM titanic
WHERE superviviente = 1
  AND ciudad_embarque <> 'Southampton';

-- 11. Ordenados por clase (ASC) y luego por edad (DESC) dentro de cada clase
SELECT *
FROM titanic
ORDER BY clase ASC, edad DESC NULLS LAST;

-- 12. Ordenados por tarifa (DESC) y, en empate, por edad (ASC)
SELECT *
FROM titanic
ORDER BY tarifa DESC, edad ASC NULLS LAST;

-- 13. Los 3 importes de tarifa más distintos (top 3 tarifas distintas más altas)
SELECT DISTINCT tarifa
FROM titanic
ORDER BY tarifa DESC
FETCH FIRST 3 ROWS ONLY;

-- 14. Tarifa más cara pagada (MAX)
SELECT MAX(tarifa) AS tarifa_maxima
FROM titanic;

-- 15. Edad del pasajero más joven (MIN)
SELECT MIN(edad) AS edad_minima
FROM titanic;

-- 16. Promedio de edad de los pasajeros de primera clase
SELECT AVG(edad) AS edad_media_1clase
FROM titanic
WHERE clase = 1;

-- 17. Suma total recaudada por tickets de los pasajeros que sobrevivieron
SELECT SUM(tarifa) AS total_recaudado_sobrevivientes
FROM titanic
WHERE superviviente = 1;

-- 18. Cuántos pasajeros hay en total
SELECT COUNT(*) AS total_pasajeros
FROM titanic;

-- 19. Cuántos pasajeros tienen informada la cubierta (no NULL)
SELECT COUNT(cubierta) AS pasajeros_con_cubierta
FROM titanic;

-- 20. Tarifa más baja pagada por una mujer que viajaba en primera clase
SELECT MIN(tarifa) AS tarifa_min_mujer_1clase
FROM titanic
WHERE genero = 'female'
  AND clase = 1;

-- 21. Edad promedio de los hombres que NO sobrevivieron
SELECT AVG(edad) AS edad_media_hombres_no_sobrevivieron
FROM titanic
WHERE genero = 'male'
  AND superviviente = 0;

-- 22. Pasajeros en familia numerosa (hermanos/cónyuges + padres/hijos > 4)
SELECT *
FROM titanic
WHERE (hermanos_conyuges + padres_hijos) > 4;

-- 23. Pasajeros acompañados (familiares > 0) cuya tarifa fue 0
SELECT *
FROM titanic
WHERE (hermanos_conyuges + padres_hijos) > 0
  AND tarifa = 0;

-- 24. id, clase y coste_por_persona = tarifa / (miembros familia + 1 propio)
SELECT
  id,
  clase,
  tarifa / (hermanos_conyuges + padres_hijos + 1) AS coste_por_persona
FROM titanic;

-- 25. Embarcaron en 'Queenstown' y su edad es par (MOD)
SELECT *
FROM titanic
WHERE ciudad_embarque = 'Queenstown'
  AND edad IS NOT NULL
  AND MOD(edad, 2) = 0;

-- 26. Pasajeros cuya tarifa es mayor que su edad
SELECT *
FROM titanic
WHERE edad IS NOT NULL
  AND tarifa > edad;

-- 27. Tipos de 'clase_literal' combinados con 'genero', sin duplicados
SELECT DISTINCT clase_literal || '-' || genero AS clase_genero
FROM titanic
ORDER BY clase_genero;

-- 28. Pasajeros que sobrevivieron, ordenados por longitud del nombre de su ciudad de embarque
SELECT *
FROM titanic
WHERE superviviente = 1
ORDER BY LENGTH(ciudad_embarque) ASC, ciudad_embarque ASC;

-- 29. Tarifa entre 50 y 100, excluyendo 'Southampton'
SELECT *
FROM titanic
WHERE tarifa BETWEEN 50 AND 100
  AND ciudad_embarque <> 'Southampton';

-- 30. Diferencia entre la edad del más viejo y la del más joven
SELECT (MAX(edad) - MIN(edad)) AS diferencia_edad
FROM titanic;