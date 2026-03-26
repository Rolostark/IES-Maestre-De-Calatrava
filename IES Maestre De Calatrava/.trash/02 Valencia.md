¡Me parece una idea fantástica! Ese formato es mucho más didáctico porque vas interiorizando el concepto clave junto con el código que lo soluciona.

Aquí tienes la resolución y explicación, ejercicio por ejercicio, con su correspondiente "chuleta" ajustada a ese formato exacto:

---

### Bloque 5: Agrupaciones Multitabla (INNER, LEFT, RIGHT + GROUP BY)

**21. Calcula el importe total gastado por cada cliente. Muestra el nombre completo y la suma de los subtotales de sus compras.**

SQL

```sql
SELECT c.nombre_completo, SUM(lp.subtotal) AS importe_total
FROM clientes c
INNER JOIN pedidos p ON c.id = p.cliente_id
INNER JOIN lineas_pedido lp ON p.id = lp.pedido_id
GROUP BY c.nombre_completo;
```

**Explicación:** Unimos las tres tablas necesarias para llegar desde el cliente hasta el subtotal de sus líneas de pedido. Agrupamos por el nombre del cliente y sumamos todo lo que ha gastado. 
📝 **Chuleta:** `SUM(columna)` combinado con `GROUP BY` suma todos los valores numéricos de las filas que pertenecen a un mismo grupo.

**22. Cuenta cuántos pedidos ha realizado cada cliente. Muestra el nombre y la cantidad.**

SQL

```sql
SELECT c.nombre_completo, COUNT(p.id) AS cantidad_pedidos
FROM clientes c
INNER JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.nombre_completo;
```

**Explicación:** Cruzamos clientes y pedidos. Al agrupar por cliente, le pedimos a la base de datos que cuente cuántos IDs de pedido existen en cada "montón". 
📝 **Chuleta:** `COUNT(columna)` cuenta cuántas filas (que no sean nulas) existen dentro de ese grupo específico.

**23. Modifica la consulta anterior para que aparezcan TODOS los clientes, incluso los que tienen 0 pedidos.**

SQL

```sql
SELECT c.nombre_completo, COUNT(p.id) AS cantidad_pedidos
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.nombre_completo;
```

**Explicación:** Cambiamos a `LEFT JOIN` para forzar a que la tabla de clientes (la de la izquierda) se muestre entera, tengan coincidencias o no. 
📝 **Chuleta:** Con `LEFT JOIN`, usa siempre `COUNT(tabla_derecha.id)`. Si usas `COUNT(*)`, contará la fila vacía como "1", arruinando el recuento de los que tienen 0.

**24. Calcula cuántas unidades en total se han vendido de cada producto.**

SQL

```sql
SELECT pr.nombre, SUM(lp.cantidad) AS total_unidades
FROM productos pr
INNER JOIN lineas_pedido lp ON pr.id = lp.producto_id
GROUP BY pr.nombre;
```

**Explicación:** Relacionamos el catálogo de productos con el historial de ventas (líneas de pedido) y sumamos la columna `cantidad`. 
📝 **Chuleta:** Es perfectamente válido y más legible hacer el `GROUP BY` por el nombre del producto (si sabes que no hay nombres repetidos) en lugar de hacerlo por su ID numérico.

**25. Muestra todas las categorías y la cantidad de productos diferentes que tienen asignados (incluye vacías con RIGHT JOIN).**

SQL

```sql
SELECT c.nombre, COUNT(p.id) AS cantidad_productos
FROM productos p
RIGHT JOIN categorias c ON p.categoria_id = c.id
GROUP BY c.nombre;
```

**Explicación:** El enunciado obliga a poner `productos` a la izquierda y `categorias` a la derecha. Para que salgan todas las categorías, usamos `RIGHT JOIN`. 
📝 **Chuleta:** `RIGHT JOIN` hace exactamente lo mismo que el `LEFT JOIN`, pero le da prioridad y obliga a aparecer a todos los registros de la tabla escrita a la derecha de la consulta.

**26. Calcula el precio medio de los productos agrupados por cada marca comercial.**

SQL

```sql
SELECT marca, AVG(precio_actual) AS precio_medio
FROM productos
GROUP BY marca;
```

**Explicación:** No necesitamos cruzar tablas porque la marca y el precio están en la misma. Solo agrupamos y pedimos el promedio. 
📝 **Chuleta:** `AVG(columna)` calcula la media aritmética de un grupo, ignorando automáticamente los valores nulos que pueda haber en esa columna.

**27. Lista las provincias de nuestros clientes y cuánto dinero han generado en ventas totales cada una.**

SQL

```sql
SELECT c.provincia, SUM(lp.subtotal) AS ventas_totales
FROM clientes c
INNER JOIN pedidos p ON c.id = p.cliente_id
INNER JOIN lineas_pedido lp ON p.id = lp.pedido_id
GROUP BY c.provincia;
```

**Explicación:** Cruzamos hasta las líneas de pedido, pero en lugar de agrupar por cliente, agrupamos por la provincia del cliente. 
📝 **Chuleta:** Puedes usar el `GROUP BY` con cualquier columna descriptiva (como zonas geográficas o estados), juntando así a múltiples clientes distintos en un solo grupo regional.

**28. Muestra cada estado posible de los pedidos y cuántos pedidos se encuentran actualmente en cada uno.**

SQL

```sql
SELECT estado, COUNT(id) AS cantidad_pedidos
FROM pedidos
GROUP BY estado;
```

**Explicación:** Agrupación simple en una sola tabla para sacar una estadística rápida. 
📝 **Chuleta:** Usar `GROUP BY` sobre una sola tabla es la forma más rápida de obtener estadísticas descriptivas de tu base de datos (cuántos hay de cada tipo).

---

### Bloque 6: Filtrado de Grupos (Joins + GROUP BY + HAVING)

**29. Muestra los clientes que han gastado más de 500 euros en total en nuestra tienda.**

SQL

```sql
SELECT c.nombre_completo, SUM(lp.subtotal) AS total_gastado
FROM clientes c
INNER JOIN pedidos p ON c.id = p.cliente_id
INNER JOIN lineas_pedido lp ON p.id = lp.pedido_id
GROUP BY c.nombre_completo
HAVING SUM(lp.subtotal) > 500;
```

**Explicación:** Calculamos el gasto total de cada cliente y, una vez tenemos los "montones" sumados, descartamos los que no superen los 500. 
📝 **Chuleta:** Todo lo que implique filtrar basándote en palabras como "en total", "promedio de" o "cantidad de", va en el `HAVING`, nunca en el `WHERE`.

**30. Lista las marcas que tienen estrictamente más de 3 productos en nuestro catálogo.**

SQL

```sql
SELECT marca, COUNT(id) AS cantidad_productos
FROM productos
GROUP BY marca
HAVING COUNT(id) > 3;
```

**Explicación:** Agrupamos el catálogo por marca, contamos sus elementos y filtramos el grupo. 
📝 **Chuleta:** `HAVING COUNT(columna) > N` es la fórmula estándar para encontrar "grupos que tienen más de N elementos".

**31. Obtén el nombre de los clientes que han realizado 2 o más pedidos históricos.**

SQL

```sql
SELECT c.nombre_completo, COUNT(p.id) AS total_pedidos
FROM clientes c
INNER JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.nombre_completo
HAVING COUNT(p.id) >= 2;
```

**Explicación:** Cruzamos clientes con pedidos, agrupamos por cliente y filtramos a los que repiten compra. 
📝 **Chuleta:** Los filtros del `HAVING` actúan como "porteros de discoteca": solo dejan pasar a la consulta final a los grupos (`GROUP BY`) que cumplen la condición matemática.

**32. ¿Qué categorías de la tienda han generado más de 1000 euros en ventas totales?**

SQL

```sql
SELECT c.nombre, SUM(lp.subtotal) AS ventas_totales
FROM categorias c
INNER JOIN productos pr ON c.id = pr.categoria_id
INNER JOIN lineas_pedido lp ON pr.id = lp.producto_id
GROUP BY c.nombre
HAVING SUM(lp.subtotal) > 1000;
```

**Explicación:** Cruzamos desde la categoría hasta la línea de pedido para poder sumar el dinero real generado por esos productos. 
📝 **Chuleta:** Puedes encadenar todos los `INNER JOIN` que necesites para trazar el camino de los datos antes de aplicar el agrupamiento.

**33. Muestra los métodos de pago que se han utilizado en más de 5 pedidos distintos.**

SQL

```sql
SELECT metodo_pago, COUNT(id) AS cantidad_pedidos
FROM pedidos
WHERE metodo_pago IS NOT NULL
GROUP BY metodo_pago
HAVING COUNT(id) > 5;
```

**Explicación:** Descartamos los pedidos que no tienen método de pago primero, agrupamos los válidos y contamos. 
📝 **Chuleta:** Usa `WHERE columna IS NOT NULL` antes del `GROUP BY` para limpiar datos basura e impedir que se te cree un grupo "fantasma" sin nombre en el resultado final.

**34. Lista los productos que han vendido menos de 5 unidades en total (incluyendo 0 unidades).**

SQL

```sql
SELECT pr.nombre, COALESCE(SUM(lp.cantidad), 0) AS total_vendido
FROM productos pr
LEFT JOIN lineas_pedido lp ON pr.id = lp.producto_id
GROUP BY pr.nombre
HAVING COALESCE(SUM(lp.cantidad), 0) < 5;
```

**Explicación:** Al usar `LEFT JOIN`, los productos sin ventas generan un `NULL` al intentar sumar. Lo transformamos a cero para poder decirle "si eres menor que 5, muéstrate". 
📝 **Chuleta:** `COALESCE(SUM(columna), 0)` o `NVL()` en Oracle, transforma los "vacíos" (`NULL`) de un `LEFT JOIN` en un `0` real, evitando que las matemáticas fallen en el `HAVING`.

**35. Busca a los clientes cuyo "ticket medio" sea superior a 150 euros.**

SQL

```sql
SELECT c.nombre_completo, (SUM(lp.subtotal) / COUNT(DISTINCT p.id)) AS ticket_medio
FROM clientes c
INNER JOIN pedidos p ON c.id = p.cliente_id
INNER JOIN lineas_pedido lp ON p.id = lp.pedido_id
GROUP BY c.nombre_completo
HAVING (SUM(lp.subtotal) / COUNT(DISTINCT p.id)) > 150;
```

**Explicación:** El ticket medio se calcula dividiendo todo lo gastado entre el número de pedidos. 
📝 **Chuleta:** Puedes realizar operaciones matemáticas complejas en el `HAVING`. Usa `COUNT(DISTINCT columna)` para no contar un mismo pedido varias veces si este tiene muchas líneas.

**36. Muestra las fechas exactas en las que la tienda facturó más de 300 euros en un solo día.**

SQL

```sql
SELECT TRUNC(p.fecha_pedido) AS fecha, SUM(lp.subtotal) AS facturacion_diaria
FROM pedidos p
INNER JOIN lineas_pedido lp ON p.id = lp.pedido_id
GROUP BY TRUNC(p.fecha_pedido)
HAVING SUM(lp.subtotal) > 300;
```

**Explicación:** Sumamos la facturación diaria agrupando por la fecha del pedido. 
📝 **Chuleta:** En Oracle, los campos `DATE` incluyen la hora exacta. Si agrupas por fecha normal, harás grupos por segundo. Usa `TRUNC(fecha)` para "borrar" la hora y agrupar por días enteros.

---

### Bloque 7: Exclusiones y Uniones Totales (FULL OUTER, IS NULL)

**37. Encuentra a los clientes que se registraron pero jamás han hecho un pedido.**

SQL

```sql
SELECT c.nombre_completo, c.email
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id
WHERE p.id IS NULL;
```

**Explicación:** Traemos a todos los clientes e intentamos emparejarlos con pedidos. Luego, filtramos y nos quedamos solo con los que se quedaron "vacíos" en la parte del pedido. 
📝 **Chuleta: El Anti-Join.** La combinación mágica para encontrar "los que no tienen" es usar `A LEFT JOIN B` y rematar con un `WHERE B.id IS NULL`.

**38. Identifica las categorías que actualmente no tienen ningún producto asociado.**

SQL

```sql
SELECT c.nombre
FROM categorias c
LEFT JOIN productos p ON c.id = p.categoria_id
WHERE p.id IS NULL;
```

**Explicación:** Aplicamos el patrón Anti-Join entre las categorías y los productos. 
📝 **Chuleta:** El Anti-Join es la herramienta definitiva para buscar "huérfanos" (categorías vacías, clientes inactivos, etc.).

**39. Muestra los productos que están en el catálogo pero que nunca se han vendido.**

SQL

```sql
SELECT p.sku, p.nombre
FROM productos p
LEFT JOIN lineas_pedido lp ON p.id = lp.producto_id
WHERE lp.pedido_id IS NULL;
```

**Explicación:** Cruzamos el maestro (productos) con el detalle (líneas_pedido) y buscamos dónde el detalle es nulo. 
📝 **Chuleta:** Igual que antes, aplicar el Anti-Join entre un catálogo y un historial de movimientos te revela qué elementos están "cogiendo polvo" sin usarse.

**40. Realiza un FULL OUTER JOIN entre categorías y productos.**

SQL

```sql
SELECT c.nombre AS categoria, p.nombre AS producto
FROM categorias c
FULL OUTER JOIN productos p ON c.id = p.categoria_id;
```

**Explicación:** Fuerza a que se unan ambas tablas mostrando las coincidencias y mostrando también los sobrantes de ambos lados. 
📝 **Chuleta:** `FULL OUTER JOIN` lo trae TODO. Muestra los registros emparejados, los huérfanos de la tabla izquierda y los huérfanos de la tabla derecha, rellenando con `NULL` lo que falte en cada caso.

**41. Lista el nombre de todos los clientes junto con la fecha de su último pedido (nula si no tienen).**

SQL

```sql
SELECT c.nombre_completo, MAX(p.fecha_pedido) AS ultimo_pedido
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.nombre_completo;
```

**Explicación:** Forzamos la aparición de todos los clientes con `LEFT JOIN` y pedimos la fecha máxima. 
📝 **Chuleta:** `MAX(columna)` obtiene el valor más alto (o más reciente en fechas). Combinado con `LEFT JOIN`, devolverá un limpio `NULL` si el cliente no tiene registros, sin dar error.

**42. Muestra todas las categorías y el total de stock disponible en cada una (cero si está vacía).**

SQL

```sql
SELECT c.nombre, COALESCE(SUM(p.stock), 0) AS stock_total
FROM categorias c
LEFT JOIN productos p ON c.id = p.categoria_id
GROUP BY c.nombre;
```

**Explicación:** Unimos forzosamente y protegemos la suma con la función que cambia nulos por ceros. 
📝 **Chuleta:** Siempre que cruces inventario o reportes financieros con `LEFT JOIN`, es obligatorio rodear el `SUM` con un `COALESCE` para que visualmente el informe muestre "0" y no celdas vacías.

**43. Obtén el identificador de los pedidos que existen pero se han quedado "huérfanos" (sin líneas de pedido).**

SQL

```sql
SELECT p.id
FROM pedidos p
LEFT JOIN lineas_pedido lp ON p.id = lp.pedido_id
WHERE lp.pedido_id IS NULL;
```

**Explicación:** Aplicamos el Anti-Join buscando inconsistencias de datos. 
📝 **Chuleta:** El Anti-Join no solo sirve para estadísticas, es tu principal arma de "Auditoría" para detectar fallos técnicos en la base de datos (como un pedido que se guardó a medias).

**44. Muestra una lista de todos los clientes. Si han comprado, añade el ID de sus pedidos. Utiliza RIGHT JOIN invirtiendo el orden.**

SQL

```sql
SELECT c.nombre_completo, p.id AS id_pedido
FROM pedidos p
RIGHT JOIN clientes c ON p.cliente_id = c.id;
```

**Explicación:** Ponemos pedidos a la izquierda y clientes a la derecha, obligando a que mande la derecha. 
📝 **Chuleta:** `A RIGHT JOIN B` es mental y computacionalmente idéntico a hacer `B LEFT JOIN A`. Simplemente cambia a qué tabla le otorgas el "poder" de mostrarlo todo.

---

### Bloque 8: El Combo Completo (JOIN + WHERE + GROUP BY + HAVING)

**45. Muestra el nombre de los clientes de 'Barcelona' que han gastado más de 200 euros en total.**

SQL

```sql
SELECT c.nombre_completo, SUM(lp.subtotal) AS gasto_total
FROM clientes c
INNER JOIN pedidos p ON c.id = p.cliente_id
INNER JOIN lineas_pedido lp ON p.id = lp.pedido_id
WHERE c.provincia = 'Barcelona'
GROUP BY c.nombre_completo
HAVING SUM(lp.subtotal) > 200;
```

**Explicación:** Filtramos la provincia antes de agrupar, y filtramos la suma después de agrupar. 
📝 **Chuleta: El orden lógico estricto.** 1º Unimos (`JOIN`), 2º Quitamos filas individuales que no sirven (`WHERE`), 3º Hacemos montones (`GROUP BY`), 4º Quitamos los montones que no cumplen (`HAVING`).

**46. Lista las categorías que han vendido más de 5 unidades, considerando solo los pedidos de 2025.**

SQL

```sql
SELECT c.nombre, SUM(lp.cantidad) AS total_unidades
FROM categorias c
INNER JOIN productos pr ON c.id = pr.categoria_id
INNER JOIN lineas_pedido lp ON pr.id = lp.producto_id
INNER JOIN pedidos p ON lp.pedido_id = p.id
WHERE EXTRACT(YEAR FROM p.fecha_pedido) = 2025
GROUP BY c.nombre
HAVING SUM(lp.cantidad) > 5;
```

**Explicación:** Extrajimos el año del pedido en el `WHERE` para que la suma solo se haga con datos de 2025. 
📝 **Chuleta:** Las funciones que evalúan fila a fila (como extraer el año de una fecha) van siempre en el `WHERE` para limitar los datos antes de que se agrupen.

**47. Encuentra a los clientes que han comprado productos de la categoría 'NEU' y han gastado en ella más de 300 euros.**

SQL

```sql
SELECT c.nombre_completo, SUM(lp.subtotal) AS gasto_neumaticos
FROM clientes c
INNER JOIN pedidos p ON c.id = p.cliente_id
INNER JOIN lineas_pedido lp ON p.id = lp.pedido_id
INNER JOIN productos pr ON lp.producto_id = pr.id
WHERE pr.categoria_id = 'NEU'
GROUP BY c.nombre_completo
HAVING SUM(lp.subtotal) > 300;
```

**Explicación:** Filtramos por una categoría específica en el `WHERE`. 
📝 **Chuleta:** Puedes usar el `WHERE` para filtrar por columnas de tablas cruzadas (como `categoria_id`), aunque esa columna luego no la vayas a mostrar en el `SELECT`.

**48. Muestra el nombre del producto, la categoría y el total ingresado, solo para productos que cuesten más de 50€, y donde el ingresado supere los 400€.**

SQL

```sql
SELECT pr.nombre, c.nombre AS categoria, SUM(lp.subtotal) AS ingresos_totales
FROM productos pr
INNER JOIN categorias c ON pr.categoria_id = c.id
INNER JOIN lineas_pedido lp ON pr.id = lp.producto_id
WHERE pr.precio_actual > 50
GROUP BY pr.nombre, c.nombre
HAVING SUM(lp.subtotal) > 400;
```

**Explicación:** Filtramos precio en `WHERE`, sumamos subtotal en `HAVING`, pero fíjate en el `GROUP BY`. 
📝 **La Regla de Oro del GROUP BY:** TODA columna que escribas en el `SELECT` y que no esté envuelta en un cálculo (`SUM`, `COUNT`...) **DEBE** copiarse obligatoriamente al `GROUP BY`.

**49. ¿Qué provincias han generado 2 o más pedidos que terminaron en estado 'CANCELADO'?**

SQL

```sql
SELECT c.provincia, COUNT(p.id) AS pedidos_cancelados
FROM clientes c
INNER JOIN pedidos p ON c.id = p.cliente_id
WHERE p.estado = 'CANCELADO'
GROUP BY c.provincia
HAVING COUNT(p.id) >= 2;
```

**Explicación:** Combinamos un filtro de estado estricto con un requisito mínimo de repeticiones. 
📝 **Chuleta:** Combina `WHERE` para quedarte con un estado concreto de la tabla y `HAVING` para exigir un número mínimo de repeticiones de ese mismo estado en el grupo.

**50. Calcula el total facturado agrupado por método de pago, aplicable solo a clientes registrados antes de 2025, y métodos que superen los 500 euros.**

SQL

```sql
SELECT p.metodo_pago, SUM(lp.subtotal) AS total_facturado
FROM pedidos p
INNER JOIN clientes c ON p.cliente_id = c.id
INNER JOIN lineas_pedido lp ON p.id = lp.pedido_id
WHERE c.fecha_registro < TO_DATE('2025-01-01', 'YYYY-MM-DD')
  AND p.metodo_pago IS NOT NULL
GROUP BY p.metodo_pago
HAVING SUM(lp.subtotal) > 500;
```

**Explicación:** Una consulta "jefe final" que une múltiples tablas, limpia nulos, acota fechas, agrupa y filtra por total. 
📝 **Chuleta:** Las consultas complejas se arman como piezas de Lego. Cruza todas las tablas primero, luego pon tus limitadores individuales en el `WHERE` con `AND`, agrupa por lo que quieres analizar y finaliza con la condición del `HAVING`.

---

### Bloque 9: Producto Cartesiano (Cross Join)

**51. Genera todas las combinaciones posibles entre los nombres de clientes y las categorías.**

SQL

```sql
SELECT c.nombre_completo, cat.nombre AS categoria
FROM clientes c
CROSS JOIN categorias cat;
```

**Explicación:** Cruzamos dos tablas sin buscar ninguna relación lógica entre ellas, forzando la multiplicación de sus filas. 
📝 **Chuleta:** `CROSS JOIN` multiplica fila por fila y no usa la cláusula `ON`. Si juntas una tabla de 100 filas con otra de 50, te devolverá 5000 resultados. ¡Cuidado en entornos reales!

**52. Muestra todas las combinaciones cruzando únicamente a los clientes de 'Madrid' con los productos 'Brembo'.**

SQL

```sql
SELECT c.nombre_completo, p.nombre AS producto
FROM clientes c
CROSS JOIN productos p
WHERE c.provincia = 'Madrid' AND p.marca = 'Brembo';
```

**Explicación:** Generamos el producto cartesiano pero reducimos el impacto filtrando masivamente ambas tablas. 
📝 **Chuleta:** Puedes domar un `CROSS JOIN` añadiendo inmediatamente un `WHERE` que limite drásticamente las filas que van a entrar en esa multiplicación masiva de datos.