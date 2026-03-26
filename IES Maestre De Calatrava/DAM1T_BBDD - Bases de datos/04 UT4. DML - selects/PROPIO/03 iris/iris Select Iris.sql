
-- 1. Muestra todo el contenido de la tabla, todas las filas y todas las columnas.
SELECT * FROM IRIS;

-- 2. Muestra únicamente los nombres de las especies de todas las filas.
SELECT ESPECIE FROM IRIS;

-- 3. Muestra solo la columna del largo del pétalo.
SELECT LARGO_PETALO FROM IRIS;

-- 4. Muestra las columnas de largo de sépalo y ancho de sépalo.
SELECT LARGO_SEPALO, ANCHO_SEPALO FROM IRIS;

-- 5. Muestra el identificador (ID) y la especie de cada flor.
SELECT ID, ESPECIE FROM IRIS;

-- 6. Muestra todas las columnas de las flores que sean de la especie 'setosa'.
SELECT * FROM IRIS
WHERE ESPECIE = 'setosa';

-- 7. Muestra todas las columnas de las flores que sean de la especie 'virginica'.
SELECT * FROM IRIS
WHERE ESPECIE = 'virginica';

-- 8. Muestra las flores que tengan un largo de pétalo igual a 1.4.
SELECT * FROM IRIS
WHERE LARGO_PETALO = 1.4;

-- 9. Muestra las flores cuyo ancho de sépalo sea igual a 3.0.
SELECT * FROM IRIS
WHERE ANCHO_SEPALO = 3.0;

-- 10. Muestra las flores que tengan un largo de sépalo mayor que 6.0.
SELECT * FROM IRIS
WHERE LARGO_SEPALO > 6.0;

-- 11. Muestra las flores con un ancho de pétalo menor que 0.3.
SELECT * FROM IRIS
WHERE ANCHO_PETALO < 0.3;

-- 12. Consulta solo la especie y el largo del pétalo para flores con largo de pétalo >= 5.0.
SELECT ESPECIE, LARGO_PETALO
FROM IRIS
WHERE LARGO_PETALO >= 5.0;

-- 13. Muestra el ID y la especie de las flores con ancho de sépalo <= 2.5.
SELECT ID, ESPECIE
FROM IRIS
WHERE ANCHO_SEPALO <= 2.5;

-- 14. Muestra todas las flores excepto las de la especie 'setosa'.
SELECT * FROM IRIS
WHERE ESPECIE <> 'setosa';

-- 15. Muestra las flores que tengan un largo de pétalo distinto de 1.5.
SELECT * FROM IRIS
WHERE LARGO_PETALO <> 1.5;

-- 16. Muestra todas las flores ordenadas por su largo de pétalo de menor a mayor.
SELECT * FROM IRIS
ORDER BY LARGO_PETALO ASC;

-- 17. Muestra todas las flores ordenadas por su ancho de sépalo de mayor a menor.
SELECT * FROM IRIS
ORDER BY ANCHO_SEPALO DESC;

-- 18. Muestra las especies ordenadas alfabéticamente.
SELECT ESPECIE FROM IRIS
ORDER BY ESPECIE ASC;

-- 19. Muestra el largo y ancho del pétalo de las flores 'virginica',
--     ordenadas por largo del pétalo descendente.
SELECT LARGO_PETALO, ANCHO_PETALO
FROM IRIS
WHERE ESPECIE = 'virginica'
ORDER BY LARGO_PETALO DESC;

-- 20. Muestra las flores 'versicolor' y además con largo de sépalo > 6.0.
SELECT * FROM IRIS
WHERE ESPECIE = 'versicolor'
  AND LARGO_SEPALO > 6.0;

-- 21. Muestra las flores de la especie 'setosa' o de la especie 'virginica'.
SELECT * FROM IRIS
WHERE ESPECIE = 'setosa'
   OR ESPECIE = 'virginica';

-- 22. Muestra las flores cuyo largo de pétalo esté entre 4.0 y 5.0 (ambos incluidos).
SELECT * FROM IRIS
WHERE LARGO_PETALO BETWEEN 4.0 AND 5.0;

-- 23. Muestra las flores cuyo ancho de pétalo NO sea 0.2.
SELECT * FROM IRIS
WHERE ANCHO_PETALO <> 0.2;

-- 24. Selecciona el largo del sépalo y la especie,
--     pero cambia el nombre de la columna ESPECIE a "Tipo_De_Flor" en el resultado.
SELECT LARGO_SEPALO, ESPECIE AS Tipo_De_Flor
FROM IRIS;

-- 25. Muestra el largo del pétalo multiplicado por 2 para todas las flores.
SELECT (LARGO_PETALO * 2) AS LARGO_PETALO_X2
FROM IRIS;

-- 26. Calcula la suma del largo del sépalo más el ancho del sépalo para cada flor
--     y llámalo "dimension_sepalo".
SELECT (LARGO_SEPALO + ANCHO_SEPALO) AS dimension_sepalo
FROM IRIS;

-- 27. Muestra los nombres de las especies convertidos a mayúsculas.
SELECT UPPER(ESPECIE) AS ESPECIE_MAYUS
FROM IRIS;

-- 28. Muestra solo las 3 primeras letras de la especie de cada flor.
SELECT SUBSTR(ESPECIE, 1, 3) AS ESPECIE_3_LETRAS
FROM IRIS;

-- 29. Busca las flores cuya especie empiece por la letra 'v'.
SELECT * FROM IRIS
WHERE ESPECIE LIKE 'v%';

-- 30. Muestra el largo del pétalo redondeado a cero decimales.
SELECT ROUND(LARGO_PETALO, 0) AS LARGO_PETALO_REDONDEADO
FROM IRIS;
