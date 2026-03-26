## 1. Conceptos Fundamentales

JavaScript es un lenguaje de programación ejecutado en el lado del cliente (en el navegador del usuario) que permite dinamizar contenido y estilos en páginas web.

- **Ubicación**: Puede colocarse en las secciones `<head>` o `<body>` de un documento HTML.
    
- **Etiqueta `<script>`**: El código debe insertarse entre las etiquetas `<script>` y `</script>`.
    
- **Script Externo**: Se puede vincular un archivo externo usando la sintaxis `<script src="nombre.js"></script>`.
    

---

## 2. El DOM (Document Object Model)

Cuando se carga una página, el navegador crea el DOM, que permite a JavaScript acceder y modificar todos los elementos HTML.

### Métodos para encontrar elementos:

- **`document.getElementById(id)`**: Busca un elemento por su identificador único.
    
- **`document.getElementsByTagName(name)`**: Busca elementos por el nombre de su etiqueta.
    
- **`document.getElementsByClassName(name)`**: Busca elementos por su clase CSS.
    

### Métodos para modificar elementos:

- **`innerHTML`**: Propiedad para cambiar el contenido interno de una etiqueta.
    
- **`attribute = nuevo valor`**: Cambia directamente el valor de un atributo (como `src` o `href`).
    
- **`style.property`**: Permite modificar el CSS (como `color` o `fontSize`).
    
- **`style.display = 'none'`**: Se utiliza para ocultar elementos de la página.
    

---

## 3. Tipos de Datos y Variables

Las variables se declaran con la palabra clave `var` y se utilizan para almacenar datos.

- **Literales**: Valores fijos como números (con o sin decimales) o cadenas de texto (entre comillas simples o dobles).
    
- **Booleanos**: Solo pueden ser `true` o `false`. El valor `0` y las cadenas vacías `""` se evalúan como falsos.
    
- **Matrices (Arrays)**: Colecciones de datos que se acceden por un índice numérico que comienza en 0.
    
- **Objetos**: Variables que contienen propiedades (nombre: valor) y métodos (funciones internas) escritos entre llaves `{}`.
    

---

## 4. Estructuras de Control y Bucles

### Condicionales

Permiten tomar decisiones basadas en resultados lógicos:

- **`if`**: Ejecuta código si la condición es verdadera.
    
- **`else`**: Ejecuta un bloque alternativo si la condición es falsa.
    
- **`switch`**: Selecciona uno de muchos bloques de código basándose en una expresión (útil para días de la semana).
    

### Bucles (Loops)

Repiten código mientras se cumpla una condición:

- **`for`**: Estructura ideal cuando se conoce de antemano el número de repeticiones.
    
- **`for/in`**: Recorre las propiedades de un objeto.
    
- **`while`**: Ejecuta el código mientras la condición sea verdadera.
    
- **`do/while`**: Ejecuta el código al menos una vez antes de comprobar la condición.
    

---

## 5. Eventos HTML

JavaScript reacciona a sucesos que ocurren en el sistema. Los más comunes son:

|**Evento**|**Significado**|
|---|---|
|**`onclick`**|Hacer clic sobre un elemento.|
|**`onmouseover`**|Mover el ratón sobre un elemento.|
|**`onchange`**|El valor de un elemento ha cambiado.|
|**`onload`**|La página ha terminado de cargarse.|

---

## 6. Operadores y Sintaxis

- **Asignación**: Se utiliza `=` para dar valor a variables.
    
- **Aritméticos**: `+`, `-`, `*`, `/`, `%` (módulo), `++` (incremento) y `--` (decremento).
    
- **Comparación**: `==` (igual), `===` (igual valor y tipo), `!=` (distinto), `>` (mayor que) y `<` (menor que).
    
- **Lógicos**: `&&` (y), `||` (o) y `!` (no).
    
- **Sensibilidad**: JavaScript distingue entre mayúsculas y minúsculas (`lastName` es diferente a `lastname`).