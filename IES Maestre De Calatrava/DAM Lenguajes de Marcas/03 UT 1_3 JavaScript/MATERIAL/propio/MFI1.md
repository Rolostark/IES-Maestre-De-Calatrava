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

## 5. Funciones Predeterminadas (Built-in)

JavaScript incluye herramientas listas para usar:

- **`parseInt(texto)`**: Convierte una cadena en un número entero.
    
- **`isNaN(valor)`**: Verifica si un valor no es un número.
    
- **`toUpperCase()`**: Pasa el texto a mayúsculas.
    

### Código HTML Completo:

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Funciones Predeterminadas</title>
</head>
<body>
    <h3>Validación de Números</h3>
    <input type="text" id="dato" placeholder="Escribe algo">
    <button onclick="procesar()">Procesar</button>
    <p id="salida"></p>

    <script>
        function procesar() {
            var input = document.getElementById("dato").value;
            var numero = parseInt(input);

            if (isNaN(numero)) {
                document.getElementById("salida").innerHTML = "Error: '" + input.toUpperCase() + "' no es numérico.";
            } else {
                document.getElementById("salida").innerHTML = "Número válido: " + numero;
            }
        }
    </script>
</body>
</html>
```

## 6. Propiedades y Eventos en Formularios

Independientemente del tipo de elemento, JavaScript permite acceder a propiedades clave:

- **`type`**: Indica el tipo de elemento (`text`, `select-one`, `textarea`, etc.).
    
- **`form`**: Referencia directa al formulario al que pertenece el elemento.
    
- **`name`**: Lee el nombre del atributo (solo lectura).
    
- **`value`**: Permite leer y modificar el contenido del elemento.
    

### Eventos más comunes:

- **`onclick`**: Al pinchar con el ratón.
    
- **`onchange`**: Cuando cambia el valor y el campo pierde el foco.
    
- **`onfocus`**: Cuando el usuario selecciona (enfoca) el campo.
    
- **`onblur`**: Cuando el usuario deselecciona (pierde el foco) el campo.
    

## 7. Obtención de Valores en Elementos Específicos

### A. Cuadros de texto y Textarea

Se accede directamente mediante la propiedad `.value`.

### B. Radiobuttons (Radio)

Se utiliza la propiedad `.checked` (devuelve `true` o `false`). Normalmente se usa `document.getElementsByName` para iterar sobre el grupo.

### C. Listas Desplegables (Select)

Es el más complejo, requiere acceder al array de opciones (`options`) y al índice seleccionado (`selectedIndex`).

### Código HTML Completo (Ejemplo Combinado):

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Manipulación Completa de Formularios</title>
</head>
<body>
    <h3>Encuesta Rápida</h3>
    <form id="formularioEncuesta">
        <label>¿Aceptas las condiciones?</label>
        <input type="checkbox" id="acepto" value="si"> <br><br>

        <label>Género:</label>
        <input type="radio" name="genero" value="H" id="h"> H
        <input type="radio" name="genero" value="M" id="m"> M <br><br>

        <label>Ciudad:</label>
        <select id="ciudad">
            <option value="mad">Madrid</option>
            <option value="bcn">Barcelona</option>
            <option value="vlc">Valencia</option>
        </select> <br><br>

        <button type="button" onclick="procesarFormulario()">Enviar Datos</button>
    </form>

    <script>
        function procesarFormulario() {
            // 1. Checkbox
            var check = document.getElementById("acepto");
            console.log("Aceptado: " + check.checked);

            // 2. Radiobuttons (Iteración por nombre)
            var radios = document.getElementsByName("genero");
            var generoSeleccionado = "Ninguno";
            for(var i = 0; i < radios.length; i++) {
                if(radios[i].checked) generoSeleccionado = radios[i].value;
            }
            console.log("Género: " + generoSeleccionado);

            // 3. Select (Abreviado)
            var lista = document.getElementById("ciudad");
            var ciudadValor = lista.options[lista.selectedIndex].value;
            var ciudadTexto = lista.options[lista.selectedIndex].text;
            
            alert("Ciudad: " + ciudadTexto + " (Código: " + ciudadValor + ")");
        }
    </script>
</body>
</html>
```

## 8. Ejercicio Final: Validación de Rango y Foco

Este ejercicio utiliza los eventos `onfocus` y `onblur` para mejorar la experiencia de usuario y valida el rango numérico.

### Código HTML Completo:

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ejercicio de Validación Avanzada</title>
    <style>
        .error { border: 2px solid red; background-color: #ffe6e6; }
        .foco { background-color: #e6f7ff; }
    </script>
</head>
<body>
    <h2>Validador de Rango (10 - 20)</h2>
    <input id="numb" type="text" 
           onfocus="marcarFoco(this)" 
           onblur="quitarFoco(this)" 
           placeholder="Introduce un número">
    <button type="button" onclick="validar()">Validar</button>
    <p id="demo"></p>

    <script>
        function marcarFoco(elemento) {
            elemento.className = "foco";
        }

        function quitarFoco(elemento) {
            elemento.className = "";
        }

        function validar() {
            var x = document.getElementById("numb").value;
            var text;

            if (isNaN(x) || x < 10 || x > 20) {
                text = "Entrada no válida (debe ser número entre 10 y 20)";
                document.getElementById("numb").className = "error";
            } else {
                text = "Entrada correcta";
                document.getElementById("numb").className = "";
            }
            document.getElementById("demo").innerHTML = text;
        }
    </script>
</body>
</html>
```