# Manual Completo de Funciones en JavaScript

Las funciones son la solución para evitar la repetición de instrucciones en aplicaciones complejas. Permiten extraer bloques de código, reutilizarlos y facilitar el mantenimiento del programa.

## 1. Definición y Función Básica

Una función es un conjunto de instrucciones agrupadas para realizar una tarea concreta. Se define con la palabra `function` y se ejecuta cuando se indica su nombre.

### Explicación técnica:

En este ejemplo, agrupamos la lógica de sumar dos variables globales y mostrar un mensaje de alerta. En lugar de escribir el `alert` tres veces, simplemente llamamos a `suma_y_muestra()`.

### Código HTML Completo:

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Función Básica</title>
</head>
<body>
    <h3>Suma de Variables Globales</h3>
    <button onclick="suma_y_muestra()">Ejecutar Suma</button>

    <script>
        // Variables globales
        var numero1 = 3;
        var numero2 = 5;
        var resultado;

        // Definición de la función (Pág. 7 del manual)
        function suma_y_muestra() {
            resultado = numero1 + numero2;
            alert("El resultado es " + resultado);
        }
    </script>
</body>
</html>
```

## 2. Funciones con Argumentos (Parámetros)

Los argumentos son variables externas que la función necesita para procesar datos específicos en el momento de la llamada.

### Explicación técnica:

Al añadir parámetros entre los paréntesis, la función se vuelve "genérica". Ya no depende de variables fijas, sino de los valores que le pasemos al hacer clic en el botón.

### Código HTML Completo:

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Argumentos en Funciones</title>
</head>
<body>
    <h3>Sumar valores dinámicos</h3>
    <button onclick="suma_y_muestra(10, 20)">Sumar 10 + 20</button>
    <button onclick="suma_y_muestra(50, 50)">Sumar 50 + 50</button>

    <script>
        // Función con argumentos (Pág. 11 del manual)
        function suma_y_muestra(n1, n2) {
            var resultado = n1 + n2;
            alert("El resultado es " + resultado);
        }
    </script>
</body>
</html>
```

## 3. Retorno de Valores (`return`)

Las funciones pueden devolver un resultado al programa principal para guardarlo en una variable y seguir trabajando con él.

### Explicación técnica:

La palabra reservada `return` detiene la función y envía el valor calculado hacia afuera. Es útil para cálculos complejos como impuestos o gastos de envío.

### Código HTML Completo:

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Funciones con Retorno</title>
</head>
<body>
    <h3>Cálculo de Precio con Impuestos</h3>
    <p id="salida_precio">El precio final aparecerá aquí.</p>
    <button onclick="mostrarPrecio()">Calcular Total (23.34€)</button>

    <script>
        // Función que devuelve un valor (Pág. 15 del manual)
        function calculaPrecioTotal(precio) {
            var impuestos = 1.16;
            var gastosEnvio = 10;
            var precioTotal = (precio * impuestos) + gastosEnvio;
            return precioTotal;
        }

        function mostrarPrecio() {
            var total = calculaPrecioTotal(23.34);
            document.getElementById("salida_precio").innerHTML = "Total con IVA y Envío: " + total.toFixed(2) + "€";
        }
    </script>
</body>
</html>
```

## 4. Ámbito de las Variables (Scope)

El ámbito determina dónde existe una variable. Es vital entender la diferencia para no borrar datos accidentalmente.

- **Global**: Definida fuera de funciones. Es accesible desde cualquier parte.
    
- **Local**: Definida con `var` dentro de una función. Solo existe ahí.
    

### Explicación técnica:

Si una función declara una variable local con el mismo nombre que una global, la **local prevalece** dentro de la función. Al salir, la global recupera su valor original.

### Código HTML Completo:

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ámbito de Variables</title>
</head>
<body>
    <h3>Prueba de Conflicto de Nombres (Pág. 22)</h3>
    <button onclick="ejecutarPrueba()">Ver Alertas de Ámbito</button>

    <script>
        var mensaje = "gana la de fuera"; // Global

        function muestraMensaje() {
            var mensaje = "gana la de dentro"; // Local
            alert("Dentro de la función: " + mensaje);
        }

        function ejecutarPrueba() {
            alert("Antes de llamar: " + mensaje);
            muestraMensaje();
            alert("Después de llamar: " + mensaje);
        }
    </script>
</body>
</html>
```

## 5. El uso de `this`

`this` hace referencia al objeto sobre el que estamos trabajando. En eventos HTML, suele referirse al elemento mismo que disparó el evento (como un botón).

### Código HTML Completo:

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Uso de This</title>
</head>
<body>
    <h3>Referencia al elemento actual</h3>
    <button onclick="cambiarTexto(this)">Haz clic para cambiar mi texto</button>

    <script>
        // El parámetro 'elemento' recibirá el objeto 'this' (el botón)
        function cambiarTexto(elemento) {
            elemento.innerHTML = "¡Has pulsado este botón!";
            elemento.style.backgroundColor = "yellow";
        }
    </script>
</body>
</html>
```