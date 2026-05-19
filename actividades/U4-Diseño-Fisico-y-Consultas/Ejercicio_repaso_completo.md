# Ejercicio completo de repaso DDL + DML
## Base de datos de un hospital

---

# Contexto

Un hospital necesita gestionar la información relacionada con:

- Pacientes.
- Médicos.
- Especialidades médicas.
- Citas médicas.
- Ingresos hospitalarios.

El objetivo es diseñar y manipular una base de datos relacional en Oracle utilizando sentencias DDL y DML.

---

# 1. Modelo relacional

```text
PACIENTES(
    id_paciente PK,
    dni UQ,
    nombre,
    apellidos,
    fecha_nacimiento,
    telefono,
    activo
)

ESPECIALIDADES(
    id_especialidad PK,
    nombre UQ,
    planta
)

MEDICOS(
    id_medico PK,
    dni UQ,
    nombre,
    apellidos,
    salario,
    id_especialidad FK → ESPECIALIDADES(id_especialidad)
)

CITAS(
    id_cita PK,
    id_paciente FK → PACIENTES(id_paciente),
    id_medico FK → MEDICOS(id_medico),
    fecha_cita,
    estado
)

INGRESOS(
    id_ingreso PK,
    id_paciente FK → PACIENTES(id_paciente),
    fecha_ingreso,
    fecha_alta,
    habitacion,
    importe
)
```

---

# 2. Parte DDL: creación de tablas

## Tabla `pacientes`

Crear la tabla cumpliendo las siguientes condiciones:

- `id_paciente`: clave primaria con `GENERATED ALWAYS AS IDENTITY`.
- `dni`: obligatorio y único.
- `nombre`: obligatorio.
- `apellidos`: obligatorios.
- `fecha_nacimiento`: obligatoria.
- `telefono`: obligatorio.
- `activo`: por defecto 1.
- `activo` solo puede valer 0 o 1.

---

## Tabla `especialidades`

- `id_especialidad`: clave primaria con identidad.
- `nombre`: obligatorio y único.
- `planta`: valor entre 1 y 10.

---

## Tabla `medicos`

- `id_medico`: clave primaria con identidad.
- `dni`: obligatorio y único.
- `nombre` y `apellidos`: obligatorios.
- `salario`: mayor que 1500.
- `id_especialidad`: clave ajena hacia `especialidades`.

---

## Tabla `citas`

- `id_cita`: clave primaria con identidad.
- `id_paciente`: clave ajena hacia `pacientes`.
- `id_medico`: clave ajena hacia `medicos`.
- `fecha_cita`: por defecto `CURRENT_TIMESTAMP`.
- `estado`: por defecto `'PENDIENTE'`.
- `estado` solo puede valer:
  - `'PENDIENTE'`
  - `'REALIZADA'`
  - `'ANULADA'`

---

## Tabla `ingresos`

- `id_ingreso`: clave primaria con identidad.
- `id_paciente`: clave ajena hacia `pacientes`.
- `fecha_ingreso`: obligatoria.
- `fecha_alta`: puede ser NULL.
- `habitacion`: obligatoria.
- `importe`: mayor que 0.

---

# 3. Parte DML: inserción de datos

Inserta como mínimo:

- 6 pacientes.
- 4 especialidades.
- 5 médicos.
- 10 citas.
- 4 ingresos.

Debe existir:

- Algún paciente inactivo.
- Alguna especialidad sin médicos.
- Algún médico con varias citas.
- Alguna cita anulada.
- Algún ingreso sin fecha de alta.
- Algún paciente sin ingresos.

---

# 4. Modificación de datos

Realiza las siguientes operaciones:

## 1.

Incrementa un 5% el salario de los médicos de la especialidad “Cardiología”.

## 2.

Cambia el estado de una cita concreta a `'REALIZADA'`.

## 3.

Desactiva a un paciente que no tenga citas pendientes.

## 4.

Actualiza el teléfono de un paciente.

## 5.

Añade fecha de alta a un ingreso hospitalario que todavía no la tenga.

---

# 5. Borrado de datos

Realiza las siguientes operaciones y explica qué ocurre:

## 1.

Intenta borrar una especialidad que tenga médicos asociados.

## 2.

Borra una cita anulada.

## 3.

Intenta borrar un paciente que tenga citas registradas.

## 4.

Borra un ingreso ya finalizado.

## 5.

Borra un paciente que no tenga citas ni ingresos.

---

# 6. Consultas

# Consultas básicas

## 1.

Mostrar todos los pacientes ordenados por apellidos y nombre.

## 2.

Mostrar los médicos cuyo salario sea superior a 3000 €.

## 3.

Mostrar las citas pendientes.

## 4.

Mostrar los ingresos que todavía no tienen fecha de alta.

---

# Consultas con JOIN

## 5.

Mostrar:

- nombre del paciente
- nombre del médico
- fecha de la cita
- estado

## 6.

Mostrar todos los médicos junto con su especialidad.

## 7.

Mostrar todos los pacientes y sus ingresos, incluyendo los pacientes que nunca han sido ingresados.

## 8.

Mostrar las especialidades y los médicos asociados, incluyendo especialidades sin médicos.

---

# Consultas con GROUP BY y HAVING

## 9.

Mostrar cuántos médicos hay en cada especialidad.

## 10.

Mostrar el número de citas realizadas por cada médico.

## 11.

Mostrar las especialidades que tengan más de un médico.

## 12.

Mostrar el salario medio de los médicos por especialidad.

---

# Consultas con subconsultas

## 13.

Mostrar los médicos que cobran más que el salario medio de todos los médicos.

## 14.

Mostrar los pacientes que tienen alguna cita anulada.

## 15.

Mostrar los pacientes que han tenido ingresos hospitalarios.

## 16.

Mostrar los médicos que no tienen ninguna cita asignada.

---

# 7. Preguntas teórico-prácticas

## 1.

¿Qué diferencia existe entre `PRIMARY KEY` y `UNIQUE`?

## 2.

¿Por qué las claves ajenas garantizan la integridad referencial?

## 3.

¿Qué ocurrirá si se intenta insertar una cita con un `id_medico` inexistente?

## 4.

¿Qué diferencia existe entre:

- `DELETE`
- `TRUNCATE`
- `DROP`

## 5.

¿Por qué puede ser peligroso ejecutar un `UPDATE` sin `WHERE`?

## 6.

¿Qué diferencia existe entre `WHERE` y `HAVING`?

## 7.

¿Qué diferencia existe entre `INNER JOIN` y `LEFT JOIN`?

## 8.

¿En qué orden se ejecutan conceptualmente las cláusulas de una consulta SQL?

---

# 8. Entrega esperada

El alumnado deberá entregar un único archivo `.sql` que contenga:

```text
1. DROP TABLE si fuese necesario.
2. CREATE TABLE de todas las tablas.
3. INSERT de datos.
4. UPDATE solicitados.
5. DELETE solicitados.
6. SELECT de todas las consultas.
7. Comentarios explicando los errores producidos por restricciones.
```
