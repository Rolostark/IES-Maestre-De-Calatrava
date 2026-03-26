/* =========================================================
   CREACIÓN DE TABLAS
========================================================= */

/* Tabla principal de empleados */
CREATE TABLE empleados (
    id INTEGER PRIMARY KEY,                  -- Identificador único del empleado
    nombre VARCHAR2(50),                     -- Nombre
    apellido1 VARCHAR2(50) NOT NULL,         -- Primer apellido obligatorio
    apellido2 VARCHAR2(50) NOT NULL,         -- Segundo apellido obligatorio
    email VARCHAR2(150) NOT NULL UNIQUE,     -- Email único
    telefono VARCHAR2(20),                   -- Teléfono
    fecha_contratacion DATE NOT NULL,        -- Fecha de contratación
    puesto_id VARCHAR2(10) NOT NULL,         -- Código del puesto
    salario DECIMAL(8,2) CHECK (salario > 0),-- Salario positivo
    comision_pct DECIMAL(2,2) CHECK (comision_pct >= 0), -- Comisión >= 0
    gerente_id INTEGER,                      -- ID del jefe
    departamento_id INTEGER                  -- Departamento al que pertenece
);

/* Tabla de departamentos */
CREATE TABLE departamentos (
    id INTEGER PRIMARY KEY,      -- Identificador del departamento
    nombre VARCHAR2(30) NOT NULL,-- Nombre del departamento
    ubicacion_id INTEGER         -- Ubicación
);

/* =========================================================
   CONSULTAS BÁSICAS SELECT
========================================================= */

/* Mostrar todas las columnas y filas */
SELECT * FROM empleados;

/* Proyección: solo algunas columnas */
SELECT id, nombre, apellido1, apellido2, email
FROM empleados;

/* Operaciones aritméticas sobre salario */
SELECT nombre,
       salario,
       salario * 12 AS salario_anual,        -- Cálculo anual
       salario + 300 AS salario_aumentado    -- Simulación aumento
FROM empleados;

/* Uso de alias */
SELECT apellido1 AS "Primer Apellido",
       salario * 12 AS salario_anual,
       (salario + 300) * 12 AS "Salario Proyectado"
FROM empleados;

/* Concatenación de texto */
SELECT puesto_id || ' asignado a ' || apellido1 AS asignacion
FROM empleados;

/* Eliminar duplicados */
SELECT DISTINCT departamento_id
FROM empleados;

/* =========================================================
   FILTROS WHERE
========================================================= */

/* Filtrar por igualdad */
SELECT nombre, departamento_id
FROM empleados
WHERE departamento_id = 500;

/* Filtrar texto (case sensitive) */
SELECT nombre, apellido1
FROM empleados
WHERE apellido1 = 'Valdes';

/* Solución usando UPPER */
SELECT nombre, apellido1
FROM empleados
WHERE UPPER(apellido1) = 'VALDES';

/* Filtrar por fecha usando TO_DATE */
SELECT nombre, fecha_contratacion
FROM empleados
WHERE fecha_contratacion = TO_DATE('25/10/2003','DD/MM/YYYY');

/* BETWEEN (rango inclusive) */
SELECT nombre, salario
FROM empleados
WHERE salario BETWEEN 2500 AND 3500;

/* IN (lista de valores) */
SELECT nombre, puesto_id
FROM empleados
WHERE puesto_id IN ('SA_MAN','SA_REP');

/* LIKE con comodín % */
SELECT nombre
FROM empleados
WHERE apellido1 LIKE 'S%';

/* LIKE con comodín _ */
SELECT nombre
FROM empleados
WHERE nombre LIKE '_o%';

/* Buscar valores NULL */
SELECT nombre
FROM empleados
WHERE gerente_id IS NULL;

/* Uso de AND */
SELECT nombre, salario
FROM empleados
WHERE departamento_id = 100
AND salario > 20000;

/* Uso de paréntesis con OR */
SELECT nombre, salario
FROM empleados
WHERE (departamento_id = 100 OR departamento_id = 200)
AND salario > 10000;

/* =========================================================
   ORDER BY
========================================================= */

/* Ordenar por fecha descendente */
SELECT nombre, fecha_contratacion
FROM empleados
ORDER BY fecha_contratacion DESC;

/* Ordenar por múltiples columnas */
SELECT departamento_id, apellido1, salario
FROM empleados
ORDER BY departamento_id ASC, salario DESC;

/* Ordenar por alias */
SELECT nombre, salario*12 AS salario_anual
FROM empleados
ORDER BY salario_anual DESC;

/* Controlar posición de NULL */
SELECT nombre, comision_pct
FROM empleados
ORDER BY comision_pct ASC NULLS LAST;

/* =========================================================
   LIMITACIÓN DE FILAS (12c+)
========================================================= */

/* Top 5 salarios */
SELECT nombre, salario
FROM empleados
ORDER BY salario DESC
FETCH FIRST 5 ROWS ONLY;

/* Top 5 con empates */
SELECT nombre, salario
FROM empleados
ORDER BY salario DESC
FETCH FIRST 5 ROWS WITH TIES;

/* Paginación (página 2) */
SELECT id, nombre
FROM empleados
ORDER BY apellido1
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;

/* =========================================================
   FUNCIONES
========================================================= */

/* Funciones de texto */
SELECT UPPER(apellido1), INITCAP(nombre)
FROM empleados;

/* Substring y longitud */
SELECT nombre,
       SUBSTR(nombre,1,3) AS abreviatura,
       LENGTH(apellido1) AS longitud
FROM empleados;

/* ROUND vs TRUNC */
SELECT salario/3,
       ROUND(salario/3,2),
       TRUNC(salario/3,2)
FROM empleados;

/* Funciones de fecha */
SELECT id,
       (SYSDATE - fecha_contratacion)/7 AS semanas,
       ADD_MONTHS(fecha_contratacion,6) AS revision
FROM empleados;

/* Formateo */
SELECT nombre,
       TO_CHAR(fecha_contratacion,'DD "de" Month YYYY'),
       TO_CHAR(salario,'L99G999D99')
FROM empleados;

/* NVL para evitar NULL */
SELECT nombre,
       (salario*12) + (salario*12*NVL(comision_pct,0)) AS ingreso_total
FROM empleados;

/* =========================================================
   CASE y DECODE
========================================================= */

/* Clasificación por salario */
SELECT nombre, salario,
       CASE
         WHEN salario < 3000 THEN 'Junior'
         WHEN salario BETWEEN 3000 AND 8000 THEN 'Especialista'
         WHEN salario > 8000 THEN 'Directivo'
       END categoria
FROM empleados;

/* Aumento según puesto */
SELECT nombre, puesto_id, salario,
       DECODE(puesto_id,
              'IT_PROG', salario*1.10,
              'ST_CLERK', salario*1.05,
              salario) AS nuevo_salario
FROM empleados;

/* =========================================================
   FUNCIONES DE AGREGACIÓN
========================================================= */

/* MAX, MIN */
SELECT MAX(salario), MIN(salario), MIN(fecha_contratacion)
FROM empleados;

/* SUM y AVG */
SELECT SUM(salario), ROUND(AVG(salario),2)
FROM empleados;

/* COUNT variantes */
SELECT COUNT(*),
       COUNT(comision_pct),
       COUNT(DISTINCT departamento_id)
FROM empleados;

/* GROUP BY */
SELECT departamento_id, AVG(salario)
FROM empleados
GROUP BY departamento_id;

/* HAVING */
SELECT departamento_id, COUNT(*)
FROM empleados
GROUP BY departamento_id
HAVING COUNT(*) > 5;

/* =========================================================
   JOINS
========================================================= */

/* INNER JOIN */
SELECT e.nombre, d.nombre
FROM empleados e
JOIN departamentos d
ON e.departamento_id = d.id;

/* LEFT JOIN */
SELECT e.nombre, d.nombre
FROM empleados e
LEFT JOIN departamentos d
ON e.departamento_id = d.id;

/* SELF JOIN (empleado-jefe) */
SELECT t.nombre trabajador,
       j.nombre jefe
FROM empleados t
JOIN empleados j
ON t.gerente_id = j.id;

/* =========================================================
   SUBCONSULTAS
========================================================= */

/* Salario mayor que el promedio */
SELECT nombre, salario
FROM empleados
WHERE salario > (SELECT AVG(salario) FROM empleados);

/* EXISTS */
SELECT nombre
FROM departamentos d
WHERE EXISTS (
    SELECT 1
    FROM empleados e
    WHERE e.departamento_id = d.id
);