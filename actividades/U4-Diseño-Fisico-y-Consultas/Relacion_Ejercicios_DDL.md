# Relación de Ejercicios DDL (Progresiva)

## Introducción

Esta relación contiene 10 ejercicios de DDL ordenados de menor a mayor dificultad. Están planteados para Oracle SQL y trabajan creación de tablas, restricciones, claves primarias y foráneas, comprobaciones con `CHECK`, uso de `ALTER TABLE`, modificaciones de estructura y objetos complementarios.

En todos los ejercicios:

- Nombra las restricciones de forma explícita.
- Ejecuta primero los `CREATE TABLE` y después los `ALTER TABLE` cuando se indique.
- Verifica al final la estructura con `DESC` y consultando el diccionario de datos.

---

## Ejercicio 1. Tabla simple con clave primaria y validaciones básicas

### Tablas

Tabla `DEPARTAMENTOS`

Nombre | Nulo? | Tipo
--- | --- | ---
COD_DEP | NOT NULL | NUMBER(3)
NOMBRE | NOT NULL | VARCHAR2(30)
PRESUPUESTO |  | NUMBER(8,2)

### Se pide

1. Crear la tabla `DEPARTAMENTOS`.
2. Definir `COD_DEP` como clave primaria.
3. Añadir una restricción para que `PRESUPUESTO` sea mayor que 0.
4. Añadir una restricción para que `NOMBRE` se almacene en mayúsculas.

---

## Ejercicio 2. Clave primaria compuesta y dominio cerrado

### Tablas

Tabla `AULAS`

Nombre | Nulo? | Tipo
--- | --- | ---
EDIFICIO | NOT NULL | VARCHAR2(10)
PLANTA | NOT NULL | NUMBER(2)
AULA | NOT NULL | VARCHAR2(10)
CAPACIDAD | NOT NULL | NUMBER(4)
TIPO_AULA | NOT NULL | VARCHAR2(12)

### Se pide

1. Crear la tabla `AULAS`.
2. Definir clave primaria compuesta por `EDIFICIO`, `PLANTA` y `AULA`.
3. Obligar a que `CAPACIDAD` sea mayor que 0.
4. Limitar `TIPO_AULA` a los valores: `'TEORIA'`, `'INFORMATICA'`, `'LABORATORIO'`.

---

## Ejercicio 3. Dos tablas con clave foránea simple

### Tablas

Tabla `PROVEEDORES`

Nombre | Nulo? | Tipo
--- | --- | ---
COD_PROV | NOT NULL | NUMBER(4)
NOMBRE | NOT NULL | VARCHAR2(30)
PAIS |  | VARCHAR2(20)

Tabla `PRODUCTOS`

Nombre | Nulo? | Tipo
--- | --- | ---
COD_PROD | NOT NULL | NUMBER(6)
NOMBRE | NOT NULL | VARCHAR2(40)
PRECIO_COSTE |  | NUMBER(8,2)
COD_PROV | NOT NULL | NUMBER(4)

### Se pide

1. Crear ambas tablas con su clave primaria (`COD_PROV` y `COD_PROD`).
2. Definir la clave foránea de `PRODUCTOS(COD_PROV)` hacia `PROVEEDORES(COD_PROV)`.
3. Añadir `CHECK` para que `PRECIO_COSTE` sea mayor que 0.
4. Hacer que `PAIS` se almacene en mayúsculas.

---

## Ejercicio 4. Relación N:M con tabla intermedia

### Tablas

Tabla `ALUMNOS`

Nombre | Nulo? | Tipo
--- | --- | ---
NIA | NOT NULL | VARCHAR2(10)
NOMBRE | NOT NULL | VARCHAR2(30)

Tabla `MODULOS`

Nombre | Nulo? | Tipo
--- | --- | ---
COD_MOD | NOT NULL | VARCHAR2(8)
NOMBRE | NOT NULL | VARCHAR2(40)
HORAS | NOT NULL | NUMBER(4)

Tabla `MATRICULAS`

Nombre | Nulo? | Tipo
--- | --- | ---
NIA | NOT NULL | VARCHAR2(10)
COD_MOD | NOT NULL | VARCHAR2(8)
CURSO | NOT NULL | VARCHAR2(9)
NOTA |  | NUMBER(4,2)

### Se pide

1. Crear las tres tablas.
2. Definir claves primarias en `ALUMNOS`, `MODULOS` y clave primaria compuesta en `MATRICULAS(NIA, COD_MOD, CURSO)`.
3. Definir claves foráneas de `MATRICULAS` hacia `ALUMNOS` y `MODULOS`.
4. Restringir `NOTA` para que esté entre 0 y 10.

---

## Ejercicio 5. Caso tipo tienda (similar al ejemplo), versión reducida

### Tablas

Tablas `FABRICANTES`, `ARTICULOS`, `TIENDAS`, `PEDIDOS`

Tabla `FABRICANTES`

Nombre | Nulo? | Tipo
--- | --- | ---
COD_FABRICANTE | NOT NULL | NUMBER(3)
NOMBRE |  | VARCHAR2(15)
PAIS |  | VARCHAR2(15)

Tabla `ARTICULOS`

Nombre | Nulo? | Tipo
--- | --- | ---
ARTICULO | NOT NULL | VARCHAR2(20)
COD_FABRICANTE | NOT NULL | NUMBER(3)
PESO | NOT NULL | NUMBER(3)
CATEGORIA | NOT NULL | VARCHAR2(10)
PRECIO_VENTA |  | NUMBER(6,2)

Tabla `TIENDAS`

Nombre | Nulo? | Tipo
--- | --- | ---
NIF | NOT NULL | VARCHAR2(10)
NOMBRE |  | VARCHAR2(20)
PROVINCIA |  | VARCHAR2(20)

Tabla `PEDIDOS`

Nombre | Nulo? | Tipo
--- | --- | ---
NIF | NOT NULL | VARCHAR2(10)
ARTICULO | NOT NULL | VARCHAR2(20)
COD_FABRICANTE | NOT NULL | NUMBER(3)
PESO | NOT NULL | NUMBER(3)
CATEGORIA | NOT NULL | VARCHAR2(10)
FECHA_PEDIDO | NOT NULL | DATE
UNIDADES_PEDIDAS |  | NUMBER(4)

### Se pide

1. Crear todas las tablas con sus claves primarias.
2. En `ARTICULOS`, usar clave primaria compuesta por `ARTICULO`, `COD_FABRICANTE`, `PESO` y `CATEGORIA`.
3. Definir las claves foráneas correspondientes en `ARTICULOS` y `PEDIDOS`.
4. Validar:
   - `PESO`, `PRECIO_VENTA` y `UNIDADES_PEDIDAS` > 0.
   - `CATEGORIA` en `'PRIMERA'`, `'SEGUNDA'`, `'TERCERA'`.
   - Campos de texto de país/provincia en mayúsculas.

---

## Ejercicio 6. Crear sin restricciones y completar con ALTER TABLE

### Tablas

Tabla `VENTAS`

Nombre | Nulo? | Tipo
--- | --- | ---
NIF | NOT NULL | VARCHAR2(10)
ARTICULO | NOT NULL | VARCHAR2(20)
COD_FABRICANTE | NOT NULL | NUMBER(3)
PESO | NOT NULL | NUMBER(3)
CATEGORIA | NOT NULL | VARCHAR2(10)
FECHA_VENTA | NOT NULL | DATE
UNIDADES_VENDIDAS |  | NUMBER(4)

### Se pide

1. Crear `VENTAS` inicialmente sin restricciones de clave.
2. Añadir con `ALTER TABLE`:
   - Clave primaria compuesta por `NIF`, `ARTICULO`, `COD_FABRICANTE`, `PESO`, `CATEGORIA`, `FECHA_VENTA`.
   - Restricción de `UNIDADES_VENDIDAS > 0`.
   - Restricción de dominio para `CATEGORIA`.
3. Suponiendo que existen `TIENDAS` y `ARTICULOS`, añadir las claves foráneas correspondientes también mediante `ALTER TABLE`.

---

## Ejercicio 7. Evolución del esquema: ADD, MODIFY, DROP COLUMN

### Escenario

Partes de esta tabla ya creada:

Tabla `CLIENTES`

Nombre | Nulo? | Tipo
--- | --- | ---
ID_CLIENTE | NOT NULL | NUMBER(6)
NOMBRE | NOT NULL | VARCHAR2(40)
EMAIL |  | VARCHAR2(60)

### Se pide

1. Añadir una nueva columna `TELEFONO VARCHAR2(15)`.
2. Modificar `EMAIL` para aumentar su tamaño a `VARCHAR2(100)`.
3. Añadir restricción `UNIQUE` sobre `EMAIL`.
4. Eliminar la columna `TELEFONO`.
5. Añadir columna `FECHA_ALTA DATE` con valor por defecto `SYSDATE`.

---

## Ejercicio 8. Integridad referencial con acciones ON DELETE

### Tablas

Tabla `CATEGORIAS`

Nombre | Nulo? | Tipo
--- | --- | ---
ID_CATEGORIA | NOT NULL | NUMBER(4)
NOMBRE | NOT NULL | VARCHAR2(30)

Tabla `PRODUCTOS_TIENDA`

Nombre | Nulo? | Tipo
--- | --- | ---
ID_PRODUCTO | NOT NULL | NUMBER(6)
NOMBRE | NOT NULL | VARCHAR2(40)
ID_CATEGORIA |  | NUMBER(4)

### Se pide

1. Crear ambas tablas con sus claves primarias.
2. Definir una clave foránea en `PRODUCTOS_TIENDA(ID_CATEGORIA)` con `ON DELETE SET NULL`.
3. Crear una segunda versión de esa clave foránea (tras eliminar la anterior) con `ON DELETE CASCADE`.
4. Explicar qué diferencia funcional hay entre ambas opciones.

---

## Ejercicio 9. Restricciones avanzadas y nomenclatura profesional

### Tablas

Tabla `EMPLEADOS`

Nombre | Nulo? | Tipo
--- | --- | ---
ID_EMP | NOT NULL | NUMBER(6)
NIF | NOT NULL | VARCHAR2(9)
NOMBRE | NOT NULL | VARCHAR2(40)
SALARIO |  | NUMBER(9,2)
TIPO_CONTRATO | NOT NULL | VARCHAR2(10)
FECHA_ALTA | NOT NULL | DATE
FECHA_BAJA |  | DATE

### Se pide

1. Crear la tabla nombrando todas las restricciones con prefijo `EMP_`.
2. Añadir `UNIQUE` sobre `NIF`.
3. Limitar `TIPO_CONTRATO` a `'FIJO'`, `'TEMPORAL'`, `'PRACTICAS'`.
4. Validar que `SALARIO > 0`.
5. Validar que `FECHA_BAJA` sea nula o mayor/igual que `FECHA_ALTA`.

---

## Ejercicio 10. Diseño DDL completo con ampliación y mantenimiento

### Escenario

Debes construir el esquema de una plataforma de préstamos de biblioteca con estas tablas:

- `SOCIOS` (datos de los socios)
- `LIBROS` (catálogo)
- `EJEMPLARES` (copias físicas de cada libro)
- `PRESTAMOS` (histórico de préstamos)

### Requisitos mínimos

1. Definir todas las claves primarias.
2. Definir las claves foráneas necesarias entre tablas.
3. Incluir al menos 6 restricciones `CHECK` relevantes (por ejemplo, estados, fechas, cantidades).
4. Incluir al menos 2 restricciones `UNIQUE`.
5. Crear al menos 2 índices con `CREATE INDEX` para mejorar búsquedas frecuentes.
6. Crear una vista `VW_PRESTAMOS_ACTIVOS` con préstamos no devueltos.
7. Alterar una tabla para añadir una columna de auditoría (`USUARIO_ULT_MOD`, `FECHA_ULT_MOD`) con valores por defecto cuando sea posible.
8. Preparar sentencias para eliminar los objetos en orden correcto (`DROP VIEW`, `DROP TABLE` con dependencias resueltas).

### Entrega

- Script 1: creación inicial (`CREATE TABLE`, restricciones básicas).
- Script 2: modificaciones (`ALTER TABLE`, índices, vista).
- Script 3: limpieza de objetos (`DROP ...`).

---

