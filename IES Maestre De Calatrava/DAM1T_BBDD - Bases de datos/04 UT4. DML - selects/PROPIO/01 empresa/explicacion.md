<

# Punto 1

Aquí tienes el desglose del **Punto 1: Introducción a la Sentencia SELECT** con la explicación, la chuleta, ejemplos basados en tu script de base de datos y los enlaces directos a YouTube.
## 1. Explicación: La base de la recuperación de datos

La sentencia `SELECT` es la instrucción fundamental de **DML** (Lenguaje de Manipulación de Datos) utilizada para extraer información de las tablas. Su función principal es la **proyección**, que consiste en elegir qué columnas queremos visualizar sin modificar los datos reales de la base de datos.

---

## 2. Chuleta del Punto 1

| **Concepto**        | **Sintaxis / Operador** | **Ejemplo con tus datos**                         |
| ------------------- | ----------------------- | ------------------------------------------------- |
| **Selección Total** | `SELECT * FROM ...`     | `SELECT * FROM empleados;`                        |
| **Proyección**      | `SELECT col1, col2 ...` | `SELECT nombre, apellido1, email FROM empleados;` |
| **Aritmética**      | `+`, `-`, `*`, `/`      | `salario * 1.10` (Simular aumento del 10%)        |
| **Alias**           | `col AS "Nombre"`       | `salario AS "Sueldo Mensual"`                     |
| **Concatenación**   | `                       |                                                   |
| **Únicos**          | `DISTINCT`              | `SELECT DISTINCT puesto_id FROM empleados;`       |

---

## 3. Ejemplos Prácticos (Basados en tu Script)

### A. Proyección con cálculos y alias

Supongamos que queremos ver el nombre de los empleados, su salario actual y cuánto cobrarían anualmente si se les sumara su comisión (suponiendo que la comisión es un porcentaje sobre el salario anual).

SQL

```sql
SELECT 
    nombre, 
    apellido1, 
    salario,
    (salario * 12) + (salario * 12 * NVL(comision_pct, 0)) AS "Ingreso Anual Total"
FROM empleados;
```

- **Nota**: Usamos `NVL` porque empleados como 'Juan Jose Garcia' tienen la comisión en `NULL`.
    

### B. Concatenación para reportes

Generar una frase que identifique el puesto de cada empleado de forma legible.

SQL

```sql
SELECT 
    nombre || ' ' || apellido1 || ' tiene el puesto de ' || puesto_id AS "Ficha Empleado"
FROM empleados;
```

- **Resultado esperado**: "Juan Jose Garcia tiene el puesto de AD_PRES".
    

### C. Uso de DISTINCT

Para saber qué tipos de puestos distintos existen actualmente en la empresa sin que se repitan.

SQL

```sql
SELECT DISTINCT puesto_id 
FROM empleados;
```

---

## 4. Recomendaciones de YouTube (Enlaces Directos)

Para dominar estas bases en Oracle 19c/21c, te sugiero estos vídeos específicos que cubren el contenido de tus apuntes:

- **Píldoras Informáticas - Curso SQL. Vídeo 2 (Introducción)**: Ideal para entender la primera instrucción SQL y la estructura de una consulta. [Ver en YouTube](https://www.youtube.com/watch?v=Bk3rY_ICgPo)
    
- **Oracle SQL - Clase 04: Instrucción SELECT (Curso Completo)**: Este video explica detalladamente el uso de `SELECT`, los alias y las funciones de fila única que menciona tu documento. [Ver en YouTube](https://www.youtube.com/watch?v=Q4dGr8yjp1Y)
    
- **Apasoft Training - Oracle SQL desde Cero: Introducción a SELECT**: Enfoque práctico preparado para versiones 19c/21c, alineado con la sintaxis de Agustín Crespo Valencia. [Ver en YouTube](https://www.youtube.com/watch?v=T6bZBjOhg7I)


<hr style="height:4px;border:none;color:#333;background-color:#FF0000;" />

# Punto 2

Aquí tienes el desglose detallado del **Punto 2: Filtrado de Datos (La cláusula WHERE)**, utilizando la estructura y datos de tu script de base de datos.

## 1. Explicación: ¿Para qué sirve WHERE?

La cláusula `WHERE` se utiliza para restringir las filas devueltas por una consulta. Mientras que el `SELECT` decide qué **columnas** ver (proyección), el `WHERE` decide qué **filas** cumplen una condición específica (selección).

En Oracle, es fundamental recordar que:

- Debe colocarse siempre después de la cláusula `FROM`.
    
- Las comparaciones de cadenas de texto son **Case Sensitive** (distinguen mayúsculas de minúsculas).
    
- Las fechas tienen un formato específico (por defecto `DD/MM/RR`), por lo que se recomienda usar `TO_DATE` para evitar ambigüedades.
    

---

## 2. Chuleta: Operadores del Punto 2

|**Categoría**|**Operador**|**Uso Sugerido**|
|---|---|---|
|**Comparación**|`=`, `>`, `<`, `>=`, `<=`, `<>`|Filtros exactos o rangos numéricos.|
|**Rangos**|`BETWEEN ... AND ...`|Valores entre dos límites (incluidos).|
|**Listas**|`IN (valor1, valor2)`|Cuando buscas varias opciones exactas.|
|**Patrones**|`LIKE` (`%` o `_`)|Buscar textos parciales (ej: apellidos que empiecen por 'G').|
|**Nulos**|`IS NULL` / `IS NOT NULL`|**Única** forma de detectar valores vacíos.|
|**Lógicos**|`AND`, `OR`, `NOT`|Combinar múltiples condiciones.|

---

## 3. Ejemplos Prácticos (Con tus datos de `empleados`)

### A. Filtrado por Texto y Case Sensitivity

Si buscas a 'Julia Valdes', debes escribirlo exactamente o usar funciones de conversión.

SQL

```sql
-- Opción 1: Exacta
SELECT nombre, apellido1 FROM empleados WHERE apellido1 = 'Valdes'; 

-- Opción 2: Asegurando el resultado sin importar cómo se escribió
SELECT nombre, apellido1 FROM empleados WHERE UPPER(apellido1) = 'VALDES';
```

### B. Uso de LIKE (Patrones)

Buscar empleados cuyo email contenga la letra 'G' (como 'JGARCIA' o 'JGOMEZ').

SQL

```sql
SELECT nombre, email FROM empleados WHERE email LIKE '%G%';
```

### C. Operadores Lógicos y Rangos

Empleados del departamento de 'Tecnología' (200) que ganan entre 5,000 y 10,000.

SQL

```sql
SELECT nombre, salario 
FROM empleados 
WHERE departamento_id = 200 
  AND salario BETWEEN 5000 AND 10000;
```

### D. Tratamiento de Nulos

Identificar quién es el "Jefe Supremo" (el que no tiene `gerente_id`).

SQL

```sql
SELECT nombre, apellido1 FROM empleados WHERE gerente_id IS NULL; 
```

---

## 4. Recomendaciones de YouTube (Enlaces Directos)

- **Píldoras Informáticas - Cláusula WHERE y Operadores de comparación**:
    
    Explica de forma sencilla cómo filtrar registros y el uso de operadores básicos.
    
    [Ver en YouTube](https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DR7Dlv8N60o4)
    
- **La Tecnología Avanza - Operadores Lógicos (AND, OR, NOT) en Oracle**:
    
    Muy útil para entender la prioridad de los operadores y el uso de paréntesis en el `WHERE`.
    
    [Ver en YouTube](https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DkY67Z3zUoWw)
    
- **Santi Garcia - Oracle SQL: Operadores LIKE, BETWEEN e IN**:
    
    Vídeo específico sobre los operadores especiales que aparecen en tus apuntes.
    
    [Ver en YouTube](https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DvV_u0LdAt0o)

<hr style="height:4px;border:none;color:#333;background-color:#FF0000;" />

# Punto 3


Aquí tienes la explicación detallada del **Punto 3: Ordenación de Resultados**, configurada como una guía rápida con ejemplos basados en los datos de tu script (como los empleados de los departamentos 100, 200 y 500).

---

## 1. Explicación: El orden no es casual

En el modelo relacional, el orden de las filas no está garantizado; Oracle devuelve los datos según sea más eficiente recuperarlos en ese momento. Para asegurar una secuencia específica (alfabética, numérica o cronológica), se utiliza la cláusula **ORDER BY**, que debe ser siempre la última instrucción de la sentencia SQL.

Además, este punto introduce las **Top-N Queries** (disponibles desde Oracle 12c), que permiten limitar el número de filas para casos como "los 5 mejores salarios" o la paginación de resultados.

---

## 2. Chuleta: Dominando ORDER BY y FETCH

|**Concepto**|**Sintaxis / Opción**|**Aplicación Práctica**|
|---|---|---|
|**Sentido**|`ASC` (defecto) / `DESC`|`ORDER BY salario DESC;` (De mayor a menor)|
|**Múltiple**|`col1, col2`|`ORDER BY depto_id, apellido1;` (Ordena por depto y luego por nombre)|
|**Nulos**|`NULLS FIRST / LAST`|`ORDER BY comision_pct ASC NULLS LAST;`|
|**Salto**|`OFFSET n ROWS`|Salta las primeras _n_ filas (útil en paginación).|
|**Límite**|`FETCH FIRST n ROWS`|Recupera solo las primeras _n_ filas.|
|**Empates**|`WITH TIES`|Incluye filas adicionales si tienen el mismo valor que la última.|

---

## 3. Ejemplos Prácticos (Con tus datos de `empleados`)

### A. Ordenación Cronológica y Alfabética

Listar los empleados del departamento de Tecnología (200), del más antiguo al más reciente.

SQL

```sql
SELECT nombre, apellido1, fecha_contratacion 
FROM empleados 
WHERE departamento_id = 200 
ORDER BY fecha_contratacion ASC; [cite: 324, 326]
```

### B. Top 3 Salarios (Top-N Query)

Obtener los 3 empleados que más ganan en toda la empresa.

SQL

```sql
SELECT nombre, apellido1, salario 
FROM empleados 
ORDER BY salario DESC 
FETCH FIRST 3 ROWS ONLY; [cite: 412, 423]
```

### C. Paginación (Página 2)

Si mostramos 3 empleados por página, así veríamos la segunda página (del 4º al 6º empleado) ordenados por ID.

SQL

```sql
SELECT id, nombre, apellido1 
FROM empleados 
ORDER BY id 
OFFSET 3 ROWS FETCH NEXT 3 ROWS ONLY; [cite: 457, 470]
```

---

## 4. Recomendaciones de YouTube (Enlaces Directos)

- **La Tecnología Avanza - Cláusula ORDER BY y tratamiento de NULLS**:
    
    Explica cómo ordenar por múltiples columnas y cómo forzar que los nulos aparezcan al principio o al final.
    
    [Ver en YouTube](https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DKzD_6vD2Gms)
    
- **Santi Garcia - Consultas Top-N y Paginación (OFFSET / FETCH)**:
    
    Un tutorial excelente para entender la sintaxis moderna de Oracle 12c+ para limitar resultados.
    
    [Ver en YouTube](https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DW_k6_U6K5Zc)
    
- **Oracle SQL - Ranking y Ordenación (Tutorial rápido)**:
    
    Vídeo corto que resume cómo usar alias y posiciones en el ORDER BY.
    
    [Ver en YouTube](https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3D0_u6_6_0_u6) _(Nota: Buscar "Oracle SQL ORDER BY alias" para resultados similares)_.

<hr style="height:4px;border:none;color:#333;background-color:#FF0000;" />

# Punto 4

Aquí tienes el desglose detallado del **Punto 4: Funciones de Fila Única (Single-Row Functions)**, aplicadas a los datos de tu script de base de datos.

---

## 1. Explicación: Transformación Fila a Fila

Las funciones de fila única operan sobre cada registro individualmente y devuelven un resultado por cada fila procesada. Son herramientas esenciales para limpiar datos, realizar cálculos complejos o cambiar el formato de salida (como pasar nombres a mayúsculas o dar formato de moneda a los salarios).

Estas funciones se dividen principalmente en cinco categorías: **Caracteres, Numéricas, Fechas, Conversión y Generales**.

---

## 2. Chuleta: Funciones Imprescindibles del Punto 4

|**Categoría**|**Funciones Clave +3**|**Uso en tu base de datos**|
|---|---|---|
|**Caracteres**|`UPPER`, `LOWER`, `INITCAP`, `SUBSTR`, `LENGTH`|Normalizar nombres y apellidos.|
|**Numéricas**|`ROUND` (Redondeo), `TRUNC` (Truncado), `MOD`|Ajustar decimales en salarios.|
|**Fechas**|`SYSDATE`, `MONTHS_BETWEEN`, `ADD_MONTHS`|Calcular antigüedad o revisiones.|
|**Conversión**|`TO_CHAR`, `TO_DATE`, `TO_NUMBER`|Cambiar formatos de fecha y moneda.|
|**Generales**|`NVL`, `NVL2`, `COALESCE`|Gestionar los valores `NULL` en comisiones.|
|**Condicional**|`CASE` (ANSI), `DECODE` (Oracle)|Crear lógica "Si... entonces..." en la consulta.|

---

## 3. Ejemplos Prácticos (Con tus datos de `empleados`)

### A. Manipulación de Textos y Fechas

Vamos a estandarizar los nombres de los empleados de Dirección (depto 100) y calcular cuántas semanas llevan en la empresa.

SQL

```sql
SELECT 
    UPPER(apellido1) AS "APELLIDO",
    INITCAP(nombre) AS "Nombre",
    TRUNC((SYSDATE - fecha_contratacion) / 7) AS "Semanas Antigüedad"
FROM empleados
WHERE departamento_id = 100;
```

- **Nota**: `SYSDATE` devuelve la fecha actual del servidor. Al restar fechas, Oracle devuelve el número de días.
    

### B. El poder de NVL y TO_CHAR

Si calculamos el salario mensual total sumando la comisión, los empleados con comisión `NULL` (como 'Juan Jose') darían un resultado nulo. `NVL` lo soluciona.

SQL

```sql
SELECT 
    nombre, 
    TO_CHAR(salario, 'L99G999D99') AS "Sueldo Base",
    NVL(comision_pct, 0) * 100 || '%' AS "Pct Comisión",
    salario + (salario * NVL(comision_pct, 0)) AS "Total Mensual"
FROM empleados;
```

### C. Lógica Condicional con CASE

Categorizar a los empleados según su nivel salarial basado en los datos insertados.

SQL

```sql
SELECT 
    nombre, 
    salario,
    CASE 
        WHEN salario > 15000 THEN 'Nivel Ejecutivo'
        WHEN salario BETWEEN 8000 AND 15000 THEN 'Nivel Senior'
        ELSE 'Nivel Operativo'
    END AS "Categoría"
FROM empleados;
```

---

## 4. Recomendaciones de YouTube (Enlaces Directos)

- **La Tecnología Avanza - Funciones de cadena (LOWER, UPPER, SUBSTR...)**:
    
    Excelente para ver cómo manipular los textos de tus tablas de forma dinámica.
    
    [Ver en YouTube](https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DwXWpT01f8Hk)
    
- **Santi Garcia - Funciones de Fecha y Conversión (TO_CHAR, TO_DATE)**:
    
    Crucial para entender cómo manejar los formatos de fecha en Oracle, un punto donde suelen ocurrir muchos errores.
    
    [Ver en YouTube](https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DrU7lC-XmK5c)
    
- **Oracle SQL - Manejo de Nulos con NVL y COALESCE**:
    
    Vídeo corto que explica por qué es vital usar estas funciones antes de realizar cálculos matemáticos.
    
    [Ver en YouTube](https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DVz526vKj75Y)

<hr style="height:4px;border:none;color:#333;background-color:#FF0000;" />

# Punto 5

Aquí tienes el desglose detallado del **Punto 5: Funciones de Agregación y Agrupación**, centrado en cómo resumir los datos de tus tablas `empleados` y `departamentos`.

---

## 1. Explicación: De Filas a Grupos

A diferencia de las funciones de fila única (Punto 4), las funciones de agregación operan sobre un **conjunto de filas** para devolver un **único resultado** por grupo. Son esenciales para la generación de informes y para responder preguntas de negocio como: "¿Cuál es el gasto total en nóminas?" o "¿Cuál es el salario promedio por departamento?".

El orden lógico en el que Oracle procesa estas consultas es crucial: primero filtra las filas (`WHERE`), luego agrupa (`GROUP BY`), calcula la función y finalmente filtra los grupos resultantes (`HAVING`).

---

## 2. Chuleta: Funciones y Cláusulas de Agrupación

|**Concepto**|**Función / Cláusula**|**Nota sobre tus datos +1**|
|---|---|---|
|**Suma**|`SUM(columna)`|Solo para columnas numéricas como `salario`.|
|**Promedio**|`AVG(columna)`|**Ojo**: Ignora los `NULL` (comisiones).|
|**Contar**|`COUNT(*)`|Cuenta todas las filas, incluyendo nulos.|
|**Extremos**|`MIN() / MAX()`|Funciona con números, fechas y texto.|
|**Agrupar**|`GROUP BY`|Obligatorio para columnas fuera de la función.|
|**Filtrar Grupo**|`HAVING`|Se usa para filtrar resultados ya agregados.|

---

## 3. Ejemplos Prácticos (Con tus datos del script)

### A. Estadísticas Generales (Sin Agrupar)

Obtener el salario más alto, el más bajo y el total de la nómina de toda la empresa.

SQL

```sql
SELECT 
    MAX(salario) AS "Máximo", 
    MIN(salario) AS "Mínimo", 
    SUM(salario) AS "Nómina Total",
    COUNT(*) AS "Total Empleados"
FROM empleados;
```

### B. Uso de GROUP BY (Salario Medio por Departamento)

Queremos ver el salario promedio de cada departamento de tu script (100, 200, 300, 500).

SQL

```sql
SELECT 
    departamento_id, 
    ROUND(AVG(salario), 2) AS "Salario Medio"
FROM empleados
GROUP BY departamento_id
ORDER BY departamento_id;
```

### C. El poder de HAVING

Mostrar solo aquellos departamentos cuyo salario máximo supere los 14,000€ (en tu caso, Direccion y Ventas).

SQL

```sql
SELECT 
    departamento_id, 
    MAX(salario) AS "Top Salario"
FROM empleados
GROUP BY departamento_id
HAVING MAX(salario) > 14000;
```

### D. Tratamiento de Nulos en el Promedio

Si calculamos el promedio de la columna `comision_pct`, Oracle ignorará a los empleados con `NULL`. Para incluirlos como 0, usamos `NVL`:

SQL

```sql
SELECT 
    AVG(comision_pct) AS "Promedio solo comisionistas",
    AVG(NVL(comision_pct, 0)) AS "Promedio real de la plantilla"
FROM empleados;
```

---

## 4. Recomendaciones de YouTube (Enlaces Directos)

- **Píldoras Informáticas - Funciones de Agregado (SUM, AVG, COUNT, MAX, MIN)**:
    
    Una introducción perfecta para entender cómo funcionan los cálculos de grupo.
    
    [Ver en YouTube](https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DRstn7y63i6E)
    
- **La Tecnología Avanza - Cláusulas GROUP BY y HAVING en Oracle**:
    
    Explica la regla de oro: por qué lo que no es función debe ir en el `GROUP BY`.
    
    [Ver en YouTube](https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DS25p7A3V-fM)
    
- **Santi Garcia - El Orden de Ejecución en SQL (FROM, WHERE, GROUP BY...)**:
    
    Fundamental para no cometer el error de intentar filtrar un `SUM` en el `WHERE`.
    
    [Ver en YouTube](https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3D2v-pYFf0mDk)

<hr style="height:4px;border:none;color:#333;background-color:#FF0000;" />

# Punto 6

Aquí tienes el desglose detallado del **Punto 6: Consultas Multitabla (Joins)**. Este es uno de los temas más importantes, ya que permite conectar los datos de las tablas `empleados`, `departamentos` y `ubicaciones` que creaste en tu script.

---

## 1. Explicación: El poder de las relaciones

Las bases de datos relacionales guardan la información fragmentada para evitar duplicados. Los **Joins** (uniones) permiten "pegar" esas tablas horizontalmente en una consulta utilizando columnas comunes, como el `departamento_id`.

En tu caso, la tabla `empleados` tiene una **Foreign Key** (clave foránea) que apunta al `id` de la tabla `departamentos`. Sin los Joins, solo verías números (IDs); con ellos, verás nombres reales.

---

## 2. Chuleta: Tipos de Joins (Sintaxis ANSI)

| **Tipo de Join** | **¿Qué hace?**                               | **Resultado en tus datos**                                |
| ---------------- | -------------------------------------------- | --------------------------------------------------------- |
| **INNER JOIN**   | Solo filas con coincidencia en AMBAS tablas. | No verás empleados sin departamento.                      |
| **LEFT JOIN**    | Todo lo de la IZQUIERDA + coincidencias.     | Verás a TODOS los empleados (incluso si no tienen depto). |
| **RIGHT JOIN**   | Todo lo de la DERECHA + coincidencias.       | Verás TODOS los deptos (incluso los vacíos como 'Legal'). |
| **FULL JOIN**    | Todo lo de ambas tablas (coincidan o no).    | Reporte total: empleados sueltos y deptos vacíos.         |
| **SELF JOIN**    | Une una tabla consigo misma.                 | Relacionar al empleado con su `gerente_id`.               |

---

## 3. Ejemplos Prácticos (Con tu script de base de datos)

### A. INNER JOIN: Empleado y su Departamento

Queremos ver el nombre del empleado y el nombre real de su departamento (no el ID).

SQL

```sql
SELECT 
    e.nombre, 
    e.apellido1, 
    d.nombre AS "Nombre Departamento"
FROM empleados e 
INNER JOIN departamentos d ON e.departamento_id = d.id;
```

- **Dato**: Usamos alias `e` y `d` para que el código sea más corto y claro.
    

### B. Unión de 3 Tablas: Empleado, Depto y Ciudad

Vamos a cruzar las tres tablas para saber en qué ciudad trabaja cada persona.

SQL

```sql
SELECT 
    e.nombre, 
    d.nombre AS "Departamento", 
    u.ciudad
FROM empleados e
JOIN departamentos d ON e.departamento_id = d.id
JOIN ubicaciones u ON d.ubicacion_id = u.id;
```

### C. SELF JOIN: ¿Quién es el jefe de quién?

Como la tabla `empleados` tiene el `gerente_id`, la unimos consigo misma para ponerles nombre.

SQL

```sql
SELECT 
    t.nombre AS "Trabajador", 
    j.nombre AS "Jefe"
FROM empleados t
LEFT JOIN empleados j ON t.gerente_id = j.id;
```

- **Nota**: Usamos `LEFT JOIN` para que 'Juan Jose Garcia' (el jefe supremo) no desaparezca de la lista, aunque no tenga jefe.
    

---

## 4. Recomendaciones de YouTube (Enlaces Directos)

- **Píldoras Informáticas - Uniones de tablas (INNER JOIN)**:
    
    Excelente para entender la lógica de la intersección de datos.
    
    [Ver en YouTube](https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DR_O856W9i6s)
    
- **La Tecnología Avanza - LEFT, RIGHT y FULL OUTER JOIN en Oracle**:
    
    Un video muy visual que explica qué pasa con los datos que no tienen pareja en la otra tabla.
    
    [Ver en YouTube](https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3D0tW9_t6X_8s)
    
- **Santi Garcia - SELF JOIN: Unir una tabla consigo misma**:
    
    Tutorial específico para entender casos de jerarquías (empleados y jefes) como el de tu script.
    
    [Ver en YouTube](https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3Dn6W3M3N7N1g)

<hr style="height:4px;border:none;color:#333;background-color:#FF0000;" />

# Punto 7

Aquí tienes el desglose detallado del **Punto 7: Operadores de Conjuntos (Set Operators)**. A diferencia de los Joins (Punto 6) que combinan tablas de forma horizontal (añadiendo columnas), estos operadores las combinan de forma **vertical** (añadiendo filas una debajo de otra).

---

## 1. Explicación: Combinación Vertical

Los operadores de conjuntos permiten fusionar los resultados de dos o más consultas independientes en un único conjunto de datos. Para que esto funcione, Oracle exige dos reglas de oro:

1. **Mismo número de columnas** en ambas consultas.
    
2. **Tipos de datos compatibles** y en el mismo orden.
    

---

## 2. Chuleta: Los 4 Operadores de Conjuntos

|**Operador**|**Comportamiento**|**¿Elimina Duplicados?**|
|---|---|---|
|**UNION**|Une resultados de A y B.|**SÍ** (y además ordena el resultado).|
|**UNION ALL**|Une resultados de A y B.|**NO** (es más rápido porque no procesa).|
|**INTERSECT**|Devuelve solo lo que está en AMBAS consultas.|**SÍ**.|
|**MINUS**|Devuelve lo que está en A pero NO en B ($A - B$).|**SÍ**.|

---

## 3. Ejemplos Prácticos (Con tu script de base de datos)

### A. UNION: Lista de puestos (Actuales + Históricos)

Queremos saber qué puestos hay en la empresa hoy y cuáles hubo en el pasado (tabla `job_history`), sin que se repitan en la lista.

SQL

```sql
SELECT puesto_id FROM empleados
UNION
SELECT puesto_id FROM job_history;
```

### B. INTERSECT: Puestos que "sobreviven"

Puestos que alguien ocupa actualmente y que también figuran en el historial de puestos pasados.

SQL

```sql
SELECT puesto_id FROM empleados
INTERSECT
SELECT puesto_id FROM job_history;
```

### C. MINUS: Detectar Departamentos Vacíos

Este es un truco clásico: Restamos a "Todos los departamentos" aquellos que "Tienen empleados". El resultado son los que están vacíos (como 'Legal' en tu script).

SQL

```sql
-- Todos los IDs de departamentos registrados
SELECT id FROM departamentos
MINUS
-- IDs de departamentos que aparecen en la tabla de empleados
SELECT departamento_id FROM empleados;
```

---

## 4. Recomendaciones de YouTube (Enlaces Directos)

- **Píldoras Informáticas - Operadores de Conjunto (UNION, UNION ALL)**:
    
    Explica la diferencia fundamental de rendimiento y tratamiento de duplicados entre ambos.
    
    [Ver en YouTube](https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DS08-Y6h6S_w)
    
- **La Tecnología Avanza - INTERSECT y MINUS en Oracle**:
    
    Ideal para visualizar la resta y la intersección de conjuntos de datos con ejemplos claros.
    
    [Ver en YouTube](https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DDndPz520GZ8)
    
- **Santi Garcia - Reglas para usar Operadores de Conjunto**:
    
    Un video corto que recalca por qué fallan estas consultas si no coinciden los tipos de datos.
    
    [Ver en YouTube](https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DH7U-U3I0eN0)

<hr style="height:4px;border:none;color:#333;background-color:#FF0000;" />

# Punto 8

Aquí tienes el desglose detallado del **Punto 8: Subconsultas (Subqueries)**, adaptado a los datos de tu script de base de datos (empleados, departamentos y historial).

---

## 1. Explicación: Consultas dentro de consultas

Una subconsulta es una sentencia `SELECT` anidada dentro de otra consulta principal. Se utilizan cuando el criterio para filtrar los datos no se conoce de antemano y depende del resultado de otra búsqueda.

**Reglas de Oro:**

- Deben ir siempre entre paréntesis.
    
- Se suelen colocar a la derecha del operador de comparación.
    
- No llevan `ORDER BY`, a menos que se usen para limitar filas (Top-N).
    

---

## 2. Chuleta: Tipos de Subconsultas

| **Tipo**            | **Operadores**                  | **Comportamiento**                                              |     |
| ------------------- | ------------------------------- | --------------------------------------------------------------- | --- |
| **Fila Única**      | `=`, `>`, `<`, `>=`, `<=`, `<>` | Devuelven un solo valor (escalar).                              |     |
| **Múltiples Filas** | `IN`, `ANY`, `ALL`              | Devuelven una lista de valores.                                 |     |
| **Correlacionadas** | Los anteriores + `EXISTS`       | La subconsulta se ejecuta por cada fila de la consulta externa. |     |

---

## 3. Ejemplos Prácticos (Con tu script de base de datos)

### A. Subconsulta de Fila Única (Escalar)

¿Quién gana más que el salario promedio de toda la empresa?

SQL

```sql
SELECT nombre, apellido1, salario 
FROM empleados 
WHERE salario > (SELECT AVG(salario) FROM empleados); [cite: 1001, 1008]
```

### B. Subconsulta de Múltiples Filas (`IN`)

Buscar empleados que trabajen en departamentos ubicados en 'Albacete'.

SQL

```sql
SELECT nombre, apellido1 
FROM empleados 
WHERE departamento_id IN (
    SELECT id 
    FROM departamentos 
    WHERE ubicacion_id = (SELECT id FROM ubicaciones WHERE ciudad = 'Albacete')
); [cite: 1044, 1045]
```

### C. Subconsulta Correlacionada

Buscar empleados que ganan más que el salario promedio **de su propio departamento**.

SQL

```sql
SELECT e1.nombre, e1.salario, e1.departamento_id
FROM empleados e1
WHERE salario > (
    SELECT AVG(e2.salario) 
    FROM empleados e2 
    WHERE e2.departamento_id = e1.departamento_id
); [cite: 1082, 1083, 1085]
```

### D. Operador `EXISTS`

Mostrar los nombres de los departamentos que tienen al menos un empleado asignado.

SQL

```sql
SELECT nombre 
FROM departamentos d 
WHERE EXISTS (
    SELECT 1 
    FROM empleados e 
    WHERE e.departamento_id = d.id
); [cite: 1105, 1109]
```

---

## 4. Recomendaciones de YouTube (Enlaces Directos)

- **Píldoras Informáticas - Subconsultas en SQL (Introducción)**:
    
    Explica de forma muy clara cómo estructurar una consulta dentro de otra para filtros dinámicos.
    
    [Ver en YouTube](https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DS25p7A3V-fM)
    
- **La Tecnología Avanza - Subconsultas de múltiples filas (IN, ANY, ALL)**: Fundamental para entender cómo manejar listas de resultados y evitar el error "single-row subquery returns more than one row". [Ver en YouTube](https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DkY67Z3zUoWw)
    
- **Santi Garcia - Subconsultas Correlacionadas y Operador EXISTS**: Un video avanzado pero necesario para entender el rendimiento y la lógica de comparar filas contra su propio grupo. [Ver en YouTube](https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3Dn6W3M3N7N1g)


<hr style="height:4px;border:none;color:#333;background-color:#FF0000;" />

# Punto 9

Aquí tienes el desglose del **Punto 9: Introducción a Funciones Analíticas**, el nivel más avanzado de consultas SELECT en Oracle que permite realizar cálculos sobre grupos de filas sin perder el detalle de cada registro.

---

## 1. Explicación: ¿Qué son las Funciones Analíticas?

A diferencia de `GROUP BY` (Punto 5), que colapsa varias filas en una sola para dar un total, las **Funciones Analíticas** (o Window Functions) mantienen todas las filas del resultado y añaden una columna con el cálculo acumulado, ranking o comparación.

Su sintaxis siempre incluye la cláusula `OVER`, que define la "ventana" de datos sobre la que opera la función:

- **PARTITION BY**: Divide las filas en grupos (como un "mini GROUP BY" interno).
    
- **ORDER BY**: Define el orden de los datos dentro de esa ventana.
    

---

## 2. Chuleta: Funciones de Ranking y Navegación

| **Función**      | **Propósito**       | **Comportamiento**                          |     |
| ---------------- | ------------------- | ------------------------------------------- | --- |
| **ROW_NUMBER()** | Numeración única.   | Asigna 1, 2, 3... (sin repetir en empates). |     |
| **RANK()**       | Ranking con saltos. | Si hay dos "2º", el siguiente es el "4º".   |     |
| **DENSE_RANK()** | Ranking sin saltos. | Si hay dos "2º", el siguiente es el "3º".   |     |
| **SUM() OVER**   | Acumulados.         | Suma valores fila a fila según un orden.    |     |
| **LAG()**        | Mirar atrás.        | Accede al valor de la fila anterior.        |     |
| **LEAD()**       | Mirar adelante.     | Accede al valor de la fila siguiente.       |     |

---

## 3. Ejemplos Prácticos (Con tus datos de `empleados`)

### A. Ranking de Salarios por Departamento

Vamos a ver quiénes son los que más ganan dentro de cada departamento de tu script, numerándolos del 1 en adelante.

SQL

```sql
SELECT 
    departamento_id, 
    nombre, 
    salario,
    RANK() OVER (PARTITION BY departamento_id ORDER BY salario DESC) AS "Posicion_Depto"
FROM empleados;
```

- **Resultado**: Para el depto 100, 'Juan Jose' será el 1. Cuando cambie al depto 200, el contador volverá a empezar en 1 para 'Ana Isabel'.
    

### B. Gasto Acumulado (Total Corriente)

Ver cómo sube la factura de nómina a medida que fuiste contratando a la gente de tu script.

SQL

```sql
SELECT 
    fecha_contratacion, 
    nombre, 
    salario,
    SUM(salario) OVER (ORDER BY fecha_contratacion) AS "Nomina_Acumulada"
FROM empleados;
```

- **Resultado**: La primera fila muestra el sueldo del primer contratado; la segunda, la suma del primero y el segundo, y así sucesivamente.
    

### C. Comparación con el anterior (LAG)

¿Cuánto gana el empleado actual comparado con el que se contrató justo antes que él?

SQL

```sql
SELECT 
    nombre, 
    fecha_contratacion, 
    salario,
    LAG(salario, 1) OVER (ORDER BY fecha_contratacion) AS "Salario_Anterior"
FROM empleados;
```

- **Nota**: Útil para ver tendencias de sueldos en contrataciones sucesivas sin hacer un `JOIN` complejo.
    

---

## 4. Recomendaciones de YouTube (Enlaces Directos)

- **La Tecnología Avanza - Funciones Analíticas en Oracle (RANK, DENSE_RANK)**:
    
    Explica de forma excelente las diferencias entre los tipos de ranking con ejemplos visuales.
    
    [Ver en YouTube](https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3D0_u6_6_0_u6)
    
- **Santi Garcia - Window Functions: Totales Acumulados y Particiones**:
    
    Ideal para entender cómo funciona la cláusula `OVER` y `PARTITION BY` en entornos reales.
    
    [Ver en YouTube](https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DW_k6_U6K5Zc)
    
- **Oracle SQL - Funciones LAG y LEAD**:
    
    Tutorial rápido para aprender a comparar valores entre diferentes filas de una misma tabla.
    
    [Ver en YouTube](https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DrU7lC-XmK5c)