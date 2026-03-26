# Resumen para Examen Teórico: DML en Oracle (SELECT)

## 1. Reglas Generales y Proyección (SELECT)
* **Proyección básica:** En entornos de producción, es recomendable especificar explícitamente las columnas deseadas en lugar del asterisco para mejorar el rendimiento y la claridad del código.
```sql
SELECT id, nombre, email FROM empleados;
```
* **Alias de columnas:** Si el alias contiene espacios, caracteres especiales o distingue mayúsculas de minúsculas, debe encerrarse obligatoriamente entre comillas dobles. 
```sql
SELECT salario * 12 AS "Salario Anual Total" FROM empleados;
  ```
* **Concatenación:** En Oracle, podemos unir columnas de texto o literales utilizando el operador de doble barra vertical (||).
```sql
SELECT nombre || ' ' || apellidol AS "Nombre Completo" FROM empleados;
```
* **DISTINCT:** Para eliminar duplicados y ver valores únicos, usamos DISTINCT justo después de la palabra clave SELECT.
```sql
SELECT DISTINCT departamento_id FROM empleados;
```

---

## 2. Filtrado de Filas (WHERE)
La cláusula WHERE debe colocarse siempre después de la cláusula FROM.

* **Sensibilidad (Case Sensitive):** Oracle SQL no distingue entre mayúsculas y minúsculas para los nombres de tablas o columnas. Sin embargo, la comparación de cadenas de texto (entre comillas simples) sí distingue mayúsculas de minúsculas.
```sql
SELECT * FROM empleados WHERE nombre = 'JUAN'; -- Solo encontrará 'JUAN' en mayúsculas
```
* **Comodines (LIKE):** El símbolo de porcentaje (%) representa cero o muchos caracteres. El símbolo de guion bajo (_) representa exactamente un carácter.
```sql
SELECT * FROM empleados WHERE nombre LIKE 'A%'; -- Empieza con A
SELECT * FROM empleados WHERE nombre LIKE '_o%'; -- 'o' en la segunda posición
```
* **La trampa de los Nulos:** Un error común es intentar comparar nulos con el operador de igualdad (= NULL), lo cual siempre devuelve falso o desconocido. Se debe usar obligatoriamente IS NULL o IS NOT NULL.
```sql
SELECT * FROM empleados WHERE comision_pct IS NULL;
```

* **AND**: Ambas condiciones deben ser ciertas
```sql
SELECT nombre, apellidol, salario FROM empleados WHERE departamento_id = 100 AND salario > 20000; -- Solo devuelve filas que cumplan AMBAS
```  
* **OR**: Al menos una debe ser cierta
```sql
SELECT nombre, apellidol, departamento_id FROM empleados WHERE departamento_id = 100 OR departamento_id = 500; -- Devuelve empleados de cualquiera de los dos
```
* **NOT**: Invierte el resultado
```sql
SELECT nombre, puesto_id FROM empleados WHERE NOT (puesto_id LIKE '%MAN' OR puesto_id LIKE '%MGR'); -- Excluye a los gerentes
```
* **Prioridad lógica:** El operador AND tiene prioridad sobre el operador OR. Se recomienda agregar paréntesis para dar preferencia a una operación sobre las demás y evitar ambigüedades.

```sql
SELECT * FROM empleados WHERE (id_depto = 10 OR id_depto = 20) AND salario > 2000;
```

---

## 3. Ordenación y Límites (ORDER BY)
* **Posición:** Esta debe ser siempre la última cláusula de la sentencia SQL estándar.
* **Comportamiento de Nulos:** En orden ascendente (ASC), los nulos aparecen al final. En orden descendente (DESC), los nulos aparecen al principio.
```sql
SELECT * FROM empleados ORDER BY comision_pct ASC NULLS LAST;
```
* **Paginación (Top-N):** OFFSET indica cuántas filas se deben saltar antes de empezar a devolver resultados. FETCH indica cuántas filas se deben devolver tras el salto. WITH TIES incluye filas adicionales si empatan en los valores de ordenación con la última fila retornada.
  ```sql
  SELECT nombre, salario FROM empleados ORDER BY salario DESC FETCH FIRST 5 ROWS WITH TIES;
  ```  

---

## 4. Agrupación y Funciones
Las funciones de agregación operan sobre un conjunto de filas para devolver un único resultado por cada grupo.

* **Regla de oro de los Nulos:** Una regla fundamental en SQL es que todas las funciones de grupo (MAX, MIN, AVG, SUM) ignoran los valores nulos, con la única excepción de COUNT(*).
 ```sql
 SELECT AVG(comision_pct) FROM empleados; -- El promedio ignora los nulos
 ``` 
* **Regla de oro del GROUP BY:** Cualquier columna que aparezca en el SELECT y que NO esté dentro de una función de agregación, DEBE aparecer obligatoriamente listada en la cláusula GROUP BY.
```sql
SELECT departamento_id, COUNT(*) FROM empleados GROUP BY departamento_id;
```
* **WHERE vs HAVING:** El WHERE filtra filas individuales antes de que se formen los grupos. El HAVING filtra los grupos resultantes después de que se han calculado las agregaciones.
```sql
SELECT departamento_id, SUM(salario) FROM empleados GROUP BY departamento_id HAVING SUM(salario) > 10000;
```

---

## 5. Uniones y Conjuntos
* **INNER JOIN:** Devuelve solo las filas donde existe correspondencia en ambas tablas unidas.
```sql
SELECT e.nombre, d.nombre_depto FROM empleados e INNER JOIN departamentos d ON e.id_depto = d.id_depto;
```
* **OUTER JOINS:** LEFT JOIN devuelve todas las filas de la tabla izquierda y las que coincidan de la derecha. RIGHT JOIN devuelve todas las de la tabla derecha. FULL OUTER JOIN devuelve todo el contenido de ambas tablas, rellenando con valores nulos donde no haya coincidencia.
```sql
SELECT e.nombre, d.nombre_depto FROM empleados e LEFT JOIN departamentos d ON e.id_depto = d.id_depto;
```
* **Operadores de Conjunto (Reglas):** Las consultas a unir verticalmente deben tener el mismo número de columnas. Además, los tipos de datos de dichas columnas deben ser compatibles y estar exactamente en el mismo orden.
* **UNION vs UNION ALL:** UNION combina los resultados, elimina las filas duplicadas y ordena la salida (proceso más lento). UNION ALL combina los resultados manteniendo todos los duplicados y sin ordenar (proceso más rápido).
```sql
SELECT id_empleado FROM empleados_norte UNION ALL SELECT id_empleado FROM empleados_sur;
```

---

## 6. Orden Lógico de Ejecución
Aunque la consulta se escribe en un orden específico, el motor de Oracle procesa las cláusulas en este orden interno estricto:
1. FROM: Identifica el origen de los datos (tablas o vistas).
2. WHERE: Filtra las filas (en esta fase no se admiten funciones de agregación).
3. GROUP BY: Agrupa las filas resultantes según las columnas especificadas.
4. HAVING: Filtra los grupos formados (aquí sí se usan funciones de agregación).
5. SELECT: Selecciona las columnas, evalúa expresiones y proyecta el resultado.
6. ORDER BY: Ordena el conjunto de resultados final.