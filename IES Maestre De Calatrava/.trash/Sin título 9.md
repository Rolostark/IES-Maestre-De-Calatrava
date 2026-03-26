### 1. Filtrado Básico y Selección Específica

**Enunciado:** Mostrar nombre, apellido y salario de los empleados que ganan más de 5,000, ordenados por salario de mayor a menor.

SQL

```SQL
SELECT nombre, apellidol, salario -- Eliges qué ver 
FROM empleados -- De dónde salen los datos 
WHERE salario > 5000 -- Filtro de filas individuales 
ORDER BY salario DESC; -- Orden final (6º paso) 
```

### 2. Uso de Patrones y Rangos (Operadores Especiales)

**Enunciado:** Listar empleados cuyo apellido empieza por 'M' y fueron contratados entre 2010 y 2015.

SQL

```SQL
SELECT nombre, apellidol, fecha_contratacion
FROM empleados
WHERE apellidol LIKE 'M%' -- 'M' seguido de cualquier cosa 
  AND fecha_contratacion BETWEEN TO_DATE('01/01/2010', 'DD/MM/YYYY') 
                         AND TO_DATE('31/12/2015', 'DD/MM/YYYY'); -- Rango 
```

### 3. Agrupación por Categoría (GROUP BY)

**Enunciado:** Mostrar cuántos empleados hay en cada departamento.

SQL

```SQL
SELECT departamento_id, COUNT(*) AS "Total" -- Función de grupo [cite: 627, 649, 657]
FROM empleados
GROUP BY departamento_id; -- Crea los grupos [cite: 682, 692, 693]
```

> **REGLA DE ORO:** Si pones `departamento_id` en el `SELECT` sin función, **debes** ponerlo en el `GROUP BY`.

### 4. El "Súper Combo" (SELECT + FROM + WHERE + GROUP BY + HAVING)

**Enunciado:** Salario promedio por puesto, pero solo para empleados con salario > 2,000 y solo mostrar puestos cuya media sea mayor a 6,000.

SQL

```SQL
SELECT puesto_id, AVG(salario) AS promedio -- 5º paso: Proyección [cite: 627, 722]
FROM empleados -- 1º paso: Origen [cite: 723, 772]
WHERE salario > 2000 -- 2º paso: Filtro de filas (no admite AVG) [cite: 714, 730, 773]
GROUP BY puesto_id -- 3º paso: Agrupación [cite: 682, 737, 774]
HAVING AVG(salario) > 6000; -- 4º paso: Filtro de grupos (sí admite AVG) [cite: 715, 727, 775]
```

### 5. Manejo de Nulos en Cálculos y Agrupaciones

**Enunciado:** Ingreso total medio por departamento (Salario + Comisión). Considerar que si la comisión es nula, vale 0.

SQL

```SQL
SELECT departamento_id, 
       AVG(salario + (salario * NVL(comision_pct, 0))) AS ingreso_medio -- [cite: 550, 555, 666]
FROM empleados
GROUP BY departamento_id;
```

---

### 📘 Resumen para tu hoja de apoyo (Teoría)

- **Orden de escritura:** `SELECT` → `FROM` → `WHERE` → `GROUP BY` → `HAVING` → `ORDER BY`.
    
- **Orden lógico de ejecución:** 1. `FROM`, 2. `WHERE`, 3. `GROUP BY`, 4. `HAVING`, 5. `SELECT`, 6. `ORDER BY` .
    
- **WHERE vs HAVING:**
    
    - `WHERE`: Filtra filas antes de agrupar. No permite funciones como `SUM` o `AVG`.
        
    - `HAVING`: Filtra grupos ya calculados. Sí permite funciones de grupo.
        
- **Mayúsculas en texto:** El contenido de las columnas es "Case Sensitive" (distingue mayúsculas). Usa `UPPER(columna) = 'TEXTO'` para evitar fallos.