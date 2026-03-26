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

        // Definición de la función
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

Al añadir parámetros entre los paréntesis, la función se vuelve "generérica". Ya no depende de variables fijas, sino de los valores que le pasemos al hacer clic en el botón.

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
        // Función con argumentos
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
        // Función que devuelve un valor
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
    <h3>Prueba de Conflicto de Nombres</h3>
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

## 6. Funciones Predeterminadas (Built-in)

JavaScript incluye funciones listas para usar que facilitan tareas comunes como convertir tipos de datos o manipular texto.

### Explicación técnica:

- **`parseInt()`**: Convierte una cadena de texto en un número entero.
    
- **`isNaN()`**: Verifica si un valor no es un número.
    
- **`toUpperCase()` / `toLowerCase()`**: Cambian el caso del texto.
    

### Código HTML Completo:

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Funciones Predeterminadas</title>
</head>
<body>
    <h3>Conversión y Validación</h3>
    <input type="text" id="datoUsuario" placeholder="Escribe un número">
    <button onclick="procesarDato()">Procesar</button>
    <p id="resultado"></p>

    <script>
        function procesarDato() {
            var entrada = document.getElementById("datoUsuario").value;
            var numero = parseInt(entrada);

            if (isNaN(numero)) {
                document.getElementById("resultado").innerHTML = "Error: '" + entrada.toUpperCase() + "' no es un número.";
            } else {
                document.getElementById("resultado").innerHTML = "El doble de " + numero + " es " + (numero * 2);
            }
        }
    </script>
</body>
</html>
```

## 7. Manipulación de Formularios

Las funciones son esenciales para validar y obtener datos de los formularios HTML.

### Explicación técnica:

Podemos acceder a los valores de campos de texto, botones de radio, casillas de verificación y listas desplegables utilizando propiedades como `.value` o `.checked`.

### Código HTML Completo:

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Funciones y Formularios</title>
</head>
<body>
    <h3>Formulario de Selección</h3>
    <form id="miForm">
        <label>Elige una opción:</label>
        <select id="opciones">
            <option value="1">Opción A</option>
            <option value="2">Opción B</option>
            <option value="3">Opción C</option>
        </select>
        <br><br>
        <button type="button" onclick="obtenerSeleccion()">Ver selección</button>
    </form>
    <p id="salida"></p>

    <script>
        function obtenerSeleccion() {
            var lista = document.getElementById("opciones");
            var indice = lista.selectedIndex;
            var valor = lista.options[indice].value;
            var texto = lista.options[indice].text;

            document.getElementById("salida").innerHTML = 
                "Has elegido la " + texto + " (Valor: " + valor + ")";
        }
    </script>
</body>
</html>
```

## 8. Ejercicio de Aplicación: Validación de Rango

Este ejercicio combina el uso de condicionales, funciones y manipulación del DOM para validar que un número esté entre 10 y 20.

### Código HTML Completo:

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ejercicio de Validación</title>
</head>
<body>
    <h2>Validador de Rango (10 - 20)</h2>
    <input id="numb" type="text" placeholder="Introduce un número">
    <button type="button" onclick="validar()">Validar</button>
    <p id="demo"></p>

    <script>
        function validar() {
            var x, text;
            x = document.getElementById("numb").value;

            // Validación lógica combinada
            if (isNaN(x) || x < 10 || x > 20) {
                text = "Entrada no válida (debe ser número entre 10 y 20)";
            } else {
                text = "Entrada correcta";
            }
            document.getElementById("demo").innerHTML = text;
        }
    </script>
</body>
</html>
```