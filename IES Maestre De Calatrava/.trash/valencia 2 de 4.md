¡Qué buen avance! Pasamos al **Bloque 4**, que es donde la cosa se pone interesante de verdad. Las uniones de tablas o `JOINs` son el corazón de las bases de datos relacionales .

Aquí tienes la resolución paso a paso, con su explicación y su chuleta para que domines cómo conectar la información.

_(Nota rápida antes de empezar: a partir de ahora usaremos **alias** de tablas. En vez de escribir `productos.nombre`, le pondremos un apodo a la tabla en el `FROM` (ej: `FROM productos p`) y usaremos `p.nombre`. Esto te ahorrará muchísimo código)._

---

### Bloque 4: Iniciación a las Uniones de Tablas (Joins)

**1. Muestra el nombre de cada producto junto con el nombre de su categoría.**

SQL

```sql
SELECT p.nombre AS producto, c.nombre AS categoria 
FROM productos p 
INNER JOIN categorias c ON p.categoria_id = c.id;
```

- **Explicación:** Queremos datos de dos tablas distintas (`productos` y `categorias`). Para unirlas, buscamos la columna que tienen en común: el ID de la categoría.
    
- 📝 **Chuleta:** `INNER JOIN tabla2 ON tabla1.id = tabla2.id` une las filas de ambas tablas SOLO cuando hay coincidencias en ambas. Si un producto no tuviera categoría, no saldría.
    

**2. Lista el identificador de los pedidos y el nombre completo de los clientes que los realizaron.**

SQL

```sql
SELECT p.id AS pedido_id, c.nombre_completo 
FROM pedidos p 
INNER JOIN clientes c ON p.cliente_id = c.id;
```

- **Explicación:** El puente entre un cliente y un pedido es el `cliente_id` que guardamos en la tabla de pedidos.
    
- 📝 **Chuleta:** Fíjate en el alias de las tablas (`pedidos p` y `clientes c`). Usamos `p.id` y `c.id` para que el motor de base de datos no se confunda, ya que ambas tablas tienen una columna llamada `id`.
    

**3. Muestra el SKU del producto, su nombre y la cantidad vendida en cada línea de pedido.**

SQL

```sql
SELECT p.sku, p.nombre, lp.cantidad 
FROM productos p 
INNER JOIN lineas_pedido lp ON p.id = lp.producto_id;
```

- **Explicación:** Unimos el catálogo de productos con el historial de lo que se ha ido metiendo en los carritos (`lineas_pedido`) usando el ID del producto.
    

**4. Obtén el nombre de los clientes y la fecha de sus pedidos, pero solo para aquellos pedidos que estén en estado 'ENTREGADO'.**

SQL

```sql
SELECT c.nombre_completo, p.fecha_pedido 
FROM clientes c 
INNER JOIN pedidos p ON c.id = p.cliente_id 
WHERE p.estado = 'ENTREGADO';
```

- **Explicación:** Hacemos el `INNER JOIN` normal y corriente, pero al final le añadimos un `WHERE` para filtrar los resultados.
    
- 📝 **Chuleta:** El orden lógico siempre es: 1º `FROM` (de dónde), 2º `JOIN` (con qué lo pego), 3º `WHERE` (qué filtro le paso).
    

**5. Genera una lista con el nombre del producto y el nombre de su categoría, pero solo para productos de la marca 'Michelin'.**

SQL

```sql
SELECT p.nombre AS producto, c.nombre AS categoria 
FROM productos p 
INNER JOIN categorias c ON p.categoria_id = c.id 
WHERE p.marca = 'Michelin';
```

- **Explicación:** Igual que el anterior, unimos productos y categorías, y luego filtramos por la columna `marca` de la tabla productos.
    

**6. Muestra todos los clientes y la fecha de sus pedidos. Asegúrate de que aparezcan incluso los clientes que nunca han comprado nada.**

SQL

```sql
SELECT c.nombre_completo, p.fecha_pedido 
FROM clientes c 
LEFT JOIN pedidos p ON c.id = p.cliente_id;
```

- **Explicación:** Aquí cambia la película. Con un `INNER JOIN`, los clientes sin pedidos (como Alex Rins en tus INSERTS anteriores) no saldrían. Con `LEFT JOIN`, forzamos a que salgan **todos** los de la tabla de la izquierda (`clientes`), tengan o no coincidencia en la de la derecha (`pedidos`).
    
- 📝 **Chuleta:** `LEFT JOIN` trae TODO lo de la primera tabla. Si no hay datos en la segunda tabla, rellena ese hueco con un valor `NULL`.
    

**7. Lista todas las categorías y el nombre de los productos que contienen. Deben aparecer incluso las categorías que no tienen productos asociados.**

SQL

```sql
SELECT c.nombre AS categoria, p.nombre AS producto 
FROM categorias c 
LEFT JOIN productos p ON c.id = p.categoria_id;
```

- **Explicación:** Ponemos `categorias c` a la izquierda del `LEFT JOIN` para que nos traiga todas (incluyendo 'Carenados', 'Herramientas', etc., que estaban vacías en tus datos).
    

**8. Busca el nombre de los clientes que NO han realizado ningún pedido.**

SQL

```sql
SELECT c.nombre_completo 
FROM clientes c 
LEFT JOIN pedidos p ON c.id = p.cliente_id 
WHERE p.id IS NULL;
```

- **Explicación:** Es un "truco" clásico de SQL. Hacemos el `LEFT JOIN` para traer a todos (con pedido y sin pedido), y luego con el `WHERE` nos quedamos _solo_ con los que se les rellenó el lado del pedido con un `NULL`.
    
- 📝 **Chuleta:** Fíltralo buscando `IS NULL` en la clave principal (`id`) de la tabla de la derecha.
    

**9. Muestra todos los productos del catálogo y, si se han vendido, el ID del pedido donde aparecen. Los productos nunca vendidos deben aparecer también.**

SQL

```sql
SELECT p.nombre AS producto, lp.pedido_id 
FROM productos p 
LEFT JOIN lineas_pedido lp ON p.id = lp.producto_id;
```

- **Explicación:** La tabla "mandona" (la que queremos conservar entera) es `productos`, así que va a la izquierda del `LEFT JOIN`.
    

**10. Lista todos los pedidos y su método de pago junto al nombre del cliente. Si un cliente no tiene nombre, el pedido debería aparecer igual.**

SQL

```sql
SELECT p.id AS pedido_id, p.metodo_pago, c.nombre_completo 
FROM pedidos p 
LEFT JOIN clientes c ON p.cliente_id = c.id;
```

- **Explicación:** En este caso, la tabla principal es `pedidos`. Ponemos a `pedidos` a la izquierda. Si un pedido por algún error se quedó huérfano de cliente, el pedido se mostrará igualmente.
    

**11. Realiza la misma consulta que el ejercicio 6, pero esta vez utiliza un RIGHT JOIN cambiando el orden de las tablas.**

SQL

```sql
SELECT c.nombre_completo, p.fecha_pedido 
FROM pedidos p 
RIGHT JOIN clientes c ON p.cliente_id = c.id;
```

- **Explicación:** Es el "gemelo" del LEFT JOIN. En lugar de mandar la tabla de la izquierda, manda la de la derecha (`clientes`). El resultado es idéntico al ejercicio 6, solo hemos alterado cómo lo escribimos.
    
- 📝 **Chuleta:** `RIGHT JOIN` trae TODO lo de la tabla que pongas justo a su derecha. En la vida real se usa poco porque los programadores prefieren leer de izquierda a derecha usando `LEFT JOIN`.
    

**12. Muestra todas las categorías (incluso las vacías) usando un RIGHT JOIN con la tabla productos.**

SQL

```sql
SELECT c.nombre AS categoria, p.nombre AS producto 
FROM productos p 
RIGHT JOIN categorias c ON p.categoria_id = c.id;
```

- **Explicación:** Para conseguir que manden las categorías, al usar `RIGHT JOIN`, la tabla `categorias` debe ir después de la cláusula.
    

**13. Obtén una lista de todas las líneas de pedido junto con el nombre del producto, asegurándote de que si un producto hubiera sido borrado, la línea de pedido aparezca con nombre nulo.**

SQL

```sql
SELECT lp.*, p.nombre AS producto 
FROM lineas_pedido lp 
LEFT JOIN productos p ON lp.producto_id = p.id;
```

- **Explicación:** Queremos todas las líneas de pedido sí o sí. Por tanto, `lineas_pedido` a la izquierda con un `LEFT JOIN`. (En una BBDD bien montada con claves foráneas estrictas esto no debería pasar, pero a nivel teórico así se resuelve).
    

**14. Muestra el nombre completo de los clientes y el estado de sus pedidos. Si hay clientes sin pedidos, muestra 'Sin pedidos' en lugar del valor nulo.**

SQL

```sql
SELECT c.nombre_completo, NVL(p.estado, 'Sin pedidos') AS estado 
FROM clientes c 
LEFT JOIN pedidos p ON c.id = p.cliente_id;
```

- **Explicación:** Usamos el `LEFT JOIN` que ya conocemos, pero maquillamos el resultado.
    
- 📝 **Chuleta:** `NVL(columna, 'texto')` evalúa si el dato es nulo. Si lo es, imprime el texto que tú le digas; si no es nulo, imprime el dato normal. (En otros motores como SQL Server se usa `ISNULL()` y en MySQL/PostgreSQL se usa `COALESCE()`).
    

**15. Lista todos los productos y su marca, junto con la cantidad total pedida. Usa LEFT JOIN para que los productos con 0 ventas no desaparezcan.**

SQL

```sql
SELECT p.nombre, p.marca, NVL(SUM(lp.cantidad), 0) AS cantidad_total 
FROM productos p 
LEFT JOIN lineas_pedido lp ON p.id = lp.producto_id
GROUP BY p.nombre, p.marca;
```

- **Explicación:** Al pedir la "cantidad total", necesitamos sumar (`SUM`) las cantidades. Y al usar una función de agrupación como `SUM`, estamos obligados a poner todas las demás columnas en un `GROUP BY`. Le meto un `NVL` de regalo para que en vez de salir "vacío" salga un "0" bien bonito si no se ha vendido nada.
    

**16. Une tres tablas: Muestra el nombre del cliente, el ID del pedido y el nombre del producto que compró.**

SQL

```sql
SELECT c.nombre_completo, p.id AS pedido_id, pr.nombre AS producto 
FROM clientes c 
INNER JOIN pedidos p ON c.id = p.cliente_id 
INNER JOIN lineas_pedido lp ON p.id = lp.pedido_id 
INNER JOIN productos pr ON lp.producto_id = pr.id;
```

- **Explicación:** _Ojo, el enunciado dice "Une tres tablas", pero técnicamente para ir desde el cliente hasta el producto hay que cruzar 4 tablas:_ Clientes -> Pedidos -> Lineas -> Productos. Es como hacer puentes: unes A con B, luego B con C, luego C con D.
    

**17. Une tres tablas: Muestra el SKU del producto, el nombre de su categoría y el ID del pedido donde se vendió.**

SQL

```sql
SELECT p.sku, c.nombre AS categoria, lp.pedido_id 
FROM productos p 
INNER JOIN categorias c ON p.categoria_id = c.id 
INNER JOIN lineas_pedido lp ON p.id = lp.producto_id;
```

- **Explicación:** Aquí sí son 3 tablas. Unimos el producto con su categoría por un lado, y el mismo producto con las líneas de pedido por el otro.
    

**18. Muestra el nombre de todas las categorías y, si tienen productos vendidos, el ID de la línea de pedido. Usa LEFT JOIN encadenados.**

SQL

```sql
SELECT c.nombre AS categoria, lp.pedido_id 
FROM categorias c 
LEFT JOIN productos p ON c.id = p.categoria_id 
LEFT JOIN lineas_pedido lp ON p.id = lp.producto_id;
```

- **Explicación:** El dominio total. Queremos preservar las categorías cueste lo que cueste. Por tanto, hacemos `LEFT JOIN` hacia productos, y luego _otro_ `LEFT JOIN` hacia las líneas de pedido.
    
- 📝 **Chuleta:** Si en un encadenamiento empiezas con `LEFT JOIN`, normalmente todo lo que siga hacia la derecha deberá ser `LEFT JOIN` para no "romper" y borrar los nulos que has rescatado en el paso anterior.
    

**19. Obtén el nombre de los clientes y los productos que han comprado, pero solo para clientes de la provincia de 'Valencia' o 'Madrid'.**

SQL

```sql
SELECT c.nombre_completo, pr.nombre AS producto 
FROM clientes c 
INNER JOIN pedidos p ON c.id = p.cliente_id 
INNER JOIN lineas_pedido lp ON p.id = lp.pedido_id 
INNER JOIN productos pr ON lp.producto_id = pr.id 
WHERE c.provincia IN ('Valencia', 'Madrid');
```

- **Explicación:** Hacemos el tren de uniones de 4 tablas como en el ej. 16, y al final le aplicamos un filtro con `WHERE`.
    
- 📝 **Chuleta:** `IN ('A', 'B')` es una forma abreviada y elegante de escribir `WHERE provincia = 'Valencia' OR provincia = 'Madrid'`.
    

**20. Muestra el identificador del pedido, la fecha y el nombre de la categoría de cada producto incluido en dicho pedido.**

SQL

```sql
SELECT p.id AS pedido_id, p.fecha_pedido, c.nombre AS categoria 
FROM pedidos p 
INNER JOIN lineas_pedido lp ON p.id = lp.pedido_id 
INNER JOIN productos pr ON lp.producto_id = pr.id 
INNER JOIN categorias c ON pr.categoria_id = c.id;
```

- **Explicación:** Trazamos la ruta: empezamos en el Pedido -> cruzamos a sus Líneas -> miramos qué Producto es -> miramos en qué Categoría está ese producto. Y una vez todo conectado, imprimimos las tres columnas que nos piden.
    

---

¡Los JOINs son como un rompecabezas, una vez que ves cómo encajan las piezas (las claves primarias con las foráneas), sale solo! ¿Avanzamos al siguiente bloque o hay alguna unión que te haya dejado dudando?