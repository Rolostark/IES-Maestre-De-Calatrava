/* ==========================================================================
   PARTE 1: LIMPIEZA TOTAL (Para poder re-ejecutar el script)
   ========================================================================== */
-- Borramos las tablas en orden inverso a su jerarquía para evitar errores de FK
BEGIN EXECUTE IMMEDIATE 'DROP TABLE job_history CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE empleados CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE departamentos CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE ubicaciones CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

/* ==========================================================================
   PARTE 2: CREACIÓN DE TABLAS
   ========================================================================== */
CREATE TABLE ubicaciones (
    id      INTEGER PRIMARY KEY,
    ciudad  VARCHAR2(30)
);

CREATE TABLE departamentos (
    id              INTEGER PRIMARY KEY,
    nombre          VARCHAR2(30) NOT NULL,
    ubicacion_id    INTEGER,
    CONSTRAINT departamentos_fk_ubicaciones
        FOREIGN KEY (ubicacion_id) 
            REFERENCES ubicaciones(id)
);

CREATE TABLE empleados (
    id                 INTEGER PRIMARY KEY,
    nombre             VARCHAR2(50),
    apellido1          VARCHAR2(50) NOT NULL,
    apellido2          VARCHAR2(50) NOT NULL,
    email              VARCHAR2(150) NOT NULL UNIQUE,
    telefono           VARCHAR2(20),
    fecha_contratacion DATE NOT NULL,
    puesto_id          VARCHAR2(10) NOT NULL,
    salario            DECIMAL(8,2) CHECK (salario > 0),
    comision_pct       DECIMAL(4,2) CHECK (comision_pct >= 0),
    gerente_id         INTEGER,
    departamento_id    INTEGER,
    CONSTRAINT empleados_fk_departamentos
        FOREIGN KEY (departamento_id) 
            REFERENCES departamentos(id),
    CONSTRAINT empleados_fk_manager
        FOREIGN KEY (gerente_id) 
            REFERENCES empleados(id)
);

CREATE TABLE job_history (
    empleado_id        INTEGER,
    fecha_inicio       DATE,
    fecha_fin           DATE,
    puesto_id          VARCHAR2(10) NOT NULL,
    departamento_id    INTEGER
);

/* ==========================================================================
   PARTE 3: INSERCIÓN DE DATOS
   ========================================================================== */

-- 1. UBICACIONES
INSERT INTO ubicaciones VALUES (2100, 'Madrid');
INSERT INTO ubicaciones VALUES (2200, 'Sevilla');
INSERT INTO ubicaciones VALUES (2300, 'Albacete');

-- 2. DEPARTAMENTOS
INSERT INTO departamentos VALUES (100, 'Direccion', 2100);
INSERT INTO departamentos VALUES (200, 'Tecnologia', 2100);
INSERT INTO departamentos VALUES (300, 'Ventas', 2200);
INSERT INTO departamentos VALUES (400, 'Marketing', 2200);
INSERT INTO departamentos VALUES (500, 'Finanzas', 2300);
INSERT INTO departamentos VALUES (600, 'Recursos Humanos', 2100);
INSERT INTO departamentos VALUES (700, 'Legal', 2300);

-- 3. EMPLEADOS (Dirección)
INSERT INTO empleados VALUES (1, 'Juan Jose', 'Garcia', 'Martinez', 'JGARCIA', '+34600111222', TO_DATE('15/01/2010', 'DD/MM/YYYY'), 'AD_PRES', 25000.00, NULL, NULL, 100);
INSERT INTO empleados VALUES (2, 'Maria del Carmen', 'Lopez', 'Sanchez', 'MLOPEZ', '0034711222333', TO_DATE('20/05/2011', 'DD/MM/YYYY'), 'AD_VP', 18000.00, NULL, 1, 100);
INSERT INTO empleados VALUES (3, 'Francisco Javier', 'Rodriguez', 'Gonzalez', 'FRODRIGUEZ', '+34622333444', TO_DATE('10/11/2012', 'DD/MM/YYYY'), 'AD_VP', 17500.00, NULL, 1, 100);
INSERT INTO empleados VALUES (36, 'Julia', 'Valdes', 'Carrasco', 'JVALDES', '0034699888777', TO_DATE('15/09/2011', 'DD/MM/YYYY'), 'AD_ASST', 4400.00, NULL, 2, 100);

-- Tecnología
INSERT INTO empleados VALUES (4, 'Ana Isabel', 'Perez', 'Martin', 'APEREZ', '+34700555666', TO_DATE('05/03/2013', 'DD/MM/YYYY'), 'IT_PROG', 9500.00, NULL, 2, 200);
INSERT INTO empleados VALUES (5, 'Carlos Alberto', 'Fernandez', 'Ruiz', 'CFERNANDEZ', '0034611000111', TO_DATE('12/07/2014', 'DD/MM/YYYY'), 'IT_PROG', 6200.00, NULL, 4, 200);
INSERT INTO empleados VALUES (6, 'Jose Luis', 'Gomez', 'Diaz', 'JGOMEZ', '+34622999888', TO_DATE('22/09/2015', 'DD/MM/YYYY'), 'IT_PROG', 5500.00, NULL, 4, 200);

-- Ventas
INSERT INTO empleados VALUES (9, 'Jose Manuel', 'Romero', 'Navarro', 'JROMERO', '+34688999000', TO_DATE('14/02/2012', 'DD/MM/YYYY'), 'SA_MAN', 14500.00, 0.40, 3, 300);
INSERT INTO empleados VALUES (10, 'Cristina', 'Torres', 'Jimenez', 'CTORRES', '0034799000111', TO_DATE('01/08/2013', 'DD/MM/YYYY'), 'SA_MAN', 13800.00, 0.35, 3, 300);

-- Finanzas y otros
INSERT INTO empleados VALUES (16, 'Isabel', 'Blanco', 'Ortega', 'IBLANCO', '0034611444555', TO_DATE('17/08/2011', 'DD/MM/YYYY'), 'FI_MGR', 12000.00, NULL, 1, 500);
INSERT INTO empleados VALUES (31, 'Silvia', 'Prieto', 'Leon', 'SPRIETO', '+34600444555', TO_DATE('12/12/2015', 'DD/MM/YYYY'), 'PU_MAN', 8500.00, NULL, 16, 500);
INSERT INTO empleados VALUES (32, 'Daniel', 'Leon', 'Herrera', 'DLEON', '0034711555666', TO_DATE('06/06/2019', 'DD/MM/YYYY'), 'PU_CLERK', 3000.00, NULL, 31, 500);

-- 4. HISTORIAL
INSERT INTO job_history VALUES (36, TO_DATE('17/09/2005', 'DD/MM/YYYY'), TO_DATE('14/09/2011', 'DD/MM/YYYY'), 'AD_ASST', 100); 

-- GUARDAR CAMBIOS
COMMIT;

/* ==========================================================================
   PARTE 4: VERIFICACIÓN FINAL
   ========================================================================== */
SELECT 'Empleados' as Tabla, Count(*) as Total FROM empleados
UNION ALL
SELECT 'Departamentos', Count(*) FROM departamentos
UNION ALL
SELECT 'Ubicaciones', Count(*) FROM ubicaciones;


SELECT * FROM empleados