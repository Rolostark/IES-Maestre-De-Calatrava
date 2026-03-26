# A1 – PRÁCTICA AVANZADA

## Diseño Integral de Casos de Prueba – Sistema Hospitalario

  

Documento explicado con diseño detallado de casos de prueba manuales basados en los requisitos **RF-01 a RF-13** del módulo de acceso y gestión de pacientes.

  

---

  

## 1. Autenticación

  

Estos casos verifican la correcta validación de credenciales, bloqueo por intentos fallidos y protección de información sensible.

  

| ID | Requisito | Descripción | Precondiciones | Pasos | Resultado Esperado |

|----|-----------|-------------|---------------|------|-------------------|

| CP-01 | RF-01 | Login con credenciales válidas | Usuario activo registrado | Acceder al login → introducir usuario y contraseña válidos → pulsar entrar | Acceso correcto al sistema |

| CP-02 | RF-01 | Login con contraseña incorrecta | Usuario registrado | Introducir contraseña incorrecta | Mensaje de error genérico |

| CP-03 | RF-02 | Bloqueo tras 5 intentos fallidos | Usuario activo | Repetir login incorrecto 5 veces | Usuario bloqueado temporalmente |

| CP-04 | RF-03 | Mensaje sin revelar información sensible | Usuario inexistente | Intentar login con usuario inválido | Mensaje genérico sin revelar detalles |

  

---

  

## 2. Control de acceso por roles

  

Se valida la correcta segregación de funciones entre perfiles (administrativo, médico y enfermería).

  

| ID | Requisito | Descripción | Precondiciones | Pasos | Resultado Esperado |

|----|-----------|-------------|---------------|------|-------------------|

| CP-05 | RF-04 / RF-05 | Administrativo intenta ver historial clínico | Login administrativo activo | Intentar acceder al historial clínico detallado | Acceso denegado |

| CP-06 | RF-06 | Médico accede historial asignado | Login médico activo | Consultar historial de paciente asignado | Historial visible correctamente |

| CP-07 | RF-04 | Acceso directo vía URL restringida | Usuario autenticado sin permisos | Introducir URL directa al historial | Sistema bloquea acceso |

  

---

  

## 3. Gestión de citas

  

Se validan reglas de negocio relacionadas con creación de citas médicas y restricciones temporales.

  

| ID | Requisito | Descripción | Precondiciones | Pasos | Resultado Esperado |

|----|-----------|-------------|---------------|------|-------------------|

| CP-08 | RF-09 | Crear cita válida | Administrativo autenticado | Crear cita en fecha futura con profesional disponible | Cita registrada correctamente |

| CP-09 | RF-10 | Crear cita en fecha pasada | Usuario autenticado | Intentar crear cita en fecha anterior a hoy | Error de validación |

| CP-10 | RF-09 | Crear cita con profesional ocupado | Usuario autenticado | Seleccionar profesional no disponible | Sistema rechaza la cita |

  

---

  

## 4. Gestión de sesión

  

Se valida la seguridad de sesión, cierre manual y expiración automática por inactividad.

  

| ID | Requisito | Descripción | Precondiciones | Pasos | Resultado Esperado |

|----|-----------|-------------|---------------|------|-------------------|

| CP-11 | RF-11 | Cierre manual de sesión | Usuario autenticado | Pulsar botón cerrar sesión | Redirige a pantalla login |

| CP-12 | RF-12 | Expiración automática | Usuario autenticado | Mantener inactividad hasta tiempo límite | Sesión expirada automáticamente |

| CP-13 | RF-13 | Uso botón atrás tras logout | Sesión cerrada | Pulsar botón atrás del navegador | No permite acceso a información |

  

---

  

## 5. Flujo completo

  

Casos que validan secuencias completas de uso realista del sistema.

  

| ID | Requisito | Descripción | Resultado Esperado |

|----|-----------|-------------|-------------------|

| CP-14 | RF-01 a RF-11 | Login → Buscar paciente → Crear cita → Logout | Flujo completo ejecutado sin errores |

| CP-15 | RF-01 a RF-06 | Login administrativo → Intentar ver historial clínico | Acceso correctamente bloqueado |