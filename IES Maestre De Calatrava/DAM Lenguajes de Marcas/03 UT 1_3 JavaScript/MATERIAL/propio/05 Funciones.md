# Guía de Funciones en JavaScript

Las funciones son bloques de código independientes y reutilizables diseñados para realizar tareas específicas. Permiten organizar el código, evitar redundancias y facilitar el mantenimiento de las aplicaciones.

## 1. Definición y Estructura Básica

Una función se define con la palabra reservada `function`, un nombre descriptivo y un bloque de instrucciones entre llaves `{}`.

### Código Transcrito:

```javascript
function nombre_funcion() {
  // Instrucciones de la función
}
```

### Ejemplo Funcional (HTML Completo):

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Función Simple</title>
</head>
<body>
    <h3>Haz clic para ejecutar la función</h3>
    <button onclick="saludar()">Saludar</button>

    <script>
        // Transcripción del ejemplo de la página 7
        function saludar() {
            alert("¡Hola Mundo!");
        }
    </script>
</body>
</html>
```

## 2. Argumentos y Parámetros

Las funciones pueden recibir valores externos llamados **argumentos** para realizar operaciones genéricas.

### Código Transcrito:

```javascript
function suma(numero1, numero2) {
    var resultado = numero1 + numero2;
    alert("El resultado es " + resultado);
}
```

### Ejemplo Funcional (HTML Completo):

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Función con Argumentos</title>
</head>
<body>
    <h3>Suma de dos números</h3>
    <button onclick="sumar(5, 10)">Sumar 5 + 10</button>
    <button onclick="sumar(20, 30)">Sumar 20 + 30</button>

    <script>
        function sumar(a, b) {
            var resultado = a + b;
            alert("La suma es: " + resultado);
        }
    </script>
</body>
</html>
```

## 3. Retorno de Valores (`return`)

La sentencia `return` permite que una función devuelva un valor al punto donde fue llamada, permitiendo guardar el resultado en una variable.

### Código Transcrito:

```javascript
function suma(numero1, numero2) {
    var resultado = numero1 + numero2;
    return resultado;
}
```

### Ejemplo Funcional (HTML Completo):

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Función con Retorno</title>
</head>
<body>
    <h3>Capturar el valor de una función</h3>
    <p id="resultado_texto"></p>

    <script>
        function calcularSuma(n1, n2) {
            return n1 + n2;
        }

        // Guardamos el retorno en una variable
        var total = calcularSuma(15, 25);
        document.getElementById("resultado_texto").innerHTML = "El total devuelto es: " + total;
    </script>
</body>
</html>
```

## 4. Ámbito de las Variables (Scope)

Es la regla que determina dónde es accesible una variable. El documento distingue entre variables **locales** y **globales**.

### A. Variables Locales vs. Globales

- **Global**: Declarada fuera de funciones. Accesible en todo el script.
    
- **Local**: Declarada con `var` dentro de una función. Solo existe ahí.
    

### Código Transcrito (Conflicto de nombres):

```javascript
var mensaje = "gana la de fuera";

function muestraMensaje() {
    var mensaje = "gana la de dentro";
    alert(mensaje); // Muestra "gana la de dentro"
}

alert(mensaje);     // Muestra "gana la de fuera"
muestraMensaje();
alert(mensaje);     // Muestra "gana la de fuera"
```

### Ejemplo Funcional (HTML Completo):

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ámbito de Variables</title>
</head>
<body>
    <h3>Prueba de Ámbito (Ver alertas)</h3>
    <script>
        var mensaje = "Soy Global (Fuera)";

        function probarAmbito() {
            var mensaje = "Soy Local (Dentro)";
            alert("Dentro de la función: " + mensaje);
        }

        alert("Antes de la función: " + mensaje);
        probarAmbito();
        alert("Después de la función: " + mensaje);
    </script>
</body>
</html>
```

## 5. Recomendaciones de Uso

1. **Variables Locales**: Definir como locales todas las variables de uso exclusivo de la función para evitar errores accidentales en el resto del programa.
    
2. **Variables Globales**: Usarlas con moderación para compartir información común entre diferentes funciones.