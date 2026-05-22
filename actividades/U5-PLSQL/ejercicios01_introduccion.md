# Ejercicios — Clase 1: Introducción a PL/SQL y Estructura de Bloques

## Esquema de tablas de referencia

Todos los ejercicios trabajan sobre las siguientes tablas. Créalas en tu entorno antes de empezar:

```sql
CREATE TABLE Hotel (
  HotelID      NUMBER        PRIMARY KEY,
  Nombre       VARCHAR2(100) NOT NULL,
  Nhabs        NUMBER,
  PrecioHab    NUMBER(8,2),
  TienePiscina CHAR(1)       DEFAULT 'N' CHECK (TienePiscina IN ('S','N')),
  Calif        NUMBER(1)     CHECK (Calif BETWEEN 1 AND 5)
);

CREATE TABLE Pieza (
  P#      NUMBER        PRIMARY KEY,
  Nombre  VARCHAR2(100) NOT NULL,
  Peso    NUMBER(8,3),
  Precio  NUMBER(8,2)
);

-- Datos de prueba
INSERT INTO Hotel VALUES (1,  'Hotel Sol',     45, 80,  'N', 3);
INSERT INTO Hotel VALUES (2,  'Hotel Mar',     80, 120, 'S', 4);
INSERT INTO Hotel VALUES (3,  'Hotel Costa',  120, 200, 'S', 5);
INSERT INTO Hotel VALUES (4,  'Hotel Prado',   30, 60,  'N', 2);
INSERT INTO Hotel VALUES (5,  'Hotel Centro',  95, 150, 'S', 4);
COMMIT;
```

---

## Nivel 1 — Primeros pasos

### Ejercicio 1.1 — Hola PL/SQL

Escribe un bloque PL/SQL anónimo que muestre por pantalla el mensaje:
`Bienvenido a PL/SQL. Fecha actual: DD/MM/YYYY`

donde la fecha se obtiene con `SYSDATE` formateada con `TO_CHAR`.

> **Pista:** Antes de ejecutar activa la salida con `SET SERVEROUTPUT ON`.

---

### Ejercicio 1.2 — Variables y asignación

Escribe un bloque anónimo que:

1. Declare una variable `base` de tipo `NUMBER` con valor `5`.
2. Declare una variable `altura` de tipo `NUMBER` con valor `8`.
3. Declare una variable `area` de tipo `NUMBER`.
4. Calcule el área del triángulo (`base * altura / 2`) y la asigne a `area`.
5. Muestre el resultado con el formato: `Área del triángulo: X`

---

### Ejercicio 1.3 — Inserción desde un bloque

Escribe un bloque anónimo que inserte en la tabla `Pieza` tres piezas de tipo `'Tornillo'` con pesos 1.5, 2.0 y 3.0 respectivamente, y número de pieza 10, 11 y 12. Confirma la transacción con `COMMIT`.

> **Nota:** Comprueba el resultado con `SELECT * FROM Pieza`.

---

## Nivel 2 — Bloques con SQL

### Ejercicio 1.4 — Leer un dato de la BD

Escribe un bloque anónimo que:

1. Declare una variable `nombre_hotel` del tipo adecuado para almacenar el nombre de un hotel.
2. Consulte el nombre del hotel con `HotelID = 3` y lo almacene en esa variable.
3. Muestre por pantalla: `Hotel encontrado: NOMBRE`

---

### Ejercicio 1.5 — Bloque nominado

Reescribe el ejercicio 1.4 como un **bloque nominado** con la etiqueta `<<BuscarHotel>>`. Pon el nombre del bloque también después de `END`.

---

### Ejercicio 1.6 — Actualización condicional

Escribe un bloque anónimo que:

1. Declare una variable con el identificador del hotel a modificar (`HotelID = 2`).
2. Suba el precio de ese hotel en un 10 % (multiplica `PrecioHab` por 1.1).
3. Muestre el mensaje `Precio actualizado correctamente.`
4. Confirme la transacción.

---

## Nivel 3 — Primer procedimiento y primer trigger

### Ejercicio 1.7 — Tu primer procedimiento

Crea un procedimiento llamado `MostrarHotel` que, dado un `HotelID` como parámetro de entrada, muestre por pantalla todas las columnas del hotel en líneas separadas con el formato:

```
ID:       3
Nombre:   Hotel Costa
Habs:     120
Precio:   200
Piscina:  S
Calif:    5
```

Llama al procedimiento con `EXEC MostrarHotel(3)`.

---

### Ejercicio 1.8 — Reflexión sobre los tipos de bloque

Contesta razonadamente las siguientes preguntas (sin ejecutar código):

1. ¿Cuál es la única sección obligatoria de un bloque PL/SQL?
2. ¿En qué se diferencia un bloque anónimo de un procedimiento almacenado?
3. Si ejecutas el mismo bloque anónimo 1000 veces, ¿cuántas veces se compila?  
   ¿Y si es un procedimiento almacenado?
4. ¿Qué orden de SQL*Plus debes ejecutar si al crear un procedimiento Oracle dice  
   `Warning: Procedure created with compilation errors`?

---

### Ejercicio 1.9 — Anticipo: primer trigger (lectura y análisis)

Lee el siguiente trigger y responde las preguntas sin ejecutarlo:

```sql
CREATE OR REPLACE TRIGGER ValidarCalif
  BEFORE INSERT OR UPDATE OF Calif ON Hotel
  FOR EACH ROW
BEGIN
  IF :new.Calif < 1 OR :new.Calif > 5 THEN
    RAISE_APPLICATION_ERROR(-20001, 'La calificación debe estar entre 1 y 5');
  END IF;
END ValidarCalif;
```

1. ¿Cuándo se activa este trigger?
2. ¿Qué hace si se intenta insertar un hotel con `Calif = 7`?
3. ¿Se activa si se actualiza el campo `Nombre` del hotel?
4. ¿Qué significa `FOR EACH ROW`?

---

## Ejercicio de síntesis — 1.10

Escribe un bloque PL/SQL completo que realice las siguientes operaciones **en orden**:

1. Inserta en `Pieza` una pieza con `P# = 20`, `Nombre = 'Tuerca'`, `Peso = 0.5`, `Precio = 0.10`.
2. Muestra por pantalla: `Pieza insertada: Tuerca`.
3. Actualiza el precio de la pieza recién insertada multiplicándolo por 2.
4. Muestra por pantalla: `Precio actualizado a: VALOR` (lee el nuevo precio de la BD).
5. Confirma la transacción.

> **Reto adicional:** ¿Qué pasaría si ejecutas el bloque dos veces seguidas? ¿Cómo lo evitarías?
