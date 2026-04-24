# Relación 04 de Ejercicios DML (JOINs, Conjuntos y Agregación)

## Introducción

Esta relación contiene ejercicios de DML orientados a `JOIN` (incluyendo `OUTER JOIN`), agregación y operaciones de conjuntos.

---

## Bloque 1. Tablas PROFESORES, PERSONAL y CENTROS

### Ejercicio 1

A partir de las tablas `PROFESORES` y `CENTROS`, realizar una consulta en la que aparezcan por cada centro y cada especialidad el número de profesores que hay.

Si el centro no tiene profesores, debe aparecer un 0 en la columna del número de profesores (`OUTER JOIN`).

### Ejercicio 2

A partir de las tablas `PERSONAL` y `CENTROS`, obtener por cada centro su código, nombre y número de empleados.

Si el centro carece de empleados, debe aparecer igualmente con valor 0 en el número de empleados (`OUTER JOIN`).

### Ejercicio 3

A partir de la tabla `PROFESORES`, obtener la especialidad con menos profesores.

### Ejercicio 4

A partir de la tabla `PERSONAL`, obtener por cada función el número de empleados.

---

## Bloque 2. Tablas ALUM, ANTIGUOS y NUEVOS

### Ejercicio 5

Visualizar los nombres de los alumnos de la tabla `ALUM` que aparezcan en alguna de estas tablas: `ANTIGUOS` y `NUEVOS`.

### Ejercicio 6

Realizar la consulta anterior de otras maneras.

### Ejercicio 7

Visualizar los nombres de los alumnos de la tabla `ALUM` que aparezcan en la tabla `ANTIGUOS` y en la tabla `NUEVOS`.

### Ejercicio 8

Realizar la consulta anterior de otras maneras.

### Ejercicio 9

Visualizar los nombres de los alumnos de la tabla `ALUM` que no estén en la tabla `ANTIGUOS` ni en la tabla `NUEVOS`.

---

## Indicaciones

1. No usar `SELECT *` salvo que se indique expresamente.
2. Emplear alias de tabla para mejorar legibilidad.
3. En los ejercicios 1 y 2, comprobar que aparecen centros sin correspondencias con valor 0.
4. En los ejercicios 6 y 8, resolver al menos dos alternativas distintas (por ejemplo: `IN`, `EXISTS`, `JOIN`, `UNION` o `INTERSECT`).
5. En el ejercicio 9, intentar una versión con `NOT IN` y otra con `NOT EXISTS`.
