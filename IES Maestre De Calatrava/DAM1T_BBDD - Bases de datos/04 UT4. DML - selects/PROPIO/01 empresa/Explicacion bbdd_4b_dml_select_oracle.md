Aquí tienes la lista completa de tus consultas desglosada con su explicación y su chuleta individual. ¡Vamos allá!

---

**Código 2**

SQL

```sql
SELECT *
FROM empleados;
```

**Explicación:** El asterisco `*` le dice a la base de datos "tráeme absolutamente todas las columnas que tenga esta tabla".
📝 **Chuleta:** Útil para explorar datos rápido, pero **evita usar `SELECT *` en programas reales**. Si mañana alguien añade una columna a la tabla, tu programa podría romperse. Pide siempre columnas específicas.

---

**Código 3**

SQL

```sql
SELECT id, nombre, apellido1, apellido2, email
FROM empleados;
```

**Explicación:** Proyección básica. Solo seleccionamos y mostramos las columnas que nos interesan, separadas por comas. 
📝 **Chuleta:** El orden en el que escribas las columnas en el `SELECT` será el orden exacto en el que se mostrarán en pantalla.

---

**Código 4**

SQL

```sql
SELECT nombre, apellido1, apellido2,
       salario,
       salario * 12,
       salario + 300
FROM empleados;
```

**Explicación:** Las columnas no tienen que ser solo datos estáticos; puedes hacer operaciones matemáticas (suma, resta, multiplicación, división) directamente en el `SELECT`. 
📝 **Chuleta:** La base de datos calcula ese valor al vuelo por cada fila. Esas columnas matemáticas no se guardan en el disco duro, solo existen en el resultado visual.

---

**Código 5**

SQL

```sql
SELECT apellido1 AS "Primer Apellido",
       salario * 12 AS salario_anual,
       (salario + 300) * 12 AS "Salario Anual Proyectado"
FROM empleados;
```

**Explicación:** Usamos la palabra reservada `AS` para renombrar las cabeceras de las columnas y hacerlas más legibles. 
📝 **Chuleta:** Si el alias tiene espacios en blanco o quieres forzar mayúsculas/minúsculas exactas, DEBES rodearlo con comillas dobles `" "`. Si es una sola palabra (como `salario_anual`), no hacen falta.

---

**Código 6**

SQL

```sql
SELECT puesto_id || ' asignado a ' || apellido1 AS "asignacion de puesto"
FROM empleados;
```

**Explicación:** La concatenación junta varias columnas y textos literales en una sola celda de texto. 
📝 **Chuleta:** En Oracle (y PostgreSQL), se usan las dobles barras verticales `||` para pegar texto. Las comillas simples `' '` se usan para inyectar tus propias palabras entre los datos.

---

**Código 7**

SQL

```sql
SELECT DISTINCT departamento_id
FROM empleados;
```

**Explicación:** Muestra qué departamentos tienen al menos un empleado, eliminando los resultados duplicados. 
📝 **Chuleta:** `DISTINCT` siempre va justo después del `SELECT`. Si pones varias columnas (`DISTINCT nombre, apellido`), considerará única la _combinación_ de ambas.

---

**Código 8**

SQL

```sql
SELECT nombre, apellido1, apellido2, departamento_id
FROM empleados
WHERE departamento_id = 500;
```

**Explicación:** Filtra los resultados para mostrar únicamente las filas que cumplan la condición matemática exacta. 
📝 **Chuleta:** El `WHERE` actúa como un embudo que evalúa fila por fila ANTES de mostrar nada en pantalla.

---

**Código 9**

SQL

```sql
SELECT nombre, apellido1, apellido2, puesto_id
FROM empleados
WHERE apellido1 = 'Valdes';
```

**Explicación:** Filtrado por texto exacto. Las cadenas de texto siempre deben ir entre comillas simples. 
📝 **Chuleta:** Cuidado, la base de datos es _Case Sensitive_ dentro de las comillas. 'Valdes' no es lo mismo que 'VALDES' o 'valdes'.

---

**Código 10**

SQL

```sql
SELECT nombre, apellido1, apellido2, puesto_id
FROM empleados
WHERE UPPER(apellido1) = 'VALDES';
```

**Explicación:** Para evitar problemas de mayúsculas/minúsculas, convertimos temporalmente el apellido del empleado a mayúsculas con `UPPER()` y lo comparamos con un texto en mayúsculas. 📝 **Chuleta:** Usa `UPPER(columna) = 'TEXTO'` o `LOWER(columna) = 'texto'` cuando no estés seguro de cómo el usuario introdujo los datos originalmente.

---

**Código 11**

SQL

```sql
SELECT nombre, apellido1, apellido2, fecha_contratacion
FROM empleados
WHERE fecha_contratacion = TO_DATE('25/10/03','RR-MM-DD');
```

**Explicación:** Filtramos por una fecha convirtiendo un texto normal en un objeto fecha oficial de Oracle usando la máscara de formato correspondiente. 
📝 **Chuleta:** Nunca confíes en el formato por defecto. Siempre que compares fechas, usa `TO_DATE('texto', 'FORMATO')` para garantizar que la base de datos lo entiende correctamente.

---

**Código 12**

SQL

```sql
SELECT nombre, apellido1, apellido2, salario
FROM empleados
WHERE salario BETWEEN 2500 AND 3500;
```

**Explicación:** Encuentra valores dentro de un rango. 
📝 **Chuleta:** `BETWEEN` siempre es inclusivo. Es decir, incluye exactamente a los que cobran 2500 y a los que cobran 3500. Es idéntico a escribir `salario >= 2500 AND salario <= 3500`.

---

**Código 13**

SQL

```sql
SELECT nombre, apellido1, apellido2, puesto_id
FROM empleados
WHERE puesto_id IN ('SA_MAN','SA_REP');
```

**Explicación:** Comprueba si el valor de la fila coincide con _alguno_ de los elementos de la lista. 
📝 **Chuleta:** `IN` es la forma limpia y profesional de evitar escribir cadenas infinitas de `OR`. (Equivale a `puesto_id = 'SA_MAN' OR puesto_id = 'SA_REP'`).

---

**Código 14**

SQL

```sql
SELECT nombre, apellido1, apellido2
FROM empleados
WHERE apellido1 LIKE 'S%';
```

**Explicación:** Busca patrones de texto. El comodín `%` significa "cualquier cantidad de caracteres (incluso ninguno)". Busca apellidos que empiecen por S. 
📝 **Chuleta:** `LIKE 'S%'` (empieza por S), `LIKE '%S'` (termina en S), `LIKE '%S%'` (contiene la S en cualquier parte).

---

**Código 15**

SQL

```sql
SELECT nombre, apellido1, apellido2
FROM empleados
WHERE nombre LIKE '_o%';
```

**Explicación:** El comodín guion bajo `_` significa "exactamente UN carácter cualquiera". Aquí busca nombres donde la segunda letra sea obligatoriamente una 'o'. 
📝 **Chuleta:** Combina comodines. `_o%` = Un carácter cualquiera + una 'o' + lo que sea detrás.

---

**Código 16**

SQL

```sql
SELECT nombre, apellido1, gerente_id
FROM empleados
WHERE gerente_id IS NULL;
```

**Explicación:** Encuentra a los empleados que no tienen jefe (el CEO). 
📝 **Chuleta:** NUNCA uses `= NULL`. En SQL, la "nada" no es igual a "nada". Siempre debes preguntar `IS NULL` o `IS NOT NULL`.

---

**Código 17**

SQL

```sql
SELECT nombre, apellido1, apellido2, departamento_id, salario
FROM empleados
WHERE departamento_id = 100
AND salario > 20000;
```

**Explicación:** El operador `AND` exige que se cumplan ambas condiciones simultáneamente para que la fila aparezca. 
📝 **Chuleta:** `AND` restringe los resultados (hace el embudo más estrecho).

---

**Código 18**

SQL

```sql
SELECT nombre, apellido1, apellido2, departamento_id, salario
FROM empleados
WHERE departamento_id = 500
OR departamento_id = 100
AND salario >= 10000;
```

**Explicación:** Muestra el clásico error de precedencia. Como no hay paréntesis, la base de datos ejecuta primero el `AND` y luego el `OR`. 
📝 **Chuleta:** El `AND` tiene prioridad matemática sobre el `OR` (como la multiplicación frente a la suma). Esta consulta es peligrosa porque el resultado será impredecible.

---

**Código 19**

SQL

```sql
SELECT nombre, apellido1, apellido2, departamento_id, salario
FROM empleados
WHERE (departamento_id = 100 OR departamento_id = 200)
AND salario > 10000;
```

**Explicación:** El uso correcto de paréntesis para mezclar `OR` y `AND`. 
📝 **Chuleta:** Obliga a la base de datos a resolver primero el paréntesis (que sea del depto 100 o 200). Y del grupo resultante, SOLO pasarán los que ganen más de 10000.

---

**Código 20**

SQL

```sql
SELECT nombre, apellido1, fecha_contratacion
FROM empleados
ORDER BY fecha_contratacion DESC;
```

**Explicación:** Ordena los resultados. `DESC` (Descendente) los pone de mayor a menor (o del más reciente al más antiguo).
📝 **Chuleta:** `ORDER BY` siempre es la última instrucción de cualquier consulta SQL, porque actúa sobre el resultado final.

---

**Código 21**

SQL

```sql
SELECT departamento_id, apellido1, salario
FROM empleados
ORDER BY departamento_id ASC, salario DESC;
```

**Explicación:** Ordenamiento múltiple. Primero ordena por departamento (de menor a mayor) y, dentro de cada departamento, pone a los que más cobran arriba. 
📝 **Chuleta:** `ASC` (Ascendente) es el valor por defecto. Si no pones nada, SQL asume que quieres ordenar de menor a mayor.

---

**Código 22**

SQL

```sql
SELECT nombre, salario * 12 AS salario_anual
FROM empleados
ORDER BY salario_anual DESC;
```

**Explicación:** Ordena utilizando el alias que acabas de inventar en el `SELECT`. 
📝 **Chuleta:** Puedes ordenar usando alias porque el `ORDER BY` se ejecuta _después_ de procesar el `SELECT`.

---

**Código 23**

SQL

```sql
SELECT nombre, apellido1, comision_pct
FROM empleados
ORDER BY comision_pct ASC NULLS LAST;
```

**Explicación:** Define qué hacer con las celdas vacías al ordenar. 
📝 **Chuleta:** `NULLS LAST` tira todos los nulos al final de la lista. `NULLS FIRST` los pone arriba del todo. Muy útil en reportes financieros.

---

**Código 24**

SQL

```sql
SELECT nombre, salario
FROM empleados
ORDER BY salario DESC
FETCH FIRST 5 ROWS ONLY;
```

**Explicación:** Devuelve un "Top 5" de los que más cobran. Sintaxis estándar moderna. 
📝 **Chuleta:** `FETCH FIRST n ROWS ONLY` recorta la consulta para no traer un millón de filas si solo quieres ver las primeras. Sustituye al antiguo `ROWNUM` de Oracle.

---

**Código 25**

SQL

```sql
SELECT nombre, salario
FROM empleados
ORDER BY salario DESC
FETCH FIRST 5 ROWS WITH TIES;
```

**Explicación:** Trae el Top 5, pero contempla empates. Si el empleado 5 y 6 cobran exactamente lo mismo, mostrará a los 6. 
📝 **Chuleta:** `WITH TIES` es fundamental en ránkings. OBLIGA a usar `ORDER BY`, de lo contrario no sabe con qué empatar.

---

**Código 26**

SQL

```sql
SELECT nombre, salario
FROM empleados
ORDER BY salario DESC
FETCH FIRST 20 PERCENT ROWS ONLY;
```

**Explicación:** En lugar de un número fijo, trae un porcentaje del total de resultados. 
📝 **Chuleta:** Útil para análisis estadísticos (ej. "quiero ver al 10% de los clientes que más compran").

---

**Código 27**

SQL

```sql
SELECT id, nombre, apellido1, apellido2
FROM empleados
ORDER BY apellido1, apellido2
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;
```

**Explicación:** Paginación pura. Salta las primeras 5 filas y empieza a mostrar a partir de la 6 (trayendo solo 5). 
📝 **Chuleta:** `OFFSET` salta resultados. Es la clave para programar botones de "Página 1, Página 2, Página 3" en páginas web.

---

**Código 28**

SQL

```sql
SELECT UPPER(apellido1) AS apellido1_mayus,
       INITCAP(nombre) AS nombre_capitalizado
FROM empleados;
```

**Explicación:** Funciones de transformación de texto (Single-Row Functions). 
📝 **Chuleta:** `UPPER` (TODO MAYÚSCULAS), `LOWER` (todo minúsculas), `INITCAP` (Primera Letra En Mayúscula). Modifican el aspecto del dato al vuelo.

---

**Código 29**

SQL

```sql
SELECT nombre,
       SUBSTR(nombre,1,3) AS abreviatura,
       LENGTH(apellido1) AS longitud_apellido1
FROM empleados;
```

**Explicación:** Extracción de texto y métricas. 
📝 **Chuleta:** `SUBSTR(texto, inicio, cantidad)` recorta un trozo de texto. `LENGTH` cuenta cuántos caracteres tiene una cadena.

---

**Código 30**

SQL

```sql
SELECT salario / 3 AS division_exacta,
       ROUND(salario / 3,2) AS redondeo_2_decimales,
       TRUNC(salario / 3,2) AS truncado_2_decimales
FROM empleados
WHERE id = 100;
```

**Explicación:** Tratamiento de decimales. 
📝 **Chuleta:** `ROUND` redondea (si el 3º decimal es 5 o superior, sube el anterior). `TRUNC` no piensa, simplemente pega un hachazo y borra lo que sobra sin redondear nada.

---

**Código 31**

SQL

```sql
SELECT id,
       (SYSDATE - fecha_contratacion)/7 AS semanas_trabajadas,
       ADD_MONTHS(fecha_contratacion,6) AS revision_semestral
FROM empleados;
```

**Explicación:** Matemáticas con fechas. 
📝 **Chuleta:** Restar dos fechas en Oracle devuelve _días naturales_. `ADD_MONTHS` suma o resta meses exactos teniendo en cuenta los años bisiestos y finales de mes.

---

**Código 32**

SQL

```sql
SELECT nombre,
       TO_CHAR(fecha_contratacion,'DD "de" Month "del" YYYY') AS fecha_texto,
       TO_CHAR(salario,'L99G999D99') AS salario_formato
FROM empleados;
```

**Explicación:** Conversión a texto con formato estético para informes. 
📝 **Chuleta:** `TO_CHAR` transforma números o fechas en texto. 'L' pone la moneda local, 'G' pone separador de miles, 'D' pone separador de decimales.

---

**Código 33**

SQL

```sql
SELECT nombre || ' ' || apellido1 || ' ' || apellido2 AS nombre_completo,
       salario,
       comision_pct,
       (salario*12)+(salario*12*NVL(comision_pct,0)) AS ingreso_total
FROM empleados;
```

**Explicación:** Cálculo financiero manejando comisiones que pueden estar en blanco. 
📝 **Chuleta:** ¡Cuidado con los nulos! Número + NULL = NULL. Usa SIEMPRE `NVL(columna, 0)` cuando operes matemáticamente con columnas que puedan tener celdas vacías.

---

**Código 34**

SQL

```sql
SELECT nombre || ' ' || apellido1 || ' ' || apellido2 AS nombre_completo,
       salario,
       CASE
         WHEN salario < 3000 THEN 'Junior'
         WHEN salario BETWEEN 3000 AND 8000 THEN 'Especialista'
         WHEN salario > 8000 THEN 'Directivo'
         ELSE 'No clasificado'
       END AS categoria_salarial
FROM empleados;
```

**Explicación:** El bloque `CASE` evalúa condiciones lógicas complejas y devuelve un texto (como un If-Else de programación). 
📝 **Chuleta:** `CASE` es el estándar en bases de datos. Permite usar rangos, mayores que, menores que, etc. Siempre debe terminar con la palabra `END`.

---

**Código 35**

SQL

```sql
SELECT nombre || ' ' || apellido1 || ' ' || apellido2 AS nombre_completo,
       puesto_id,
       salario,
       DECODE(puesto_id,
              'IT_PROG', salario*1.10,
              'ST_CLERK', salario*1.05,
              salario) AS nuevo_salario
FROM empleados;
```

**Explicación:** Simula una subida de sueldo dependiendo del departamento exacto. 
📝 **Chuleta:** `DECODE` es la versión antigua (y exclusiva de Oracle) del `CASE`. Funciona como "Si el puesto es X, haz esto. Si es Y, haz esto. Sino, haz Z". Funciona bien, pero usa `CASE` por ser más universal.

---

**Código 36**

SQL

```sql
SELECT MAX(salario) AS salario_maximo,
       MIN(salario) AS salario_minimo,
       MIN(fecha_contratacion) AS empleado_mas_antiguo
FROM empleados;
```

**Explicación:** Funciones de Agregación. Leen todas las filas y devuelven un único resultado final. 📝 **Chuleta:** `MAX()` devuelve el valor más alto, `MIN()` el más bajo. Si se aplica a fechas, el MINIMUM es la fecha más lejana en el pasado (el más antiguo).

---

**Código 37**

SQL

```sql
SELECT SUM(salario) AS nomina_total,
       ROUND(AVG(salario),2) AS salario_promedio
FROM empleados;
```

**Explicación:** Suma total y Promedio (Average). 
📝 **Chuleta:** Puedes envolver una función de agregación dentro de otra función de fila (como `ROUND` para quitarle los infinitos decimales al promedio).

---

**Código 38**

SQL

```sql
SELECT COUNT(*) AS total_empleados,
       COUNT(comision_pct) AS empleados_con_comision,
       COUNT(DISTINCT departamento_id) AS deptos_activos
FROM empleados;
```

**Explicación:** Las tres formas distintas de contar en SQL. 
📝 **Chuleta:** - `COUNT(*)`: Cuenta filas físicas completas (sean nulas o no).

- `COUNT(columna)`: Cuenta cuántas filas tienen algún valor en esa columna concreta (ignora nulos).
    
- `COUNT(DISTINCT columna)`: Cuenta cuántos valores _diferentes_ existen en esa columna.
    

---

**Código 39**

SQL

```sql
SELECT AVG(comision_pct) AS promedio_real,
       AVG(NVL(comision_pct,0)) AS promedio_ajustado
FROM empleados;
```

**Explicación:** Demuestra cómo las funciones de grupo lidian con los vacíos. 
📝 **Chuleta:** `AVG` ignora matemáticamente las filas que tienen nulos. Si quieres que la gente con "0 comisión" baje la media real de la empresa, debes convertir ese nulo en un 0 primero con `NVL()`.

---

**Código 40**

SQL

```sql
SELECT departamento_id,
       ROUND(AVG(salario),2) AS salario_medio
FROM empleados
GROUP BY departamento_id;
```

**Explicación:** Divide a los empleados en "montones" (grupos) según su departamento y calcula el salario promedio de _cada montón_. 
📝 **Chuleta:** La regla de oro: Cualquier columna "suelta" en el `SELECT` (como `departamento_id`) debe copiarse obligatoriamente en la cláusula `GROUP BY`.

---

**Código 41**

SQL

```sql
SELECT departamento_id, puesto_id,
       COUNT(*) AS cantidad_empleados
FROM empleados
GROUP BY departamento_id, puesto_id
ORDER BY departamento_id;
```

**Explicación:** Agrupación múltiple. Crea subgrupos (ej: "Programadores dentro de Tecnología", "Jefes dentro de Ventas"). 
📝 **Chuleta:** Debes poner en el `GROUP BY` todas las columnas del SELECT. El orden en el que las escribas en el GROUP BY no afecta al cálculo final.

---

**Código 42 (Incorrecto)**

SQL

```sql
SELECT departamento_id, AVG(salario)
FROM empleados
WHERE AVG(salario) > 8000
GROUP BY departamento_id;
```

**Explicación:** Esto lanzará un error "OEA-00934: group function is not allowed here". 
📝 **Chuleta:** La base de datos lee el `WHERE` fila por fila _antes_ de hacer los grupos. Por tanto, es imposible filtrar por un promedio, suma o cuenta en el `WHERE` porque aún no se ha calculado nada.

---

**Código 43**

SQL

```sql
SELECT departamento_id, MAX(salario)
FROM empleados
GROUP BY departamento_id
HAVING MAX(salario) > 10000;
```

**Explicación:** La forma correcta del anterior. El `HAVING` es el equivalente al `WHERE`, pero se ejecuta _después_ de hacer los grupos. 
📝 **Chuleta:** Úsalo siempre para filtrar basándote en un resultado matemático grupal (`SUM`, `MAX`, `AVG`, `COUNT`).

---

**Código 44**

SQL

```sql
SELECT departamento_id, COUNT(*)
FROM empleados
WHERE puesto_id NOT LIKE '%MAN'
AND puesto_id NOT LIKE '%MGR'
GROUP BY departamento_id
HAVING COUNT(*) > 5;
```

**Explicación:** El flujo completo. 1. Filtra filas (quitando jefes). 2. Agrupa los que quedan por departamento. 3. Borra los departamentos que tengan menos de 5 empleados en total. 
📝 **Chuleta:** Este es el orden estructural sagrado que debes memorizar: `WHERE` -> `GROUP BY` -> `HAVING` -> `ORDER BY`.

---

**Código 45** _(Es simplemente la creación de una tabla (`CREATE TABLE`), por lo que pasamos a las consultas directamente)_

---

**Código 46**

SQL

```sql
SELECT e.nombre,
       e.apellido1 || ' ' || e.apellido2 AS apellidos,
       d.nombre AS departamento
FROM empleados e
INNER JOIN departamentos d
ON e.departamento_id = d.id;
```

**Explicación:** Une información de dos tablas distintas donde las claves coinciden. 
📝 **Chuleta:** `INNER JOIN` actúa como una "intersección". Los empleados que no tengan departamento asignado NO aparecerán. Los departamentos sin empleados TAMPOCO.

---

**Código 48**

SQL

```sql
SELECT e.nombre, e.apellido1, d.nombre
FROM empleados e
LEFT JOIN departamentos d
ON e.departamento_id = d.id;
```

**Explicación:** Muestra TODOS los empleados, aunque no tengan departamento. 
📝 **Chuleta:** El `LEFT JOIN` da prioridad a la tabla de la izquierda (el `FROM`). Trae todos los empleados. Si no encuentra su departamento en la derecha, pone esa columna como `NULL`.

---

**Código 50**

SQL

```sql
SELECT e.nombre || ' ' || e.apellido1 AS empleado,
       d.nombre AS departamento
FROM empleados e
FULL JOIN departamentos d
ON e.departamento_id = d.id;
```

**Explicación:** Trae absolutamente todo. Intersecciones, sobrantes de la izquierda y sobrantes de la derecha. 
📝 **Chuleta:** Te mostrará empleados sin departamento (con un hueco a la derecha) Y departamentos sin empleados (con un hueco en la parte del empleado).

---

**Código 51**

SQL

```sql
SELECT t.nombre || ' ' || t.apellido1 AS trabajador,
       j.nombre || ' ' || j.apellido1 AS jefe
FROM empleados t
JOIN empleados j
ON t.gerente_id = j.id;
```

**Explicación:** Un "Auto-Join" o Join reflexivo. Unes una tabla consigo misma simulando que son dos distintas dándoles ALIAS diferentes (`t` para trabajador, `j` para jefe). 
📝 **Chuleta:** Útil en jerarquías (empleado-jefe, pieza-subpieza, tarea-subtarea). Recuerda cruzar la columna hija con el ID principal del padre (`t.gerente_id = j.id`).

---

**Código 52**

SQL

```sql
SELECT e.nombre, e.apellido1, d.nombre
FROM empleados e
CROSS JOIN departamentos d;
```

**Explicación:** Producto Cartesiano. Multiplica literalmente todas las filas de la tabla A por las filas de la tabla B. 
📝 **Chuleta:** No necesita condición `ON`. ¡Peligroso en tablas grandes! Si hay 100 empleados y 20 departamentos, generará 2000 resultados absurdos donde Juan estará asignado a todos los departamentos.

---

**Código 53**

SQL

```sql
SELECT puesto_id FROM empleados
UNION
SELECT puesto_id FROM job_history;
```

**Explicación:** Apila dos consultas una encima de otra verticalmente, eliminando las filas duplicadas resultantes. 
📝 **Chuleta:** Ambas consultas deben devolver el mismo número de columnas y del mismo tipo de datos. Si quieres que salgan duplicados, usa `UNION ALL`.

---

**Código 54**

SQL

```sql
SELECT puesto_id FROM empleados
INTERSECT
SELECT puesto_id FROM job_history;
```

**Explicación:** Muestra únicamente los registros que estén presentes en las dos consultas simultáneamente. 
📝 **Chuleta:** Matemáticamente es la intersección estricta de conjuntos (A y B).

---

**Código 55**

SQL

```sql
SELECT departamento_id FROM empleados
MINUS
SELECT departamento_id FROM departamentos;
```

**Explicación:** Coge los resultados de la consulta de arriba y "réstale" lo que encuentres en la consulta de abajo. 
📝 **Chuleta:** Te dice qué departamentos están en la tabla de empleados PERO NO existen en la tabla principal de departamentos (una excelente técnica para encontrar errores e inconsistencias en la BD).

---

**Código 56**

SQL

```sql
SELECT departamento_id FROM departamentos
MINUS
SELECT departamento_id FROM empleados;
```

**Explicación:** Igual que el anterior, pero restando al revés. 
📝 **Chuleta:** Muestra los departamentos que existen legalmente en la empresa, pero que actualmente están vacíos porque no hay nadie de la tabla de empleados asociado a ellos.

---

**Código 57**

SQL

```sql
SELECT nombre, salario
FROM empleados
WHERE salario > (SELECT AVG(salario) FROM empleados);
```

**Explicación:** Subconsulta escalar. Una consulta en paréntesis devuelve "la media" (un solo número), y la consulta externa lo usa para comparar en el `WHERE`.
📝 **Chuleta:** Si usas operadores como `=`, `>`, `<`, asegúrate de que tu subconsulta SIEMPRE vaya a devolver 1 única fila y 1 sola columna.

---

**Código 58**

SQL

```sql
SELECT nombre, puesto_id
FROM empleados
WHERE puesto_id = (SELECT puesto_id
                   FROM empleados
                   WHERE apellido1 = 'Valdes')
AND apellido1 <> 'Valdes';
```

**Explicación:** "Búscame a los empleados que tengan el mismo puesto que Valdés, pero quita a Valdés del resultado". 
📝 **Chuleta:** Es una forma de relacionar registros sin saber el dato de antemano (tú no sabes en qué trabaja Valdés, le pides a SQL que lo descubra primero).

---

**Código 59**

SQL

```sql
SELECT nombre, apellido1, apellido2
FROM empleados
WHERE departamento_id IN (SELECT id
                          FROM departamentos
                          WHERE ubicacion_id = 2300);
```

**Explicación:** Subconsulta de listas. La subconsulta devuelve varios números (IDs de departamento) y filtramos al empleado si encaja en alguno de ellos.
📝 **Chuleta:** Cuando la subconsulta devuelve varias filas, no puedes usar `=`, TIENES que usar `IN`.

---

**Código 60**

SQL

```sql
SELECT nombre, salario
FROM empleados
WHERE salario > ALL (SELECT salario
                     FROM empleados
                     WHERE departamento_id = 200);
```

**Explicación:** Operador masivo. Exige que el salario del empleado sea mayor que TODOS los salarios devueltos en la lista del paréntesis. (Es decir, mayor que el que más cobra de ese departamento). 
📝 **Chuleta:** `> ALL` (mayor que el más alto), `< ALL` (menor que el más bajo). Tambien existe `> ANY` (mayor que el más bajo de esa lista).

---

**Código 61**

SQL

```sql
SELECT e1.nombre, e1.departamento_id, e1.salario
FROM empleados e1
WHERE salario > (SELECT AVG(e2.salario)
                 FROM empleados e2
                 WHERE e2.departamento_id = e1.departamento_id);
```

**Explicación:** Subconsulta Correlacionada. La consulta "hija" (e2) utiliza un dato que viene de la consulta "padre" (e1) para autoejecutarse y calcular la media departamental cada vez que evalúa a un empleado nuevo. 
📝 **Chuleta:** Son súper potentes pero extremadamente lentas si procesas millones de filas, porque se comportan como un "Bucle For" ejecutando la query interna miles de veces.

---

**Código 62**

SQL

```sql
SELECT nombre
FROM departamentos d
WHERE EXISTS (SELECT 1
              FROM empleados e
              WHERE e.departamento_id = d.id);
```

**Explicación:** Encuentra departamentos que tienen empleados activos, usando un detector de existencias en lugar de un `JOIN` o un `IN`. 
📝 **Chuleta:** `EXISTS` es la opción más rápida para saber "si algo está", porque detiene la subconsulta en el mismo instante que encuentra la primera coincidencia (no necesita contar ni mapear el resto). Se suele usar `SELECT 1` o `SELECT 'x'` por convención, ya que no importa el dato que traiga, solo importa que traiga _algo_.