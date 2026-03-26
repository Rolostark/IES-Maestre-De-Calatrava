
# A4 – Automatización de Pruebas

## Objetivo
Introducir los conceptos fundamentales de automatización de pruebas, herramientas y buenas prácticas.

---

## 1. ¿Qué es la automatización de pruebas?

La automatización consiste en ejecutar pruebas mediante herramientas y scripts, sin intervención manual, para validar el comportamiento de una aplicación.

### Ventajas
- Ejecución rápida y repetible
- Reducción de errores humanos
- Integración con CI/CD
- Mayor cobertura

### Desventajas
- Coste inicial de implementación
- Mantenimiento de scripts
- No sustituye completamente al testing manual

---

## 2. Tipos de pruebas automatizables

- Pruebas unitarias
- Pruebas de integración
- Pruebas funcionales
- Pruebas end-to-end
- Pruebas de regresión

---

## 3. Herramientas comunes

- Selenium
- Cypress
- Playwright
- JUnit / TestNG
- Mocha / Jest

---

## 4. Selenium (conceptos básicos)

Selenium permite automatizar navegadores web.

Componentes:
- WebDriver
- Localizadores (id, name, css, xpath)
- Acciones (click, sendKeys, getText)

Ejemplo básico:

```javascript
driver.findElement(By.id("login")).click();
```

---

## 5. Buenas prácticas

- Usar Page Object Model (POM)
- Separar lógica de prueba y lógica de página
- Evitar esperas fijas (usar waits explícitos)
- Mantener pruebas independientes

---

## 6. Integración Continua

La automatización debe integrarse en pipelines CI/CD para ejecutar pruebas en cada commit.

---

# Conclusión

La automatización mejora eficiencia, calidad y velocidad de validación del software cuando se aplica correctamente.
