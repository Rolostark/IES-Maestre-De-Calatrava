### **Pregunta 1**

**Pregunta:** La inclusión de JavaScript en HTML se hace: **Respuesta correcta:** **a.** En el mismo documento, en un archivo externo o en los elementos HTML.

**Tu chuleta:** En el desarrollo web, tienes exactamente tres formas de integrar tu código JavaScript dentro de una página HTML. La opción "a" es la única que menciona las tres categorías generales correctas:

1. **En el mismo documento (Interno):** Escribiendo el código directamente entre las etiquetas `<script>` y `</script>`. Normalmente se coloca justo antes de cerrar la etiqueta `</body>` o dentro del `<head>`.
    
2. **En un archivo externo:** Creando un archivo separado con extensión `.js` (por ejemplo, `main.js`) y enlazándolo en tu HTML usando el atributo `src`. Ejemplo: `<script src="main.js"></script>`. Esta es la forma más recomendada y profesional porque mantiene tu código limpio y organizado.
    
3. **En los elementos HTML (En línea / Inline):** Añadiendo el código JavaScript directamente dentro de las etiquetas HTML a través de los atributos de eventos. Ejemplo: `<button onclick="alert('¡Hola!')">Haz clic aquí</button>`. (Aunque funciona, hoy en día se intenta evitar para no mezclar la estructura con la lógica).
    

Las opciones b, c y d mezclan conceptos o se dejan fuera el archivo externo, que es la forma más importante de todas.
    

---

Aquí tienes la explicación detallada de la **Pregunta 2**, analizando por qué la opción "b" es la correcta y, sobre todo, por qué las demás son trampas en las que no debes caer.
### **Pregunta 2**

**Pregunta:** JavaScript:

- a. No distingue entre mayúsculas y minúsculas.
    
- **b. Puede incluir comentarios de sólo una línea.**
    
- c. No tiene en cuenta los espacios en blanco y las nuevas líneas.
    
- d. Hay que definir obligatoriamente el tipo de variables.
    

**Respuesta correcta:** **b**


### **Explicación detallada (Por qué las demás son falsas):**

- **Opción A (Falsa):** JavaScript **sí** distingue entre mayúsculas y minúsculas (es un lenguaje _case-sensitive_).
    
    - _Ejemplo:_ Si creas una variable llamada `edad` y luego intentas usar `Edad` o `EDAD`, el programa te dará un error diciendo que no existe. Son palabras totalmente distintas para JavaScript.
        
- **Opción B (Verdadera):** Efectivamente, JavaScript te permite hacer comentarios de una sola línea utilizando la doble barra `//`. Todo lo que escribas a la derecha de esas barras en esa línea será ignorado por el navegador.
    
    - _Nota:_ También permite comentarios de varias líneas usando `/*` para abrir y `*/` para cerrar, pero la afirmación de la opción "b" sigue siendo 100% correcta.
        
- **Opción C (Falsa):** Aunque JavaScript suele ignorar los espacios en blanco extra entre palabras, **sí que tiene en cuenta las nuevas líneas** (los "Enter" o saltos de línea).
    
    - JavaScript tiene un sistema llamado "Inserción Automática de Punto y Coma". Si das un salto de línea en el lugar equivocado (por ejemplo, después de la palabra `return`), JavaScript asumirá que la instrucción ha terminado ahí y pondrá un punto y coma invisible, lo que romperá tu código.
        
- **Opción D (Falsa):** JavaScript es un lenguaje de **tipado dinámico o débil**. Esto significa que **no** tienes que decirle de qué tipo es la variable.
    
    - _Ejemplo:_ En otros lenguajes tendrías que escribir `int numero = 5;` (para decir que es un entero), pero en JS simplemente escribes `let numero = 5;`. El lenguaje es lo suficientemente listo para darse cuenta de que es un número. Y si luego decides hacer `numero = "Hola";`, JS te dejará hacerlo sin problemas, cambiando el tipo sobre la marcha.

---

Aquí tienes el análisis detallado de la **Pregunta 3**, desgranando por qué la opción "b" es la correcta y cuáles son las trampas de las demás.

### **Pregunta 3**

**Pregunta:** El nombre de una variable o identificador en JavaScript:

- a. Puede empezar por un número.
    
- **b. No puede empezar por un número.**
    
- c. No puede empezar por $
    
- d. No puede empezar por _ _
    

**Respuesta correcta:** **b**

### **Explicación detallada (Las reglas de oro para nombrar variables):**

Para entender esta pregunta, hay que conocer las reglas estrictas de JavaScript sobre cómo "bautizar" a las variables (lo que técnicamente se llama _identificadores_).

- **Opción A (Falsa):** Una variable **nunca** puede empezar por un número. Si intentas escribir en tu código algo como `let 1erNombre = "Juan";`, JavaScript se quejará inmediatamente y te lanzará un error de sintaxis (`SyntaxError: Invalid or unexpected token`). El motor del navegador se confunde porque piensa que estás intentando escribir un número, no el nombre de una variable.
    
- **Opción B (Verdadera):** Esta es la regla fundamental. Los números pueden ir **en medio** o **al final** del nombre de tu variable (por ejemplo, `nombre1` o `jugador2Activo`), pero jamás pueden ser el primer carácter.
    
- **Opción C (Falsa):** JavaScript **sí** te permite empezar el nombre de una variable con el símbolo del dólar (`$`). De hecho, es una práctica súper común. Historicamente se usaba muchísimo con la librería jQuery, y hoy en día muchos programadores lo usan para indicar que esa variable guarda un elemento HTML de la página (ejemplo válido: `let $botonEnviar = document.querySelector('button');`).
    
- **Opción D (Falsa):** JavaScript **sí** permite que empieces con uno o más guiones bajos (`_` o `__`). Aunque te parezca raro escribir `let __miVariable = 5;`, el lenguaje lo acepta perfectamente. Los programadores suelen usar el guion bajo al principio para avisar a otros desarrolladores de que esa variable es "privada" o de uso interno y que no deberían tocarla.
    

En resumen: Para nombrar variables, el primer carácter solo puede ser una **letra**, un **`$`** o un **`_`**. A partir del segundo carácter, ya puedes meter los números que quieras.

---

Aquí tienes el análisis detallado de la **Pregunta 4**, explicando por qué la opción "c" es la ganadora y la trampa en la que caen muchos estudiantes que vienen de otros lenguajes de programación.
### **Pregunta 4**

**Pregunta:** Un array es:

- a. Un conjunto de números enteros.
    
- b. Un conjunto de cadenas de caracteres.
    
- **c. Una colección de variables de distintos tipos.**
    
- d. Una colección de variables del mismo tipo.
    

**Respuesta correcta:** **c**


### **Explicación detallada (Por qué las demás son falsas):**

El concepto clave aquí es entender que JavaScript es un lenguaje muy "relajado" y flexible comparado con otros más estrictos (como Java o C).

- **Opción A y B (Falsas):** Aunque un array _puede_ contener solo números enteros (`[1, 2, 3]`) o solo cadenas de texto (`["manzana", "pera"]`), decir que es _exclusivamente_ eso es incorrecto. Limitar un array a un solo tipo de dato en JS es quedarse muy corto con sus capacidades.
    
- **Opción D (Falsa - La trampa clásica):** Fíjate que en la imagen de tu examen, esta fue la opción que se marcó inicialmente y luego se tachó. Esta respuesta sería correcta si el examen fuera de un lenguaje fuertemente tipado como C o Java, donde si creas un array de números, **solo** puedes meter números. JavaScript no tiene esta restricción; no te obliga a que todos los elementos sean hermanos gemelos del mismo tipo.
    
- **Opción C (Verdadera):** En JavaScript, un array es como una caja de sastre donde puedes meter lo que te dé la gana, en el orden que quieras y mezclando tipos de datos sin que el navegador te dé ningún error.
    
    - _Ejemplo totalmente válido en JS:_ `let miCaja = [42, "Hola Mundo", true, null, { nombre: "Juan" }, [1, 2, 3]];`
        
    - Como ves, hemos metido en la misma colección un número, un texto, un booleano, un valor nulo, un objeto y hasta otro array. Por eso es una "colección de variables de distintos tipos".
---

Aquí tienes el análisis detallado de la **Pregunta 5**. Esta es una de las preguntas "trampa" más clásicas en los exámenes de programación, porque juega con el orden exacto en el que JavaScript ejecuta las operaciones.
### **Pregunta 5**

**Pregunta:** Cuánto valen las variables `numero3` y `numero1` después de ejecutar las siguientes instrucciones: `var numero1 = 5; var numero2 = 2; numero3 = numero1++ + numero2;`

- a. numero3=7 y numero1=5
    
- b. numero3=8 y numero1=6
    
- **c. numero3=7 y numero1=6**
    
- d. numero3=8 y numero1=5
    

**Respuesta correcta:** **c**

### **Explicación detallada (El secreto del Post-incremento):**

El punto clave aquí es entender cómo funciona el operador `++` cuando se pone **después** de la variable (lo que se llama _post-incremento_). Vamos a ejecutar el código paso a paso como si fuéramos el navegador:

1. **`var numero1 = 5;`** (Guardamos un 5).
    
2. **`var numero2 = 2;`** (Guardamos un 2).
    
3. **`numero3 = numero1++ + numero2;`** ¡Aquí viene la magia!
    
    - Al leer `numero1++`, JavaScript dice: _"Como el `++` está al final, primero te entrego el valor original para que hagas la cuenta, y luego, en un segundo plano, le sumo 1 a la variable"_.
        
    - Por tanto, la suma que realmente se ejecuta es **5 + 2**. El resultado es **7**.
        
    - Ese 7 se guarda en la variable `numero3`.
        
    - Justo una milésima de segundo después de entregar el 5 para la suma, `numero1` se incrementa a sí mismo, pasando a valer **6**.
        

**Por qué las demás opciones son falsas:**

- **Opción A (Falsa):** Asume que `numero1` nunca se incrementó y se quedó en 5. El operador `++` siempre modifica la variable original.
    
- **Opción B (La trampa - Falsa):** Esto es lo que habría pasado si el código fuera `++numero1` (_pre-incremento_). Si el `++` estuviera delante, JavaScript primero sumaría 1 (pasando a 6) y luego haría la suma (6 + 2 = 8). Pero como está detrás, no funciona así.
    
- **Opción D (Falsa):** Mezcla conceptos. Asume que la suma dio 8 (como si fuera pre-incremento) pero que la variable original no cambió (quedándose en 5). Totalmente imposible.
    


¿Lo ves más claro ahora? Es puramente una cuestión de orden: "primero uso, luego sumo".
    

---
Aquí tienes el análisis detallado de la **Pregunta 6**. Esta pregunta es fantástica porque evalúa tu comprensión de un concepto vital en JavaScript: los valores **Truthy** y **Falsy** (verdaderos y falsos lógicos).
### **Pregunta 6**

Aquí tienes el análisis detallado de la **Pregunta 6**. Esta pregunta es fantástica porque evalúa tu comprensión de un concepto vital en JavaScript: los valores **Truthy** y **Falsy** (verdaderos y falsos lógicos).


**Pregunta:** Después de ejecutar las siguientes instrucciones la variable vacío tiene el valor: `var cantidad = 0; vacio = !cantidad; cantidad = 2; vacio = !cantidad;`

- a. 2
    
- b. -2
    
- c. true
    
- **d. false**
    

**Respuesta correcta:** **d**


### **Explicación detallada (Paso a paso con Truthy y Falsy):**

El operador `!` (NOT lógico) sirve para negar una expresión. Si algo es verdadero, lo hace falso, y si es falso, lo hace verdadero. Además, **siempre** devuelve un valor booleano (`true` o `false`).

Vamos a ejecutar el código como si fuéramos el ordenador:

1. **`var cantidad = 0;`**
    
    - Guardamos el número `0` en la variable `cantidad`.
        
2. **`vacio = !cantidad;`**
    
    - Aquí evaluamos `!0`. En JavaScript, el número `0` se considera un valor **falso** (_falsy_).
        
    - Como estamos negando un valor falso (`!falso`), el resultado es verdadero. En este momento, la variable `vacio` vale **`true`**.
        
3. **`cantidad = 2;`**
    
    - Actualizamos el valor de `cantidad`. Ahora vale `2`.
        
4. **`vacio = !cantidad;`** (Esta es la línea final, la que cuenta)
    
    - Ahora evaluamos `!2`. En JavaScript, **cualquier número que no sea 0** (ya sea 2, 100 o -50) se considera un valor **verdadero** (_truthy_).
        
    - Como estamos negando un valor verdadero (`!verdadero`), el resultado final es falso. Por lo tanto, `vacio` pasa a valer **`false`**.
        

**Por qué las demás opciones son incorrectas:**

- **Opciones A (2) y B (-2):** Son totalmente imposibles. El operador `!` siempre, obligatoriamente, devuelve un booleano (`true` o `false`). Nunca te devolverá un número.
    
- **Opción C (true):** Es una trampa. `vacio` sí que valió `true` durante la segunda instrucción, pero la pregunta te pide el valor _después_ de ejecutar todas las instrucciones. Al final del código, su valor se sobrescribió a `false`.

---
Aquí tienes el análisis detallado de la **Pregunta 7**, repasando cómo funciona la toma de decisiones en tu código.

### **Pregunta 7**

**Pregunta:** La estructura if...else

- a. Se puede encadenar para realizar varias comprobaciones seguidas.
    
- b. No se puede encadenar para realizar varias comprobaciones seguidas.
    
- c. No existe esa estructura.
    
- d. No se puede utilizar con variables de texto.
    

**Respuesta correcta:** **a**


### **Explicación detallada (Encadenando condiciones):**

El condicional `if...else` es la herramienta básica para que tu programa tome decisiones lógicas.

- **Opción A (Verdadera):** Efectivamente, puedes enganchar tantas comprobaciones como necesites utilizando `else if`. Esto es fundamental cuando tienes más de dos caminos posibles para tu código.
    
    - _Ejemplo:_
        
        JavaScript
        
        ```javascript
        if (nota === 10) {
            console.log("Matrícula de honor");
        } else if (nota >= 5) {
            console.log("Aprobado");
        } else {
            console.log("Suspenso");
        }
        ```
        
- **Opción B (Falsa):** Afirma exactamente lo contrario a la realidad. Como acabamos de ver en el ejemplo, el encadenamiento no solo es posible, sino que es una práctica recomendada y de uso diario.
    
- **Opción C (Falsa):** ¡Claro que existe! Es probablemente la estructura de control más antigua y utilizada en todo JavaScript (y en casi cualquier otro lenguaje de programación del mundo).
    
- **Opción D (Falsa):** Es una afirmación incorrecta. Dentro de los paréntesis de un `if ( ... )` puedes evaluar absolutamente cualquier tipo de dato o expresión que devuelva `true` o `false`. Esto incluye, por supuesto, las variables de texto (Strings). Puedes hacer cosas como `if (usuario === "Admin")` sin ningún tipo de problema.

---
Aquí tienes el análisis detallado de la **Pregunta 8**. Esta es una pregunta teórica clásica para comprobar si tienes claros los conceptos básicos de lo que es (y cómo se usa) un bloque de código reutilizable.

### **Pregunta 8**

**Pregunta:** Una función en JavaScript:

- a. Es un conjunto de instrucciones que se agrupan para realizar una tarea concreta y que se pueden reutilizar fácilmente.
    
- b. Las funciones en JavaScript se definen mediante la palabra reservada function.
    
- c. El nombre de la función se utiliza para llamar a esa función cuando sea necesario.
    
- **d. Todas las anteriores son posibles.**
    

**Respuesta correcta:** **d**


### **Explicación detallada (Desgranando las funciones):**

En esta pregunta, la opción "d" es la correcta porque las afirmaciones A, B y C son definiciones y reglas perfectas de cómo funcionan las funciones en JavaScript. Vamos a verlas una por una:

- **Opción A (Verdadera):** Esta es la definición de manual. El propósito principal de una función es evitar que repitas el mismo código una y otra vez (un principio de programación conocido como DRY: _Don't Repeat Yourself_). Agrupas el código que calcula algo o hace una tarea, y simplemente lo usas cuando te hace falta.
    
- **Opción B (Verdadera):** Para enseñarle a JavaScript que estás creando una función tradicional, debes empezar con la palabra clave `function`.
    
    - _Ejemplo:_ `function saludar() { console.log("¡Hola!"); }`
        
    - _(Nota extra: Hoy en día también existen las "funciones flecha" que no usan esta palabra, pero la forma base y tradicional que se evalúa aquí sí la exige)._
        
- **Opción C (Verdadera):** Escribir la función (definirla) no hace que el código se ejecute. El navegador simplemente la guarda en su memoria. Para que realmente haga su trabajo, tienes que "llamarla" o "invocarla" usando su nombre seguido de paréntesis.
    
    - _Ejemplo:_ Escribir `saludar();` en tu código es lo que hace que el mensaje "¡Hola!" aparezca en la consola.
        

Al ser las tres primeras afirmaciones correctas, la única opción lógica es marcar la **d**.

---
Aquí tienes el análisis detallado de la **Pregunta 9**. Esta pregunta trata sobre los **eventos**, que son la forma en la que JavaScript se entera de lo que hace el usuario en la página (hacer clic, escribir, mover el ratón...).

### **Pregunta 9**

**Pregunta:** El evento onchange se produce cuando:

- a. El usuario selecciona un elemento.
    
- b. El usuario deselecciona un elemento.
    
- **c. El usuario cambia el valor de un elemento.**
    
- d. El usuario pincha con el ratón sobre un elemento.
    

**Respuesta correcta:** **c** _(Nota: Aunque en tu examen parece tener una 'X' roja al lado, técnicamente en JavaScript la respuesta correcta es la 'c')._


### **Explicación detallada (Detectando cambios):**

El evento `onchange` es uno de los más útiles cuando trabajas con formularios HTML. Sirve para detectar si el usuario ha modificado el contenido de un campo (`<input>`, `<textarea>` o `<select>`).

Vamos a ver por qué las demás opciones corresponden a otros eventos distintos:

- **Opción C (Verdadera):** Efectivamente, `onchange` se dispara cuando el valor de un elemento cambia.
    
    - _Ojo al detalle:_ En campos de texto, no se dispara con cada letra que escribes (para eso existe `oninput`), sino que se dispara cuando terminas de escribir y "sales" del campo pinchando fuera o pulsando Enter (lo que se conoce como perder el foco o _blur_), confirmando así que el valor definitivo ha cambiado. En los menús desplegables (`<select>`), sí se dispara en el momento exacto en el que eliges una opción nueva.
        
- **Opción A (Falsa):** Cuando el usuario "selecciona" (entra o hace clic dentro) de un campo para empezar a escribir, el evento que se dispara es `onfocus`. Si te refieres a seleccionar texto con el ratón (resaltarlo en azul), el evento es `onselect`.
    
- **Opción B (Falsa):** Cuando el usuario "deselecciona" o sale de un campo (por ejemplo, pasas al siguiente campo del formulario), el evento principal que se dispara es `onblur` (pérdida de foco).
    
- **Opción D (Falsa):** Cuando el usuario pincha con el ratón sobre cualquier cosa (un botón, una imagen, un texto...), el evento estrella que salta es `onclick`.

---
Aquí tienes el análisis detallado de la **Pregunta 10**, la última del test. Esta pregunta evalúa tu conocimiento sobre los métodos básicos para manipular elementos dentro de un array.

### **Pregunta 10**

**Pregunta:** La función `shift()`:

- a. Elimina el primer elemento del array.
    
- **b. Elimina el primer elemento del array y lo devuelve.**
    
- c. Elimina el último elemento del array y lo devuelve.
    
- d. Elimina el último elemento del array.
    

**Respuesta correcta:** **b**


### **Explicación detallada (Los 4 fantásticos de los Arrays):**

Para dominar los arrays en JavaScript, tienes que conocer de memoria los cuatro métodos principales que añaden o quitan elementos. Vamos a ver por qué la "b" es la opción más completa y exacta:

- **Opción B (Verdadera):** El método `shift()` hace dos cosas al mismo tiempo. Primero, va al principio de tu array y arranca el primer elemento (modificando la longitud del array original). Segundo, **te devuelve ese elemento** por si quieres guardarlo en una variable o usarlo para algo.
    
    - _Ejemplo:_ ```javascript let fila = ["Ana", "Juan", "Pedro"]; let atendido = fila.shift(); // Ahora 'fila' es ["Juan", "Pedro"] // Y la variable 'atendido' vale "Ana"
        
- **Opción A (Falsa/Incompleta):** Aunque es cierto que elimina el primer elemento, esta opción está incompleta. La clave de métodos como `shift()` o `pop()` es que no se limitan a borrar, sino que "extraen" el dato y te lo entregan. Por eso la opción B es la respuesta correcta y no la A.
    
- **Opciones C y D (Falsas):** Estas opciones describen lo que hace el método **`pop()`**. Si quieres sacar al _último_ elemento de la lista (el que está al final del array), usas `pop()`, el cual también lo elimina y te lo devuelve.
    

**Tu chuleta para memorizar (Los 4 métodos de Arrays):**

- Extraer el **primero**: `shift()`
    
- Añadir al **principio**: `unshift()`
    
- Extraer el **último**: `pop()`
    
- Añadir al **final**: `push()`