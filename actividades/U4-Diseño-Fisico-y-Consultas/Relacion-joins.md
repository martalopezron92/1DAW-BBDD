# Ejercicios de JOIN y cardinalidad en Oracle SQL

## Contexto

Vamos a trabajar con un pequeño modelo académico formado por cuatro tablas:

```text
PROFESOR 1 ─────── N ASIGNATURA

ALUMNO   N ─────── M ASIGNATURA
           mediante MATRICULA
```

La relación entre `ALUMNO` y `ASIGNATURA` es N:M, por lo que necesita una tabla intermedia llamada `MATRICULA`.

La relación entre `PROFESOR` y `ASIGNATURA` es 1:N, porque un profesor puede impartir varias asignaturas, pero cada asignatura está impartida por un único profesor.

---

# 1. Script de creación de tablas

```sql
DROP TABLE matricula CASCADE CONSTRAINTS;
DROP TABLE asignatura CASCADE CONSTRAINTS;
DROP TABLE alumno CASCADE CONSTRAINTS;
DROP TABLE profesor CASCADE CONSTRAINTS;

CREATE TABLE profesor (
    id_profesor NUMBER GENERATED ALWAYS AS IDENTITY,
    nombre      VARCHAR2(50) NOT NULL,
    apellidos   VARCHAR2(80) NOT NULL,
    email       VARCHAR2(100) NOT NULL,
    departamento VARCHAR2(50) NOT NULL,

    CONSTRAINT pro_id_pk PRIMARY KEY (id_profesor),
    CONSTRAINT pro_email_uq UNIQUE (email),
    CONSTRAINT pro_email_ck CHECK (email LIKE '%@%')
);

CREATE TABLE alumno (
    id_alumno NUMBER GENERATED ALWAYS AS IDENTITY,
    nombre    VARCHAR2(50) NOT NULL,
    apellidos VARCHAR2(80) NOT NULL,
    dni       VARCHAR2(9) NOT NULL,
    email     VARCHAR2(100),
    fecha_nacimiento DATE,
    curso     VARCHAR2(20) DEFAULT '1DAW' NOT NULL,

    CONSTRAINT alu_id_pk PRIMARY KEY (id_alumno),
    CONSTRAINT alu_dni_uq UNIQUE (dni),
    CONSTRAINT alu_email_uq UNIQUE (email),
    CONSTRAINT alu_email_ck CHECK (email IS NULL OR email LIKE '%@%'),
    CONSTRAINT alu_curso_ck CHECK (curso IN ('1DAW', '2DAW'))
);

CREATE TABLE asignatura (
    id_asignatura NUMBER GENERATED ALWAYS AS IDENTITY,
    nombre        VARCHAR2(80) NOT NULL,
    horas_semanales NUMBER(2) NOT NULL,
    curso         VARCHAR2(20) NOT NULL,
    id_profesor   NUMBER NOT NULL,

    CONSTRAINT asi_id_pk PRIMARY KEY (id_asignatura),
    CONSTRAINT asi_nombre_uq UNIQUE (nombre),
    CONSTRAINT asi_horas_ck CHECK (horas_semanales BETWEEN 1 AND 10),
    CONSTRAINT asi_curso_ck CHECK (curso IN ('1DAW', '2DAW')),
    CONSTRAINT asi_pro_fk FOREIGN KEY (id_profesor)
        REFERENCES profesor(id_profesor)
);

CREATE TABLE matricula (
    id_alumno     NUMBER,
    id_asignatura NUMBER,
    fecha_matricula DATE DEFAULT SYSDATE NOT NULL,
    nota NUMBER(4,2),

    CONSTRAINT mat_pk PRIMARY KEY (id_alumno, id_asignatura),

    CONSTRAINT mat_alu_fk FOREIGN KEY (id_alumno)
        REFERENCES alumno(id_alumno)
        ON DELETE CASCADE,

    CONSTRAINT mat_asi_fk FOREIGN KEY (id_asignatura)
        REFERENCES asignatura(id_asignatura)
        ON DELETE CASCADE,

    CONSTRAINT mat_nota_ck CHECK (nota IS NULL OR nota BETWEEN 0 AND 10)
);
```

---

# 2. Script de inserción de datos

> Importante: este conjunto de datos está diseñado para que haya alumnos sin matrícula, asignaturas sin alumnos y profesores sin asignaturas. Así se pueden practicar correctamente `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN` y los efectos de la cardinalidad.

## 2.1. Profesores

```sql
INSERT INTO profesor (nombre, apellidos, email, departamento)
VALUES ('Ana', 'García López', 'ana.garcia@centro.es', 'Informática');

INSERT INTO profesor (nombre, apellidos, email, departamento)
VALUES ('Luis', 'Martínez Ruiz', 'luis.martinez@centro.es', 'Informática');

INSERT INTO profesor (nombre, apellidos, email, departamento)
VALUES ('Sofía', 'Navarro Torres', 'sofia.navarro@centro.es', 'Informática');

INSERT INTO profesor (nombre, apellidos, email, departamento)
VALUES ('Pedro', 'Sánchez Molina', 'pedro.sanchez@centro.es', 'Informática');
```

## 2.2. Alumnos

```sql
INSERT INTO alumno (nombre, apellidos, dni, email, fecha_nacimiento, curso)
VALUES ('Carlos', 'Pérez Sánchez', '11111111A', 'carlos.perez@alumno.es', DATE '2006-03-15', '1DAW');

INSERT INTO alumno (nombre, apellidos, dni, email, fecha_nacimiento, curso)
VALUES ('María', 'López Fernández', '22222222B', 'maria.lopez@alumno.es', DATE '2005-11-22', '1DAW');

INSERT INTO alumno (nombre, apellidos, dni, email, fecha_nacimiento, curso)
VALUES ('Elena', 'Romero Díaz', '33333333C', 'elena.romero@alumno.es', DATE '2006-07-08', '1DAW');

INSERT INTO alumno (nombre, apellidos, dni, email, fecha_nacimiento, curso)
VALUES ('Javier', 'Moreno Ruiz', '44444444D', 'javier.moreno@alumno.es', DATE '2005-05-30', '1DAW');

INSERT INTO alumno (nombre, apellidos, dni, email, fecha_nacimiento, curso)
VALUES ('Lucía', 'Castro Vidal', '55555555E', 'lucia.castro@alumno.es', DATE '2006-01-19', '1DAW');

INSERT INTO alumno (nombre, apellidos, dni, email, fecha_nacimiento, curso)
VALUES ('Andrés', 'Jiménez Ortega', '66666666F', 'andres.jimenez@alumno.es', DATE '2004-09-10', '2DAW');
```

## 2.3. Asignaturas

```sql
INSERT INTO asignatura (nombre, horas_semanales, curso, id_profesor)
VALUES ('Bases de Datos', 6, '1DAW', 1);

INSERT INTO asignatura (nombre, horas_semanales, curso, id_profesor)
VALUES ('Programación', 8, '1DAW', 1);

INSERT INTO asignatura (nombre, horas_semanales, curso, id_profesor)
VALUES ('Lenguajes de Marcas', 4, '1DAW', 2);

INSERT INTO asignatura (nombre, horas_semanales, curso, id_profesor)
VALUES ('Entornos de Desarrollo', 3, '1DAW', 2);

INSERT INTO asignatura (nombre, horas_semanales, curso, id_profesor)
VALUES ('Despliegue de Aplicaciones Web', 5, '2DAW', 3);

INSERT INTO asignatura (nombre, horas_semanales, curso, id_profesor)
VALUES ('Diseño de Interfaces Web', 6, '2DAW', 3);
```

## 2.4. Matrículas

```sql
INSERT INTO matricula (id_alumno, id_asignatura, fecha_matricula, nota)
VALUES (1, 1, DATE '2025-09-15', 8.50);

INSERT INTO matricula (id_alumno, id_asignatura, fecha_matricula, nota)
VALUES (1, 2, DATE '2025-09-15', 7.00);

INSERT INTO matricula (id_alumno, id_asignatura, fecha_matricula, nota)
VALUES (2, 1, DATE '2025-09-15', 6.75);

INSERT INTO matricula (id_alumno, id_asignatura, fecha_matricula, nota)
VALUES (2, 3, DATE '2025-09-16', 9.00);

INSERT INTO matricula (id_alumno, id_asignatura, fecha_matricula, nota)
VALUES (3, 2, DATE '2025-09-16', 5.50);

INSERT INTO matricula (id_alumno, id_asignatura, fecha_matricula, nota)
VALUES (3, 4, DATE '2025-09-17', NULL);

INSERT INTO matricula (id_alumno, id_asignatura, fecha_matricula, nota)
VALUES (5, 1, DATE '2025-09-17', 4.25);

INSERT INTO matricula (id_alumno, id_asignatura, fecha_matricula, nota)
VALUES (5, 2, DATE '2025-09-17', 6.00);

INSERT INTO matricula (id_alumno, id_asignatura, fecha_matricula, nota)
VALUES (6, 5, DATE '2025-09-18', 7.80);

COMMIT;
```

---

# 3. Situaciones especiales del conjunto de datos

Antes de hacer los ejercicios, observa estas situaciones:

```text
Carlos cursa 2 asignaturas.
María cursa 2 asignaturas.
Elena cursa 2 asignaturas.
Lucía cursa 2 asignaturas.
Andrés cursa 1 asignatura de 2DAW.
Javier no está matriculado en ninguna asignatura.

Ana imparte 2 asignaturas.
Luis imparte 2 asignaturas.
Sofía imparte 2 asignaturas.
Pedro no imparte ninguna asignatura.

Diseño de Interfaces Web no tiene alumnos matriculados.
```

Estas situaciones permiten comprobar cómo se comportan los distintos tipos de JOIN.

---

# 4. Ejercicios

## Bloque 1. INNER JOIN

### Ejercicio 1. Alumnos y asignaturas que cursan

Visualiza el nombre y apellidos de cada alumno junto con el nombre de las asignaturas que cursa.

Deben aparecer únicamente los alumnos que estén matriculados en alguna asignatura.

Columnas sugeridas:

```text
alumno | asignatura
```

Preguntas:

1. ¿Aparece Javier?
2. ¿Por qué no aparece?
3. ¿Cuántas filas aparecen?

---

### Ejercicio 2. Alumnos matriculados, permitiendo repetición

Visualiza únicamente el nombre de los alumnos que están matriculados en alguna asignatura.

No utilices `DISTINCT`.

Preguntas:

1. ¿Qué alumnos aparecen repetidos?
2. ¿Por qué aparecen repetidos?
3. ¿Es un error de la consulta o una consecuencia de la cardinalidad?

---

### Ejercicio 3. Alumnos matriculados sin repetición

Obtén el nombre y apellidos de los alumnos que estén matriculados en alguna asignatura, sin que aparezcan repetidos.

Pregunta:

1. ¿Qué diferencia hay entre esta consulta y la anterior?

---

## Bloque 2. Cardinalidad y multiplicación de filas

### Ejercicio 4. Alumno, asignatura y profesor

Visualiza el nombre del alumno, el nombre de la asignatura y el nombre del profesor que la imparte.

Columnas sugeridas:

```text
alumno | asignatura | profesor
```

Preguntas:

1. ¿Por qué Ana aparece varias veces?
2. ¿Por qué Luis aparece varias veces?
3. ¿Qué relación provoca que se multipliquen las filas?

---

### Ejercicio 5. Predecir el número de filas

Antes de ejecutar ninguna consulta, responde razonadamente:

Un alumno está matriculado en 5 asignaturas.

Cada asignatura tiene 1 profesor.

¿Cuántas filas aparecerán si hacemos un JOIN entre `alumno`, `matricula`, `asignatura` y `profesor` para ese alumno?

Después, comprueba la idea utilizando los datos reales de Carlos.

---

## Bloque 3. LEFT JOIN

### Ejercicio 6. Todos los alumnos y sus asignaturas

Visualiza todos los alumnos y, si existen, las asignaturas en las que están matriculados.

Deben aparecer también los alumnos que no están matriculados en ninguna asignatura.

Columnas sugeridas:

```text
alumno | asignatura
```

Preguntas:

1. ¿Aparece Javier?
2. ¿Qué valor aparece en la columna de asignatura para Javier?
3. ¿Por qué aparece ese valor?

---

### Ejercicio 7. Todas las asignaturas y sus alumnos

Visualiza todas las asignaturas y, si existen, los alumnos matriculados en ellas.

Deben aparecer también las asignaturas que no tienen ningún alumno matriculado.

Columnas sugeridas:

```text
asignatura | alumno
```

Preguntas:

1. ¿Aparece Diseño de Interfaces Web?
2. ¿Qué valor aparece como alumno?
3. ¿Qué tabla debe ir a la izquierda para conservar todas las asignaturas?

---

## Bloque 4. Error típico con LEFT JOIN y WHERE

### Ejercicio 8. LEFT JOIN mal planteado

Queremos visualizar todas las asignaturas y, si existen, los alumnos que tengan una nota mayor o igual que 7.

Ejecuta una consulta parecida a esta:

```sql
SELECT 
    asig.nombre AS asignatura,
    al.nombre || ' ' || al.apellidos AS alumno,
    m.nota
FROM asignatura asig
LEFT JOIN matricula m
    ON asig.id_asignatura = m.id_asignatura
LEFT JOIN alumno al
    ON m.id_alumno = al.id_alumno
WHERE m.nota >= 7
ORDER BY asig.nombre, alumno;
```

Preguntas:

1. ¿Aparecen todas las asignaturas?
2. ¿Aparece Diseño de Interfaces Web?
3. ¿Por qué desaparecen las asignaturas sin alumnos con nota mayor o igual que 7?
4. ¿Qué efecto tiene el `WHERE` sobre los valores `NULL`?

---

### Ejercicio 9. LEFT JOIN correctamente planteado

Repite el ejercicio anterior, pero manteniendo todas las asignaturas, aunque no tengan alumnos con nota mayor o igual que 7.

Pista:

La condición sobre la nota debe colocarse en el `ON`, no en el `WHERE`.

Preguntas:

1. ¿Aparece ahora Diseño de Interfaces Web?
2. ¿Aparecen asignaturas cuyos alumnos no llegan a 7?
3. ¿Por qué esta versión respeta mejor el sentido del `LEFT JOIN`?

---

## Bloque 5. RIGHT JOIN

### Ejercicio 10. Todos los profesores y sus asignaturas usando RIGHT JOIN

Visualiza todos los profesores y las asignaturas que imparten.

Aunque un profesor no tenga asignaturas, debe aparecer igualmente.

Hazlo utilizando `RIGHT JOIN`.

Columnas sugeridas:

```text
profesor | asignatura
```

Preguntas:

1. ¿Aparece Pedro?
2. ¿Qué valor aparece como asignatura para Pedro?
3. ¿Qué tabla se está conservando con el `RIGHT JOIN`?

---

### Ejercicio 11. Reescribir el RIGHT JOIN como LEFT JOIN

Reescribe la consulta anterior utilizando `LEFT JOIN`.

Preguntas:

1. ¿Devuelve el mismo resultado?
2. ¿Cuál de las dos versiones te parece más clara?
3. ¿Por qué en la práctica suele preferirse `LEFT JOIN` frente a `RIGHT JOIN`?

---

## Bloque 6. Explosión de filas

### Ejercicio 12. Profesor, asignatura y alumno

Visualiza el nombre del profesor, el nombre de la asignatura y el nombre del alumno matriculado.

Columnas sugeridas:

```text
profesor | asignatura | alumno
```

Preguntas:

1. ¿Por qué Ana aparece varias veces?
2. ¿Cuántas asignaturas imparte Ana?
3. ¿Cuántos alumnos hay matriculados en cada una de sus asignaturas?
4. ¿Qué ocurre cuando se combinan relaciones 1:N y N:M?

---

### Ejercicio 13. Contar filas mentalmente

Responde sin ejecutar SQL:

Un profesor imparte 3 asignaturas.

Cada asignatura tiene 20 alumnos matriculados.

¿Cuántas filas devolverá un JOIN entre `profesor`, `asignatura`, `matricula` y `alumno`?

Explica el razonamiento.

---

## Bloque 7. Errores reales de JOIN

### Ejercicio 14. JOIN incorrecto entre alumno y asignatura

Un alumno escribe esta consulta:

```sql
SELECT 
    al.nombre AS alumno,
    asig.nombre AS asignatura
FROM alumno al
INNER JOIN asignatura asig
    ON al.id_alumno = asig.id_asignatura;
```

Responde:

1. ¿Por qué esta consulta es incorrecta desde el punto de vista del modelo relacional?
2. ¿Qué tabla falta?
3. ¿Por qué no se deben unir tablas usando columnas que tienen valores parecidos pero no representan la misma relación?
4. Escribe la consulta correcta.

---

### Ejercicio 15. JOIN incompleto en una relación N:M

Queremos mostrar alumnos y asignaturas.

Un alumno intenta unir directamente `alumno` con `asignatura`.

Explica por qué en una relación N:M es obligatorio pasar por la tabla intermedia `matricula`.

Después, escribe la consulta correcta.

---

# 5. Reglas finales para recordar

## INNER JOIN

Devuelve solo las filas que tienen coincidencia en ambas tablas.

```text
Si no hay coincidencia, la fila no aparece.
```

## LEFT JOIN

Devuelve todas las filas de la tabla de la izquierda.

```text
Si no hay coincidencia en la derecha, aparecen NULL.
```

## RIGHT JOIN

Devuelve todas las filas de la tabla de la derecha.

```text
Se puede reescribir normalmente como LEFT JOIN cambiando el orden de las tablas.
```

## Cardinalidad

```text
1 → 1      normalmente no multiplica filas
N → 1      normalmente no multiplica filas
1 → N      puede multiplicar filas
N → M      puede multiplicar muchas filas
```

## Idea clave

```text
Los JOIN no duplican datos.
La cardinalidad es la que multiplica filas.
```
