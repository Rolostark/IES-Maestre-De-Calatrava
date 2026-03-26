/* ==========================================================================
   PARTE 1: CREACIÓN DEL USUARIO
   ========================================================================== */
BEGIN
   EXECUTE IMMEDIATE 'DROP USER empresa CASCADE';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/

CREATE USER empresa 
    IDENTIFIED BY empresa
    QUOTA 100M ON USERS;

GRANT CONNECT, RESOURCE TO empresa;
GRANT CREATE VIEW TO empresa;

/* ==========================================================================
   PARTE 2: DDL y DML
   ========================================================================== */
-- CONN empresa/empresa;

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE job_history CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE empleados CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE departamentos CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE ubicaciones CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

-- TABLAS

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
    comision_pct       DECIMAL(2,2) CHECK (comision_pct >= 0),
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
    fecha_fin          DATE,
    puesto_id          VARCHAR2(10) NOT NULL,
    departamento_id    INTEGER
);

-- INSERCIONES

INSERT INTO ubicaciones VALUES (2100, 'Madrid');
INSERT INTO ubicaciones VALUES (2200, 'Sevilla');
INSERT INTO ubicaciones VALUES (2300, 'Albacete');

INSERT INTO departamentos VALUES (100, 'Direccion', 2100);
INSERT INTO departamentos VALUES (200, 'Tecnologia', 2100);
INSERT INTO departamentos VALUES (300, 'Ventas', 2200);
INSERT INTO departamentos VALUES (400, 'Marketing', 2200);
INSERT INTO departamentos VALUES (500, 'Finanzas', 2300);
INSERT INTO departamentos VALUES (600, 'Recursos Humanos', 2100);
INSERT INTO departamentos VALUES (700, 'Legal', 2300);

-- Dirección (Depto 100)
INSERT INTO empleados VALUES (1, 'Juan Jose', 'Garcia', 'Martinez', 'JGARCIA', '+34600111222', TO_DATE('15/01/2010', 'DD/MM/YYYY'), 'AD_PRES', 25000.00, NULL, NULL, 100);
INSERT INTO empleados VALUES (2, 'Maria del Carmen', 'Lopez', 'Sanchez', 'MLOPEZ', '0034711222333', TO_DATE('20/05/2011', 'DD/MM/YYYY'), 'AD_VP', 18000.00, NULL, 1, 100);
INSERT INTO empleados VALUES (3, 'Francisco Javier', 'Rodriguez', 'Gonzalez', 'FRODRIGUEZ', '+34622333444', TO_DATE('10/11/2012', 'DD/MM/YYYY'), 'AD_VP', 17500.00, NULL, 1, 100);
INSERT INTO empleados VALUES (36, 'Julia', 'Valdes', 'Carrasco', 'JVALDES', '0034699888777', TO_DATE('15/09/2011', 'DD/MM/YYYY'), 'AD_ASST', 4400.00, NULL, 2, 100);

-- Tecnología (Depto 200)
INSERT INTO empleados VALUES (4, 'Ana Isabel', 'Perez', 'Martin', 'APEREZ', '+34700555666', TO_DATE('05/03/2013', 'DD/MM/YYYY'), 'IT_PROG', 9500.00, NULL, 2, 200);
INSERT INTO empleados VALUES (5, 'Carlos Alberto', 'Fernandez', 'Ruiz', 'CFERNANDEZ', '0034611000111', TO_DATE('12/07/2014', 'DD/MM/YYYY'), 'IT_PROG', 6200.00, NULL, 4, 200);
INSERT INTO empleados VALUES (6, 'Jose Luis', 'Gomez', 'Diaz', 'JGOMEZ', '+34622999888', TO_DATE('22/09/2015', 'DD/MM/YYYY'), 'IT_PROG', 5500.00, NULL, 4, 200);
INSERT INTO empleados VALUES (7, 'Laura', 'Diaz', 'Moreno', 'LDIAZ', '0034733777666', TO_DATE('18/01/2016', 'DD/MM/YYYY'), 'IT_PROG', 4800.00, NULL, 4, 200);
INSERT INTO empleados VALUES (8, 'Miguel Angel', 'Alvarez', 'Romero', 'MALVAREZ', '+34644555444', TO_DATE('30/06/2017', 'DD/MM/YYYY'), 'IT_SUPP', 4200.00, NULL, 4, 200);
INSERT INTO empleados VALUES (33, 'Natalia', 'Herrera', 'Marquez', 'NHERRERA', '0034655222111', TO_DATE('18/02/2020', 'DD/MM/YYYY'), 'IN_ENG', 9200.00, NULL, 4, 200);
INSERT INTO empleados VALUES (34, 'Diego', 'Marquez', 'Peinado', 'DMARQUEZ', '+34766333222', TO_DATE('22/10/2021', 'DD/MM/YYYY'), 'IN_ENG', 8800.00, NULL, 4, 200);
INSERT INTO empleados VALUES (38, 'Monica', 'Santos', 'Castillo', 'MSANTOS', '0034677444555', TO_DATE('05/04/2023', 'DD/MM/YYYY'), 'IT_PROG', 4500.00, NULL, 4, 200);

-- Ventas (Depto 300)
INSERT INTO empleados VALUES (9, 'Jose Manuel', 'Romero', 'Navarro', 'JROMERO', '+34688999000', TO_DATE('14/02/2012', 'DD/MM/YYYY'), 'SA_MAN', 14500.00, 0.40, 3, 300);
INSERT INTO empleados VALUES (10, 'Cristina', 'Torres', 'Jimenez', 'CTORRES', '0034799000111', TO_DATE('01/08/2013', 'DD/MM/YYYY'), 'SA_MAN', 13800.00, 0.35, 3, 300);
INSERT INTO empleados VALUES (11, 'Antonio Jesus', 'Vazquez', 'Serrano', 'AVAZQUEZ', '+34600222333', TO_DATE('19/12/2014', 'DD/MM/YYYY'), 'SA_REP', 8500.00, 0.25, 9, 300);
INSERT INTO empleados VALUES (12, 'Marta', 'Ramos', 'Gil', 'MRAMOS', '0034611333444', TO_DATE('25/04/2015', 'DD/MM/YYYY'), 'SA_REP', 8000.00, 0.20, 9, 300);
INSERT INTO empleados VALUES (13, 'Pedro', 'Gil', 'Molina', 'PGIL', '+34722444555', TO_DATE('09/09/2016', 'DD/MM/YYYY'), 'SA_REP', 7500.00, 0.15, 10, 300);
INSERT INTO empleados VALUES (14, 'Sofia', 'Serrano', 'Blanco', 'SSERRANO', '0034633555666', TO_DATE('11/03/2018', 'DD/MM/YYYY'), 'SA_REP', 7200.00, 0.15, 10, 300);
INSERT INTO empleados VALUES (15, 'Manuel', 'Molina', 'Castro', 'MMOLINA', '+34644666777', TO_DATE('29/11/2019', 'DD/MM/YYYY'), 'SA_REP', 6800.00, 0.10, 9, 300);
INSERT INTO empleados VALUES (39, 'Andres', 'Castillo', 'Vega', 'ACASTILLO', '0034755777888', TO_DATE('10/01/2024', 'DD/MM/YYYY'), 'SA_REP', 7300.00, 0.10, 10, 300);

-- Marketing (Depto 400)
INSERT INTO empleados VALUES (25, 'Beatriz', 'Cano', 'Mendez', 'BCANO', '+34666888999', TO_DATE('10/06/2013', 'DD/MM/YYYY'), 'MK_MAN', 13000.00, NULL, 3, 400);
INSERT INTO empleados VALUES (26, 'Alberto', 'Mendez', 'Cruz', 'AMENDEZ', '0034677999000', TO_DATE('20/01/2016', 'DD/MM/YYYY'), 'MK_REP', 6000.00, NULL, 25, 400);
INSERT INTO empleados VALUES (28, 'Victor', 'Calvo', 'Gallego', 'VCALVO', '+34688000111', TO_DATE('14/03/2017', 'DD/MM/YYYY'), 'CS_REP', 5000.00, NULL, 25, 400);
INSERT INTO empleados VALUES (29, 'Patricia', 'Gallego', 'Vidal', 'PGALLEGO', '0034799111222', TO_DATE('23/08/2018', 'DD/MM/YYYY'), 'CS_REP', 4800.00, NULL, 25, 400);
INSERT INTO empleados VALUES (40, 'Teresa', 'Vega', 'Cabrera', 'TVEGA', '+34600333444', TO_DATE('28/02/2024', 'DD/MM/YYYY'), 'MK_REP', 5800.00, NULL, 25, 400);

-- Finanzas (Depto 500)
INSERT INTO empleados VALUES (16, 'Isabel', 'Blanco', 'Ortega', 'IBLANCO', '0034611444555', TO_DATE('17/08/2011', 'DD/MM/YYYY'), 'FI_MGR', 12000.00, NULL, 1, 500);
INSERT INTO empleados VALUES (17, 'Fernando', 'Castro', 'Rubio', 'FCASTRO', '+34722555666', TO_DATE('03/12/2013', 'DD/MM/YYYY'), 'FI_ACCOUNT', 7800.00, NULL, 16, 500);
INSERT INTO empleados VALUES (18, 'Raquel', 'Rubio', 'Marin', 'RRUBIO', '0034633666777', TO_DATE('22/05/2015', 'DD/MM/YYYY'), 'FI_ACCOUNT', 7500.00, NULL, 16, 500);
INSERT INTO empleados VALUES (19, 'Luis Miguel', 'Marin', 'Sanz', 'LMARIN', '+34644777888', TO_DATE('14/10/2016', 'DD/MM/YYYY'), 'FI_ACCOUNT', 6900.00, NULL, 16, 500);
INSERT INTO empleados VALUES (20, 'Pablo', 'Sanz', 'Iglesias', 'PSANZ', '0034755888999', TO_DATE('01/02/2012', 'DD/MM/YYYY'), 'ST_MAN', 8200.00, NULL, 16, 500);
INSERT INTO empleados VALUES (21, 'Elena', 'Iglesias', 'Nunez', 'EIGLESIAS', '+34666999000', TO_DATE('19/07/2014', 'DD/MM/YYYY'), 'ST_CLERK', 3200.00, NULL, 20, 500);
INSERT INTO empleados VALUES (22, 'Javier', 'Nunez', 'Garrido', 'JNUNEZ', '0034677000111', TO_DATE('28/11/2015', 'DD/MM/YYYY'), 'ST_CLERK', 2900.00, NULL, 20, 500);
INSERT INTO empleados VALUES (23, 'Sonia', 'Garrido', 'Cortes', 'SGARRIDO', '+34788111222', TO_DATE('10/04/2017', 'DD/MM/YYYY'), 'ST_CLERK', 2800.00, NULL, 20, 500);
INSERT INTO empleados VALUES (24, 'Jorge', 'Cortes', 'Cano', 'JCORTES', '0034699222333', TO_DATE('15/09/2018', 'DD/MM/YYYY'), 'ST_CLERK', 2700.00, NULL, 20, 500);
INSERT INTO empleados VALUES (31, 'Silvia', 'Prieto', 'Leon', 'SPRIETO', '+34600444555', TO_DATE('12/12/2015', 'DD/MM/YYYY'), 'PU_MAN', 8500.00, NULL, 16, 500);
INSERT INTO empleados VALUES (32, 'Daniel', 'Leon', 'Herrera', 'DLEON', '0034711555666', TO_DATE('06/06/2019', 'DD/MM/YYYY'), 'PU_CLERK', 3000.00, NULL, 31, 500);
INSERT INTO empleados VALUES (37, 'Roberto', 'Carrasco', 'Santos', 'RCARRASCO', '+34622666777', TO_DATE('20/11/2022', 'DD/MM/YYYY'), 'ST_CLERK', 2600.00, NULL, 20, 500);

-- RRHH
INSERT INTO empleados VALUES (27, 'Rosa Maria', 'Cruz', 'Calvo', 'RCRUZ', '0034633777888', TO_DATE('05/11/2011', 'DD/MM/YYYY'), 'HR_REP', 6500.00, NULL, 2, 600);
-- Legal
INSERT INTO empleados VALUES (30, 'Ricardo', 'Vidal', 'Prieto', 'RVIDAL', '+34744888999', TO_DATE('30/09/2010', 'DD/MM/YYYY'), 'LG_ADV', 11000.00, NULL, 1, 700);

-- Empleado sin departamento (NULL) - Caso especial
INSERT INTO empleados VALUES (35, 'Clara', 'Peinado', 'Flores', 'CPEINADO', '0034655999000', TO_DATE('01/05/2022', 'DD/MM/YYYY'), 'SA_REP', 7100.00, 0.15, 9, NULL);
-- Historial de puestos
INSERT INTO job_history VALUES (36, TO_DATE('17/09/2005', 'DD/MM/YYYY'), TO_DATE('14/09/2011', 'DD/MM/YYYY'), 'AD_ASST', 100); 
INSERT INTO job_history VALUES (2, TO_DATE('21/09/2005', 'DD/MM/YYYY'), TO_DATE('19/05/2011', 'DD/MM/YYYY'), 'AC_ACCOUNT', 500);
INSERT INTO job_history VALUES (4, TO_DATE('13/01/2008', 'DD/MM/YYYY'), TO_DATE('04/03/2013', 'DD/MM/YYYY'), 'IT_PROG', 200);
INSERT INTO job_history VALUES (35, TO_DATE('24/03/2018', 'DD/MM/YYYY'), TO_DATE('30/04/2022', 'DD/MM/YYYY'), 'SA_REP', 300);
INSERT INTO job_history VALUES (3, TO_DATE('01/01/2008', 'DD/MM/YYYY'), TO_DATE('09/11/2012', 'DD/MM/YYYY'), 'MK_MAN', 400);

COMMIT;

PROMPT Carga de datos completada.
SELECT 'Empleados' as Tabla, Count(*) as Filas FROM empleados
UNION ALL
SELECT 'Departamentos', Count(*) FROM departamentos
UNION ALL
SELECT 'Ubicaciones', Count(*) FROM ubicaciones;