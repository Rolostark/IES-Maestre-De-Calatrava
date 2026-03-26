¡Me parece una idea genial! Aprender SQL no va de memorizar consultas enteras, sino de entender qué hace cada "pieza" del código.

Aquí tienes el desglose paso a paso de los 20 ejercicios, cada uno con su explicación y su **chuleta** de conceptos clave.

#        1/4
### Bloque 1: Explorando la Clientela y Categorías

**1. Muestra todos los campos de la tabla CATEGORIAS...**

SQL

```sql
SELECT * FROM categorias;
```

- **Explicación:** Queremos ver absolutamente todo lo que hay en la tabla, sin filtros ni omisiones.
    
- 📝 **Chuleta:** `SELECT *` (asterisco) significa "tráeme todas las columnas". `FROM` indica de qué tabla sacamos los datos.
    

**2. Lista el nombre completo y el email de todos los clientes registrados.**

SQL

```sql
SELECT nombre_completo, email FROM clientes;
```

- **Explicación:** En lugar de traer todos los datos (como DNI o teléfono), especificamos exactamente qué dos columnas queremos leer.
    
- 📝 **Chuleta:** `SELECT columna1, columna2` te permite filtrar verticalmente, eligiendo solo los datos que necesitas ver.
    

**3. ¿Cuántos clientes tenemos en total?**

SQL

```sql
SELECT COUNT(*) AS total_clientes FROM clientes;
```

- **Explicación:** No queremos ver a los clientes, solo queremos saber cuántas filas (registros) hay en la tabla.
    
- 📝 **Chuleta:** `COUNT(*)` es una función de agregación que cuenta el número total de filas. `AS` sirve para ponerle un "alias" o nombre bonito a esa columna en el resultado.
    

**4. Muestra los clientes que viven en la provincia de 'Barcelona'.**

SQL

```sql
SELECT * FROM clientes WHERE provincia = 'Barcelona';
```

- **Explicación:** Traemos todas las columnas, pero le ponemos una condición: la columna provincia debe ser exactamente igual a 'Barcelona'.
    
- 📝 **Chuleta:** `WHERE` es la cláusula estrella para filtrar horizontalmente (elegir qué filas queremos que salgan). Requiere comillas simples `''` para los textos (cadenas de caracteres).
    

**5. Obtén una lista de las provincias distintas donde tenemos clientes...**

SQL

```sql
SELECT DISTINCT provincia FROM clientes;
```

- **Explicación:** Si hacemos un `SELECT provincia`, saldría "Barcelona, Madrid, Barcelona, Murcia...", repitiéndose. Queremos ver los valores únicos.
    
- 📝 **Chuleta:** `DISTINCT` se coloca justo después del `SELECT` y sirve para eliminar los valores duplicados del resultado.
    

**6. Muestra los nombres de los clientes que NO han facilitado un número de teléfono.**

SQL

```
SELECT nombre_completo FROM clientes WHERE telefono IS NULL;
```

- **Explicación:** Buscamos a los clientes cuyo campo de teléfono esté literalmente vacío (sin registrar).
    
- 📝 **Chuleta:** `IS NULL` es la forma correcta de buscar datos vacíos. Nunca uses `= NULL` porque en SQL "nada" no es igual a "nada".
    

**7. Lista los 5 clientes con más puntos de fidelidad, ordenados de mayor a menor.**

SQL

```sql
SELECT * FROM clientes 
ORDER BY puntos_fidelidad DESC 
FETCH FIRST 5 ROWS ONLY;
```

- **Explicación:** Primero ordenamos toda la tabla basándonos en los puntos, de forma descendente. Luego, "cortamos" el resultado para ver solo a los 5 primeros (el top 5).
    
- 📝 **Chuleta:** `ORDER BY columna DESC` ordena de mayor a menor (usa `ASC` para menor a mayor). `FETCH FIRST n ROWS ONLY` es la sintaxis de Oracle para limitar la cantidad de resultados (en otros motores como MySQL se usa `LIMIT 5`).
    

**8. Busca a todos los clientes que se hayan registrado durante el año 2026.**

SQL

```sql
SELECT * FROM clientes 
WHERE EXTRACT(YEAR FROM fecha_registro) = 2026;
```

- **Explicación:** El campo fecha tiene día, mes y año. Necesitamos extraer solo el año para compararlo con el número 2026.
    
- 📝 **Chuleta:** `EXTRACT(YEAR FROM campo_fecha)` es una función nativa que aísla el año de una fecha. También puedes extraer el `MONTH` o el `DAY`.
    

---

### Bloque 2: El Inventario de Repuestos

**9. Muestra el nombre y el precio de todos los productos de la marca 'Brembo'.**

SQL

```sql
SELECT nombre, precio_actual FROM productos WHERE marca = 'Brembo';
```

- **Explicación:** Igual que en el ejercicio 4, filtramos por un texto exacto y mostramos solo dos columnas.
    

**10. Lista los productos que tienen un stock crítico (menos de 10 unidades).**

SQL

```sql
SELECT * FROM productos WHERE stock < 10;
```

- **Explicación:** Filtramos la tabla buscando valores numéricos estrictamente menores a 10.
    
- 📝 **Chuleta:** Operadores matemáticos: `<` (menor), `>` (mayor), `<=` (menor o igual), `>=` (mayor o igual), `!=` o `<>` (distinto).
    

**11. Muestra los productos cuyo precio esté entre 50 y 200 euros.**

SQL

```sql
SELECT * FROM productos WHERE precio_actual BETWEEN 50 AND 200;
```

- **Explicación:** Buscamos un rango inclusivo (incluye tanto el 50 como el 200).
    
- 📝 **Chuleta:** `BETWEEN valor1 AND valor2` es la forma limpia de buscar rangos. Es exactamente lo mismo que escribir `WHERE precio_actual >= 50 AND precio_actual <= 200`.
    

**12. Busca todos los productos que contengan la palabra 'Neumático' en su nombre.**

SQL

```sql
SELECT * FROM productos WHERE nombre LIKE '%Neumático%';
```

- **Explicación:** No sabemos el nombre exacto del producto, solo sabemos que una parte de ese nombre es "Neumático".
    
- 📝 **Chuleta:** `LIKE` se usa para buscar patrones de texto. El comodín `%` significa "cualquier conjunto de caracteres". `%Neumático%` significa que puede haber texto antes y texto después de esa palabra.
    

**13. ¿Cuál es el producto más caro de toda la tienda?**

SQL

```sql
SELECT nombre, precio_actual FROM productos 
ORDER BY precio_actual DESC 
FETCH FIRST 1 ROW ONLY;
```

- **Explicación:** Aplicamos la misma lógica que en el Top 5 de clientes (ejercicio 7), pero limitando la respuesta a 1 sola fila para tener el récord absoluto.
    

**14. Calcula el stock total de piezas que hay en el almacén sumando todas las existencias.**

SQL

```sql
SELECT SUM(stock) AS stock_total_almacen FROM productos;
```

- **Explicación:** Cogemos todos los números de la columna "stock" y los sumamos.
    
- 📝 **Chuleta:** `SUM(columna)` es otra función de agregación (como COUNT). Suma los valores de las filas resultantes.
    

---

### Bloque 3: Pedidos y Ventas

**15. Muestra todos los pedidos que se encuentran en estado 'CANCELADO'.**

SQL

```sql
SELECT * FROM pedidos WHERE estado = 'CANCELADO';
```

- **Explicación:** Filtrado simple por texto exacto (recuerda que SQL suele ser sensible a mayúsculas dentro de las comillas).
    

**16. Lista los pedidos realizados mediante el método de pago 'PayPal'.**

SQL

```sql
SELECT * FROM pedidos WHERE metodo_pago = 'PayPal';
```

- **Explicación:** Otro filtrado directo utilizando la cláusula `WHERE`.
    

**17. Muestra los pedidos realizados hoy mismo (9 de marzo de 2026), incluyendo la hora.**

SQL

```sql
SELECT * FROM pedidos 
WHERE TRUNC(fecha_pedido) = TO_DATE('2026-03-09', 'YYYY-MM-DD');
```

- **Explicación:** Como los pedidos tienen fecha _y hora_, si solo buscamos '2026-03-09', Oracle asume que es a las 00:00:00 y no encontrará los pedidos de la tarde. Por eso cortamos la hora del pedido para compararlo solo con el día.
    
- 📝 **Chuleta:** `TRUNC(fecha)` "trunca" o corta la hora, dejándola a medianoche. `TO_DATE('texto', 'formato')` le enseña a Oracle a leer un texto y convertirlo en un formato de fecha real.
    

**18. En la tabla LINEAS_PEDIDO, muestra aquellas donde se compraron más de 3 unidades.**

SQL

```sql
SELECT * FROM lineas_pedido WHERE cantidad > 3;
```

- **Explicación:** Operador relacional mayor que (`>`). Muy directo.
    

**19. Muestra el pedido_id, el producto_id y el subtotal de las 10 líneas de pedido más caras.**

SQL

```sql
SELECT pedido_id, producto_id, subtotal FROM lineas_pedido 
ORDER BY subtotal DESC 
FETCH FIRST 10 ROWS ONLY;
```

- **Explicación:** Combinamos proyección de columnas específicas (`SELECT`), ordenación descendente (`ORDER BY`) y límite de resultados (`FETCH FIRST`).
    

**20. ¿Qué estados distintos puede tener un pedido?**

SQL

```sql
SELECT DISTINCT estado FROM pedidos;
```

- **Explicación:** Eliminamos la repetición masiva de estados ('PAGADO', 'PENDIENTE'...) para ver el catálogo único de estados que se han usado hasta ahora. (Repaso de la chuleta del ejercicio 5).