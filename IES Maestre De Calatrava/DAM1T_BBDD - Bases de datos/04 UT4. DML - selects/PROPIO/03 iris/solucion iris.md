¡A sus órdenes! Tienes toda la razón, si estamos creando una guía de estudio, saltarnos pasos agrupándolos no ayuda a fijar los conceptos. Vamos a destripar estas 30 consultas sobre el dataset Iris una por una, con su explicación y su chuleta individual.

¡Ponte cómodo que empezamos!

---

**1. Muestra todo el contenido de la tabla, todas las filas y todas las columnas.**

SQL

```sql
SELECT * FROM IRIS;
```

**Explicación:** El asterisco (`*`) le ordena a la base de datos devolver la tabla entera sin ningún filtro. 
📝 **Chuleta:** Ideal para un vistazo rápido, pero prohibido en aplicaciones reales porque consume mucha memoria y red si la tabla es gigante.

**2. Muestra únicamente los nombres de las especies de todas las filas.**

SQL

```sql
SELECT ESPECIE FROM IRIS;
```

**Explicación:** Proyección de una sola columna. Se ignoran las medidas y solo vemos la especie. 
📝 **Chuleta:** Pide siempre solo las columnas que necesites. Si devuelves 150 filas, solo viajará esa pequeña porción de texto.

**3. Muestra solo la columna del largo del pétalo.**

SQL

```sql
SELECT LARGO_PETALO FROM IRIS;
```

**Explicación:** Igual que la anterior, extraemos únicamente una métrica específica. 
📝 **Chuleta:** El nombre de la columna debe estar escrito tal cual figura en la estructura de la base de datos (sin espacios).

**4. Muestra las columnas de largo de sépalo y ancho de sépalo.**

SQL

```sql
SELECT LARGO_SEPALO, ANCHO_SEPALO FROM IRIS;
```

**Explicación:** Proyección múltiple. Pedimos dos datos separándolos por una coma. 
📝 **Chuleta:** El orden en el que escribes las columnas en el `SELECT` es el orden exacto en el que aparecerán en la pantalla, independientemente de cómo estén guardadas en la tabla original.

**5. Muestra el identificador (ID) y la especie de cada flor.**

SQL

```sql
SELECT ID, ESPECIE FROM IRIS;
```

**Explicación:** Extrae la clave primaria (ID) junto con un dato descriptivo. 
📝 **Chuleta:** Incluir el ID suele ser necesario si luego vas a querer actualizar o borrar una fila específica en tu programa.

**6. Muestra todas las columnas de las flores que sean de la especie 'setosa'.**

SQL

```sql
SELECT * FROM IRIS
WHERE ESPECIE = 'setosa';
```

**Explicación:** Filtramos usando el `WHERE` para quedarnos solo con las filas que coincidan exactamente con la palabra 'setosa'. 
📝 **Chuleta:** Los textos siempre van entre comillas simples (`' '`). Además, la base de datos distingue mayúsculas de minúsculas dentro de esas comillas.

**7. Muestra todas las columnas de las flores que sean de la especie 'virginica'.**

SQL

```sql
SELECT * FROM IRIS
WHERE ESPECIE = 'virginica';
```

**Explicación:** Igual que el anterior, filtramos por otro valor de texto. 
📝 **Chuleta:** Si pusieras `'Virginica'` (con V mayúscula), la consulta probablemente devolvería 0 resultados porque no coincide al 100%.

**8. Muestra las flores que tengan un largo de pétalo igual a 1.4.**

SQL

```sql
SELECT * FROM IRIS
WHERE LARGO_PETALO = 1.4;
```

**Explicación:** Filtrado numérico por coincidencia exacta. 
📝 **Chuleta:** Los números NUNCA llevan comillas. Además, en SQL los decimales se separan siempre con un punto (`.`), nunca con una coma (`,`).

**9. Muestra las flores cuyo ancho de sépalo sea igual a 3.0.**

SQL

```sql
SELECT * FROM IRIS
WHERE ANCHO_SEPALO = 3.0;
```

**Explicación:** Otro filtrado numérico exacto. 
📝 **Chuleta:** Aunque el número termine en `.0`, al ser un campo numérico, SQL lo tratará como el número entero 3 al hacer la comparación.

**10. Muestra las flores que tengan un largo de sépalo mayor que 6.0.**

SQL

```sql
SELECT * FROM IRIS
WHERE LARGO_SEPALO > 6.0;
```

**Explicación:** Usamos el operador "mayor que" (`>`) para acotar un límite inferior excluyente. 
📝 **Chuleta:** El `>` excluye el número exacto. Una flor que mida exactamente 6.0 NO aparecerá en esta lista.

**11. Muestra las flores con un ancho de pétalo menor que 0.3.**

SQL

```sql
SELECT * FROM IRIS
WHERE ANCHO_PETALO < 0.3;
```

**Explicación:** Usamos el operador "menor que" (`<`) para fijar un límite superior. 
📝 **Chuleta:** Al igual que el anterior, excluye el valor exacto 0.3.

**12. Consulta solo la especie y el largo del pétalo para flores con largo de pétalo >= 5.0.**

SQL

```sql
SELECT ESPECIE, LARGO_PETALO
FROM IRIS
WHERE LARGO_PETALO >= 5.0;
```

**Explicación:** Combinamos proyección de columnas concretas y un filtro "mayor o igual" (`>=`). 
📝 **Chuleta:** Al añadir el símbolo `=`, incluimos en el resultado a las flores que midan exactamente 5.0.

**13. Muestra el ID y la especie de las flores con ancho de sépalo <= 2.5.**

SQL

```sql
SELECT ID, ESPECIE
FROM IRIS
WHERE ANCHO_SEPALO <= 2.5;
```

**Explicación:** Filtro "menor o igual" (`<=`) mostrando solo dos columnas.
📝 **Chuleta:** Puedes filtrar por una columna en el `WHERE` (`ANCHO_SEPALO`) aunque no la vayas a mostrar en el `SELECT`. No es obligatorio imprimir lo que usas para buscar.

**14. Muestra todas las flores excepto las de la especie 'setosa'.**

SQL

```sql
SELECT * FROM IRIS
WHERE ESPECIE <> 'setosa';
```

**Explicación:** Operador de desigualdad para excluir un grupo. 
📝 **Chuleta:** En el estándar SQL, "distinto de" se escribe `<>`. (Aunque motores modernos como Oracle, MySQL o PostgreSQL también entienden `!=`).

**15. Muestra las flores que tengan un largo de pétalo distinto de 1.5.**

SQL

```sql
SELECT * FROM IRIS
WHERE LARGO_PETALO <> 1.5;
```

**Explicación:** Exclusión basada en un valor numérico. 
📝 **Chuleta:** Excluir valores exactos en campos decimales puede ser engañoso si los datos de origen tienen más precisión oculta (ej. 1.50001).

**16. Muestra todas las flores ordenadas por su largo de pétalo de menor a mayor.**

SQL

```sql
SELECT * FROM IRIS
ORDER BY LARGO_PETALO ASC;
```

**Explicación:** Ordenación ascendente de resultados. 
📝 **Chuleta:** El `ORDER BY` siempre es la última línea de tu consulta. `ASC` significa ascendente (de 0 a 9, o de A a la Z). Es el valor por defecto si no pones nada.

**17. Muestra todas las flores ordenadas por su ancho de sépalo de mayor a menor.**

SQL

```sql
SELECT * FROM IRIS
ORDER BY ANCHO_SEPALO DESC;
```

**Explicación:** Ordenación descendente de resultados.
📝 **Chuleta:** `DESC` significa descendente (del más grande al más pequeño). Imprescindible para hacer ránkings (los más caros, los más recientes, etc.).

**18. Muestra las especies ordenadas alfabéticamente.**

SQL

```sql
SELECT ESPECIE FROM IRIS
ORDER BY ESPECIE ASC;
```

**Explicación:** Ordena un campo de texto. 
📝 **Chuleta:** Al ordenar texto, la base de datos se guía por el alfabeto. ¡Ojo! Las mayúsculas y minúsculas pueden afectar el orden dependiendo de la configuración de tu servidor.

**19. Muestra el largo y ancho del pétalo de las flores 'virginica', ordenadas por largo del pétalo descendente.**

SQL

```sql
SELECT LARGO_PETALO, ANCHO_PETALO
FROM IRIS
WHERE ESPECIE = 'virginica'
ORDER BY LARGO_PETALO DESC;
```

**Explicación:** Mezcla de filtro (`WHERE`) y ordenación (`ORDER BY`). 
📝 **Chuleta: El orden lógico.** La BD primero filtra las 'virginicas' y, de las que sobran, las ordena de mayor a menor. El `ORDER BY` siempre va _después_ del `WHERE`.

**20. Muestra las flores 'versicolor' y además con largo de sépalo > 6.0.**

SQL

```sql
SELECT * FROM IRIS
WHERE ESPECIE = 'versicolor'
  AND LARGO_SEPALO > 6.0;
```

**Explicación:** Operador lógico `AND`. Exige que se cumplan múltiples condiciones. 
📝 **Chuleta:** Con `AND`, la flor tiene que ser obligatoriamente 'versicolor' Y medir obligatoriamente más de 6.0. Si falla una de las dos, se descarta.

**21. Muestra las flores de la especie 'setosa' o de la especie 'virginica'.**

SQL

```sql
SELECT * FROM IRIS
WHERE ESPECIE = 'setosa'
   OR ESPECIE = 'virginica';
```

**Explicación:** Operador lógico `OR`. Amplía los resultados dando opciones alternativas. 
📝 **Chuleta:** Esta es la forma clásica de hacerlo. Sin embargo, para listas de opciones en una misma columna, es mucho más limpio y profesional usar el operador `IN ('setosa', 'virginica')`.

**22. Muestra las flores cuyo largo de pétalo esté entre 4.0 y 5.0 (ambos incluidos).**

SQL

```sql
SELECT * FROM IRIS
WHERE LARGO_PETALO BETWEEN 4.0 AND 5.0;
```

**Explicación:** Filtro de rangos usando `BETWEEN`. 
📝 **Chuleta:** `BETWEEN` es inclusivo. Es exactamente igual a escribir `LARGO_PETALO >= 4.0 AND LARGO_PETALO <= 5.0`, pero mucho más fácil de leer.

**23. Muestra las flores cuyo ancho de pétalo NO sea 0.2.**

SQL

```sql
SELECT * FROM IRIS
WHERE ANCHO_PETALO <> 0.2;
```

**Explicación:** Otra demostración del operador de exclusión aplicado a decimales. 
📝 **Chuleta:** También válido para repasar que `<>` es el estándar para "diferente a".

**24. Selecciona el largo del sépalo y la especie, pero cambia el nombre de la columna ESPECIE a "Tipo_De_Flor" en el resultado.**

SQL

```sql
SELECT LARGO_SEPALO, ESPECIE AS Tipo_De_Flor
FROM IRIS;
```

**Explicación:** Renombramos la cabecera de la columna con un Alias usando `AS`. 
📝 **Chuleta:** El alias solo cambia cómo se ve en la pantalla, no modifica el nombre real de la columna en la base de datos. Si quieres que lleve espacios (ej. `AS "Tipo de Flor"`), deberás usar comillas dobles.

**25. Muestra el largo del pétalo multiplicado por 2 para todas las flores.**

SQL

```sql
SELECT (LARGO_PETALO * 2) AS LARGO_PETALO_X2
FROM IRIS;
```

**Explicación:** Operaciones matemáticas "al vuelo" dentro del `SELECT`. 
📝 **Chuleta:** Puedes sumar `+`, restar `-`, multiplicar `*` o dividir `/`. La BD calcula el resultado instantáneamente por cada fila que imprime.

**26. Calcula la suma del largo del sépalo más el ancho del sépalo para cada flor y llámalo "dimension_sepalo".**

SQL

```sql
SELECT (LARGO_SEPALO + ANCHO_SEPALO) AS dimension_sepalo
FROM IRIS;
```

**Explicación:** Operamos matemáticamente sumando los valores de dos columnas diferentes de la misma fila. 
📝 **Chuleta:** Si alguna de las dos columnas estuviera vacía (`NULL`), el resultado de esa suma sería obligatoriamente `NULL`. ¡Ojo con los vacíos al hacer matemáticas!

**27. Muestra los nombres de las especies convertidos a mayúsculas.**

SQL

```sql
SELECT UPPER(ESPECIE) AS ESPECIE_MAYUS
FROM IRIS;
```

**Explicación:** Uso de funciones de fila única (`Single-Row Functions`) para manipular texto. 
📝 **Chuleta:** `UPPER()` pasa todo a mayúsculas. Existen también `LOWER()` para minúsculas y `INITCAP()` para la primera letra en mayúscula.

**28. Muestra solo las 3 primeras letras de la especie de cada flor.**

SQL

```sql
SELECT SUBSTR(ESPECIE, 1, 3) AS ESPECIE_3_LETRAS
FROM IRIS;
```

**Explicación:** Función `SUBSTR` (Substring) para recortar cadenas de texto. 
📝 **Chuleta:** Los parámetros son: `SUBSTR(texto_a_cortar, posicion_de_inicio, cantidad_de_letras)`. En Oracle, el primer carácter es el 1, no el 0.

**29. Busca las flores cuya especie empiece por la letra 'v'.**

SQL

```sql
SELECT * FROM IRIS
WHERE ESPECIE LIKE 'v%';
```

**Explicación:** Búsqueda difusa usando el operador `LIKE` y comodines. 
📝 **Chuleta:** El signo de porcentaje `%` actúa como comodín. `v%` significa "Tiene que empezar por la letra v, y detrás puede haber cualquier cosa o nada".

**30. Muestra el largo del pétalo redondeado a cero decimales.**

SQL

```sql
SELECT ROUND(LARGO_PETALO, 0) AS LARGO_PETALO_REDONDEADO
FROM IRIS;
```

**Explicación:** Función matemática para redondear valores numéricos. 
📝 **Chuleta:** `ROUND(columna, número_de_decimales)`. Si el decimal a descartar es 5 o superior, redondea hacia arriba (ej. 1.5 se convierte en 2). Si usaras `TRUNC()`, cortaría los decimales sin redondear nada.

---

¡Ahí las tienes todas! Menuda colección de bloques de construcción tienes ya para dominar el SQL. ¿Qué te parece si aplicamos esto que acabas de ver en un desafío rápido?