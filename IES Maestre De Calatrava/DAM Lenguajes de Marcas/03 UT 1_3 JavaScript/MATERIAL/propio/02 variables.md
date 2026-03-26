### 1. El Concepto de Variable

Este ejemplo demuestra la lógica detrás del uso de variables para crear programas genéricos, realizando una suma sin usar números fijos en la operación final.

HTML

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Concepto de Variable</title>
</head>
<body>
    <h3>Abre la Consola (F12) para ver los resultados</h3>
    <script>
        // Transcripción del código
        // Se asignan valores a los nombres de las variables
        numero_1 = 3;
        numero_2 = 1;
        
        // La operación usa los nombres, no los números directamente
        resultado = numero_1 + numero_2;
        
        console.log("El resultado de la suma es:", resultado); // Muestra 4
    </script>
</body>
</html>
```

---

### 2. Declaración e Inicialización con `var`

En JavaScript, la forma correcta de crear una variable es utilizando la palabra reservada `var`. Este ejemplo muestra cómo declarar e inicializar las variables simultáneamente.

HTML

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Declaración con var</title>
</head>
<body>
    <h3>Abre la Consola (F12) para ver los resultados</h3>
    <script>
        // Transcripción del código
        // Usamos 'var' para declarar e inicializar en la misma línea
        var numero_1 = 3;
        var numero_2 = 1;
        
        // Una vez declaradas, las usamos directamente por su nombre
        var resultado = numero_1 + numero_2;
        
        console.log("Resultado con var:", resultado); // Muestra 4
    </script>
</body>
</html>
```

---

### 3. Identificadores (Nombres válidos e inválidos)

Los nombres de las variables (identificadores) deben seguir reglas estrictas. Solo pueden contener letras, números, `$` y `_`, y **nunca** pueden empezar por un número.

HTML

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Identificadores Válidos e Inválidos</title>
</head>
<body>
    <h3>Observa los comentarios en el código</h3>
    <script>
        // --- Identificadores VÁLIDOS ---
        var $numero1;
        var _$letra;
        var $$$variable;
        var $_a__$__1;

        // --- Identificadores INVÁLIDOS (Darán error) ---
        // var 1numero;      // ERROR: Empieza por número
        // var numero;123;   // ERROR: Contiene un carácter no permitido (;)
        
        console.log("Nombres de variables verificados.");
    </script>
</body>
</html>
```

---

### 4. Tipos de Variables

Aunque todas se declaran con `var`, el tipo de dato que almacenan determina cómo se comportan.

#### A. Variables Numéricas y Cadenas de Texto (Strings)

Este ejemplo muestra cómo declarar números (enteros y decimales) y texto (usando comillas simples o dobles).

HTML

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Tipos: Números y Texto</title>
</head>
<body>
    <h3>Abre la Consola (F12) para ver los resultados</h3>
    <script>
        // --- Variables Numéricas ---
        var iva = 16;        // Número entero (integer)
        var total = 234.65;  // Número decimal (float). ¡Usa punto, no coma!

        // --- Cadenas de Texto (Strings) ---
        var mensaje = "Bienvenido a nuestro sitio web"; // Comillas dobles
        var nombreProducto = 'Producto ABC';           // Comillas simples
        var textoSolucion1 = "Una frase con 'comillas simples' dentro"; // Mezcla válida

        console.log("IVA:", iva);
        console.log("Total:", total);
        console.log("Mensaje:", mensaje);
        console.log("Texto con comillas:", textoSolucion1);
    </script>
</body>
</html>
```

#### B. Arrays (Vectores o Matrices)

Los arrays permiten agrupar múltiples valores relacionados en una sola colección, accesibles mediante un índice numérico que empieza en **0**.

HTML

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Tipos: Arrays</title>
</head>
<body>
    <h3>Abre la Consola (F12) para ver los resultados</h3>
    <script>
        // Transcripción del código
        // Definimos el array separando elementos por comas dentro de corchetes []
        var dias = ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"];
        
        // Accedemos a los elementos por su índice (posición)
        var primerDia = dias[0]; // Resultado: "Lunes"
        var sextoDia = dias[5];  // Resultado: "Sábado"

        console.log("Array completo:", dias);
        console.log("Primer día (índice 0):", primerDia);
        console.log("Sexto día (índice 5):", sextoDia);
    </script>
</body>
</html>
```

#### C. Variables Booleanas

También llamadas lógicas, solo pueden tener dos valores: `true` (verdadero) o `false` (falso). Son fundamentales para la toma de decisiones.

HTML

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Tipos: Booleanos</title>
</head>
<body>
    <h3>Abre la Consola (F12) para ver los resultados</h3>
    <script>
        // Transcripción del código
        var clienteRegistrado = false;
        var ivaIncluido = true;

        console.log("¿Cliente registrado?", clienteRegistrado); // Muestra false
        console.log("¿IVA incluido?", ivaIncluido);           // Muestra true
    </script>
</body>
</html>
```