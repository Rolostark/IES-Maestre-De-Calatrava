¡Por fin tenemos los enunciados a la vista! 💎 Me pongo el monóculo de joyero, ajusto la balanza de precisión y vamos a pulir estas **50 consultas** una a una.

Como es un bloque inmenso que abarca desde la exploración básica hasta agrupaciones avanzadas, he sido directo y conciso en las explicaciones para que tengas una guía de estudio perfecta y rápida de leer.

¡Empezamos a tallar! 💍

---

### 🟢 Nivel 1: Exploración Básica de la Joyería

**1. Muestra todos los datos de los 100 primeros diamantes registrados en la tabla.**

SQL

```sql
SELECT * FROM diamantes 
FETCH FIRST 100 ROWS ONLY;
```

**Explicación:** Limita visualmente el tamaño del resultado para no sobrecargar la pantalla. 📝 **Chuleta:** `FETCH FIRST n ROWS ONLY` es el estándar en Oracle para limitar registros (equivalente al `LIMIT` de MySQL).


SQL

```sql
SELECT DISTINCT corte FROM diamantes;
```

**Explicación:** Extrae un listado único de los valores de esa columna.

**3. Lista todos los colores (color) únicos que puede tener un diamante según esta tabla.**

SQL

```sql
SELECT DISTINCT color FROM diamantes;
```

**Explicación:** Igual que el anterior, perfecto para conocer qué categorías existen.

**4. Obtén las distintas categorías de claridad presentes en los datos.**

SQL

```sql
SELECT DISTINCT claridad FROM diamantes;
```

**Explicación:** Extrae los valores únicos de pureza.

**5. Selecciona únicamente el identificador, los quilates y el precio de todos los diamantes.**

SQL

```sql
SELECT id, quilates, precio FROM diamantes;
```

**Explicación:** Proyección básica de columnas para reducir el ancho de la tabla devuelta.

**6. Cuenta cuál es el número total de filas almacenadas en la tabla.**

SQL

```sql
SELECT COUNT(*) AS total_diamantes FROM diamantes;
```

**Explicación:** Nos da el tamaño exacto de nuestro catálogo completo.

**7. Muestra el identificador y las dimensiones físicas tridimensionales (longitud_x, ancho_y, profundidad_z) de todos los diamantes.**

SQL

```sql
SELECT id, longitud_x, ancho_y, profundidad_z FROM diamantes;
```

**Explicación:** Proyección simple múltiple.

**8. Calcula cuál es el precio mínimo y el precio máximo de todos los diamantes del catálogo.**

SQL

```sql
SELECT MIN(precio) AS precio_mas_barato, MAX(precio) AS precio_mas_caro 
FROM diamantes;
```

**Explicación:** Funciones de agregación globales sin `GROUP BY` para obtener los topes del catálogo.

**9. Descubre cuál es el peso en quilates más bajo y más alto registrado en la tabla.**

SQL

```sql
SELECT MIN(quilates) AS min_quilates, MAX(quilates) AS max_quilates 
FROM diamantes;
```

**Explicación:** Igual que la anterior, sacando los extremos estadísticos.

**10. Muestra todos los datos de aquellos diamantes que tienen un color exactamente igual a 'D'.**

SQL

```sql
SELECT * FROM diamantes 
WHERE color = 'D';
```

**Explicación:** Filtrado estricto de texto.

---

### 🟡 Nivel 2: Agrupaciones y Filtros Intermedios

**11. Calcula el precio promedio de los diamantes agrupados por su tipo de corte.**

SQL

```sql
SELECT corte, AVG(precio) AS precio_medio 
FROM diamantes 
GROUP BY corte;
```

**Explicación:** Aplasta la tabla en montones según el corte y calcula la media matemática.

**12. Agrupa los diamantes por color y muestra solo aquellos colores que tienen más de 5000 diamantes en total.**

SQL

```sql
SELECT color, COUNT(*) AS cantidad 
FROM diamantes 
GROUP BY color 
HAVING COUNT(*) > 5000;
```

**Explicación:** Filtra los grupos matemáticos desechando los colores menos comunes.

**13. Muestra los diamantes que pesan más de 2 quilates y cuyo precio es estrictamente superior a 10000.**

SQL

```sql
SELECT * FROM diamantes 
WHERE quilates > 2 AND precio > 10000;
```

**Explicación:** Condiciones numéricas unidas por un `AND` lógico.

**14. Calcula el peso promedio en quilates agrupado por claridad, pero muestra únicamente las claridades cuyo peso promedio sea superior a 0.8.**

SQL

```sql
SELECT claridad, AVG(quilates) AS peso_medio 
FROM diamantes 
GROUP BY claridad 
HAVING AVG(quilates) > 0.8;
```

**Explicación:** Calcula la media por montón y usa esa misma media para decidir qué montón se muestra.

**15. Lista los diamantes donde alguna de sus dimensiones físicas (longitud_x, ancho_y o profundidad_z) no esté registrada (sea nula).**

SQL

```sql
SELECT * FROM diamantes 
WHERE longitud_x IS NULL OR ancho_y IS NULL OR profundidad_z IS NULL;
```

**Explicación:** Uso del `OR` para encontrar fallos de medición en cualquier dimensión.

**16. Calcula el valor total monetario (suma de precios) de los diamantes agrupados por color.**

SQL

```sql
SELECT color, SUM(precio) AS valor_total 
FROM diamantes 
GROUP BY color;
```

**Explicación:** Acumulativo financiero básico (`SUM`) por grupo.

**17. Agrupa por corte y muestra el precio promedio, pero solo para aquellos cortes cuyo precio medio supere los 4000.**

SQL

```sql
SELECT corte, AVG(precio) AS precio_medio 
FROM diamantes 
GROUP BY corte 
HAVING AVG(precio) > 4000;
```

**Explicación:** Regla de oro: si la condición depende de un cálculo (AVG), va en el `HAVING`.

**18. Muestra los diamantes con corte 'Ideal', ordenados por precio de mayor a menor.**

SQL

```sql
SELECT * FROM diamantes 
WHERE corte = 'Ideal' 
ORDER BY precio DESC;
```

**Explicación:** Limpieza, selección y ordenación final descendente (`DESC`).

**19. Muestra las combinaciones exactas de corte y color que tienen más de 1000 diamantes registrados.**

SQL

```sql
SELECT corte, color, COUNT(*) AS total 
FROM diamantes 
GROUP BY corte, color 
HAVING COUNT(*) > 1000;
```

**Explicación:** Agrupación múltiple (subgrupos) combinada con recuento.

**20. Calcula el promedio de la profundidad_porc y de la tabla_porc agrupado por cada tipo de corte.**

SQL

```sql
SELECT corte, AVG(profundidad_porc) AS prom_profundidad, AVG(tabla_porc) AS prom_tabla 
FROM diamantes 
GROUP BY corte;
```

**Explicación:** Varias métricas estadísticas distintas en la misma consulta.

---

### 🟠 Nivel 3: Matemáticas Avanzadas y Nulos (NULL)

**21. Muestra el identificador y calcula el volumen aproximado (multiplicando x, y, z) de aquellos diamantes donde ninguna de las tres dimensiones sea nula.**

SQL

```sql
SELECT id, (longitud_x * ancho_y * profundidad_z) AS volumen_aprox 
FROM diamantes 
WHERE longitud_x IS NOT NULL AND ancho_y IS NOT NULL AND profundidad_z IS NOT NULL;
```

**Explicación:** Matemáticas de proyección tras un triple seguro antinulos.

**22. Calcula el precio máximo agrupado por claridad, mostrando solo aquellas claridades donde el precio máximo no supere los 15000.**

SQL

```sql
SELECT claridad, MAX(precio) AS precio_max 
FROM diamantes 
GROUP BY claridad 
HAVING MAX(precio) <= 15000;
```

**Explicación:** Techo estadístico (`MAX`) evaluado en el `HAVING`.

**23. Muestra el precio mínimo agrupado por corte, pero teniendo en cuenta exclusivamente los diamantes de más de 1 quilate antes de hacer la agrupación.**

SQL

```sql
SELECT corte, MIN(precio) AS precio_minimo 
FROM diamantes 
WHERE quilates > 1 
GROUP BY corte;
```

**Explicación:** El `WHERE` hace el triaje inicial, el `GROUP BY` agrupa a los supervivientes.

**24. Selecciona los diamantes que tienen un color 'E' o 'F' y una claridad 'VVS1' o 'VVS2'.**

SQL

```sql
SELECT * FROM diamantes 
WHERE color IN ('E', 'F') AND claridad IN ('VVS1', 'VVS2');
```

**Explicación:** Combinación de listas (`IN`) con un `AND` obligatorio.

**25. Calcula el promedio de la tabla_porc agrupado por corte, filtrando el resultado para mostrar solo los cortes con un promedio general superior a 57.**

SQL

```sql
SELECT corte, AVG(tabla_porc) AS prom_tabla 
FROM diamantes 
GROUP BY corte 
HAVING AVG(tabla_porc) > 57;
```

**Explicación:** Promedio estándar con umbral.

**26. Cuenta cuántos diamantes hay agrupados por claridad, excluyendo antes del conteo a aquellos diamantes que tengan la longitud_x nula.**

SQL

```sql
SELECT claridad, COUNT(*) AS total 
FROM diamantes 
WHERE longitud_x IS NOT NULL 
GROUP BY claridad;
```

**Explicación:** Descarte de registros defectuosos antes de sacar las cuentas.

**27. Agrupa los diamantes por color y muestra aquellos colores donde el diamante más pequeño del grupo (mínimo de quilates) sea mayor a 0.2.**

SQL

```sql
SELECT color, MIN(quilates) AS min_quilates 
FROM diamantes 
GROUP BY color 
HAVING MIN(quilates) > 0.2;
```

**Explicación:** Condiciona un grupo en base a su valor más bajo (`MIN`).

**28. Muestra los diamantes donde la profundidad física (profundidad_z) sea numéricamente mayor que la longitud (longitud_x).**

SQL

```sql
SELECT * FROM diamantes 
WHERE profundidad_z > longitud_x;
```

**Explicación:** Comparación dinámica entre columnas de una misma fila.

**29. Suma el total del precio agrupado por claridad, mostrando solo aquellas claridades cuya suma total recaudada supere los 10.000.000.**

SQL

```sql
SELECT claridad, SUM(precio) AS total_recaudado 
FROM diamantes 
GROUP BY claridad 
HAVING SUM(precio) > 10000000;
```

**Explicación:** Sumas financieras evaluadas posteriormente en el `HAVING`.

**30. Calcula el promedio del volumen aproximado (x * y * z) agrupado por color, ignorando para el cálculo a los diamantes que tengan dimensiones nulas.**

SQL

```sql
SELECT color, AVG(longitud_x * ancho_y * profundidad_z) AS volumen_medio 
FROM diamantes 
WHERE longitud_x IS NOT NULL AND ancho_y IS NOT NULL AND profundidad_z IS NOT NULL 
GROUP BY color;
```

**Explicación:** Función `AVG` procesando dentro una multiplicación tridimensional.

---

### 🔴 Nivel 4: Maestría Joyera

**31. Muestra el precio promedio agrupado por corte, pero solo de aquellos cortes donde la diferencia entre el diamante más caro y el más barato de dicho corte sea mayor a 10000.**

SQL

```sql
SELECT corte, AVG(precio) AS precio_medio 
FROM diamantes 
GROUP BY corte 
HAVING (MAX(precio) - MIN(precio)) > 10000;
```

**Explicación:** Operamos matemáticamente con dos agregaciones distintas en la misma evaluación.

**32. Calcula el precio por quilate (precio dividido entre quilates) para los diamantes con corte 'Premium', mostrando el ID y el resultado calculado.**

SQL

```sql
SELECT id, (precio / quilates) AS precio_por_quilate 
FROM diamantes 
WHERE corte = 'Premium';
```

**Explicación:** Prorrateo clásico a nivel de fila individual.

**33. Agrupa los diamantes por su profundidad_porc (redondeada a cero decimales) y muestra aquellos porcentajes que agrupan a más de 500 diamantes.**

SQL

```sql
SELECT ROUND(profundidad_porc, 0) AS prof_redondeada, COUNT(*) AS total 
FROM diamantes 
GROUP BY ROUND(profundidad_porc, 0) 
HAVING COUNT(*) > 500;
```

**Explicación:** Creamos grupos artificiales aplicando una función matemática `ROUND` a la columna y agrupando por dicha fórmula.

**34. Muestra los diamantes cuya tabla_porc sea exactamente 55 o 60.**

SQL

```sql
SELECT * FROM diamantes 
WHERE tabla_porc IN (55, 60);
```

**Explicación:** Uso directo y seguro del `IN` con valores numéricos.

**35. Agrupa por corte y muestra la longitud_x promedio, pero solo para los cortes donde este promedio sea estrictamente mayor a 6.**

SQL

```sql
SELECT corte, AVG(longitud_x) AS prom_x 
FROM diamantes 
GROUP BY corte 
HAVING AVG(longitud_x) > 6;
```

**Explicación:** Filtro basado en el rendimiento de una dimensión física media.

**36. Obtén la dimensión máxima de longitud_x agrupada por cada tipo de corte.**

SQL

```sql
SELECT corte, MAX(longitud_x) AS max_x 
FROM diamantes 
GROUP BY corte;
```

**Explicación:** Extrae la joya más ancha por cada tipo de corte.

**37. Calcula el ratio resultante de dividir el precio promedio entre los quilates promedio agrupado por color, mostrando solo los colores donde este ratio supera los 3500.**

SQL

```sql
SELECT color, (AVG(precio) / AVG(quilates)) AS ratio_rentabilidad 
FROM diamantes 
GROUP BY color 
HAVING (AVG(precio) / AVG(quilates)) > 3500;
```

**Explicación:** Creamos un ratio estadístico dividiendo los resultados de dos promedios distintos.

**38. Selecciona los diamantes con un porcentaje de profundidad (profundidad_porc) comprendido entre 60 y 62, que además cuesten menos de 2000.**

SQL

```sql
SELECT * FROM diamantes 
WHERE profundidad_porc BETWEEN 60 AND 62 
  AND precio < 2000;
```

**Explicación:** Combinación de `BETWEEN` y operadores clásicos `<`, `>=`.

**39. Filtra los diamantes que cuestan más de 5000, agrúpalos por claridad y muestra solo aquellas claridades que retengan más de 200 diamantes con ese precio.**

SQL

```sql
SELECT claridad, COUNT(*) AS total 
FROM diamantes 
WHERE precio > 5000 
GROUP BY claridad 
HAVING COUNT(*) > 200;
```

**Explicación:** Filtramos la élite cara, hacemos montones y descartamos los montones pequeños.

**40. Calcula el número total de diamantes agrupados por color, pero solo tomando en consideración aquellos diamantes que tienen la tabla_porc registrada (no nula).**

SQL

```sql
SELECT color, COUNT(*) AS total 
FROM diamantes 
WHERE tabla_porc IS NOT NULL 
GROUP BY color;
```

**Explicación:** Descarte de registros incompletos (`IS NOT NULL`) previo al recuento.

**41. Agrupa por color y claridad combinados, calculando el precio promedio y mostrando solo los grupos cuyo precio promedio esté entre 3000 y 4000.**

SQL

```sql
SELECT color, claridad, AVG(precio) AS precio_medio 
FROM diamantes 
GROUP BY color, claridad 
HAVING AVG(precio) BETWEEN 3000 AND 4000;
```

**Explicación:** El `HAVING` acepta operadores ricos en lógica como el `BETWEEN`.

**42. Muestra el identificador, el corte y el precio de los 5 diamantes más caros de la tabla.**

SQL

```sql
SELECT id, corte, precio 
FROM diamantes 
ORDER BY precio DESC 
FETCH FIRST 5 ROWS ONLY;
```

**Explicación:** Ordenación descendente acotada para construir el "Top 5".

**43. Calcula la profundidad_z máxima agrupada por corte, mostrando únicamente los cortes donde dicha profundidad máxima supere el valor de 5.**

SQL

```sql
SELECT corte, MAX(profundidad_z) AS max_z 
FROM diamantes 
GROUP BY corte 
HAVING MAX(profundidad_z) > 5;
```

**Explicación:** `HAVING` utilizando el umbral del valor techo de su grupo.

**44. Encuentra el precio promedio de los diamantes agrupados por corte y color simultáneamente.**

SQL

```sql
SELECT corte, color, AVG(precio) AS precio_medio 
FROM diamantes 
GROUP BY corte, color;
```

**Explicación:** Múltiples variables independientes (corte + color) en el `GROUP BY`.

**45. Agrupa los diamantes por su peso exacto en quilates y muestra aquellos pesos que pertenecen exactamente a un único diamante en toda la base de datos.**

SQL

```sql
SELECT quilates, COUNT(*) AS diamantes_unicos 
FROM diamantes 
GROUP BY quilates 
HAVING COUNT(*) = 1;
```

**Explicación:** Un uso brillante del `GROUP BY` para encontrar "ejemplares únicos" o rarezas en la base de datos.

**46. Filtra los diamantes de color 'D', agrúpalos por corte y muestra solo los cortes cuyo precio promedio en ese color sea superior a 3000.**

SQL

```sql
SELECT corte, AVG(precio) AS precio_medio 
FROM diamantes 
WHERE color = 'D' 
GROUP BY corte 
HAVING AVG(precio) > 3000;
```

**Explicación:** Aislamiento demográfico (Color D), agrupación de corte y filtro final de precio medio.

**47. Calcula el precio mínimo agrupado por claridad, mostrando solo las claridades donde este precio mínimo sea inferior a 400.**

SQL

```sql
SELECT claridad, MIN(precio) AS precio_min 
FROM diamantes 
GROUP BY claridad 
HAVING MIN(precio) < 400;
```

**Explicación:** Extracción y filtrado del "suelo" de precios del grupo.

**48. Suma los quilates totales agrupados por color, y muestra solo los colores donde la suma total de quilates exceda la cantidad de 5000.**

SQL

```sql
SELECT color, SUM(quilates) AS masa_total 
FROM diamantes 
GROUP BY color 
HAVING SUM(quilates) > 5000;
```

**Explicación:** Función de masa agregada evaluando totales macro.

**49. Agrupa por corte y muestra aquellos cortes donde la cantidad de diamantes con longitud_x nula sea mayor a cero (pista: compara la cuenta total del grupo con la cuenta de la columna).**

SQL

```sql
SELECT corte 
FROM diamantes 
GROUP BY corte 
HAVING COUNT(*) > COUNT(longitud_x);
```

**Explicación:** ¡Magia pura! `COUNT(*)` cuenta todas las filas, pero `COUNT(longitud_x)` solo cuenta las filas que NO son nulas. Si el primero es mayor que el segundo, significa que existen nulos escondidos en ese grupo.

**50. Calcula el precio máximo y el promedio de quilates agrupado por corte, mostrando solo los cortes donde el máximo de precio sea mayor a 18000 y además el promedio de quilates sea menor a 1.**

SQL

```sql
SELECT corte, MAX(precio) AS max_precio, AVG(quilates) AS prom_quilates 
FROM diamantes 
GROUP BY corte 
HAVING MAX(precio) > 18000 AND AVG(quilates) < 1;
```

**Explicación:** Combos múltiples en el `HAVING` unidos por `AND`. Exigimos que el grupo sea carísimo pero con diamantes en promedio muy ligeros.

---

¡Reto superado! 50 consultas talladas a la perfección. Has pasado por todas las facetas del SQL: desde la limpieza de datos hasta operaciones cruzadas de estadística avanzada.

La número 49 me parece una genialidad técnica. ¿Qué te ha parecido a ti esta travesía por los diamantes?