---
marp: true
theme: default
paginate: true
title: "Tema 3 - Diseno Fisico de Bases de Datos (DDL)"
description: "1DAW - Bases de Datos"
---

# Tema 3: Diseno Fisico de Bases de Datos (DDL)
## 1o DAW - Bases de Datos

- Del modelo relacional al SQL real en PostgreSQL
- Objetivo: disenar estructuras correctas, seguras y mantenibles

---

# Indice

1. Introduccion al diseno fisico
2. Creacion de bases de datos y tablas
3. Restricciones (clave en calidad de datos)
4. Claves foraneas y relaciones
5. Modificacion de tablas
6. Indices
7. Vistas
8. Relacion con el diseno logico

---

# 1) Introduccion al Diseno Fisico

## Que es el diseno fisico

- Es convertir el modelo logico en objetos reales del SGBD.
- Define tablas, tipos de datos, claves, restricciones e indices.
- Aqui decidimos "como se guarda" la informacion.

Idea rapida:
- Nivel logico: plano de una casa.
- Nivel fisico: materiales, puertas, cableado y medidas exactas.

---

# Nivel Logico vs Nivel Fisico

## Diferencia clave

- Nivel logico (modelo relacional): entidades, atributos y relaciones.
- Nivel fisico (SQL): `CREATE TABLE`, tipos (`INTEGER`, `DATE`), reglas (`CHECK`, `FK`).

Ejemplo:
- Logico: USUARIO(id, email, fecha_registro)
- Fisico PostgreSQL: tipos concretos + restricciones concretas.

```sql
-- Nivel fisico: decision concreta en PostgreSQL
CREATE TABLE usuarios (
    id INTEGER PRIMARY KEY,
    email VARCHAR(120) UNIQUE NOT NULL,
    fecha_registro DATE NOT NULL DEFAULT CURRENT_DATE
);
```

---

# Que es DDL

## Data Definition Language

- Sirve para definir y modificar la estructura de la base de datos.
- Comandos tipicos: `CREATE`, `ALTER`, `DROP`, `TRUNCATE`.

```sql
-- DDL: crear estructura
CREATE TABLE productos (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    precio NUMERIC(10,2) CHECK (precio >= 0)
);
```

---

# DDL, DML y DCL

## Diferencias practicas

- DDL: estructura (`CREATE TABLE ...`)
- DML: datos (`INSERT`, `UPDATE`, `DELETE`, `SELECT`)
- DCL: permisos (`GRANT`, `REVOKE`)

```sql
-- DDL: define tabla
CREATE TABLE clientes (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL
);

-- DML: inserta datos
INSERT INTO clientes (id, nombre) VALUES (1, 'Ana');

-- DCL: da permisos de lectura
GRANT SELECT ON clientes TO alumno_lectura;
```

---

# 2) Creacion de Bases de Datos

## CREATE DATABASE

```sql
-- Crear una base de datos para el proyecto de clase
CREATE DATABASE tienda_daw;

-- Conectarse despues (normalmente desde psql o PGAdmin)
-- \c tienda_daw
```

Recomendacion docente:
- Un nombre claro por proyecto.
- Evitar espacios y tildes en nombres tecnicos.

---

# CREATE TABLE y Tipos Basicos

## Tipos frecuentes en PostgreSQL

- `INTEGER`: numeros enteros
- `VARCHAR(n)`: texto corto con limite
- `TEXT`: texto largo
- `DATE`: fecha
- `BOOLEAN`: verdadero/falso

```sql
-- Tabla simple: usuarios
CREATE TABLE usuarios (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL
);
```

---

# Ejemplo de Tabla con Varios Tipos

```sql
CREATE TABLE perfiles_usuario (
    id INTEGER PRIMARY KEY,
    usuario_id INTEGER NOT NULL,
    biografia TEXT,
    fecha_nacimiento DATE,
    activo BOOLEAN NOT NULL DEFAULT TRUE
);

-- Ejemplo de insercion correcta
INSERT INTO perfiles_usuario (id, usuario_id, biografia, fecha_nacimiento, activo)
VALUES (1, 1, 'Estudiante de DAW interesado en BBDD', '2006-05-10', TRUE);
```

Caso real:
- `TEXT` para descripciones largas.
- `BOOLEAN` para estados activos/inactivos.

---

# 3) Restricciones

## Por que son tan importantes

- Evitan datos invalidos antes de que entren en la tabla.
- Reducen errores de aplicacion y de informes.
- Documentan reglas de negocio dentro de la propia BD.

Regla de oro:
- Si una regla siempre debe cumplirse, mejor en la BD que solo en la app.

---

# PRIMARY KEY

## Identificador unico de cada fila

- No se repite.
- No admite `NULL`.
- Suele ser la referencia para otras tablas.

```sql
CREATE TABLE categorias (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL
);

-- Caso real: cada categoria debe tener un id unico
INSERT INTO categorias (id, nombre) VALUES (1, 'Informatica');
-- INSERT INTO categorias (id, nombre) VALUES (1, 'Hogar'); -- Error por duplicado
```

---

# NOT NULL

## Campo obligatorio

- Impide guardar filas sin ese dato.
- Util para informacion minima imprescindible.

```sql
CREATE TABLE alumnos (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    email VARCHAR(120) NOT NULL
);

-- Caso real: no queremos alumnos sin nombre ni email
-- INSERT INTO alumnos (id, nombre, email) VALUES (1, NULL, 'a@centro.es'); -- Error
```

---

# UNIQUE

## Valor no repetido en la columna

- Similar a clave candidata.
- Muy usado en emails, DNI o codigos internos.

```sql
CREATE TABLE empleados (
    id INTEGER PRIMARY KEY,
    dni VARCHAR(12) UNIQUE NOT NULL,
    nombre VARCHAR(80) NOT NULL
);

-- Caso real: dos empleados no pueden compartir DNI
INSERT INTO empleados (id, dni, nombre) VALUES (1, '12345678A', 'Mario');
-- INSERT INTO empleados (id, dni, nombre) VALUES (2, '12345678A', 'Lucia'); -- Error
```

---

# CHECK

## Regla de validacion personalizada

- Obliga a cumplir una condicion logica.
- Muy util para rangos, estados o importes.

```sql
CREATE TABLE productos (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio NUMERIC(10,2) NOT NULL CHECK (precio >= 0),
    stock INTEGER NOT NULL CHECK (stock >= 0)
);

-- Caso real: no permitimos precios ni stock negativos
INSERT INTO productos (id, nombre, precio, stock)
VALUES (1, 'Teclado mecanico', 79.90, 10);
```

---

# DEFAULT

## Valor automatico por defecto

- Se aplica cuando no se envia valor en el `INSERT`.
- Facilita consistencia y reduce errores.

```sql
CREATE TABLE tickets_soporte (
    id INTEGER PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'abierto',
    fecha_creacion DATE NOT NULL DEFAULT CURRENT_DATE
);

-- Caso real: si no digo estado, empieza como 'abierto'
INSERT INTO tickets_soporte (id, titulo)
VALUES (1, 'No puedo acceder al campus');
```

---

# Restricciones Combinadas en una Tabla Real

```sql
CREATE TABLE usuarios (
    id INTEGER PRIMARY KEY,
    email VARCHAR(120) UNIQUE NOT NULL,
    nombre VARCHAR(80) NOT NULL,
    edad INTEGER CHECK (edad >= 16),
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_alta DATE NOT NULL DEFAULT CURRENT_DATE
);

-- Este diseno aplica varias reglas de negocio de una vez.
```

---

# 4) Claves Foraneas y Relaciones

## FOREIGN KEY

- Conecta una tabla hija con una tabla padre.
- Garantiza integridad referencial: no hay pedidos sin usuario valido.

```sql
-- Padre
CREATE TABLE usuarios (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL
);

-- Hija
CREATE TABLE pedidos (
    id INTEGER PRIMARY KEY,
    usuario_id INTEGER NOT NULL,
    total NUMERIC(10,2) NOT NULL CHECK (total >= 0),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);
```

---

# ON DELETE y ON UPDATE

## Comportamientos mas usados

- `CASCADE`: propaga el cambio/borrado.
- `SET NULL`: deja la FK en `NULL`.
- `RESTRICT`: impide borrar/actualizar si hay dependencias.

```sql
-- Ejemplo rapido de configuracion
FOREIGN KEY (usuario_id)
    REFERENCES usuarios(id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
```

Nota:
- Elegir accion segun negocio. No hay una unica opcion correcta.

---

# Ejemplo Completo: usuarios y pedidos

```sql
CREATE TABLE usuarios (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL
);

CREATE TABLE pedidos (
    id INTEGER PRIMARY KEY,
    usuario_id INTEGER,
    fecha DATE NOT NULL DEFAULT CURRENT_DATE,
    total NUMERIC(10,2) NOT NULL CHECK (total >= 0),
    FOREIGN KEY (usuario_id)
        REFERENCES usuarios(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- Datos de prueba
INSERT INTO usuarios (id, nombre, email)
VALUES (1, 'Ana', 'ana@correo.com');

INSERT INTO pedidos (id, usuario_id, total)
VALUES (100, 1, 59.90);
```

---

# Entender CASCADE, SET NULL y RESTRICT

```sql
-- Variante A: ON DELETE CASCADE
-- Si se borra el usuario 1, tambien se borran sus pedidos.

-- Variante B: ON DELETE SET NULL
-- Si se borra el usuario 1, el pedido queda sin usuario (usuario_id = NULL).

-- Variante C: ON DELETE RESTRICT
-- No permite borrar el usuario 1 si tiene pedidos asociados.
```

Pregunta de clase:
- En una tienda real, cual elegirias para conservar historico de pedidos?

---

# 5) Modificacion de Tablas con ALTER TABLE

## Operaciones habituales

- Anadir columnas
- Modificar tipo de una columna
- Anadir restricciones

```sql
-- Paso 1: anadir columna telefono
ALTER TABLE usuarios
ADD COLUMN telefono VARCHAR(20);

-- Paso 2: cambiar tipo de telefono a VARCHAR(25)
ALTER TABLE usuarios
ALTER COLUMN telefono TYPE VARCHAR(25);

-- Paso 3: anadir restriccion UNIQUE al telefono
ALTER TABLE usuarios
ADD CONSTRAINT uq_usuarios_telefono UNIQUE (telefono);
```

---

# ALTER TABLE Paso a Paso (Ejemplo Real)

```sql
CREATE TABLE productos (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    precio NUMERIC(10,2) NOT NULL
);

-- 1) Anadir stock con valor por defecto
ALTER TABLE productos
ADD COLUMN stock INTEGER NOT NULL DEFAULT 0;

-- 2) Anadir validacion de stock
ALTER TABLE productos
ADD CONSTRAINT ck_productos_stock CHECK (stock >= 0);

-- 3) Ajustar precision de precio
ALTER TABLE productos
ALTER COLUMN precio TYPE NUMERIC(12,2);
```

---

# DROP TABLE y TRUNCATE

## Diferencia clave

- `DROP TABLE`: elimina estructura + datos.
- `TRUNCATE`: vacia datos, mantiene estructura.

```sql
-- Vaciar registros rapidamente
TRUNCATE TABLE pedidos;

-- Eliminar tabla completa
DROP TABLE IF EXISTS pedidos;
```

Uso recomendado:
- `TRUNCATE` para reiniciar pruebas.
- `DROP` cuando la tabla ya no existe en el diseno.

---

# 6) Indices para Optimizar Consultas

## Que es un indice

- Estructura auxiliar para acelerar busquedas.
- Analogia: indice de un libro.

Importante:
- Mejora lecturas (`SELECT`).
- Puede hacer mas lentas inserciones/actualizaciones (hay que mantenerlo).

---

# CREATE INDEX

```sql
-- Consulta frecuente por email
CREATE INDEX idx_usuarios_email ON usuarios(email);

-- Consulta frecuente por fecha en pedidos
CREATE INDEX idx_pedidos_fecha ON pedidos(fecha);
```

Caso real:
- Si el login busca por email muchas veces al dia, conviene indice.

---

# Sin Indice vs Con Indice (Conceptual)

```sql
-- Consulta habitual
SELECT *
FROM usuarios
WHERE email = 'ana@correo.com';

-- Sin indice: recorrido de muchas filas (coste mayor).
-- Con indice: localizacion rapida por estructura indexada.

-- Para analizar en PostgreSQL:
EXPLAIN SELECT * FROM usuarios WHERE email = 'ana@correo.com';
```

Idea docente:
- No indexar todo. Indexar campos usados en filtros, joins y ordenaciones frecuentes.

---

# 7) Vistas (VIEW)

## Que es una vista

- Una consulta guardada con nombre.
- Simplifica acceso a datos y puede ocultar columnas sensibles.

```sql
CREATE VIEW vista_usuarios_activos AS
SELECT id, nombre, email, fecha_alta
FROM usuarios
WHERE activo = TRUE;

-- Uso de la vista
SELECT * FROM vista_usuarios_activos;
```

Caso real:
- El equipo de soporte consulta solo usuarios activos, sin reescribir SQL cada vez.

---

# 8) Del Modelo Relacional al SQL

## Como pasar de diseno logico a diseno fisico

Pasos practicos:
1. Crear cada tabla del modelo relacional.
2. Elegir tipos de datos correctos por atributo.
3. Definir PK y FK.
4. Anadir restricciones (`NOT NULL`, `UNIQUE`, `CHECK`, `DEFAULT`).

Clave didactica:
- El modelo relacional dice que existe.
- El SQL dice como se implementa correctamente.

---

# Ejemplo Completo: Modelo Relacional -> CREATE TABLE

Modelo relacional:
- USUARIOS(`id`, nombre, email, activo)
- PRODUCTOS(`id`, nombre, precio)
- PEDIDOS(`id`, usuario_id, fecha)
- LINEAS_PEDIDO(`pedido_id`, producto_id, cantidad)

```sql
CREATE TABLE usuarios (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE productos (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio NUMERIC(10,2) NOT NULL CHECK (precio >= 0)
);

CREATE TABLE pedidos (
    id INTEGER PRIMARY KEY,
    usuario_id INTEGER NOT NULL,
    fecha DATE NOT NULL DEFAULT CURRENT_DATE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE RESTRICT
);

CREATE TABLE lineas_pedido (
    pedido_id INTEGER NOT NULL,
    producto_id INTEGER NOT NULL,
    cantidad INTEGER NOT NULL CHECK (cantidad > 0),
    PRIMARY KEY (pedido_id, producto_id),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE,
    FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE RESTRICT
);
```

---

# Cierre del Tema

## Ideas que debes dominar

- DDL crea y modifica la estructura de la BD.
- Las restricciones protegen la calidad del dato.
- Las claves foraneas mantienen relaciones coherentes.
- Los indices mejoran rendimiento en consultas concretas.
- Las vistas simplifican consultas y reutilizan logica.

Siguiente paso sugerido:
- Practicar creando un esquema completo desde un modelo relacional.
