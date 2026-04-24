# Relación de Ejercicios DML (Consultas SELECT)

## Introducción

Esta relación contiene ejercicios de DML centrados en consultas `SELECT` con condiciones, operadores lógicos, subconsultas y filtrado por rangos.

---

## Bloque 1. Tablas EMPLE y DEPART

### Ejercicio 1

Seleccionar de la tabla `EMPLE` aquellas filas cuyo `APELLIDO` empiece por `A` y el `OFICIO` tenga una `E` en cualquier posición.

### Ejercicio 2

Seleccionar `APELLIDO`, `OFICIO` y `LOCALIDAD` de los empleados que son `ANALISTAS`.

### Ejercicio 3

Mostrar los empleados (`APELLIDO`, `OFICIO`, `SALARIO` y `FECHA_ALT`) que desempeñen el mismo oficio que `JIMENEZ` o que tengan un salario mayor o igual que `FERNANDEZ`.

### Ejercicio 4

Mostrar en pantalla `APELLIDO`, `OFICIO` y `SALARIO` de los empleados del departamento de `FERNANDEZ` que tengan su mismo salario.

### Ejercicio 5

Mostrar `APELLIDO` y `OFICIO` de los empleados que tienen el mismo trabajo que `JIMENEZ`.

---

## Bloque 2. Tabla LIBRERIA

### Ejercicio 6

Visualizar `TEMA`, `ESTANTE` y `EJEMPLARES` de las filas de `LIBRERIA` con ejemplares comprendidos entre 8 y 15.

### Ejercicio 7

Visualizar `TEMA`, `ESTANTE` y `EJEMPLARES` de las filas cuyo `ESTANTE` no esté comprendido entre `B` y `D`.

### Ejercicio 8

Visualizar, con una única orden `SELECT` (subconsulta), todos los temas de `LIBRERIA` cuyo número de ejemplares sea inferior a los que hay en `Medicina`.

### Ejercicio 9

Visualizar los temas de `LIBRERIA` cuyo número de ejemplares no esté entre 15 y 20, ambos incluidos.

---

## Bloque 3. Tablas ALUMNOS, ASIGNATURAS y NOTAS

### Ejercicio 10

Visualizar todas las asignaturas que contengan tres letras `o` en su nombre y tengan alumnos matriculados en `Madrid`.

### Ejercicio 11

Visualizar los nombres de los alumnos que tengan una nota entre 7 y 8 en la asignatura `FOL`.

### Ejercicio 12

Mostrar los nombres de los alumnos de Madrid que tengan alguna asignatura suspendida.

### Ejercicio 13

Mostrar los nombres de las asignaturas que no tengan suspensos.

### Ejercicio 14

Mostrar los nombres de los alumnos que tengan la misma nota que tiene `Diaz Fernandez, Maria` en `FOL` en alguna asignatura.

---

## Indicaciones

1. No usar `SELECT *` salvo que se indique expresamente.
2. Nombrar alias de tabla para mejorar legibilidad.
3. Ordenar resultados cuando tenga sentido didáctico (`ORDER BY`).
4. Probar al menos una alternativa con subconsulta en los ejercicios donde aplique.
