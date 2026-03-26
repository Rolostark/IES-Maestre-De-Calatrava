### 1. Operador de Asignación (`=`)

Este operador básico se utiliza para guardar un valor dentro de una variable. La operación siempre fluye de derecha a izquierda.

HTML

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Operador de Asignación</title>
</head>
<body>
    <h3>Abre la Consola (F12) para ver los resultados</h3>
    <script>
        // Transcripción del código
        var numero1 = 3; // Asigna el valor 3 a la variable numero1
        var numero2 = 4;

        console.log("numero1 inicial:", numero1); // Muestra 3

        // Las siguientes líneas están comentadas en el original, 
        // pero muestran cómo fluye la asignación:
        // numero1 = 5;       // Ahora numero1 vale 5
        // numero1 = numero2; // Ahora numero1 vale 4 (toma el valor de numero2)
        
        // Error común mencionado en el texto:
        // 5 = numero1; // Esto daría un error de sintaxis porque 5 es un valor fijo.
    </script>
</body>
</html>
```

---

### 2. Operadores de Incremento y Decremento (`++`, `--`)

Estos operadores añaden o restan una unidad al valor de una variable numérica. Su comportamiento cambia drásticamente dependiendo de si se colocan antes (prefijo) o después (sufijo) de la variable.

#### A. Ejemplo de Prefijo (`++numero`)

El valor se incrementa **antes** de realizar cualquier otra operación en la misma línea.

HTML

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Incremento: Prefijo</title>
</head>
<body>
    <h3>Abre la Consola (F12) para ver los resultados</h3>
    <script>
        // Transcripción del código
        var numero1 = 5;
        var numero2 = 2;
        
        // Explicación: numero1 se incrementa a 6, Y LUEGO se suma: 6 + 2
        var numero3 = ++numero1 + numero2; 
        
        console.log("numero3 (Prefijo ++n):", numero3); // Resultado: 8
        console.log("numero1 final:", numero1);         // Resultado: 6
    </script>
</body>
</html>
```

#### B. Ejemplo de Sufijo (`numero++`)

El valor se incrementa **después** de que se haya ejecutado la sentencia actual.

HTML

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Incremento: Sufijo</title>
</head>
<body>
    <h3>Abre la Consola (F12) para ver los resultados</h3>
    <script>
        // Transcripción del código
        var numero1 = 5;
        var numero2 = 2;
        
        // Explicación: Se usa el valor original (5) para la suma: 5 + 2 = 7.
        // DESPUÉS de guardar el 7 en numero3, numero1 sube a 6.
        var numero3 = numero1++ + numero2; 
        
        console.log("numero3 (Sufijo n++):", numero3); // Resultado: 7
        console.log("numero1 final:", numero1);         // Resultado: 6
    </script>
</body>
</html>
```

---

### 3. Operadores Lógicos (`!`, `&&`, `||`)

Estos operadores se utilizan para combinar múltiples condiciones y trabajan con valores booleanos (`true` o `false`).

HTML

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Operadores Lógicos</title>
</head>
<body>
    <h3>Abre la Consola (F12) y observa la Alerta</h3>
    <script>
        // --- Negación (!) ---
        // Invierte el valor lógico.
        var visible = true;
        alert("!visible es: " + (!visible)); // Muestra "false" en una ventana

        var cantidad = 0;
        var vacio = !cantidad; // true. Explicación: 0 se evalúa como false, su negación es true.
        console.log("vacio (!0):", vacio);

        // --- AND (&&) y OR (||) ---
        var valor1 = true;
        var valor2 = false;

        // AND (&&): El resultado es true solo si AMBOS son true.
        var resultadoAnd = valor1 && valor2; // false (porque valor2 es false)
        console.log("AND (true && false):", resultadoAnd);

        // OR (||): El resultado es true si AL MENOS UNO es true.
        var resultadoOr = valor1 || valor2; // true (porque valor1 es true)
        console.log("OR (true || false):", resultadoOr);
    </script>
</body>
</html>
```

---

### 4. Operadores Matemáticos (`+`, `-`, `*`, `/`, `%`)

Realizan cálculos aritméticos estándar. El operador **módulo** (`%`) es crucial para obtener el resto de una división entera.

HTML

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Operadores Matemáticos</title>
</head>
<body>
    <h3>Abre la Consola (F12) para ver los resultados</h3>
    <script>
        var numero1 = 10;
        var numero2 = 5;

        // Operaciones aritméticas básicas
        var suma = numero1 + 3;      // Resultado: 13
        var division = numero1 / 2;  // Resultado: 5

        // Operador Módulo (%)
        // Devuelve el RESTO de la división entera.
        var resto = 10 % 3; // Resultado: 1 (porque 10 dividido entre 3 es 3, y sobra 1)

        console.log("Suma (10 + 3):", suma);
        console.log("División (10 / 2):", division);
        console.log("Módulo (10 % 3):", resto);
    </script>
</body>
</html>
```

---

### 5. Operadores Relacionales (`==`, `!=`, `>=`, `<=`)

Comparan dos valores y devuelven un resultado booleano (`true` o `false`). El documento destaca la importancia de no confundir la asignación (`=`) con la comparación de igualdad (`==`).

HTML

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Operadores Relacionales</title>
</head>
<body>
    <h3>Abre la Consola (F12) para ver los resultados</h3>
    <script>
        // Comparación básica de números
        var n1 = 3;
        var n2 = 5;
        
        var esMayor = n1 > n2;        // false (3 no es mayor que 5)
        var esIgual = (n1 == 3);      // true (3 es igual a 3)
        var esDistinto = (n1 != n2);  // true (3 es distinto de 5)

        console.log("¿n1 > n2?", esMayor);
        console.log("¿n1 == 3?", esIgual);
        console.log("¿n1 != n2?", esDistinto);

        // --- Comparación accidental (Error común) ---
        var a = 5;
        
        // Uso correcto de '==' para comparar
        var b = (a == 3); // b es false (5 no es igual a 3).
        console.log("b (Uso de ==):", b);

        // Uso INCORRECTO de '=' dentro de una condición
        // Explicación: Se asigna el valor 3 a la variable 'a', Y LUEGO
        // la expresión completa se evalúa como 3 (que se considera true).
        var c = (a = 3);  // c es 3. ¡PELIGRO! Ahora 'a' también vale 3.
        console.log("c (Uso accidental de =):", c);
        console.log("Valor final de 'a':", a); // Muestra 3, no 5.
    </script>
</body>
</html>
```