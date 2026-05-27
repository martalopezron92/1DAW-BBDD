# Ejercicios — Clase 2: Variables, Tipos de Datos y Estructuras de Control

## Recordatorio del esquema

```sql
Hotel      (HotelID, Nombre, Nhabs, PrecioHab, TienePiscina CHAR(1), Calif)
Empleados  (DNI NUMBER PK, Nombre VARCHAR2(100), Salario NUMBER(8,2), Dpto NUMBER)
Departamentos (NumDpto NUMBER PK, NombreDpto VARCHAR2(100), Num_Emp NUMBER)
```

Datos de prueba adicionales para esta clase:

```sql
CREATE TABLE Empleados (
  DNI     NUMBER        PRIMARY KEY,
  Nombre  VARCHAR2(100) NOT NULL,
  Salario NUMBER(8,2),
  Dpto    NUMBER
);
CREATE TABLE Departamentos (
  NumDpto   NUMBER        PRIMARY KEY,
  NombreDpto VARCHAR2(100),
  Num_Emp   NUMBER DEFAULT 0
);

INSERT INTO Departamentos VALUES (10, 'Ventas',      3);
INSERT INTO Departamentos VALUES (20, 'Informática', 4);
INSERT INTO Departamentos VALUES (30, 'RRHH',        2);

INSERT INTO Empleados VALUES (1,  'Ana García',    2500, 10);
INSERT INTO Empleados VALUES (2,  'Luis Pérez',    1800, 10);
INSERT INTO Empleados VALUES (3,  'Marta López',   3200, 20);
INSERT INTO Empleados VALUES (4,  'Carlos Ruiz',   2900, 20);
INSERT INTO Empleados VALUES (5,  'Elena Torres',  2100, 20);
INSERT INTO Empleados VALUES (6,  'Pedro Díaz',    1600, 20);
INSERT INTO Empleados VALUES (7,  'Sofía Núñez',   2200, 30);
INSERT INTO Empleados VALUES (8,  'Javier Mora',   1950, 30);
INSERT INTO Empleados VALUES (99, 'Empleado Nulo', NULL, 10);
COMMIT;
```

---

## Nivel 1 — Variables y tipos

### Ejercicio 2.1 — Declaración correcta

Indica cuáles de las siguientes declaraciones son **correctas** y cuáles contienen un **error**. Justifica cada respuesta:

```sql
a) Contador    NUMBER := 0;
b) Nombre      VARCHAR2;
c) Pi          CONSTANT NUMBER := 3.14159;
d) Activo      BOOLEAN := 'TRUE';
e) FechaAlta   DATE NOT NULL;
f) Precio      NUMBER(8,2) NOT NULL := 9.99;
g) Max_Val     CONSTANT NUMBER;
h) Dni         Empleados.DNI%TYPE;
```

---

### Ejercicio 2.2 — Tipos y %TYPE

Escribe un bloque que:

1. Declare `v_salario` usando `%TYPE` sobre la columna `Empleados.Salario`.
2. Declare `v_nombre` usando `%TYPE` sobre `Empleados.Nombre`.
3. Declare `v_incremento` como `NUMBER` con valor `0.15`.
4. Asigne manualmente: `v_salario := 2500`, `v_nombre := 'Prueba'`.
5. Calcule y muestre el salario tras aplicar el incremento:  
   `Salario con incremento del 15%: VALOR`

---

### Ejercicio 2.3 — Conversiones

Escribe un bloque que convierta y muestre:

1. El número `3.14159` como cadena con 2 decimales usando `TO_CHAR`.
2. La cadena `'15/06/2024'` como fecha usando `TO_DATE`.
3. La fecha actual como cadena con formato `'DAY, DD "de" MONTH "de" YYYY'`.

> **Reflexión:** ¿Por qué se recomienda la conversión **explícita** frente a la implícita?

---

## Nivel 2 — Lógica con NULL y estructura IF

### Ejercicio 2.4 — Lógica trivaluada

Sin ejecutar código, indica el valor (`TRUE`, `FALSE` o `NULL`) de cada expresión, dado que `A = 5`, `B = NULL`, `C = 10`:

```
a) A < C
b) B = NULL
c) B IS NULL
d) A < B
e) NOT (B IS NULL)
f) A < C AND B IS NULL
g) A < B OR C > A
h) NOT (A > C)
```

---

### Ejercicio 2.5 — Clasificación de empleados

Escribe un bloque PL/SQL que lea el salario del empleado con `DNI = 99` y clasifique su situación:

- Si el salario es `NULL`: mostrar `'Salario no registrado'`
- Si el salario es menor de 1.500: mostrar `'Salario bajo'`
- Si está entre 1.500 y 2.500 (inclusive): mostrar `'Salario medio'`
- Si supera 2.500: mostrar `'Salario alto'`

> **Atención:** el empleado con `DNI = 99` tiene salario `NULL`. Verifica que tu bloque lo gestiona correctamente.

---

### Ejercicio 2.6 — Clasificación de hoteles

Escribe un bloque que lea el número de habitaciones del hotel con `HotelID = 1` y:

- Si `Nhabs IS NULL`: `'Información no disponible'`
- Si `Nhabs < 50`: `'Hotel pequeño'`
- Si `Nhabs` entre 50 y 100: `'Hotel mediano'`
- Si `Nhabs > 100`: `'Hotel grande'`

Muestra también el nombre del hotel junto a la clasificación:  
`Hotel Sol → Hotel pequeño (45 habs.)`

---

### Ejercicio 2.7 — Error clásico con NULL (análisis)

Analiza este bloque. ¿Qué valor tendrá `C` en cada caso? Justifica por qué los dos fragmentos **no son equivalentes** cuando alguna variable puede ser `NULL`:

```sql
-- Fragmento A
IF A < B THEN C := 1; ELSE C := 2; END IF;

-- Fragmento B
IF A >= B THEN C := 2; ELSE C := 1; END IF;
```

Indica qué valor toma `C` para cada combinación:

| A | B | Fragmento A → C | Fragmento B → C |
|---|---|---|---|
| 3 | 5 | | |
| 5 | 3 | | |
| NULL | 5 | | |
| 3 | NULL | | |

---

## Nivel 3 — Bucles

### Ejercicio 2.8 — Tres bucles, el mismo resultado

Crea una tabla temporal y rellénala usando **tres bloques separados**, cada uno con un tipo de bucle distinto (`LOOP`, `WHILE`, `FOR`). Todos deben insertar los números del 1 al 20:

```sql
CREATE TABLE Numeros_Temp (Valor NUMBER);
```

Para cada bloque, antes de ejecutarlo haz `DELETE FROM Numeros_Temp` y después verifica con `SELECT COUNT(*) FROM Numeros_Temp` que hay exactamente 20 filas.

---

### Ejercicio 2.9 — Tabla de multiplicar

Escribe un bloque con **bucles anidados** que muestre la tabla de multiplicar del 1 al 5 en el siguiente formato:

```
1 x 1 = 1
1 x 2 = 2
...
1 x 5 = 5
2 x 1 = 2
...
5 x 5 = 25
```

> **Pista:** Usa dos bucles FOR anidados.

---

### Ejercicio 2.10 — Suma con condición de salida

Escribe un bloque con un bucle `WHILE` que:

1. Parta de `i = 1` y `suma = 0`.
2. En cada iteración añada `i` a `suma` y sume 1 a `i`.
3. Se detenga cuando `suma` supere 100.
4. Muestre: `La suma 1+2+...+N supera 100 en N = VALOR, suma = VALOR`

> **Matemáticas:** comprueba el resultado con la fórmula `N*(N+1)/2`.

---

### Ejercicio 2.11 — Subida de precios controlada

Escribe un bloque que suba el `PrecioHab` de **todos los hoteles** un 5 % por iteración, usando un bucle `LOOP`, hasta que el precio medio de todos los hoteles supere 200 €. Al final muestra cuántas iteraciones fueron necesarias y el precio medio resultante.

> **Atención:** Usa `ROLLBACK` al final para no alterar los datos de prueba.

---

## Nivel 4 — Reto

### Ejercicio 2.12 — FizzBuzz con PL/SQL

Escribe un bloque PL/SQL que recorra los números del 1 al 30 y muestre:

- `'Fizz'` si el número es divisible por 3
- `'Buzz'` si es divisible por 5
- `'FizzBuzz'` si es divisible por ambos
- El propio número en caso contrario

> **Operador útil:** `MOD(numero, divisor)` devuelve el resto de la división.

---

### Ejercicio 2.13 — Investigación: CASE

PL/SQL también tiene la estructura `CASE`, que no se ha visto en clase. Investiga su sintaxis y reescribe el ejercicio 2.5 (clasificación de empleados) usando `CASE` en lugar de `IF-ELSIF-ELSE`.

Existen dos formas:
- `CASE variable WHEN valor1 THEN ... WHEN valor2 THEN ... END CASE;`
- `CASE WHEN condicion1 THEN ... WHEN condicion2 THEN ... END CASE;`

¿Cuál de las dos necesitas para el ejercicio 2.5? ¿Por qué?
