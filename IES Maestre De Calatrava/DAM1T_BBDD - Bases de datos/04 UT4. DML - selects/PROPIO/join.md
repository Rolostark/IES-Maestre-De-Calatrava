```sql

-- 1. INNER JOIN: Devuelve solo las filas que tienen una coincidencia en AMBAS tablas.
-- Si un departamento no tiene ubicación o una ubicación no tiene departamentos, se excluyen.
select 
    d.id, 
    d.nombre,
    u.ciudad
from
    departamentos d inner join ubicaciones u 
        on(d.ubicacion_id = u.id);

-- 2. LEFT JOIN: Devuelve todos los registros de la tabla izquierda (departamentos).
-- Si un departamento no tiene ubicación asignada, la columna 'ciudad' mostrará NULL.
select 
    d.id, 
    d.nombre,
    u.ciudad
from
    departamentos d left join ubicaciones u 
        on(d.ubicacion_id = u.id);

-- 3. RIGHT JOIN: Devuelve todos los registros de la tabla derecha (ubicaciones).
-- Muestra todas las ciudades, incluso aquellas que no tienen departamentos asociados.
select 
    d.id, 
    d.nombre,
    u.ciudad
from
    departamentos d right join ubicaciones u 
        on(d.ubicacion_id = u.id);

-- 4. FULL JOIN: Combina LEFT y RIGHT join.
-- Devuelve todos los departamentos y todas las ciudades, sin importar si tienen pareja o no.
select 
    d.id, 
    d.nombre,
    u.ciudad
from
    departamentos d full join ubicaciones u 
        on(d.ubicacion_id = u.id);

-- 5. PRODUCTO CARTESIANO (CROSS JOIN implícito):
-- Al no usar una cláusula 'ON' o 'WHERE', combina cada fila de 'ubicaciones' 
-- con cada fila de 'departamentos' (ej. 5 ciudades x 10 depto = 50 filas).
select 
    u.ciudad, d.nombre
from
    ubicaciones u,
    departamentos d;

-- 6. INNER JOIN (Sintaxis alternativa):
-- Idéntico al primer punto, pero iniciando la selección desde la tabla de ubicaciones.
select 
    u.ciudad, 
    d.nombre
from
    ubicaciones u join departamentos d on (u.id=d.ubicacion_id);

-- 7. LEFT JOIN (Desde Ubicaciones):
-- Asegura que aparezcan todas las ciudades. Si una ciudad está vacía, el nombre del depto será NULL.
select 
    u.ciudad, 
    d.nombre
from
    ubicaciones u left join departamentos d on (u.id=d.ubicacion_id);

-- 8. AGRUPACIÓN Y CONTEO:
-- Cuenta cuántos departamentos hay por cada ciudad. 
-- El LEFT JOIN permite que incluso las ciudades con 0 departamentos aparezcan en el reporte.
select 
    u.ciudad, 
    count(d.nombre)
from
    ubicaciones u left join departamentos d on (u.id=d.ubicacion_id)
group by 
    u.ciudad;
```