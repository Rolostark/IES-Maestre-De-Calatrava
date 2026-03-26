### Ejercicio 1: Cambiar contenido de texto

Usa `innerHTML` para modificar el texto dentro de una etiqueta.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <p id="demo">Texto original.</p>
  <button type="button" onclick="document.getElementById('demo').innerHTML = 'Bienvenido a Java Script!'">Haz clic</button>
</body>
</html>
```

---

### Ejercicio 2: Cambiar imagen (Atributo src)

Modifica la fuente de una imagen al interactuar con ella.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <img id="myImage" onclick="changeImage()" src="pic_bulboff.gif" width="100" height="180">
  <script>
    function changeImage() {
      let img = document.getElementById('myImage');
      img.src = img.src.match("bulbon") ? "pic_bulboff.gif" : "pic_bulbon.gif";
    }
  </script>
</body>
</html>
```

---

### Ejercicio 3: Cambiar tamaño de fuente

Modifica el estilo CSS (`fontSize`) directamente desde el botón.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <p id="demo">¡Texto que cambia de tamaño!</p>
  <button type="button" onclick="document.getElementById('demo').style.fontSize='35px'">Cambiar tamaño</button>
</body>
</html>
```

---

### Ejercicio 4: Mostrar fecha y hora

Utiliza la función interna `Date()` de JavaScript.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <p id="fecha"></p>
  <button type="button" onclick="document.getElementById('fecha').innerHTML = Date()">Mostrar fecha y hora</button>
</body>
</html>
```

---

### Ejercicio 5: Fecha y hora con función declarada

Igual al anterior, pero encapsulando el código en una función llamada `primera()`.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <p id="fecha"></p>
  <button type="button" onclick="primera()">Mostrar fecha</button>
  <script>
    function primera() {
      document.getElementById('fecha').innerHTML = Date();
    }
  </script>
</body>
</html>
```

---

### Ejercicio 6: Cambiar múltiples estilos

Usa una función para cambiar color y tamaño de un elemento simultáneamente.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <p id="demo">Texto con estilo.</p>
  <button type="button" onclick="myFunction()">Aplicar estilos</button>
  <script>
    function myFunction() {
      var x = document.getElementById("demo");
      x.style.fontSize = "25px";
      x.style.color = "red";
    }
  </script>
</body>
</html>
```

---

### Ejercicio 7: Script externo

Muestra cómo enlazar un archivo `.js` independiente.

HTML

```html
<!DOCTYPE html>
<html>
<head>
  <script src="script.js"></script>
</head>
<body>
  <p id="demo">Referencia externa.</p>
  <button onclick="myFunction()">Ejecutar</button>
</body>
</html>
```

---

### Ejercicio 8: Cambiar enlace (Atributo href)

Modifica el destino de un hipervínculo dinámicamente.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <a id="miLink" href="https://www.google.com">Ir a Google</a><br><br>
  <button onclick="document.getElementById('miLink').href='http://www.iesmaestredecalatrava.es'">Cambiar destino</button>
</body>
</html>
```

---

### Ejercicio 9: Bombilla con dos botones

Controla el estado de una imagen usando botones dedicados de "On" y "Off".

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <img id="bulb" src="pic_bulboff.gif" width="100">
  <button type="button" onclick="document.getElementById('bulb').src='pic_bulbon.gif'">Light On</button>
  <button type="button" onclick="document.getElementById('bulb').src='pic_bulboff.gif'">Light Off</button>
</body>
</html>
```

---

### Ejercicio 10: Alerta aritmética

Muestra una ventana emergente con el resultado de una suma.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <script>
    alert(5 + 6);
  </script>
</body>
</html>
```

---

### Ejercicio 11: Alert con el contenido de un atributo

Extrae el valor `href` de un enlace y lo muestra en un alert.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <a id="mylink" href="https://www.google.com">Google</a>
  <script>
    alert(document.getElementById("mylink").href);
  </script>
</body>
</html>
```

---

### Ejercicio 12: document.write() simple

Escribe directamente en el flujo del documento.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <script>
    document.write(5 + 6);
  </script>
</body>
</html>
```

---

### Ejercicio 13: document.write() tras la carga

Demuestra que usar esta función tras la carga completa borra todo el contenido previo.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <p>Este párrafo desaparecerá al pulsar el botón.</p>
  <button type="button" onclick="document.write(5 + 6)">Inténtalo</button>
</body>
</html>
```

---

### Ejercicio 14: Salida de texto personalizada

Usa `document.write` para mostrar una frase específica.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <script>
    document.write("Mayo es el mes de la flores");
  </script>
</body>
</html>
```

---

### Ejercicio 15: Suma y resta de variables

Realiza operaciones matemáticas y las muestra en distintos párrafos.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <p id="suma"></p>
  <p id="resta"></p>
  <script>
    var x = 10.5;
    var y = 5;
    document.getElementById("suma").innerHTML = "Suma: " + (x + y);
    document.getElementById("resta").innerHTML = "Resta: " + (x - y);
  </script>
</body>
</html>
```

---

### Ejercicio 16: Literal numérico con decimales

Escribe un número fijo en un elemento con `id="demo"`.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <p id="demo"></p>
  <script>
    document.getElementById("demo").innerHTML = 10.50;
  </script>
</body>
</html>
```

---

### Ejercicio 17: Operadores de asignación

Muestra alertas de operaciones abreviadas como `+=`, `-=`, `*=`, `/=` y `%`.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <script>
    var x = 10; x += 5; alert("x += 5 es: " + x);
    var y = 10; y -= 5; alert("y -= 5 es: " + y);
    var z = 10; z *= 5; alert("z *= 5 es: " + z);
    var a = 10; a /= 5; alert("a /= 5 es: " + a);
    var b = 10; b %= 5; alert("b %= 5 es: " + b);
  </script>
</body>
</html>
```

---

### Ejercicio 18: Longitud de una cadena (length)

Calcula el número de caracteres de una frase.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <p id="contar"></p>
  <script>
    var texto = "En un lugar de la Mancha...";
    document.getElementById("contar").innerHTML = texto.length;
  </script>
</body>
</html>
```

---

### Ejercicio 19: Cambio de título de botón

Al pulsar el botón, el texto del mismo cambia por la fecha actual.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <button id="btn" onclick="this.innerHTML = Date()">¿qué hora y fecha es?</button>
</body>
</html>
```

---

### Ejercicio 20: Concatenación de strings

Une dos variables de texto con un espacio intermedio.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <p id="union"></p>
  <script>
    var txt1 = "Hola";
    var txt2 = "Mundo";
    document.getElementById("union").innerHTML = txt1 + " " + txt2;
  </script>
</body>
</html>
```

---

### Ejercicio 21: Matriz de meses

Muestra todos los elementos de un array y uno específico (Junio).

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <p id="todos"></p>
  <p id="junio"></p>
  <script>
    var meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
    document.getElementById("todos").innerHTML = meses;
    document.getElementById("junio").innerHTML = meses[5];
  </script>
</body>
</html>
```

---

### Ejercicio 22: Atributos de objeto (Coche)

Accede a una propiedad específica de un objeto.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <p id="modelo"></p>
  <script>
    var car = {type:"Fiat", model:"500", color:"white"};
    document.getElementById("modelo").innerHTML = car.model;
  </script>
</body>
</html>
```

---

### Ejercicio 23: Método de objeto

Añade una función interna al objeto para retornar su descripción completa.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <p id="carInfo"></p>
  <script>
    var car = {
      type:"Fiat", model:"500", color:"white",
      fullDesc: function() { return this.type + " " + this.model + " " + this.color; }
    };
    document.getElementById("carInfo").innerHTML = car.fullDesc();
  </script>
</body>
</html>
```

---

### Ejercicio 24: Crear objeto con `new Object()`

Otra forma de instanciar objetos en JavaScript.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <p id="demo"></p>
  <script>
    var car = new Object();
    car.type = "Fiat";
    document.getElementById("demo").innerHTML = car.type;
  </script>
</body>
</html>
```

---

### Ejercicio 25: Propiedades de objeto (Persona)

Muestra una frase combinando texto literal y valores del objeto.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <p id="demo"></p>
  <script>
    var person = {nombre:"Cristofer", edad:18};
    document.getElementById("demo").innerHTML = person.nombre + " tiene " + person.edad + " años";
  </script>
</body>
</html>
```

---

### Ejercicio 26: Comillas dentro de strings

Usa comillas simples para envolver un texto que contiene comillas dobles.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <p id="demo"></p>
  <script>
    document.getElementById("demo").innerHTML = 'Somos los "europeos" del sur';
  </script>
</body>
</html>
```

---

### Ejercicio 27: Posiciones en Arrays

Obtiene el valor de la cuarta posición (índice 3) de una lista.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <p id="dia"></p>
  <script>
    var dias = ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"];
    document.getElementById("dia").innerHTML = dias[3];
  </script>
</body>
</html>
```

---

### Ejercicio 28: Evaluación lógica (Booleana)

Evalúa una comparación AND (`&&`) y muestra el resultado (true/false).

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <p id="demo"></p>
  <script>
    var x = 5, y = 2;
    document.getElementById("demo").innerHTML = (x < 10 && y > 1);
  </script>
</body>
</html>
```

---

### Ejercicio 29: Validación de tipo de dato (isNaN)

Comprueba si el valor ingresado es numérico o no.

HTML

```html
<!DOCTYPE html>
<html>
<head>
  <script>
    function check() {
      var val = document.getElementById("numb").value;
      if (isNaN(val)) { alert("No es un número"); } 
      else { alert("Es un número"); }
    }
  </script>
</head>
<body>
  <input id="numb">
  <button onclick="check()">Validar</button>
</body>
</html>
```

---

### Ejercicio 30: Condicional simple (Hora)

Muestra un saludo si la hora es anterior a las 18:00.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <p id="demo"></p>
  <script>
    var hora = new Date().getHours();
    if (hora < 18) { document.getElementById("demo").innerHTML = "¡Buen día!"; }
  </script>
</body>
</html>
```

---

### Ejercicio 31: Condicional if-else

Saludo alternativo según la franja horaria.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <p id="demo"></p>
  <script>
    var hora = new Date().getHours();
    if (hora < 18) { document.getElementById("demo").innerHTML = "¡Buen día!"; } 
    else { document.getElementById("demo").innerHTML = "Buenas noches"; }
  </script>
</body>
</html>
```

---

### Ejercicio 32: Condicional anidado (Mañana/Tarde/Noche)

Divide el día en tres saludos distintos.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <p id="demo"></p>
  <script>
    var hora = new Date().getHours();
    if (hora < 13) { document.getElementById("demo").innerHTML = "¡Buen día!"; } 
    else if (hora < 18) { document.getElementById("demo").innerHTML = "Buenas tardes"; } 
    else { document.getElementById("demo").innerHTML = "Buenas noches"; }
  </script>
</body>
</html>
```

---

### Ejercicio 33: Bombilla con if-else

Controla el encendido/apagado verificando el nombre del archivo de imagen actual.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <img id="bulb" onclick="toggle()" src="pic_bulboff.gif">
  <script>
    function toggle() {
      let img = document.getElementById('bulb');
      if (img.src.match("bulbon")) { img.src = "pic_bulboff.gif"; } 
      else { img.src = "pic_bulbon.gif"; }
    }
  </script>
</body>
</html>
```

---

### Ejercicio 34: Rango numérico (10-20)

Valida si la entrada es un número y si se encuentra dentro de un intervalo específico.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <input id="numb">
  <button onclick="validate()">Validar</button>
  <p id="demo"></p>
  <script>
    function validate() {
      var x = document.getElementById("numb").value;
      if (isNaN(x) || x < 10 || x > 20) {
        document.getElementById("demo").innerHTML = "Input not valid";
      } else {
        document.getElementById("demo").innerHTML = "Input OK";
      }
    }
  </script>
</body>
</html>
```

---

### Ejercicio 35: Bucle for (Contar hasta 9)

Usa el operador `+=` para acumular resultados en una cadena.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <p id="demo"></p>
  <script>
    var i;
    for (i = 0; i < 10; i++) {
      document.getElementById("demo").innerHTML += i + "<br>";
    }
  </script>
</body>
</html>
```

---

### Ejercicio 36: Listar Array con for

Recorre una lista de marcas de coches y las imprime.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <p id="demo"></p>
  <script>
    var coches = ["BMW", "Volvo", "Saab", "Ford"];
    for (var i = 0; i < coches.length; i++) {
      document.getElementById("demo").innerHTML += coches[i] + "<br>";
    }
  </script>
</body>
</html>
```

---

### Ejercicio 37: Bucle for/in para objetos

Recorre todas las propiedades de un objeto persona.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <p id="demo"></p>
  <script>
    var person = {nombre:"Cristofer", apellido:"Veloz", edad:18};
    for (var x in person) {
      document.getElementById("demo").innerHTML += person[x] + " ";
    }
  </script>
</body>
</html>
```

---

### Ejercicio 38: Bucle for descendente

Cuenta desde 10 hasta 0.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <p id="demo"></p>
  <script>
    for (var i = 10; i >= 0; i--) {
      document.getElementById("demo").innerHTML += i + "<br>";
    }
  </script>
</body>
</html>
```

---

### Ejercicio 39: Números impares con for

Itera sumando de dos en dos para obtener solo números impares.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <p id="demo"></p>
  <script>
    for (var i = 1; i <= 9; i += 2) {
      document.getElementById("demo").innerHTML += i + "<br>";
    }
  </script>
</body>
</html>
```

---

### Ejercicio 40: Números impares con while

Repite el ejercicio anterior pero con una estructura de control distinta.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <p id="demo"></p>
  <script>
    var i = 1;
    while (i <= 9) {
      document.getElementById("demo").innerHTML += i + "<br>";
      i += 2;
    }
  </script>
</body>
</html>
```

---

### Ejercicio 41: Suma interactiva hasta introducir 0

Usa `while` y `prompt` para acumular valores hasta que el usuario decida parar.

HTML

```html
<!DOCTYPE html>
<html>
<body>
  <script>
    var suma = 0;
    var n = -1;
    while (n !== 0) {
      n = parseInt(prompt("Introduce un número (0 para finalizar):"));
      if (!isNaN(n)) suma += n;
    }
    alert("La suma total es: " + suma);
  </script>
</body>
</html>
```