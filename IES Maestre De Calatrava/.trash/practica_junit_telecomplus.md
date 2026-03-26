# A3 – PRÁCTICA AVANZADA
## Testing automatizado con JUnit – TeleComPlus

**Asignatura:** Testing de Software  
**Práctica:** Testing automatizado con JUnit 5  
**Alumno:** __________________________  
**Profesor:** ________________________  
**Centro:** __________________________  
**Fecha:** 2026  

---

# Índice

1. Introducción  
2. Objetivo de la práctica  
3. Descripción del sistema TeleComPlus  
4. Reglas de cálculo de facturación  
5. Diseño de pruebas unitarias  
6. Implementación con JUnit 5  
7. Conclusión  

---

# 1. Introducción

Las pruebas unitarias permiten validar el comportamiento de componentes individuales del software de forma automática. 
En sistemas críticos de negocio, como los sistemas de facturación de una empresa telefónica, estas pruebas son 
fundamentales para garantizar que los cálculos y reglas de negocio funcionen correctamente.

En esta práctica se implementan pruebas unitarias utilizando **JUnit 5** para verificar el funcionamiento del sistema 
de facturación de la empresa ficticia **TeleComPlus**.

---

# 2. Objetivo de la práctica

El objetivo de esta práctica es diseñar e implementar pruebas unitarias que validen:

- La creación correcta de clientes.
- La gestión de errores al crear clientes.
- El cálculo correcto de facturación para distintos tipos de tarifa.
- El comportamiento del sistema ante consumos excesivos.
- La validación de excepciones.
- La comprobación de valores límite.

Las pruebas se implementan utilizando **JUnit 5** sin modificar el código de producción.

---

# 3. Descripción del sistema TeleComPlus

El sistema gestiona la facturación mensual de clientes de una empresa telefónica.  
La factura depende de:

- Tipo de tarifa contratada
- Consumo de minutos
- Consumo de datos móviles
- Penalizaciones por exceso de consumo

Tipos de tarifa:

- **BASICA**
- **ILIMITADA**

---

# 4. Reglas de cálculo de facturación

Las reglas de negocio del sistema son:

### Tarifa ILIMITADA

- Precio fijo mensual: **50 €**
- No se aplican cargos adicionales por consumo.

### Tarifa BASICA

- Cuota base mensual: **20 €**
- Incluye:
  - 100 minutos
  - 5 GB de datos

### Excesos

- Minutos extra: **0.15 € por minuto**
- Datos extra: **5 € por GB adicional**

---

# 5. Diseño de pruebas unitarias

Las pruebas diseñadas cubren los siguientes escenarios:

### Creación de cliente

- Creación correcta con datos válidos
- Error con DNI nulo
- Error con DNI vacío
- Error con tarifa nula

### Cálculo de facturación

- Tarifa ILIMITADA
- Tarifa BASICA sin excesos
- Exceso de minutos
- Exceso de datos
- Exceso combinado

### Excepciones

- Cliente nulo
- Consumos negativos

### Valores límite

- Consumo cero
- Consumo justo en el límite
- Consumo ligeramente superior al límite

---

# 6. Implementación con JUnit 5

```java
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class FacturacionServiceTest {

    private FacturacionService service;
    private Cliente clienteBasica;
    private Cliente clienteIlimitada;

    @BeforeEach
    void setUp() {
        service = new FacturacionService();
        clienteBasica = new Cliente("12345678A", TipoTarifa.BASICA);
        clienteIlimitada = new Cliente("87654321B", TipoTarifa.ILIMITADA);
    }

    @Test
    void crearClienteValido() {
        Cliente cliente = new Cliente("11111111C", TipoTarifa.BASICA);

        assertEquals("11111111C", cliente.getDNI());
        assertEquals(TipoTarifa.BASICA, cliente.getTarifa());
    }

    @Test
    void crearClienteConDniNull() {
        assertThrows(IllegalArgumentException.class, () -> {
            new Cliente(null, TipoTarifa.BASICA);
        });
    }

    @Test
    void crearClienteConTarifaNula() {
        assertThrows(IllegalArgumentException.class, () -> {
            new Cliente("22222222D", null);
        });
    }

    @Test
    void calcularFacturaTarifaIlimitada() {
        double total = service.calcularFactura(clienteIlimitada, 1000, 100);
        assertEquals(50.0, total);
    }

    @Test
    void calcularFacturaBasicaSinExcesos() {
        double total = service.calcularFactura(clienteBasica, 80, 3);
        assertEquals(20.0, total);
    }

    @Test
    void calcularFacturaExcesoMinutos() {
        double total = service.calcularFactura(clienteBasica, 120, 3);
        assertEquals(23.0, total);
    }

    @Test
    void calcularFacturaExcesoDatos() {
        double total = service.calcularFactura(clienteBasica, 90, 7);
        assertEquals(30.0, total);
    }

    @Test
    void calcularFacturaExcesoCombinado() {
        double total = service.calcularFactura(clienteBasica, 150, 8);
        assertEquals(42.5, total);
    }

    @Test
    void calcularFacturaClienteNulo() {
        assertThrows(IllegalArgumentException.class, () -> {
            service.calcularFactura(null, 10, 1);
        });
    }

    @Test
    void calcularFacturaConsumoNegativo() {
        assertThrows(IllegalArgumentException.class, () -> {
            service.calcularFactura(clienteBasica, -5, 1);
        });
    }

}
```

---

# 7. Conclusión

Las pruebas unitarias desarrolladas permiten validar el comportamiento del sistema de facturación de TeleComPlus 
en múltiples escenarios. Se han probado tanto los casos correctos de funcionamiento como los errores y valores 
límite, garantizando una alta cobertura del código.

El uso de **JUnit 5** facilita la automatización de estas pruebas y mejora la calidad del software al detectar 
posibles fallos en etapas tempranas del desarrollo.
