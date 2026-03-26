/* DMLS_EJ02 - Titanic (parte 1/4) */
/* Tabla: TITANIC
   Columnas (según titanic_oracle.sql): 
   id, superviviente, clase, genero, edad, hermanos_conyuges, padres_hijos, tarifa,
   puerto_embarque, clase_literal, tipo_persona, es_adulto_masculino, cubierta,
   ciudad_embarque, esta_vivo, viaja_solo
*/

-- 1. Muestra toda la información de todos los pasajeros de la tabla.
SELECT *
FROM titanic;

-- 2. Muestra únicamente los nombres de las ciudades de embarque que aparecen en la tabla.
SELECT DISTINCT ciudad_embarque
FROM titanic;

-- 3. Selecciona únicamente la columna de la edad de todos los pasajeros.
SELECT edad
FROM titanic;

-- 4. Muestra el género y la edad de cada pasajero.
SELECT genero, edad
FROM titanic;

-- 5. Muestra la clase numérica y el precio de la tarifa pagada por cada pasajero.
SELECT clase, tarifa
FROM titanic;

-- 6. Lista el identificador del pasajero, su género y si sobrevivió o no.
SELECT
  id,
  genero,
  CASE WHEN superviviente = 1 THEN 'sobrevivio' ELSE 'no' END AS sobrevivio
FROM titanic;

-- 7. Muestra las columnas de clase literal (texto) y ciudad de embarque.
SELECT clase_literal, ciudad_embarque
FROM titanic;

-- 8. Muestra todos los datos de los pasajeros que tienen exactamente 30 años.
SELECT *
FROM titanic
WHERE edad = 30;

-- 9. Selecciona los pasajeros que viajaban en la clase 1.
SELECT *
FROM titanic
WHERE clase = 1;

-- 10. Muestra los datos de los pasajeros que embarcaron en 'Southampton'.
SELECT *
FROM titanic
WHERE ciudad_embarque = 'Southampton';

-- 11. Lista los pasajeros de género femenino.
SELECT *
FROM titanic
WHERE genero = 'female';

-- 12. Muestra los pasajeros que pagaron una tarifa igual a 0.
SELECT *
FROM titanic
WHERE tarifa = 0;

-- 13. Selecciona los pasajeros que viajaban solos.
SELECT *
FROM titanic
WHERE viaja_solo = 'True';

-- 14. Muestra los pasajeros que NO sobrevivieron.
SELECT *
FROM titanic
WHERE superviviente = 0;

-- 15. Muestra los pasajeros que tienen menos de 10 años.
SELECT *
FROM titanic
WHERE edad < 10;

-- 16. Lista los pasajeros que pagaron una tarifa mayor a 50.
SELECT *
FROM titanic
WHERE tarifa > 50;

-- 17. Muestra los pasajeros que tienen 50 años o más.
SELECT *
FROM titanic
WHERE edad >= 50;

-- 18. Selecciona los pasajeros que viajan con más de 2 hermanos o cónyuges.
SELECT *
FROM titanic
WHERE hermanos_conyuges > 2;

-- 19. Muestra los pasajeros que no tenían ningún padre ni hijo a bordo.
SELECT *
FROM titanic
WHERE padres_hijos = 0;

-- 20. Lista los pasajeros cuya clase sea distinta de 3.
SELECT *
FROM titanic
WHERE clase <> 3;

-- 21. Muestra los pasajeros cuya cubierta es conocida (no es nula).
SELECT *
FROM titanic
WHERE cubierta IS NOT NULL;

-- 22. Muestra los pasajeros cuya edad desconocemos (es nula).
SELECT *
FROM titanic
WHERE edad IS NULL;

-- 23. Selecciona las mujeres que viajaban en primera clase.
SELECT *
FROM titanic
WHERE genero = 'female'
  AND clase = 1;

-- 24. Muestra los hombres que sobrevivieron.
SELECT *
FROM titanic
WHERE genero = 'male'
  AND superviviente = 1;

-- 25. Lista los pasajeros menores de edad (menos de 18 años) que sobrevivieron.
SELECT *
FROM titanic
WHERE edad < 18
  AND superviviente = 1;

-- 26. Muestra los pasajeros que embarcaron en 'Cherbourg' y pagaron más de 100 de tarifa.
SELECT *
FROM titanic
WHERE ciudad_embarque = 'Cherbourg'
  AND tarifa > 100;

-- 27. Selecciona los pasajeros que viajaban en primera o en segunda clase.
SELECT *
FROM titanic
WHERE clase IN (1, 2);

-- 28. Muestra los pasajeros que embarcaron en 'Queenstown' o en 'Cherbourg'.
SELECT *
FROM titanic
WHERE ciudad_embarque IN ('Queenstown', 'Cherbourg');

-- 29. Lista las mujeres que no viajaban solas.
SELECT *
FROM titanic
WHERE genero = 'female'
  AND viaja_solo = 'False';

-- 30. Muestra los hombres mayores de 60 años que viajaban en tercera clase.
SELECT *
FROM titanic
WHERE genero = 'male'
  AND edad > 60
  AND clase = 3;

-- 31. Selecciona los pasajeros con una edad comprendida entre 20 y 30 años (ambos incluidos).
SELECT *
FROM titanic
WHERE edad BETWEEN 20 AND 30;

-- 32. Muestra los pasajeros que pagaron una tarifa entre 10 y 20.
SELECT *
FROM titanic
WHERE tarifa BETWEEN 10 AND 20;

-- 33. Lista los pasajeros cuya ciudad de embarque comienza por la letra 'S'.
SELECT *
FROM titanic
WHERE ciudad_embarque LIKE 'S%';

-- 34. Muestra los pasajeros cuya clase literal termina en 'ird'.
SELECT *
FROM titanic
WHERE clase_literal LIKE '%ird';

-- 35. Selecciona los pasajeros que tienen una 'A' en su código de cubierta.
SELECT *
FROM titanic
WHERE cubierta LIKE '%A%';

-- 36. Muestra la edad de los pasajeros multiplicada por 365 (estimación en días).
SELECT
  id,
  edad,
  edad * 365 AS edad_en_dias_aprox
FROM titanic;

-- 37. Calcula el tamaño total de la familia de cada pasajero sumando hermanos/cónyuges más padres/hijos.
SELECT
  id,
  hermanos_conyuges,
  padres_hijos,
  (hermanos_conyuges + padres_hijos) AS familia_total
FROM titanic;

-- 38. Muestra la tarifa dividida entre 2 (simulando un descuento del 50%).
SELECT
  id,
  tarifa,
  tarifa / 2 AS tarifa_con_descuento_50
FROM titanic;

-- 39. Calcula la edad que tendrían los pasajeros dentro de 10 años.
SELECT
  id,
  edad,
  edad + 10 AS edad_en_10_anios
FROM titanic;

-- 40. Muestra la clase literal en mayúsculas y la ciudad de embarque en minúsculas.
SELECT
  UPPER(clase_literal) AS clase_literal_mayus,
  LOWER(ciudad_embarque) AS ciudad_embarque_minus
FROM titanic;