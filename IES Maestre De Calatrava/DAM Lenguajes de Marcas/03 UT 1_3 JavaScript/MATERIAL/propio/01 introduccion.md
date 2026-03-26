## 1. Inclusión en el mismo documento (Script Interno)

Este método consiste en escribir las instrucciones directamente dentro del archivo HTML. Se utiliza habitualmente para añadir funciones específicas que solo se necesitan en esa página concreta.

Código transcrito :

HTML

```html
<html>
<head>
  <meta charset="utf-8"/>
  <title>Ejemplo de código JavaScript en el propio documento</title>
  <script type="text/javascript">
    alert("Un mensaje de prueba");
  </script>
</head>
<body>
  <p>Un párrafo de texto.</p>
</body>
</html>
```

### Explicación:

- **Etiqueta `<script>`**: Es el contenedor donde reside el código JavaScript.
    
- **Atributo `type`**: Se debe especificar `text/javascript` para que el documento sea válido.
    
- **`alert()`**: Esta función genera una ventana emergente (pop-up) que muestra el mensaje indicado entre comillas.
    

---

## 2. Inclusión en un archivo externo

Es la forma más eficiente de organizar el código, ya que permite separar la lógica de programación del diseño HTML. El archivo de JavaScript es un documento de texto plano con la extensión `.js`.

Código transcrito :

**Archivo: `codigo.js`**

JavaScript

```javascript
alert("Un mensaje de prueba");
```

**Archivo: `index.html`**

HTML

```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8"/>
  <title>Ejemplo de código JavaScript en el propio documento</title>
  <script type="text/javascript" src="/js/codigo.js"></script>
</head>
<body>
  <p>Un párrafo de texto.</p>
</body>
</html>
```

### Explicación:

- **Atributo `src`**: Indica la ruta o URL donde se encuentra el archivo externo.
    
- **Etiqueta de cierre**: Aunque el archivo sea externo, la etiqueta `<script>` siempre debe cerrarse con `</script>`.
    
- **Múltiples archivos**: Una sola página puede incluir tantas etiquetas `<script>` como sean necesarias para enlazar distintos archivos.
    

---

## 3. Inclusión en los elementos XHTML (Eventos)

Este método inserta el código directamente dentro de los atributos de las etiquetas HTML. Se desaconseja su uso general porque complica el mantenimiento del código, aunque es útil para manejar eventos rápidos.

Código transcrito :

HTML

```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8"/>
  <title>Ejemplo de código JavaScript en el propio documento</title>
</head>
<body>
  <p onclick="alert('Un mensaje de prueba')">Un párrafo de texto.</p>
</body>
</html>
```

### Explicación:

- **Evento `onclick`**: Indica que el código JavaScript se ejecutará únicamente cuando el usuario haga clic sobre ese párrafo específico.
    
- **Mezcla de comillas**: Observa que se usan comillas dobles para el atributo HTML y comillas simples para el texto dentro del `alert` para evitar conflictos de sintaxis.
    

---

Resumen de Sintaxis Básica

- **Case Sensitive**: JavaScript diferencia entre mayúsculas y minúsculas.
    
- **Espacios en blanco**: El intérprete ignora los espacios y líneas nuevas, permitiendo ordenar el código para que sea más legible mediante tabulaciones.
    
- **Variables**: No es necesario definir el tipo de dato (número, texto, etc.) al crear una variable.
    
- **Comentarios**: Se usa `//` para una sola línea y `/* ... */` para comentarios de bloque.