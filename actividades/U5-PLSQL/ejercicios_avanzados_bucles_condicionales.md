# Ejercicios Avanzados — Bucles y Condicionales en PL/SQL

## Esquema de tablas

Todos los ejercicios trabajan sobre las siguientes tablas. Créalas y carga los datos antes de empezar:

```sql
CREATE TABLE Empleados (
  DNI     NUMBER        PRIMARY KEY,
  Nombre  VARCHAR2(100) NOT NULL,
  Salario NUMBER(8,2),
  Dpto    NUMBER,
  Nivel   NUMBER(1) CHECK (Nivel BETWEEN 1 AND 5)
);

CREATE TABLE Departamentos (
  NumDpto    NUMBER        PRIMARY KEY,
  NombreDpto VARCHAR2(100),
  Presupuesto NUMBER(12,2),
  Num_Emp    NUMBER DEFAULT 0
);

CREATE TABLE Pieza (
  P#      NUMBER        PRIMARY KEY,
  Nombre  VARCHAR2(100) NOT NULL,
  Peso    NUMBER(8,3),
  Precio  NUMBER(8,2),
  Stock   NUMBER DEFAULT 0
);

CREATE TABLE Movimientos (
  ID        NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  Pieza_ID  NUMBER REFERENCES Pieza(P#),
  Tipo      CHAR(1) CHECK (Tipo IN ('E','S')),  -- E=Entrada, S=Salida
  Cantidad  NUMBER,
  Fecha     DATE
);

-- Datos de prueba
INSERT INTO Departamentos VALUES (10, 'Ventas',      50000,  4);
INSERT INTO Departamentos VALUES (20, 'Informática', 80000,  5);
INSERT INTO Departamentos VALUES (30, 'RRHH',        30000,  2);
INSERT INTO Departamentos VALUES (40, 'Dirección',   120000, 1);

INSERT INTO Empleados VALUES (1,  'Ana García',    2500, 10, 3);
INSERT INTO Empleados VALUES (2,  'Luis Pérez',    1800, 10, 2);
INSERT INTO Empleados VALUES (3,  'Marta López',   3200, 20, 4);
INSERT INTO Empleados VALUES (4,  'Carlos Ruiz',   2900, 20, 3);
INSERT INTO Empleados VALUES (5,  'Elena Torres',  2100, 20, 2);
INSERT INTO Empleados VALUES (6,  'Pedro Díaz',    1600, 20, 1);
INSERT INTO Empleados VALUES (7,  'Sofía Núñez',   2200, 30, 3);
INSERT INTO Empleados VALUES (8,  'Javier Mora',   1950, 30, 2);
INSERT INTO Empleados VALUES (9,  'Rosa Ibáñez',   5800, 40, 5);
INSERT INTO Empleados VALUES (10, 'Miguel Vega',   NULL, 10, 2);

INSERT INTO Pieza VALUES (1, 'Tornillo M5',  0.010, 0.05, 500);
INSERT INTO Pieza VALUES (2, 'Tuerca M5',    0.008, 0.04, 300);
INSERT INTO Pieza VALUES (3, 'Arandela',     0.003, 0.02, 1000);
INSERT INTO Pieza VALUES (4, 'Perno M10',    0.050, 0.30, 150);
INSERT INTO Pieza VALUES (5, 'Remache',      0.005, 0.08, 0);
INSERT INTO Pieza VALUES (6, 'Pasador',      0.012, 0.15, 80);
INSERT INTO Pieza VALUES (7, 'Clavija',      0.020, 0.12, 25);
INSERT INTO Pieza VALUES (8, 'Espárrago M8', 0.035, 0.22, 0);

INSERT INTO Movimientos (Pieza_ID, Tipo, Cantidad, Fecha)
VALUES (1, 'E', 200, DATE '2024-01-10');
INSERT INTO Movimientos (Pieza_ID, Tipo, Cantidad, Fecha)
VALUES (1, 'S', 50,  DATE '2024-01-15');
INSERT INTO Movimientos (Pieza_ID, Tipo, Cantidad, Fecha)
VALUES (2, 'E', 100, DATE '2024-01-12');
INSERT INTO Movimientos (Pieza_ID, Tipo, Cantidad, Fecha)
VALUES (3, 'S', 200, DATE '2024-01-20');
INSERT INTO Movimientos (Pieza_ID, Tipo, Cantidad, Fecha)
VALUES (4, 'E', 50,  DATE '2024-02-01');
INSERT INTO Movimientos (Pieza_ID, Tipo, Cantidad, Fecha)
VALUES (5, 'S', 10,  DATE '2024-02-05');

COMMIT;
```

---

---

## Ejercicio 1 — Simulador de revisión salarial por rondas

### Contexto

La empresa realiza revisiones salariales **por rondas**. En cada ronda se recorren todos los empleados y se les aplica una subida según criterios. El proceso se repite hasta que el gasto total en salarios alcance o supere un **presupuesto salarial máximo** fijado de antemano, o hasta un máximo de **10 rondas** para evitar bucles infinitos.

### Reglas de subida por ronda

Dentro de cada ronda, la subida depende del nivel del empleado:

| Nivel | Subida |
|---|---|
| 1 | 3 % |
| 2 | 4 % |
| 3 | 5 % |
| 4 | 3 % (ya cobra bastante) |
| 5 | 0 % (directivos, revisión aparte) |

Adicionalmente, si el salario del empleado tras la subida supera el **doble de la media actual** de su departamento (calculada antes de la ronda), la subida se limita para que no supere ese techo.

### Lo que debe hacer el bloque

1. Declara `v_presupuesto_max NUMBER := 90000` (masa salarial máxima total que no debe superarse).
2. En cada ronda:
   - Calcula la masa salarial actual (suma de todos los salarios).
   - Si ya supera `v_presupuesto_max`, detén el proceso.
   - Para cada empleado (con salario no nulo), calcula la subida según su nivel.
   - Calcula la media salarial de su departamento **antes** de aplicar ninguna subida de la ronda.
   - Si el salario resultante supera el doble de esa media, ajusta la subida al mínimo necesario para llegar exactamente a ese techo (o no apliques subida si ya está por encima).
   - Aplica la subida con `UPDATE`.
3. Muestra al final de cada ronda: número de ronda, masa salarial antes y después, número de empleados subidos y número limitados por el techo.
4. Muestra un resumen final con el total de rondas ejecutadas y la masa salarial final.
5. Haz `ROLLBACK` para no alterar los datos.

### Salida esperada (orientativa)

```
Ronda 1: masa antes=24050 | masa después=25045 | subidos=9 | limitados=1
Ronda 2: masa antes=25045 | masa después=26097 | subidos=9 | limitados=2
...
Proceso detenido: presupuesto alcanzado en ronda 4.
Masa salarial final: 90312.50
```

---

---

## Ejercicio 2 — Reconstrucción de stock por movimientos

### Contexto

La columna `Stock` de la tabla `Pieza` puede haberse desincronizado respecto a los movimientos reales registrados en la tabla `Movimientos`. Tu bloque debe **recalcular el stock correcto** a partir del historial de movimientos y detectar inconsistencias.

### Lo que debe hacer el bloque

1. Recorre todas las piezas con un cursor.
2. Para cada pieza:
   - Calcula el stock teórico sumando entradas (`Tipo = 'E'`) y restando salidas (`Tipo = 'S'`) de la tabla `Movimientos`. Si no hay movimientos, el stock teórico es 0.
   - Compara el stock teórico con el stock actual almacenado en `Pieza.Stock`.
   - Clasifica la situación:
     - **`'OK'`**: coinciden exactamente.
     - **`'DESFASE_POSITIVO'`**: el stock real registrado es mayor que el teórico (posible pérdida no registrada).
     - **`'DESFASE_NEGATIVO'`**: el stock real es menor que el teórico (posible entrada no registrada).
     - **`'SIN_MOVIMIENTOS'`**: la pieza no tiene ningún movimiento en el historial.
3. Muestra una línea por pieza con: nombre, stock actual, stock teórico, diferencia y clasificación.
4. Cuenta cuántas piezas hay en cada categoría y muestra el resumen.
5. **Solo si la diferencia es mayor de 50 unidades en valor absoluto**, actualiza `Pieza.Stock` al valor teórico y anota la corrección en pantalla.
6. Al final indica el número total de correcciones aplicadas.
7. Haz `COMMIT` de las correcciones (no de los datos originales).

### Salida esperada (orientativa)

```
Tornillo M5   | Stock actual:  500 | Teórico:  650 | Dif: -150 | DESFASE_NEGATIVO  → CORREGIDO
Tuerca M5     | Stock actual:  300 | Teórico:  100 | Dif:  200 | DESFASE_POSITIVO  → CORREGIDO
Arandela      | Stock actual: 1000 | Teórico: -200 | Dif: 1200 | DESFASE_POSITIVO  → CORREGIDO
Perno M10     | Stock actual:  150 | Teórico:   50 | Dif:  100 | DESFASE_POSITIVO  → CORREGIDO
Remache       | Stock actual:    0 | Teórico:  -10 | Dif:   10 | DESFASE_POSITIVO
Pasador       | Stock actual:   80 | Teórico:    0 | Dif:   80 | SIN_MOVIMIENTOS   → CORREGIDO
...
Resumen: OK=1 | Desfase positivo=4 | Desfase negativo=1 | Sin movimientos=2
Correcciones aplicadas: 5
```

> **Nota:** con los datos de prueba proporcionados los resultados serán distintos a los del ejemplo. El ejemplo es solo para ilustrar el formato.

---

---

## Ejercicio 3 — Generador de tabla de amortización

### Contexto

Un préstamo de importe `C` se amortiza en `n` cuotas mensuales con tipo de interés mensual `i`. La cuota constante es:

```
cuota = C * i / (1 - (1 + i)^(-n))
```

En cada mes `k`, los intereses pagados son `saldo_pendiente * i` y la amortización de capital es `cuota - intereses`.

### Lo que debe hacer el bloque

Dado:
```sql
v_capital    NUMBER := 10000;   -- importe del préstamo
v_tasa_anual NUMBER := 0.06;    -- tipo de interés anual (6%)
v_meses      NUMBER := 12;      -- plazo en meses
```

1. Calcula la tasa mensual (`v_tasa_anual / 12`) y la cuota mensual con la fórmula anterior. Usa `POWER(base, exp)` para la potencia.
2. Usa un bucle `FOR` que recorra los meses del 1 al `v_meses`.
3. Para cada mes calcula: intereses del período, amortización de capital, saldo pendiente tras el pago.
4. **Detecta y marca** los meses especiales con un comentario adicional:
   - Si los intereses del mes superan el 50% de la cuota: marca como `'[INTERÉS ALTO]'`
   - Si la amortización supera los intereses por primera vez: marca como `'[PUNTO DE EQUILIBRIO]'` (solo la primera vez)
   - El último mes: ajusta la cuota para que el saldo quede exactamente a cero (redondeos) y marca como `'[ÚLTIMO PAGO]'`
5. Muestra una tabla formateada:

```
Mes | Cuota     | Intereses | Amortización | Saldo pendiente | Nota
----+-----------+-----------+--------------+-----------------+-----
  1 |    855.49 |     50.00 |       805.49 |        9,194.51 | [INTERÉS ALTO]
  2 |    855.49 |     45.97 |       809.52 |        8,384.99 | [INTERÉS ALTO]
...
  7 |    855.49 |     22.01 |       833.48 |        3,936.06 | [PUNTO DE EQUILIBRIO]
...
 12 |    855.52 |      4.27 |       851.25 |            0.00 | [ÚLTIMO PAGO]
```

6. Al final muestra el total de intereses pagados y el coste total del préstamo.

> **Pista para el formato:** usa `TO_CHAR(valor, '999,990.00')` y `LPAD` para alinear columnas.

---

---

## Ejercicio 4 — Clasificación iterativa de empleados con escalado dinámico

### Contexto

La empresa quiere asignar a cada empleado una **categoría de rendimiento** basada en su salario relativo dentro de su departamento, pero el criterio se ajusta dinámicamente: si en un departamento **ningún** empleado cae en la categoría `'ALTO'` tras la primera clasificación, el umbral se relaja un 10% y se reclasifica. Este proceso se repite hasta que al menos un empleado quede como `'ALTO'` o se hayan hecho 5 relajaciones.

### Criterios de clasificación (umbrales iniciales)

Para cada departamento, calcula `media` y `desviacion_tipica` del salario:

| Categoría | Condición |
|---|---|
| `'ALTO'` | `salario > media + desviacion_tipica` |
| `'MEDIO'` | `media - desviacion_tipica <= salario <= media + desviacion_tipica` |
| `'BAJO'` | `salario < media - desviacion_tipica` |
| `'SIN_DATOS'` | `salario IS NULL` |

> Para la desviación típica usa `STDDEV(Salario)` en una consulta SQL.  
> Si `STDDEV` devuelve `NULL` (departamento con un solo empleado), usa 0.

### Lo que debe hacer el bloque

1. Recorre cada departamento con un cursor externo.
2. Para cada departamento:
   - Calcula `media` y `desviacion` con `SELECT AVG / STDDEV INTO`.
   - Inicializa `factor_relajacion := 1.0` y `relajaciones := 0`.
   - Entra en un bucle `LOOP` interno que clasifica a los empleados del departamento:
     - Los umbrales son: `media ± desviacion * factor_relajacion`.
     - Cuenta cuántos quedan en `'ALTO'`.
     - Si hay al menos uno en `'ALTO'` o se han hecho 5 relajaciones: sal del bucle.
     - Si no: incrementa `relajaciones`, multiplica `factor_relajacion` por 0.9 y repite.
3. Guarda la clasificación final de cada empleado en una tabla PL/SQL (tipo registro con DNI, Nombre, Categoria, Relajaciones aplicadas).
4. Muestra los resultados agrupados por departamento e indica cuántas relajaciones fueron necesarias.
5. Muestra un resumen final con el total de empleados por categoría.

### Salida esperada (orientativa)

```
Departamento: Ventas (relajaciones: 0)
  Ana García   → ALTO   (2.500 €)
  Luis Pérez   → BAJO   (1.800 €)
  Miguel Vega  → SIN_DATOS

Departamento: Informática (relajaciones: 2)
  Marta López  → ALTO   (3.200 €)
  Carlos Ruiz  → MEDIO  (2.900 €)
  ...

RESUMEN: ALTO=3 | MEDIO=4 | BAJO=2 | SIN_DATOS=1
```

---

---

## Ejercicio 5 — Motor de reglas de descuento por volumen

### Contexto

Un sistema de ventas aplica descuentos sobre el precio de las piezas según el **volumen del pedido** y el **historial de movimientos** de esa pieza. Las reglas son acumulativas y se aplican en orden; el descuento total no puede superar el 40%.

### Tabla de reglas (en orden de aplicación)

| # | Condición | Descuento adicional |
|---|---|---|
| R1 | `cantidad_pedida >= 100` | 5 % |
| R2 | `cantidad_pedida >= 500` | 5 % adicional (total 10% si también R1) |
| R3 | La pieza ha tenido **más de 3 movimientos de salida** en el historial | 3 % |
| R4 | El stock actual cubre menos de 2 veces la cantidad pedida | −5 % (penalización: riesgo de rotura) |
| R5 | La pieza pesa menos de 0.010 kg | 2 % (piezas pequeñas, fáciles de enviar) |
| R6 | El precio unitario de la pieza es inferior a 0.10 € | −2 % (margen mínimo, no se puede descontar más) |

### Lo que debe hacer el bloque

1. Define un array de pedidos a procesar (usa una tabla PL/SQL de registros con campos `Pieza_ID` y `Cantidad_Pedida`):

```
Pedido 1: Pieza 1 (Tornillo M5),   cantidad 600
Pedido 2: Pieza 2 (Tuerca M5),     cantidad 80
Pedido 3: Pieza 3 (Arandela),      cantidad 500
Pedido 4: Pieza 4 (Perno M10),     cantidad 200
Pedido 5: Pieza 5 (Remache),       cantidad 50
Pedido 6: Pieza 7 (Clavija),       cantidad 150
```

2. Recorre los pedidos con un bucle `FOR` sobre la tabla PL/SQL.
3. Para cada pedido:
   - Lee los datos de la pieza (nombre, precio, peso, stock) con `SELECT INTO`.
   - Calcula los movimientos de salida históricos con otra `SELECT INTO`.
   - Evalúa **cada regla** con un bloque `IF` independiente y acumula el descuento.
   - **Limita** el descuento total al 40%.
   - Calcula el precio final unitario y el importe total del pedido.
   - Muestra el desglose completo de reglas aplicadas.
4. Al terminar todos los pedidos, muestra el pedido con mayor descuento total y el de mayor importe.

### Salida esperada (orientativa)

```
═══════════════════════════════════════════════════
Pedido 1: Tornillo M5 × 600 uds.
  Precio base:      0.05 €
  R1 (+5%):         cantidad >= 100        ✓
  R2 (+5%):         cantidad >= 500        ✓
  R3 (+3%):         >3 salidas históricas  ✓
  R4 (-5%):         stock insuficiente     ✓
  R5 (+2%):         peso < 0.010 kg        ✓
  R6 (-2%):         precio < 0.10€         ✓
  Descuento total:  8% (limitado a máx 40%)
  Precio final:     0.0460 €
  IMPORTE TOTAL:    27.60 €
═══════════════════════════════════════════════════

...

MEJOR DESCUENTO:  Pedido 3 — Arandela (descuento 15%)
MAYOR IMPORTE:    Pedido 4 — Perno M10 (importe 52.20 €)
```
