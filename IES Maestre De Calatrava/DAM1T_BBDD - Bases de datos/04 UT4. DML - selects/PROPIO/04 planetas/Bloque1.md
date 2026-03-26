¡Mis disculpas por el malentendido! Había interpretado que querías avanzar al siguiente, pero tienes toda la razón. Vamos a centrarnos **exclusivamente en el primer bloque** de la imagen de los planetas y a destriparlo consulta por consulta, con su código, su explicación y su chuleta.

Aquí tienes el **Bloque 1: Filtrado Complejo y Cálculos (Sin Agrupación)** al completo:

---

**1. Muestra el método de descubrimiento y el año de todos los planetas descubiertos en el siglo XXI (año 2001 en adelante).**

SQL

```sql
SELECT metodo_descubrimiento, anio_descubrimiento 
FROM planetas 
WHERE anio_descubrimiento >= 2001;
```

**Explicación:** Proyectamos dos columnas y filtramos usando un operador "mayor o igual" sobre el año de descubrimiento. 📝 **Chuleta:** `>=` incluye el número exacto. Si hubiésemos puesto `> 2000`, el resultado habría sido matemáticamente idéntico para valores enteros.

**2. Muestra los planetas que tienen una masa conocida pero cuya distancia es desconocida (NULL).**

SQL

```sql
SELECT * FROM planetas 
WHERE masa_planeta IS NOT NULL 
  AND distancia_años_luz IS NULL;
```

**Explicación:** Combinamos dos comprobaciones de nulos: exigimos que la masa sí tenga datos y que la distancia esté completamente vacía. 📝 **Chuleta:** `IS NOT NULL` es el guardián para asegurar que una celda tiene información útil. NUNCA uses `= NULL` ni `<> NULL`.

**3. Selecciona los planetas descubiertos por 'Radial Velocity' o 'Imaging' que estén a más de 100 años luz de distancia.**

SQL

```sql
SELECT * FROM planetas 
WHERE metodo_descubrimiento IN ('Radial Velocity', 'Imaging') 
  AND distancia_años_luz > 100;
```

**Explicación:** Usamos `IN` para simplificar la elección del método y lo unimos con un `AND` para forzar la condición de la distancia. 📝 **Chuleta:** Mezclar `IN` con `AND` es súper seguro y evita tener que usar paréntesis adicionales, lo cual sí sería obligatorio si usaras `OR` mezclado con `AND`.

**4. Muestra los planetas descubiertos entre 2005 y 2010 (ambos incluidos) que además tengan un periodo orbital menor a 10 días.**

SQL

```sql
SELECT * FROM planetas 
WHERE anio_descubrimiento BETWEEN 2005 AND 2010 
  AND periodo_orbital < 10;
```

**Explicación:** Acotamos un rango temporal y exigimos que su órbita sea muy rápida. 📝 **Chuleta:** `BETWEEN` siempre incluye los extremos (el 2005 y el 2010). Es ideal para rangos de números o fechas.

**5. Calcula una columna llamada 'masa_tierra' multiplicando la 'masa_planeta' por 317.8 (ya que la masa está en Júpiteres) para aquellos planetas con masa menor a 0.5.**

SQL

```sql
SELECT id, masa_planeta, (masa_planeta * 317.8) AS masa_tierra 
FROM planetas 
WHERE masa_planeta < 0.5;
```

**Explicación:** Hacemos una conversión matemática en el `SELECT` multiplicando por una constante y aplicamos el filtro `WHERE` sobre el dato original. 📝 **Chuleta:** Las operaciones matemáticas en el `SELECT` no alteran la base de datos, solo generan una columna "virtual" para ese resultado visual.

**6. Muestra los planetas cuyo método de descubrimiento contenga la palabra 'Timing' y que pertenezcan a sistemas con más de 2 planetas.**

SQL

```sql
SELECT * FROM planetas 
WHERE metodo_descubrimiento LIKE '%Timing%' 
  AND numero_planetas > 2;
```

**Explicación:** Búsqueda de un patrón de texto en cualquier lugar de la cadena usando los comodines `%` a ambos lados. 📝 **Chuleta:** `%Timing%` encontrará cualquier método que lo incluya (ej. "Eclipse Timing Variations" o "Pulsar Timing").

**7. Muestra los planetas descubiertos por 'Transit' que tengan una distancia conocida, ordenados por distancia de mayor a menor.**

SQL

```sql
SELECT * FROM planetas 
WHERE metodo_descubrimiento = 'Transit' 
  AND distancia_años_luz IS NOT NULL 
ORDER BY distancia_años_luz DESC;
```

**Explicación:** Triple combo: filtramos por texto, eliminamos nulos y ordenamos el resultado final. 📝 **Chuleta:** El `IS NOT NULL` es obligatorio aquí. En Oracle, los valores `NULL` se consideran infinitamente grandes al ordenar; si no los filtras, un `ORDER BY DESC` los pondría los primeros de la lista.

**8. Selecciona los planetas que NO fueron descubiertos ni por 'Transit' ni por 'Radial Velocity'.**

SQL

```sql
SELECT * FROM planetas 
WHERE metodo_descubrimiento NOT IN ('Transit', 'Radial Velocity');
```

**Explicación:** Exclusión limpia de una lista múltiple. 📝 **Chuleta:** `NOT IN` es la forma profesional de evitar largas cadenas de exclusiones (`metodo <> 'Transit' AND metodo <> 'Radial Velocity'`).

**9. Muestra los planetas descubiertos antes de 2000 que tengan una masa mayor a 1.0 O los descubiertos después de 2010 con una masa menor a 0.1 (ojo con los paréntesis).**

SQL

```sql
SELECT * FROM planetas 
WHERE (anio_descubrimiento < 2000 AND masa_planeta > 1.0) 
   OR (anio_descubrimiento > 2010 AND masa_planeta < 0.1);
```

**Explicación:** La "prueba de fuego" de la lógica booleana. Creamos dos grupos independientes de reglas matemáticas y permitimos que la base de datos escoja cualquiera de las dos realidades. 📝 **Chuleta:** Los paréntesis aquí son de vida o muerte. Sin ellos, la jerarquía de operadores de SQL leería el `AND` antes que el `OR` y generaría un caos lógico.

**10. Calcula la densidad de información: Muestra las columnas periodo, masa y distancia concatenadas en una sola cadena de texto para los planetas del año 2014.**

SQL

```sql
SELECT (periodo_orbital || ' - ' || masa_planeta || ' - ' || distancia_años_luz) AS densidad_info
FROM planetas 
WHERE anio_descubrimiento = 2014;
```

**Explicación:** Concatenamos tres valores numéricos separándolos por un guion estético para crear una sola cadena. 📝 **Chuleta:** En Oracle (y PostgreSQL), el operador `||` une textos y además convierte automáticamente los números a formato texto para poder pegarlos.

**11. Muestra los 5 planetas más lejanos descubiertos por el método 'Microlensing'.**

SQL

```sql
SELECT * FROM planetas 
WHERE metodo_descubrimiento = 'Microlensing' 
  AND distancia_años_luz IS NOT NULL
ORDER BY distancia_años_luz DESC 
FETCH FIRST 5 ROWS ONLY;
```

**Explicación:** Filtramos, quitamos nulos (crucial), ordenamos de mayor a menor y paginamos limitando el resultado a solo cinco filas. 📝 **Chuleta:** `FETCH FIRST n ROWS ONLY` es la sintaxis moderna estándar para extraer un "Top N".

**12. Lista los planetas donde el periodo orbital es mayor que la distancia en años luz.**

SQL

```sql
SELECT * FROM planetas 
WHERE periodo_orbital > distancia_años_luz;
```

**Explicación:** Compara dinámicamente el valor de dos columnas de la misma fila entre sí. 📝 **Chuleta:** No necesitas un número estático en el `WHERE`. Puedes comparar `Columna A > Columna B` y SQL lo evaluará fila por fila.

**13. Muestra los planetas cuyo año de descubrimiento es par y el número de planetas en el sistema es impar.**

SQL

```sql
SELECT * FROM planetas 
WHERE MOD(anio_descubrimiento, 2) = 0 
  AND MOD(numero_planetas, 2) <> 0;
```

**Explicación:** Usamos la función de Módulo (resto de la división entera) para determinar la paridad de los números. 📝 **Chuleta:** `MOD(columna, 2) = 0` es la fórmula matemática en Oracle para encontrar números pares. Si el resto no es cero (`<> 0`), entonces es impar.

**14. Selecciona los planetas donde la masa es nula O el periodo es nulo, pero la distancia SÍ es conocida.**

SQL

```sql
SELECT * FROM planetas 
WHERE (masa_planeta IS NULL OR periodo_orbital IS NULL) 
  AND distancia_años_luz IS NOT NULL;
```

**Explicación:** Otro bloque vital con paréntesis. Aceptamos cualquiera de los dos fallos en las métricas (masa o periodo), pero exigimos obligatoriamente que exista la distancia. 📝 **Chuleta:** Agrupa las condiciones `OR` entre paréntesis siempre que vayas a ligarlas a un `AND` externo.

**15. Muestra el método de descubrimiento y la distancia redondeada a cero decimales para los planetas a menos de 20 años luz.**

SQL

```sql
SELECT metodo_descubrimiento, ROUND(distancia_años_luz, 0) AS distancia_redondeada 
FROM planetas 
WHERE distancia_años_luz < 20;
```

**Explicación:** Aplicamos la función matemática `ROUND` para alterar la precisión decimal visualmente. 📝 **Chuleta:** `ROUND(columna, 0)` te devuelve el entero más cercano. Si el decimal es .5 o superior, redondeará hacia arriba automáticamente.

**16. Muestra los planetas descubiertos por 'Imaging' que tengan un periodo orbital superior a 365 días (un año terrestre) y una distancia menor a 50 años luz.**

SQL

```sql
SELECT * FROM planetas 
WHERE metodo_descubrimiento = 'Imaging' 
  AND periodo_orbital > 365 
  AND distancia_años_luz < 50;
```

**Explicación:** Apilamiento sucesivo de condiciones estrictas usando `AND`. 📝 **Chuleta:** Puedes encadenar tantos `AND` como soporte la lógica de tu negocio.

**17. Lista los planetas descubiertos a partir del año 2010 (incluido).**

SQL

```sql
SELECT * FROM planetas 
WHERE anio_descubrimiento >= 2010;
```

**Explicación:** Filtrado numérico simple indicando un punto de partida. 📝 **Chuleta:** "A partir de" e "incluido" son la señal inconfundible de que debes usar `>=`.

**18. Muestra los planetas que tienen exactamente 1, 4 o 6 planetas en su sistema.**

SQL

```sql
SELECT * FROM planetas 
WHERE numero_planetas IN (1, 4, 6);
```

**Explicación:** Validación matemática contra una matriz específica de valores usando `IN`. 📝 **Chuleta:** Como la columna `numero_planetas` es numérica, los valores dentro del paréntesis no llevan comillas simples.

**19. Calcula el cuadrado del periodo orbital para los planetas descubiertos en 2002.**

SQL

```sql
SELECT id, periodo_orbital, POWER(periodo_orbital, 2) AS periodo_al_cuadrado 
FROM planetas 
WHERE anio_descubrimiento = 2002;
```

**Explicación:** Uso de la función matemática de potencia. 📝 **Chuleta:** Usar `POWER(columna, 2)` es más limpio que escribir `(columna * columna)`. Funciona para cualquier exponente (al cubo, a la cuarta, etc.).

**20. Muestra los planetas ordenados primero por número de planetas (descendente) y luego por año de descubrimiento (ascendente) para romper empates.**

SQL

```sql
SELECT * FROM planetas 
ORDER BY numero_planetas DESC, anio_descubrimiento ASC;
```

**Explicación:** Sistema de ordenación secundaria. 📝 **Chuleta:** Si hay 50 sistemas que tienen "1 solo planeta", la base de datos usará la segunda columna especificada (`anio_descubrimiento`) para organizar internamente ese bloque empatado.