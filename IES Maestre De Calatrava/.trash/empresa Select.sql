-- Código 2
-- Recupera todas las filas y todas las columnas de la tabla
SELECT *
FROM empleados;

-- Código 3
-- Seleccionamos unicamente identificador, nombre, apellidos y correo
SELECT id, nombre, apellido1, apellido2, email
FROM empleados;

-- Código 4
-- Calculamos el salario anual (x12) y una simulacion de aumento (+300)
SELECT nombre, apellido1, apellido2,
       salario,
       salario * 12,
       salario + 300
FROM empleados;

-- Código 5
-- Uso de alias para mejorar la presentacion de los encabezados
SELECT apellido1 AS "Primer Apellido",
       salario * 12 AS salario_anual,
       (salario + 300) * 12 AS "Salario Anual Proyectado"
FROM empleados;

-- Código 6
-- Unimos el puesto y el apellido en una frase legible
SELECT puesto_id || ' asignado a ' || apellido1 AS "asignacion de puesto"
FROM empleados;

-- Código 7
-- Muestra la lista de departamentos unicos que tienen empleados
SELECT DISTINCT departamento_id
FROM empleados;

-- Código 8
-- Filtramos empleados que pertenecen exactamente al departamento 500
SELECT nombre, apellido1, apellido2, departamento_id
FROM empleados
WHERE departamento_id = 500;

-- Código 9
-- NOTA: Las cadenas son Case Sensitive
SELECT nombre, apellido1, apellido2, puesto_id
FROM empleados
WHERE apellido1 = 'Valdes';

-- Código 10
SELECT nombre, apellido1, apellido2, puesto_id
FROM empleados
WHERE UPPER(apellido1) = 'VALDES';

-- Código 11
SELECT nombre, apellido1, apellido2, fecha_contratacion
FROM empleados
WHERE fecha_contratacion = TO_DATE('25/10/03','RR-MM-DD');

-- Código 12
-- Empleados con salario entre 2500 y 3500
SELECT nombre, apellido1, apellido2, salario
FROM empleados
WHERE salario BETWEEN 2500 AND 3500;

-- Código 13
SELECT nombre, apellido1, apellido2, puesto_id
FROM empleados
WHERE puesto_id IN ('SA_MAN','SA_REP');

-- Código 14
SELECT nombre, apellido1, apellido2
FROM empleados
WHERE apellido1 LIKE 'S%';

-- Código 15
SELECT nombre, apellido1, apellido2
FROM empleados
WHERE nombre LIKE '_o%';

-- Código 16
SELECT nombre, apellido1, gerente_id
FROM empleados
WHERE gerente_id IS NULL;

-- Código 17
SELECT nombre, apellido1, apellido2, departamento_id, salario
FROM empleados
WHERE departamento_id = 100
AND salario > 20000;

-- Código 18
SELECT nombre, apellido1, apellido2, departamento_id, salario
FROM empleados
WHERE departamento_id = 500
OR departamento_id = 100
AND salario >= 10000;

-- Código 19
SELECT nombre, apellido1, apellido2, departamento_id, salario
FROM empleados
WHERE (departamento_id = 100 OR departamento_id = 200)
AND salario > 10000;

-- Código 20
SELECT nombre, apellido1, fecha_contratacion
FROM empleados
ORDER BY fecha_contratacion DESC;

-- Código 21
SELECT departamento_id, apellido1, salario
FROM empleados
ORDER BY departamento_id ASC, salario DESC;

-- Código 22
SELECT nombre, salario * 12 AS salario_anual
FROM empleados
ORDER BY salario_anual DESC;

-- Código 23
SELECT nombre, apellido1, comision_pct
FROM empleados
ORDER BY comision_pct ASC NULLS LAST;

-- Código 24
SELECT nombre, salario
FROM empleados
ORDER BY salario DESC
FETCH FIRST 5 ROWS ONLY;

-- Código 25
SELECT nombre, salario
FROM empleados
ORDER BY salario DESC
FETCH FIRST 5 ROWS WITH TIES;

-- Código 26
SELECT nombre, salario
FROM empleados
ORDER BY salario DESC
FETCH FIRST 20 PERCENT ROWS ONLY;

-- Código 27
SELECT id, nombre, apellido1, apellido2
FROM empleados
ORDER BY apellido1, apellido2
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;

-- Código 28
SELECT UPPER(apellido1) AS apellido1_mayus,
       INITCAP(nombre) AS nombre_capitalizado
FROM empleados;

-- Código 29
SELECT nombre,
       SUBSTR(nombre,1,3) AS abreviatura,
       LENGTH(apellido1) AS longitud_apellido1
FROM empleados;

-- Código 30
SELECT salario / 3 AS division_exacta,
       ROUND(salario / 3,2) AS redondeo_2_decimales,
       TRUNC(salario / 3,2) AS truncado_2_decimales
FROM empleados
WHERE id = 100;

-- Código 31
SELECT id,
       (SYSDATE - fecha_contratacion)/7 AS semanas_trabajadas,
       ADD_MONTHS(fecha_contratacion,6) AS revision_semestral
FROM empleados;

-- Código 32
SELECT nombre,
       TO_CHAR(fecha_contratacion,'DD "de" Month "del" YYYY') AS fecha_texto,
       TO_CHAR(salario,'L99G999D99') AS salario_formato
FROM empleados;

-- Código 33
SELECT nombre || ' ' || apellido1 || ' ' || apellido2 AS nombre_completo,
       salario,
       comision_pct,
       (salario*12)+(salario*12*NVL(comision_pct,0)) AS ingreso_total
FROM empleados;

-- Código 34
SELECT nombre || ' ' || apellido1 || ' ' || apellido2 AS nombre_completo,
       salario,
       CASE
         WHEN salario < 3000 THEN 'Junior'
         WHEN salario BETWEEN 3000 AND 8000 THEN 'Especialista'
         WHEN salario > 8000 THEN 'Directivo'
         ELSE 'No clasificado'
       END AS categoria_salarial
FROM empleados;

-- Código 35
SELECT nombre || ' ' || apellido1 || ' ' || apellido2 AS nombre_completo,
       puesto_id,
       salario,
       DECODE(puesto_id,
              'IT_PROG', salario*1.10,
              'ST_CLERK', salario*1.05,
              salario) AS nuevo_salario
FROM empleados;

-- Código 36
SELECT MAX(salario) AS salario_maximo,
       MIN(salario) AS salario_minimo,
       MIN(fecha_contratacion) AS empleado_mas_antiguo
FROM empleados;

-- Código 37
SELECT SUM(salario) AS nomina_total,
       ROUND(AVG(salario),2) AS salario_promedio
FROM empleados;

-- Código 38
SELECT COUNT(*) AS total_empleados,
       COUNT(comision_pct) AS empleados_con_comision,
       COUNT(DISTINCT departamento_id) AS deptos_activos
FROM empleados;

-- Código 39
SELECT AVG(comision_pct) AS promedio_real,
       AVG(NVL(comision_pct,0)) AS promedio_ajustado
FROM empleados;

-- Código 40
SELECT departamento_id,
       ROUND(AVG(salario),2) AS salario_medio
FROM empleados
GROUP BY departamento_id;

-- Código 41
SELECT departamento_id, puesto_id,
       COUNT(*) AS cantidad_empleados
FROM empleados
GROUP BY departamento_id, puesto_id
ORDER BY departamento_id;

-- Código 42 (Incorrecto)
SELECT departamento_id, AVG(salario)
FROM empleados
WHERE AVG(salario) > 8000
GROUP BY departamento_id;

-- Código 43
SELECT departamento_id, MAX(salario)
FROM empleados
GROUP BY departamento_id
HAVING MAX(salario) > 10000;

-- Código 44
SELECT departamento_id, COUNT(*)
FROM empleados
WHERE puesto_id NOT LIKE '%MAN'
AND puesto_id NOT LIKE '%MGR'
GROUP BY departamento_id
HAVING COUNT(*) > 5;

-- Código 45
CREATE TABLE departamentos (
  id INTEGER PRIMARY KEY,
  nombre VARCHAR2(30) NOT NULL,
  ubicacion_id INTEGER
);

-- Código 46
SELECT e.nombre,
       e.apellido1 || ' ' || e.apellido2 AS apellidos,
       d.nombre AS departamento
FROM empleados e
INNER JOIN departamentos d
ON e.departamento_id = d.id;

-- Código 48
SELECT e.nombre, e.apellido1, d.nombre
FROM empleados e
LEFT JOIN departamentos d
ON e.departamento_id = d.id;

-- Código 50
SELECT e.nombre || ' ' || e.apellido1 AS empleado,
       d.nombre AS departamento
FROM empleados e
FULL JOIN departamentos d
ON e.departamento_id = d.id;

-- Código 51
SELECT t.nombre || ' ' || t.apellido1 AS trabajador,
       j.nombre || ' ' || j.apellido1 AS jefe
FROM empleados t
JOIN empleados j
ON t.gerente_id = j.id;

-- Código 52
SELECT e.nombre, e.apellido1, d.nombre
FROM empleados e
CROSS JOIN departamentos d;

-- Código 53
SELECT puesto_id FROM empleados
UNION
SELECT puesto_id FROM job_history;

-- Código 54
SELECT puesto_id FROM empleados
INTERSECT
SELECT puesto_id FROM job_history;

-- Código 55
SELECT departamento_id FROM empleados
MINUS
SELECT departamento_id FROM departamentos;

-- Código 56
SELECT departamento_id FROM departamentos
MINUS
SELECT departamento_id FROM empleados;

-- Código 57
SELECT nombre, salario
FROM empleados
WHERE salario > (SELECT AVG(salario) FROM empleados);

-- Código 58
SELECT nombre, puesto_id
FROM empleados
WHERE puesto_id = (SELECT puesto_id
                   FROM empleados
                   WHERE apellido1 = 'Valdes')
AND apellido1 <> 'Valdes';

-- Código 59
SELECT nombre, apellido1, apellido2
FROM empleados
WHERE departamento_id IN (SELECT id
                          FROM departamentos
                          WHERE ubicacion_id = 2300);

-- Código 60
SELECT nombre, salario
FROM empleados
WHERE salario > ALL (SELECT salario
                     FROM empleados
                     WHERE departamento_id = 200);

-- Código 61
SELECT e1.nombre, e1.departamento_id, e1.salario
FROM empleados e1
WHERE salario > (SELECT AVG(e2.salario)
                 FROM empleados e2
                 WHERE e2.departamento_id = e1.departamento_id);

-- Código 62
SELECT nombre
FROM departamentos d
WHERE EXISTS (SELECT 1
              FROM empleados e
              WHERE e.departamento_id = d.id);