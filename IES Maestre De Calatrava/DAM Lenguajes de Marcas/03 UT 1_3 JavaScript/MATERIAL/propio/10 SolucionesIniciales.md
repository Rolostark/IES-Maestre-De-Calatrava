## Ejercicio 1: Script Externo y Comentarios

Este ejercicio requiere organizar el código para que el JavaScript se ejecute desde un archivo independiente y añadir etiquetas de seguridad para navegadores antiguos.

### Archivo: `codigo.js`

JavaScript

```bash
// Este script muestra dos mensajes en la consola del navegador
// Primer mensaje de saludo
console.log("Hola Mundo!");

// Segundo mensaje informativo 
console.log("Soy el primer script");
```

### Archivo: `index.html`

HTML

```html
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>El primer script</title>
    <script type="text/javascript" src="codigo.js"></script>
</head>
<body>
    <p>Esta página contiene el primer script</p>
    
    <noscript>
        <p>Aviso: Su navegador no tiene activado JavaScript o no soporta scripts. 
        Algunas funciones de la página pueden no estar disponibles.</p>
    </noscript>
</body>
</html>
```

---

## Ejercicio 2: Mensajes Complejos con Variables

Para este ejercicio, se debe almacenar una cadena de texto que incluya saltos de línea y distintos tipos de comillas dentro de una variable.

### Archivo: `codigo.js`

JavaScript

```javascript
// Almacenamiento del texto en una variable llamada 'mensaje' [cite: 110]
// Se utiliza \n para representar los saltos de línea vistos en la imagen [cite: 111, 115, 116]
var mensaje = "Hola Mundo!\nQué facil es incluir 'comillas simples'\ny \"comillas dobles\"";

// Se muestra el contenido de la variable mediante una alerta [cite: 111, 117]
alert(mensaje);
```

---

## Ejercicio 3: Arrays y `document.write()`

En este apartado se crea una estructura de datos para los meses y se imprime directamente en el cuerpo del documento.

### Archivo HTML completo

HTML

```html
<!DOCTYPE html>
<html>
<body>
    <script type="text/javascript">
        // Creación del array con los doce meses [cite: 119]
        var meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", 
                     "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];

        // Mostrar los nombres en la página [cite: 120]
        document.write("<h1>Meses del año:</h1>");
        document.write(meses.join(", ")); 
    </script>
</body>
</html>
```

---

## Ejercicio 4: Manejo de Arrays Mixtos

A partir de un array con diferentes tipos de datos (booleanos, números y cadenas), se solicita mostrar la información.

### Código JavaScript

JavaScript

```javascript
// Array proporcionado con tipos de datos mixtos [cite: 122, 123]
var valores = [true, 5, false, "hola", "adios", 2];

// Mostrar el contenido del array utilizando document.write() [cite: 124]
document.write("<p>El contenido del array es: " + valores.toString() + "</p>");
```