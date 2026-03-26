¡Perfecto! Vamos directos al **Bloque 2: Agregaciones y Agrupaciones (`GROUP BY` sin `HAVING`)**.

Este bloque marca un salto de nivel importante. Ya no estamos viendo los planetas uno a uno, sino que vamos a "aplastar" la tabla para hacer montones (grupos) y sacar métricas de ellos (medias, sumas, máximos, cuentas).

Aquí lo tienes, consulta a consulta, con tu formato favorito:

---

### Bloque 2: Agregaciones y Agrupaciones (GROUP BY sin HAVING)

**21. Calcula la distancia promedio de todos los planetas descubiertos por el método 'Transit'.**

SQL

```sql
SELECT AVG(distancia_años_luz) AS distancia_media
FROM planetas 
WHERE metodo_descubrimiento = 'Transit';
```

**Explicación:** Aunque estamos en el bloque de agrupaciones, aquí no hay `GROUP BY`. Pedimos una estadística global (la media) pero aplicada únicamente a las filas que superan el filtro `WHERE`. 
📝 **Chuleta:** Las funciones de grupo (`AVG`, `SUM`, `COUNT`, `MAX`, `MIN`) colapsan el resultado en una sola fila. Pueden usarse solas sin `GROUP BY` si quieres calcular el total absoluto de toda la tabla.

**22. Cuenta cuántos planetas se han descubierto en total por cada método de descubrimiento.**

SQL

```sql
SELECT metodo_descubrimiento, COUNT(*) AS total_planetas
FROM planetas 
GROUP BY metodo_descubrimiento;
```

**Explicación:** Le pedimos a SQL que separe las filas en "montones" según su método de descubrimiento, y luego cuente cuántos registros físicos hay dentro de cada montón. 📝 **Chuleta: La Regla de Oro.** TODA columna que escribas en el `SELECT` y que no esté envuelta en una función matemática (como `COUNT`), **tiene que copiarse obligatoriamente** en el `GROUP BY`. Si te olvidas, dará error.

**23. Calcula la masa máxima y la masa mínima encontrada en cada año de descubrimiento.**

SQL

```sql
SELECT anio_descubrimiento, 
       MAX(masa_planeta) AS masa_maxima, 
       MIN(masa_planeta) AS masa_minima
FROM planetas 
GROUP BY anio_descubrimiento;
```

**Explicación:** Agrupamos las filas por año y le aplicamos dos funciones estadísticas distintas al mismo grupo de manera simultánea. 📝 **Chuleta:** Las funciones matemáticas ignoran automáticamente los valores `NULL`. Si en 2005 hubo 10 planetas pero 9 no tienen la masa registrada, `MAX()` calculará el máximo basándose solo en el único planeta que sí tiene datos.

**24. Muestra el año de descubrimiento y cuántos planetas se descubrieron ese año, pero solo considerando los planetas descubiertos por 'Radial Velocity'.**

SQL

```sql
SELECT anio_descubrimiento, COUNT(*) AS cantidad
FROM planetas 
WHERE metodo_descubrimiento = 'Radial Velocity'
GROUP BY anio_descubrimiento;
```

**Explicación:** Filtramos la "masa bruta" de datos primero (`WHERE`) para quitar los demás métodos y quedarnos con Radial Velocity. Luego, agrupamos a los supervivientes por año. 📝 **Chuleta:** El orden lógico siempre es: 1º Filtrar filas sueltas (`WHERE`) ➔ 2º Hacer los montones (`GROUP BY`).

**25. Calcula la suma total de la masa de todos los planetas agrupados por el número de planetas que hay en su sistema.**

SQL

```sql
SELECT numero_planetas, SUM(masa_planeta) AS suma_masa_total
FROM planetas 
GROUP BY numero_planetas;
```

**Explicación:** Crea grupos numéricos (sistemas de 1 planeta, de 2, de 3...) y suma literalmente todas las masas de los integrantes de cada grupo. 📝 **Chuleta:** `SUM()` suma los valores. A diferencia de `COUNT(*)`, que cuenta filas existan o no, si intentas hacer un `SUM` de un grupo donde absolutamente todos los valores son nulos, el resultado será `NULL`.

**26. Muestra el promedio del periodo orbital para cada método, pero considerando solo los planetas descubiertos después del año 2010.**

SQL

```sql
SELECT metodo_descubrimiento, AVG(periodo_orbital) AS promedio_orbital
FROM planetas 
WHERE anio_descubrimiento > 2010
GROUP BY metodo_descubrimiento;
```

**Explicación:** Descartes por fecha usando `WHERE` antes de sacar la media por cada técnica de observación. 📝 **Chuleta:** Puedes usar el `WHERE` para filtrar por columnas (como el año) que ni siquiera vas a imprimir luego en tu `SELECT`.

**27. Cuenta cuántos planetas tienen distancia nula (desconocida) en cada año.**

SQL

```sql
SELECT anio_descubrimiento, COUNT(*) AS sin_distancia
FROM planetas 
WHERE distancia_años_luz IS NULL
GROUP BY anio_descubrimiento;
```

**Explicación:** Obligamos a que la consulta solo trabaje con la "basura" o datos incompletos (`IS NULL`) y agrupamos para ver en qué años nos faltó más información. 📝 **Chuleta:** Tienes que usar `COUNT(*)` (contar filas). Si pusieras `COUNT(distancia_años_luz)`, el resultado sería siempre 0 en todos los años, porque la función `COUNT(columna)` se niega a contar celdas que tengan `NULL`.

**28. Calcula la distancia máxima descubierta por cada método, excluyendo los planetas con masa desconocida.**

SQL

```sql
SELECT metodo_descubrimiento, MAX(distancia_años_luz) AS distancia_maxima
FROM planetas 
WHERE masa_planeta IS NOT NULL
GROUP BY metodo_descubrimiento;
```

**Explicación:** Filtramos la ausencia de datos en una columna (masa) y sacamos estadísticas sobre otra columna completamente diferente (distancia). 📝 **Chuleta:** `IS NOT NULL` en el `WHERE` te asegura que tus cálculos posteriores sean puros y exactos con datos comprobados.

**29. Muestra el número de planetas descubiertos por año, pero solo para los años pares. Ordenar descendentemente.**

SQL

```sql
SELECT anio_descubrimiento, COUNT(*) AS total_descubrimientos
FROM planetas 
WHERE MOD(anio_descubrimiento, 2) = 0
GROUP BY anio_descubrimiento
ORDER BY anio_descubrimiento DESC;
```

**Explicación:** Filtro matemático (`MOD`), agrupación y ordenación final. 📝 **Chuleta:** El `ORDER BY` se coloca _siempre_ en la última línea absoluta del código. Actúa sobre el resultado final de los grupos ya hechos.

**30. Agrupa por método de descubrimiento y año, mostrando la cuenta de planetas para cada combinación. Ordenar primero ascendentemente y luego descendentemente.**

SQL

```sql
SELECT metodo_descubrimiento, anio_descubrimiento, COUNT(*) AS total
FROM planetas 
GROUP BY metodo_descubrimiento, anio_descubrimiento
ORDER BY metodo_descubrimiento ASC, anio_descubrimiento DESC;
```

**Explicación:** Agrupación múltiple y ordenación múltiple. Esto crea subgrupos (ej. Transit 2012, Transit 2013, Radial 2010...). 📝 **Chuleta:** Como tienes dos columnas "sueltas" en el `SELECT`, **ambas** deben estar en el `GROUP BY`. El orden en el que las escribas en el `GROUP BY` da igual, pero en el `ORDER BY` sí importa muchísimo (primero ordenará alfabéticamente por método, y dentro de un mismo método, pondrá el año más reciente primero).

**31. Calcula la media de la distancia en años luz agrupada por el número de planetas del sistema, ordenado de mayor a menor distancia media.**

SQL

```sql
SELECT numero_planetas, AVG(distancia_años_luz) AS media_distancia
FROM planetas 
GROUP BY numero_planetas
ORDER BY media_distancia DESC;
```

**Explicación:** Agrupamos y ordenamos utilizando el alias que hemos fabricado en el `SELECT`. 📝 **Chuleta:** Como el `ORDER BY` es lo último que lee la base de datos, es la única cláusula que **sí reconoce los Alias** (como `media_distancia`). Si intentaras usar ese alias en el `GROUP BY` o en el `WHERE`, daría error.

**32. Cuenta cuántos métodos de descubrimiento distintos se utilizaron cada año.**

SQL

```sql
SELECT anio_descubrimiento, COUNT(DISTINCT metodo_descubrimiento) AS metodos_usados
FROM planetas 
GROUP BY anio_descubrimiento;
```

**Explicación:** Cuenta valores únicos dentro de cada grupo temporal. 📝 **Chuleta:** ¡Vital! `COUNT(DISTINCT columna)` es la navaja suiza de las estadísticas. Si en 2010 se encontraron 50 planetas pero los 50 fueron por 'Transit', el recuento normal daría 50, pero el `DISTINCT` te dirá correctamente que solo se usó **1** método distinto ese año.

**33. Muestra la masa promedio por método de descubrimiento, considerando solo planetas que están a una distancia entre 10 y 100 años luz.**

SQL

```sql
SELECT metodo_descubrimiento, AVG(masa_planeta) AS masa_media
FROM planetas 
WHERE distancia_años_luz BETWEEN 10 AND 100
GROUP BY metodo_descubrimiento;
```

**Explicación:** Filtrado de rangos espaciales seguido de una media de pesos. 📝 **Chuleta:** `BETWEEN` funciona sin problemas con números con decimales y es mucho más óptimo que usar `>= 10 AND <= 100`.

**34. Calcula el periodo orbital más largo encontrado en cada año para los planetas solitarios (numero_planetas = 1).**

SQL

```sql
SELECT anio_descubrimiento, MAX(periodo_orbital) AS periodo_maximo
FROM planetas 
WHERE numero_planetas = 1
GROUP BY anio_descubrimiento;
```

**Explicación:** Filtramos los sistemas solares múltiples y sacamos el techo máximo (`MAX`) orbital por año.

**35. Cuenta cuántos planetas se han descubierto por el método 'Transit' agrupados por década (puedes usar funciones matemáticas sobre el año para truncarlo).**

SQL

```sql
SELECT FLOOR(anio_descubrimiento / 10) * 10 AS decada, COUNT(*) AS total_planetas
FROM planetas 
WHERE metodo_descubrimiento = 'Transit'
GROUP BY FLOOR(anio_descubrimiento / 10) * 10;
```

**Explicación:** Alteramos matemáticamente la fecha para crear agrupaciones por décadas ficticias (ej: 2014 / 10 = 201.4 ➔ `FLOOR` le quita los decimales dejándolo en 201 ➔ Al multiplicar por 10 te devuelve la década de 2010). 📝 **Chuleta:** Si en el `SELECT` transformas la columna con una fórmula, **toda esa fórmula** debe copiarse literalmente en el `GROUP BY`. No puedes agrupar simplemente por `anio_descubrimiento` si arriba estás proyectando una década modificada.

**36. Muestra la desviación estándar (si el motor lo permite, o si no, el promedio) de la masa agrupada por método.**

SQL

```sql
SELECT metodo_descubrimiento, STDDEV(masa_planeta) AS desviacion_masa
FROM planetas 
GROUP BY metodo_descubrimiento;
```

**Explicación:** `STDDEV` es una función estadística avanzada presente en Oracle que mide cómo de dispersos están los datos de masa respecto a su propia media. 📝 **Chuleta:** En Data Science, usar `STDDEV()` junto con `AVG()` te dice si todos los planetas de ese grupo pesan casi lo mismo, o si hay unos diminutos y otros gigantes.

**37. Calcula la suma de la distancia de todos los planetas descubiertos, desglosado por si el número de planetas en el sistema es mayor a 3.**

SQL

```sql
SELECT CASE 
           WHEN numero_planetas > 3 THEN 'Más de 3' 
           ELSE '3 o menos' 
       END AS categoria_sistema, 
       SUM(distancia_años_luz) AS distancia_total
FROM planetas 
GROUP BY CASE 
             WHEN numero_planetas > 3 THEN 'Más de 3' 
             ELSE '3 o menos' 
         END;
```

**Explicación:** Usamos un bloque condicional `CASE` para inventarnos dos grupos artificiales que no existen nativamente en la tabla y sumar basándonos en ellos. 📝 **Chuleta:** Al igual que en la pregunta 35, el enorme bloque `CASE` que define tu nueva columna tiene que copiarse _entero_ en el `GROUP BY`.

**38. Muestra el año y la masa promedio de los planetas, excluyendo aquellos métodos de descubrimiento que empiezan por 'A' (Astrometry, etc.).**

SQL

```sql
SELECT anio_descubrimiento, AVG(masa_planeta) AS masa_promedio
FROM planetas 
WHERE metodo_descubrimiento NOT LIKE 'A%'
GROUP BY anio_descubrimiento;
```

**Explicación:** Filtramos la "basura" usando patrones de texto invertidos (`NOT LIKE`) antes de procesar las medias. 📝 **Chuleta:** Añadir la partícula `NOT` delante de un operador invierte su comportamiento: `NOT IN`, `NOT LIKE`, `IS NOT NULL`, `NOT BETWEEN`.

**39. Cuenta cuántos registros hay por cada método donde la distancia NO es nula y la masa NO es nula.**

SQL

```sql
SELECT metodo_descubrimiento, COUNT(*) AS registros_limpios
FROM planetas 
WHERE distancia_años_luz IS NOT NULL 
  AND masa_planeta IS NOT NULL
GROUP BY metodo_descubrimiento;
```

**Explicación:** Unimos condiciones con `AND` para asegurarnos de que la métrica de recuento solo analice datos 100% perfectos.

**40. Muestra el año y el periodo orbital mínimo, máximo y promedio, agrupado por año, solo para planetas descubiertos por 'Microlensing' o 'Imaging'.**

SQL

```sql
SELECT anio_descubrimiento, 
       MIN(periodo_orbital) AS min_orbital, 
       MAX(periodo_orbital) AS max_orbital, 
       AVG(periodo_orbital) AS avg_orbital
FROM planetas 
WHERE metodo_descubrimiento IN ('Microlensing', 'Imaging')
GROUP BY anio_descubrimiento;
```

**Explicación:** La "prueba final" del bloque. Combina limpieza inicial mediante listas (`IN`), agrupación por fechas y cálculo estadístico múltiple en simultáneo.

---

¡Dominar este bloque significa que ya sabes "aplanar" datos como un profesional! Si te ha quedado claro cómo se hacen los "montones" (GROUP BY), el siguiente paso natural sería aprender a tirar a la basura montones enteros que no nos interesen (para eso es el `HAVING`). ¿Hay alguna que se te haya atascado?