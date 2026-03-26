# A4 – AUTOMATIZACIÓN DE PRUEBAS FUNCIONALES CON SELENIUM

[cite_start]**Objetivo:** Aprender a automatizar pruebas de UI para aplicaciones web[cite: 3].

## Contenidos
1. [cite_start]Introducción a Selenium WebDriver[cite: 5].
2. [cite_start]Localización de elementos (Xpath, CSS Selectors)[cite: 5].
3. [cite_start]Creación de scripts de prueba con Java+Selenium[cite: 5].
4. [cite_start]Patrones de diseño en automatización (Page Object Model)[cite: 5].
5. [cite_start]Integración con frameworks de testing (JUnit, TestNG)[cite: 5].
6. [cite_start]Práctica: Suite de pruebas automatizadas para un sistema web de login y CRUD[cite: 5].

---

## 1. Introducción a Selenium WebDriver
[cite_start]Selenium es un conjunto de herramientas ampliamente utilizado para la automatización de pruebas en aplicaciones web[cite: 8]. [cite_start]Su objetivo principal es permitir la grabación, configuración, ejecución y verificación de pruebas que aseguren que una aplicación web se comporta exactamente como se espera desde el punto de vista del usuario[cite: 9].

[cite_start]La versión 2 de Selenium introduce la integración de WebDriver[cite: 11, 12]. [cite_start]WebDriver aporta controladores nativos para los principales navegadores web, como Internet Explorer, Firefox y Chrome, permitiendo interactuar con ellos de forma más directa y fiable[cite: 13]. [cite_start]Otra característica destacada de Selenium 2 es su soporte para pruebas en dispositivos móviles, concretamente en plataformas como iPhone y Android[cite: 16].

[cite_start]**Requisitos para trabajar con Selenium:** Java, Maven, Junit, Selenium 2.0 [cite: 21-25].

### Configuración del proyecto Maven (pom.xml)
[cite_start]Añadimos la dependencia del `selenium-server` y actualizamos la versión de `JUnit`[cite: 30, 32]:

```xml
<dependency>
    <groupId>org.seleniumhq.selenium</groupId>
    <artifactId>selenium-server</artifactId>
    <version>2.0b2</version>
    <scope>test</scope>
</dependency>
<dependency>
    <groupId>junit</groupId>
    <artifactId>junit</artifactId>
    <version>4.8.2</version>
    <scope>test</scope>
</dependency>
```

---

## 2. Localización de elementos (Xpath, CSS Selectors)
[cite_start]Selenium necesita identificar de forma precisa cada elemento del DOM[cite: 203]. 

### 2.1. XPath
[cite_start]XPath (XML Path Language) es un lenguaje de consultas diseñado para navegar a través de la estructura de documentos XML y HTML[cite: 209].
* [cite_start]**XPath absoluto:** define la ruta completa desde la raíz del documento hasta el elemento[cite: 213].
* [cite_start]**XPath relativo:** comienza desde cualquier nodo del documento y es más robusto y flexible[cite: 216, 217].
* [cite_start]*Ejemplo por atributo:* `//input[@id='username']`[cite: 220].

### 2.2. CSS Selectors
[cite_start]Los CSS Selectors se basan en los mismos selectores utilizados en las hojas de estilo CSS[cite: 229]. [cite_start]Son más rápidos que XPath y más fáciles de leer[cite: 231].
* [cite_start]*Localizar por id:* `#username`[cite: 235].
* [cite_start]*Localizar por clase:* `.error`[cite: 238].

---

## 3. Creación de scripts de prueba con Java+Selenium
[cite_start]Un script de prueba con Java y Selenium suele seguir una estructura común[cite: 257]:
1. [cite_start]Configuración del entorno de pruebas[cite: 258].
2. [cite_start]Inicialización del navegador[cite: 259].
3. [cite_start]Navegación a la aplicación bajo prueba[cite: 260].
4. [cite_start]Localización de elementos e interacción con ellos[cite: 261].
5. [cite_start]Verificación de resultados esperados[cite: 262].
6. [cite_start]Cierre del navegador y liberación de recursos[cite: 263].

---

## 4. Patrones de diseño en automatización (Page Object Model)
[cite_start]El Page Object Model (POM) es un patrón de diseño que propone una separación clara entre la lógica de las pruebas y la lógica de interacción con la interfaz de usuario [cite: 308-311]. [cite_start]Cada página o pantalla de la aplicación web se representa mediante una clase Java, denominada Page Object[cite: 312].

Aporta ventajas como:
* [cite_start]Centralización de los localizadores[cite: 316].
* [cite_start]Reutilización de código[cite: 317].
* [cite_start]Mejor legibilidad de los tests[cite: 317].
* [cite_start]Menor coste de mantenimiento ante cambios en la aplicación[cite: 318].

---

## 5. Integración con frameworks de testing (JUnit, TestNG)
[cite_start]Selenium se integra con frameworks de testing para gestionar la ejecución de pruebas, las aserciones y la generación de informes[cite: 348].

* [cite_start]**JUnit:** Utiliza anotaciones para marcar métodos como casos de prueba, ejecutar código antes (`@Before`) y después (`@After`) de cada test, y usar aserciones para validar resultados[cite: 360, 361].
* [cite_start]**TestNG:** Framework más avanzado que ofrece configuración flexible mediante ficheros XML, agrupación de tests, control de dependencias y ejecución paralela [cite: 368-374].
* **Mocha:** Framework muy utilizado en el ecosistema JavaScript. [cite_start]Utiliza bloques `describe`, `it`, y hooks como `before`, `after` [cite: 382, 386-388].

---

## 6. Práctica: Suite de pruebas automatizadas para CRUD (Solución)
[cite_start]**Objetivo:** Desarrollar una suite de pruebas automatizadas end-to-end utilizando Selenium WebDriver con JavaScript (Node.js) para validar el funcionamiento de un sistema web (CRUD)[cite: 395, 396].

### Archivos de la Aplicación Web Proporcionada

[cite_start]**citas.html** [cite: 442-481]
```html
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>App de Citas - Gestión de Participantes</title>
<link rel="stylesheet" href="citas.css">
</head>
<body>
<h1>Gestión de participantes</h1>
<form id="formParticipante">
<input type="hidden" id="index">
<label for="nombre">Nombre</label>
<input type="text" id="nombre" required>
<label for="edad">Edad</label>
<input type="number" id="edad" required>
<label for="ciudad">Ciudad</label>
<input type="text" id="ciudad" required>
<label for="intereses">Intereses</label>
<input type="text" id="intereses" required>
<button type="submit" id="btnGuardar">Guardar</button>
</form>
<h2>Listado de Participantes</h2>
<table id="tablaParticipantes">
<thead>
<tr>
<th>Nombre</th>
<th>Edad</th>
<th>Ciudad</th>
<th>Intereses</th>
<th>Acciones</th>
</tr>
</thead>
<tbody>
</tbody>
</table>
<script src="citas.js"></script>
</body>
</html>
```

[cite_start]**citas.css** [cite: 482-523]
```css
body { font-family: Arial, sans-serif; margin: 40px; background-color: #fafafa; }
h1, h2 { color: #333; }
form { margin-bottom: 30px; max-width: 400px; }
label { display: block; margin-top: 10px; }
input { width: 100%; padding: 6px; box-sizing: border-box; }
button { margin-top: 15px; padding: 8px 15px; cursor: pointer; }
table { width: 100%; border-collapse: collapse; }
th, td { border: 1px solid #ccc; padding: 8px; text-align: center; }
th { background-color: #eaeaea; }
button { margin: 2px; }
```

[cite_start]**citas.js** [cite: 524-579]
```javascript
let participantes = [];
const form = document.getElementById("formParticipante");
const tablaBody = document.querySelector("#tablaParticipantes tbody");

fetch("participantes.json")
    .then(response => response.json())
    .then(data => {
        participantes = data;
        renderTabla();
    });

form.addEventListener("submit", function (event) {
    event.preventDefault();
    const index = document.getElementById("index").value;
    const participante = {
        nombre: document.getElementById("nombre").value,
        edad: document.getElementById("edad").value,
        ciudad: document.getElementById("ciudad").value,
        intereses: document.getElementById("intereses").value
    };

    if (index === "") { participantes.push(participante); } 
    else { participantes[index] = participante; }
    
    form.reset();
    document.getElementById("index").value = "";
    renderTabla();
});

function renderTabla() {
    tablaBody.innerHTML = "";
    participantes.forEach((p, i) => {
        const fila = document.createElement("tr");
        fila.innerHTML = `
        <td>${p.nombre}</td>
        <td>${p.edad}</td>
        <td>${p.ciudad}</td>
        <td>${p.intereses}</td>
        <td>
            <button class="btnEditar" onclick="editar(${i})">Editar</button>
            <button class="btnEliminar" onclick="eliminar(${i})">Eliminar</button>
        </td>`;
        tablaBody.appendChild(fila);
    });
}

function editar(index) {
    const p = participantes[index];
    document.getElementById("nombre").value = p.nombre;
    document.getElementById("edad").value = p.edad;
    document.getElementById("ciudad").value = p.ciudad;
    document.getElementById("intereses").value = p.intereses;
    document.getElementById("index").value = index;
}

function eliminar(index) {
    participantes.splice(index, 1);
    renderTabla();
}
```

[cite_start]**participantes.json** [cite: 580-594]
```json
[
    {
        "nombre": "Laura",
        "edad": 29,
        "ciudad": "Madrid",
        "intereses": "viajes, cine"
    },
    {
        "nombre": "Carlos",
        "edad": 34,
        "ciudad": "Barcelona",
        "intereses": "deporte, música"
    }
]
```

### Automatización de Pruebas (Node.js)

**package.json**
```json
{
  "name": "automatizacion-citas",
  "version": "1.0.0",
  "scripts": {
    "test": "mocha test/**/*.js --timeout 15000"
  },
  "dependencies": {
    "chai": "^4.4.1",
    "mocha": "^10.2.0",
    "selenium-webdriver": "^4.18.1"
  }
}
```

**CitasPage.js (Page Object Model)** [cite: 426]
```javascript
const { By } = require('selenium-webdriver');

class CitasPage {
    constructor(driver) {
        this.driver = driver;
        this.nombreInput = By.id('nombre');
        this.edadInput = By.id('edad');
        this.ciudadInput = By.id('ciudad');
        this.interesesInput = By.id('intereses');
        this.btnGuardar = By.id('btnGuardar');
        this.tablaFilas = By.css('#tablaParticipantes tbody tr');
    }

    async abrir() {
        const url = 'file://' + __dirname + '/citas.html'; 
        await this.driver.get(url);
    }

    async rellenarFormulario(nombre, edad, ciudad, intereses) {
        await this.driver.findElement(this.nombreInput).clear();
        await this.driver.findElement(this.nombreInput).sendKeys(nombre);
        await this.driver.findElement(this.edadInput).clear();
        await this.driver.findElement(this.edadInput).sendKeys(edad);
        await this.driver.findElement(this.ciudadInput).clear();
        await this.driver.findElement(this.ciudadInput).sendKeys(ciudad);
        await this.driver.findElement(this.interesesInput).clear();
        await this.driver.findElement(this.interesesInput).sendKeys(intereses);
    }

    async guardar() {
        await this.driver.findElement(this.btnGuardar).click();
    }

    async obtenerNumeroParticipantes() {
        const filas = await this.driver.findElements(this.tablaFilas);
        return filas.length;
    }

    async obtenerDatosFila(indice) {
        const filas = await this.driver.findElements(this.tablaFilas);
        const celdas = await filas[indice].findElements(By.tagName('td'));
        return {
            nombre: await celdas[0].getText(),
            edad: await celdas[1].getText(),
            ciudad: await celdas[2].getText(),
            intereses: await celdas[3].getText()
        };
    }

    async hacerClicEditar(indice) {
        const filas = await this.driver.findElements(this.tablaFilas);
        const btnEditar = await filas[indice].findElement(By.className('btnEditar'));
        await btnEditar.click();
    }

    async hacerClicEliminar(indice) {
        const filas = await this.driver.findElements(this.tablaFilas);
        const btnEliminar = await filas[indice].findElement(By.className('btnEliminar'));
        await btnEliminar.click();
    }
}

module.exports = CitasPage;
```

[cite_start]**test/citas.test.js (Suite de Pruebas)** [cite: 430-436]
```javascript
const { Builder } = require('selenium-webdriver');
const chai = require('chai');
const expect = chai.expect;
const CitasPage = require('../CitasPage'); 

describe('Suite de Pruebas CRUD - App de Citas', function() {
    let driver;
    let paginaCitas;

    before(async function() {
        driver = await new Builder().forBrowser('chrome').build();
        paginaCitas = new CitasPage(driver);
        await paginaCitas.abrir();
        await driver.sleep(1000); 
    });

    after(async function() {
        if (driver) {
            await driver.quit();
        }
    });

    it('1. Visualización inicial del listado de participantes', async function() {
        const cantidad = await paginaCitas.obtenerNumeroParticipantes();
        expect(cantidad).to.equal(2); 
    });

    it('2. Creación y verificación de un nuevo participante', async function() {
        await paginaCitas.rellenarFormulario('Ana', '25', 'Valencia', 'Pintura');
        await paginaCitas.guardar();

        const cantidad = await paginaCitas.obtenerNumeroParticipantes();
        expect(cantidad).to.equal(3);

        const datosNuevo = await paginaCitas.obtenerDatosFila(2); 
        expect(datosNuevo.nombre).to.equal('Ana');
    });

    it('3. Edición de un participante existente', async function() {
        await paginaCitas.hacerClicEditar(2); 
        await paginaCitas.rellenarFormulario('Ana', '26', 'Valencia', 'Pintura, Lectura');
        await paginaCitas.guardar();

        const datosEditados = await paginaCitas.obtenerDatosFila(2);
        expect(datosEditados.edad).to.equal('26');
    });

    it('4. Eliminación de un participante', async function() {
        const cantidadAntes = await paginaCitas.obtenerNumeroParticipantes();
        await paginaCitas.hacerClicEliminar(2); 

        const cantidadDespues = await paginaCitas.obtenerNumeroParticipantes();
        expect(cantidadDespues).to.equal(cantidadAntes - 1);
    });
});
```