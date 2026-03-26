## 1. Introducción a JavaScript

JavaScript es un lenguaje de programación implementado en el navegador web que se ejecuta en el ordenador del cliente, no en el servidor. Su función principal es dinamizar las páginas web permitiendo cambiar el contenido o el estilo de los elementos HTML.

- **Ubicación**: El código puede colocarse tanto en la sección `<head>` como en el `<body>` de un documento HTML.
    
- **Implementación**: Se utiliza la etiqueta `<script>` para insertar el código directamente o el atributo `src` para enlazar archivos externos (ej. `codigo.js`).
    
- **Sintaxis**: Es un lenguaje sensible a mayúsculas y minúsculas (case-sensitive). Las instrucciones o sentencias deben separarse preferiblemente con puntos y comas (`;`).
    

## 2. El DOM (Document Object Model)

Al cargar una página, el navegador crea un modelo de objetos del documento (DOM). Este modelo permite a JavaScript acceder y manipular todos los elementos HTML mediante métodos y propiedades.

### Métodos de Acceso y Modificación

- **Búsqueda**: Se utilizan métodos como `document.getElementById(id)`, `document.getElementsByTagName(name)` y `document.getElementsByClassName(name)` para localizar elementos.
    
- **Contenido**: La propiedad `innerHTML` permite obtener o cambiar el contenido de una etiqueta.
    
- **Atributos**: Se pueden modificar valores de atributos como `src` en imágenes o `href` en enlaces.
    
- **Estilo (CSS)**: Se accede a las propiedades de estilo mediante `element.style.property` para cambiar colores, tamaños de fuente o visibilidad (`display = 'none'`).
    

## 3. Variables y Tipos de Datos

Las variables son contenedores para almacenar datos. En JavaScript estándar se declaran con `var`, mientras que en **ECMAScript 6 (ES6)** se introducen `let` (alcance de bloque) y `const` (para valores que no cambian).

- **Tipos de datos**: Incluyen números (literales numéricos), cadenas de texto (strings), booleanos (`true`/`false`), matrices (arrays) y objetos.
    
- **Arrays**: Colecciones de elementos bajo un único nombre, accesibles mediante un índice numérico que comienza en **0**.
    
- **Objetos**: Variables que contienen propiedades (nombres y valores) y métodos (funciones internas) escritos entre llaves `{}`.
    

## 4. Estructuras de Control y Lógica

La lógica del programa se define mediante decisiones y repeticiones.

### Condicionales

- **`if / else / else if`**: Evalúan si una condición es verdadera para ejecutar un bloque de código.
    
- **`switch`**: Selecciona uno de muchos bloques de código para ser ejecutado según una expresión evaluada una sola vez.
    
- **Operador Ternario**: Permite realizar una asignación condicional rápida: `(condición) ? valor_si_cierto : valor_si_falso`.
    

### Bucles (Loops)

- **`for`**: Repite instrucciones un número determinado de veces.
    
- **`for / in`**: Recorre los atributos o propiedades de un objeto.
    
- **`while`**: Ejecuta el código mientras una condición específica sea verdadera.
    
- **`do / while`**: Variante que ejecuta el código al menos una vez antes de comprobar la condición.
    

## 5. Funciones y Eventos

- **Funciones**: Bloques de código independientes y reutilizables. Pueden recibir parámetros y devolver valores mediante la sentencia `return`.
    
- **Funciones Arrow (ES6)**: Sintaxis moderna y simplificada para declarar funciones (ej. `(x, y) => { return x + y }`).
    
- **Eventos**: Sucesos que JavaScript detecta para ejecutar código, como `onclick` (clic), `onmouseover` (mover el ratón encima), `onchange` (cambio de valor) o `onload` (carga finalizada).
    

## 6. Operadores y Conversión

- **Aritméticos**: `+` (suma/concatenación), `-` (resta), `*` (multiplicación), `/` (división) y `%` (módulo o resto).
    
- **Lógicos**: `&&` (and), `||` (or) y `!` (not).
    
- **Conversión**: Dado que la entrada por teclado (`window.prompt`) siempre devuelve texto, se debe usar `parseInt()` para convertir valores a números antes de realizar operaciones matemáticas.