# Relación 02 de Ejercicios DML (Funciones, Agregación y Subconsultas)

## Introducción

Esta relación contiene ejercicios de DML orientados a funciones numéricas y de texto, fechas, agregación, formateo de salida y subconsultas (incluyendo correlacionadas).

---

## Bloque 1. Funciones numéricas (tabla DUAL)

### Ejercicio 1

¿Cuál sería la salida al ejecutar estas funciones?

- `ABS(146)`
- `ABS(-30)`
- `CEIL(2)`
- `CEIL(1.3)`
- `CEIL(-2.3)`
- `CEIL(-2)`
- `FLOOR(-2)`
- `FLOOR(-2.3)`
- `FLOOR(2)`
- `FLOOR(1.3)`
- `MOD(22,23)`
- `MOD(10,3)`
- `POWER(10,0)`
- `POWER(3,2)`
- `POWER(3,-1)`
- `ROUND(33.67)`
- `ROUND(-33.67,2)`
- `ROUND(-33.67,-2)`
- `ROUND(-33.27,1)`
- `ROUND(-33.27,-1)`
- `TRUNC(67.232)`
- `TRUNC(67.232,-2)`
- `TRUNC(67.232,2)`
- `TRUNC(67.58,1)`

---

## Bloque 2. Agregación y filtrado (EMPLE y LIBRERIA)

### Ejercicio 2

A partir de la tabla `EMPLE`, visualizar cuántos apellidos de empleados empiezan por la letra `A`.

### Ejercicio 3

Dada la tabla `EMPLE`, obtén el sueldo medio, el número de comisiones no nulas, el máximo sueldo y el mínimo sueldo de los empleados del departamento 30.

Emplear el formato adecuado para la salida de las cantidades numéricas.

### Ejercicio 4

Contar los temas de `LIBRERIA` cuyo `TEMA` tenga, por lo menos, una `a`.

### Ejercicio 5

Visualiza los temas con mayor número de ejemplares de la tabla `LIBRERIA` y que tengan, al menos, una `e` (puede ser un tema o varios).

### Ejercicio 6

Visualiza el número de estantes diferentes que hay en la tabla `LIBRERIA`.

### Ejercicio 7

Visualiza el número de estantes distintos que hay en la tabla `LIBRERIA` de aquellos temas que contienen, al menos, una `e`.

---

## Bloque 3. Funciones de texto y formateo

### Ejercicio 8

Dada la tabla `MISTEXTOS`, ¿qué sentencia `SELECT` se debe ejecutar para tener este resultado?

```text
RESULTADO
----------------------------------------
METODOLOGÍA DE LA PROGRAMACIÓN-^-^-^-^-^
INFORMÁTICA BÁSICA-^-^-^-^-^-^-^-^-^-^-^
SISTEMAS OPERATIVOS-^-^-^-^-^-^-^-^-^-^-
SISTEMAS DIGITALES-^-^-^-^-^-^-^-^-^-^-^
MANUAL DE C-^-^-^-^-^-^-^-^-^-^-^-^-^-^-
```

### Ejercicio 9

Visualiza los títulos de la tabla `MISTEXTOS` sin los caracteres punto y comillas, y en minúsculas, de dos maneras diferentes.

### Ejercicio 10

Dada la tabla `LIBROS`, escribe la sentencia `SELECT` que visualice dos columnas, una con el `AUTOR` y otra con el apellido del autor.

### Ejercicio 11

Escribe la sentencia `SELECT` que visualice dos columnas, una con el `AUTOR` y otra con el nombre del autor (sin el apellido) de la tabla `LIBROS`.

### Ejercicio 12

A partir de la tabla `LIBROS`, realiza una consulta que visualice en una columna, primero el nombre del autor y, luego, el apellido.

### Ejercicio 13

A partir de la tabla `LIBROS`, realiza una consulta en la que aparezcan los títulos ordenados por su número de caracteres.

### Ejercicio 14

Dada la tabla `LIBRERIA`, haz una consulta que visualice `TEMA`, el último carácter del tema que no sea blanco y el número de caracteres de `TEMA` (sin contar los blancos de la derecha), ordenados por tema.

### Ejercicio 15

Visualiza aquellos temas de la tabla `LIBRERIA` cuyos ejemplares sean 7 con el nombre de tema `SEVEN`; el resto de temas que no tengan 7 ejemplares se visualizará como están.

Ejemplo de salida:

```text
TEMA            EJEMPLARES CODIGO
--------------- ---------- ---------------
Informática             15 Informática
Economía                10 Economía
Deportes                 8 Deportes
Filosofía                7 SEVEN
Dibujo                  10 Dibujo
Biología                11 Biología
Geología                 7 SEVEN
```

---

## Bloque 4. Fechas y conversión de formato

### Ejercicio 16

A partir de la tabla `NACIMIENTOS`, realiza una consulta que obtenga las columnas `NOMBRE`, `FECHANAC`, `FECHA_FORMATEADA`, donde `FECHA_FORMATEADA` tenga el formato: `Nació el 12 de mayo de 1982`.

### Ejercicio 17

A partir de la tabla `NACIMIENTOS`, realiza una consulta que muestre `NOMBRE` seguido de su fecha de nacimiento formateada (quita los blancos de `NOMBRE`).

### Ejercicio 18

Convierte la cadena `01072012` a fecha y visualiza el nombre del mes en mayúsculas (utiliza la tabla `DUAL`).

---

## Bloque 5. Subconsultas y correlacionadas (EMPLE)

### Ejercicio 19

A partir de la tabla `EMPLE`, obtener el apellido de los empleados que lleven más de 15 años trabajando.

### Ejercicio 20

Selecciona el apellido de los empleados que llevan más de 18 años trabajando en el departamento `VENTAS`.

### Ejercicio 21

Visualiza `APELLIDO`, `SALARIO` y `DEPT_NO` de los empleados cuyo salario sea el mayor de su departamento.

Pista: revisa las consultas correlacionadas.

### Ejercicio 22

Visualiza `APELLIDO`, `SALARIO` y `DEPT_NO` de los empleados cuyo salario supere a la media de su departamento.

Pista: revisa las consultas correlacionadas.

---

## Indicaciones

1. No usar `SELECT *` salvo que se indique expresamente.
2. Nombrar alias de tabla para mejorar legibilidad.
3. Cuando proceda, mostrar títulos de columna con alias (`AS`).
4. En ejercicios de texto y fecha, justificar brevemente qué funciones SQL has utilizado.
5. En ejercicios 21 y 22, resolver al menos una versión con subconsulta correlacionada.
