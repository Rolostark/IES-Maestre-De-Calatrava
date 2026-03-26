/* ============================================================
   DMLS_EJ05 - Consultas sobre Titanic (parte 3/4)
   Tabla: TITANIC
   ============================================================ */


/* 1. Edad promedio de pasajeros de primera clase */
SELECT AVG(EDAD) AS EDAD_PROMEDIO_PRIMERA
FROM TITANIC
WHERE CLASE = 1;


/* 2. Total recaudado de pasajeros de Southampton que no sobrevivieron */
SELECT SUM(TARIFA) AS TOTAL_RECAUDADO
FROM TITANIC
WHERE CIUDAD_EMBARQUE = 'Southampton'
  AND SUPERVIVIENTE = 0;


/* 3. Tarifa máxima de pasajero que viajaba solo */
SELECT MAX(TARIFA) AS TARIFA_MAXIMA_SOLO
FROM TITANIC
WHERE VIAJA_SOLO = 'Si';


/* 4. Diferencia de edad entre el hombre más viejo y la mujer más joven */
SELECT 
    MAX(CASE WHEN GENERO = 'male' THEN EDAD END) -
    MIN(CASE WHEN GENERO = 'female' THEN EDAD END)
    AS DIFERENCIA_EDAD
FROM TITANIC;


/* 5. Total pasajeros con cabina informada y embarcaron en Cherbourg */
SELECT COUNT(*) AS TOTAL_PASAJEROS
FROM TITANIC
WHERE CUBIERTA IS NOT NULL
  AND CIUDAD_EMBARQUE = 'Cherbourg';


/* 6. Promedio de familiares de pasajeros menores de edad */
SELECT AVG(HERMANOS_CONYUGES + PADRES_HIJOS) AS PROMEDIO_FAMILIARES
FROM TITANIC
WHERE EDAD < 18;


/* 7. Porcentaje de supervivencia */
SELECT AVG(SUPERVIVIENTE) * 100 AS PORCENTAJE_SUPERVIVENCIA
FROM TITANIC;


/* 8. Tarifa media pagada por pasajeros cuyo tipo_persona contiene 'Mrs.' */
SELECT AVG(TARIFA) AS TARIFA_MEDIA_MRS
FROM TITANIC
WHERE TIPO_PERSONA LIKE '%Mrs.%';


/* 9. Suma de edades de todos los sobrevivientes */
SELECT SUM(EDAD) AS SUMA_EDADES_SUPERVIVIENTES
FROM TITANIC
WHERE SUPERVIVIENTE = 1;


/* 10. Pasajeros en tercera clase y >40 años o tarifa >50 */
SELECT COUNT(*) AS TOTAL_PASAJEROS
FROM TITANIC
WHERE CLASE = 3
  AND (EDAD > 40 OR TARIFA > 50);


/* 11. Número total de pasajeros por clase */
SELECT CLASE, COUNT(*) AS TOTAL_PASAJEROS
FROM TITANIC
GROUP BY CLASE
ORDER BY CLASE;


/* 12. Edad promedio por género */
SELECT GENERO, AVG(EDAD) AS EDAD_PROMEDIO
FROM TITANIC
GROUP BY GENERO;


/* 13. Precio medio de tarifa por ciudad de embarque */
SELECT CIUDAD_EMBARQUE, AVG(TARIFA) AS TARIFA_MEDIA
FROM TITANIC
GROUP BY CIUDAD_EMBARQUE;


/* 14. Total sobrevivientes y no sobrevivientes */
SELECT SUPERVIVIENTE, COUNT(*) AS TOTAL
FROM TITANIC
GROUP BY SUPERVIVIENTE;


/* 15. Tarifa máxima y mínima por clase */
SELECT CLASE,
       MAX(TARIFA) AS TARIFA_MAXIMA,
       MIN(TARIFA) AS TARIFA_MINIMA
FROM TITANIC
GROUP BY CLASE
ORDER BY CLASE;


/* 16. Número de pasajeros por clase y género */
SELECT CLASE, GENERO, COUNT(*) AS TOTAL_PASAJEROS
FROM TITANIC
GROUP BY CLASE, GENERO
ORDER BY CLASE, GENERO;


/* 17. Clases con edad promedio superior a 30 */
SELECT CLASE, AVG(EDAD) AS EDAD_PROMEDIO
FROM TITANIC
GROUP BY CLASE
HAVING AVG(EDAD) > 30;


/* 18. Ciudades de embarque con más de 100 pasajeros */
SELECT CIUDAD_EMBARQUE, COUNT(*) AS TOTAL_PASAJEROS
FROM TITANIC
GROUP BY CIUDAD_EMBARQUE
HAVING COUNT(*) > 100;


/* 19. Tarifa promedio por clase mayor a 50 */
SELECT CLASE, AVG(TARIFA) AS TARIFA_MEDIA
FROM TITANIC
GROUP BY CLASE
HAVING AVG(TARIFA) > 50;


/* 20. Número de pasajeros por cubierta (sin nulos) */
SELECT CUBIERTA, COUNT(*) AS TOTAL_PASAJEROS
FROM TITANIC
WHERE CUBIERTA IS NOT NULL
GROUP BY CUBIERTA
ORDER BY TOTAL_PASAJEROS DESC;