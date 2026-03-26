#### 1. Cambiar contenido con `innerHTML`

Este ejercicio muestra cómo acceder a un elemento por su `id` y modificar el texto que contiene al hacer clic en un botón.

HTML

```html
<!DOCTYPE html>
<html>
<body>
    <h2>JavaScript Básico</h2>
    <p id="demo">Este texto cambiará.</p>
    
    <button type="button" 
    onclick="document.getElementById('demo').innerHTML = '¡Bienvenido a Java Script!'">
    Haz clic aquí
    </button>
</body>
</html>
```

#### 2. Cambiar el atributo de una imagen (`src`)

Aquí se demuestra cómo JS puede interactuar con los atributos de las etiquetas HTML para crear efectos visuales, como encender una bombilla.

HTML

```html
<!DOCTYPE html>
<html>
<body>
    <h2>Interacción con Atributos</h2>
    <img id="myImage" onclick="changeImage()" src="pic_bulboff.gif" width="100" height="180">

    <script>
    function changeImage() {
        var image = document.getElementById('myImage');
        // Comprobamos el nombre del archivo actual para alternar
        if (image.src.match("bulbon")) {
            image.src = "pic_bulboff.gif";
        } else {
            image.src = "pic_bulbon.gif";
        }
    }
    </script>
</body>
</html>
```

#### 3. Cambiar estilos CSS con una función

En este caso, se modifican propiedades visuales como el tamaño de fuente y el color directamente desde el script.

HTML

```html
<!DOCTYPE html>
<html>
<body>
    <p id="demo">JavaScript puede cambiar el estilo de este texto.</p>

    <button type="button" onclick="myFunction()">Cambiar Estilo</button>

    <script>
    function myFunction() {
        var x = document.getElementById("demo");
        x.style.fontSize = "25px"; // Cambia el tamaño
        x.style.color = "red";      // Cambia el color a rojo
    }
    </script>
</body>
</html>
```

---

### Bloque 2: Variables y Operadores

Las variables se utilizan para almacenar datos y realizar cálculos matemáticos complejos.

#### 15. Operaciones Aritméticas Básicas

Muestra cómo declarar variables numéricas con `var` y mostrar el resultado de una suma y resta.

HTML

```html
<!DOCTYPE html>
<html>
<body>
    <h2>Cálculos con Variables</h2>
    <p id="suma"></p>
    <p id="resta"></p>

    <script>
    var numero1 = 10;
    var numero2 = 5;
    
    var suma = numero1 + numero2;
    var resta = numero1 - numero2;

    document.getElementById("suma").innerHTML = "La suma es: " + suma;
    document.getElementById("resta").innerHTML = "La resta es: " + resta;
    </script>
</body>
</html>
```

---

### Bloque 3: Estructuras de Control y Matrices

Las estructuras de control permiten que los programas tomen decisiones inteligentes y repitan instrucciones de forma eficiente.

#### 21. Manejo de Matrices (Arrays)

Muestra cómo almacenar una lista de datos (meses) y acceder a ellos mediante su índice numérico, recordando que las posiciones empiezan en 0.

HTML

```html
<!DOCTYPE html>
<html>
<body>
    <h2>Meses del Año</h2>
    <p id="todos"></p>
    <p id="junio"></p>

    <script>
    // Creamos la matriz de meses
    var meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", 
                 "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];

    // Mostramos todos los meses
    document.getElementById("todos").innerHTML = "Todos los meses: " + meses.toString();

    // Accedemos al mes de Junio (índice 5)
    document.getElementById("junio").innerHTML = "Mes seleccionado: " + meses[5];
    </script>
</body>
</html>
```

#### 34. Validación con `if/else` e `isNaN`

Este script utiliza estructuras de decisión para validar si el usuario ha introducido un número válido dentro de un rango específico (10 a 20).

HTML

```html
<!DOCTYPE html>
<html>
<body>
    <h2>Validación de Rango</h2>
    <input id="numb" placeholder="Introduce un número">
    <button type="button" onclick="validar()">Validar</button>
    <p id="demo"></p>

    <script>
    function validar() {
        var x, text;
        // Obtenemos el valor del input
        x = document.getElementById("numb").value;

        // Validamos si NO es número o si está fuera de rango
        if (isNaN(x) || x < 10 || x > 20) {
            text = "Entrada no válida";
        } else {
            text = "Entrada correcta";
        }
        document.getElementById("demo").innerHTML = text;
    }
    </script>
</body>
</html>
```

#### 35. Bucle `for`

Utiliza un bucle para repetir instrucciones y generar una lista de números de forma automática.

HTML

```html
<!DOCTYPE html>
<html>
<body>
    <h2>Bucle de Números</h2>
    <p id="demo"></p>

    <script>
    var i;
    var texto = "";
    // El bucle se ejecuta mientras i sea menor que 10
    for (i = 0; i < 10; i++) {
        texto += "El número es " + i + "<br>";
    }
    document.getElementById("demo").innerHTML = texto;
    </script>
</body>
</html>
```