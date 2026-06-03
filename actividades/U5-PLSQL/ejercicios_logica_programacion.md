# Ejercicios de Lógica — Antes de escribir código, piensa

> **Para el alumno:** En esta relación, lo importante no es escribir PL/SQL
> rápido. Es pensar despacio. Cada ejercicio te pide que respondas preguntas,
> rellenes huecos o dibujes un esquema **antes** de ver o escribir código.
> Si te saltas esa parte y vas directamente al teclado, el ejercicio no sirve.

---

## Tablas de trabajo

```sql
CREATE TABLE Hotel (
  HotelID      NUMBER        PRIMARY KEY,
  Nombre       VARCHAR2(100),
  Nhabs        NUMBER,
  PrecioHab    NUMBER(8,2),
  TienePiscina CHAR(1),
  Calif        NUMBER(1)
);

CREATE TABLE Empleados (
  DNI     NUMBER PRIMARY KEY,
  Nombre  VARCHAR2(100),
  Salario NUMBER(8,2),
  Dpto    NUMBER
);

INSERT INTO Hotel VALUES (1, 'Hotel Sol',    45,  80.00, 'N', 3);
INSERT INTO Hotel VALUES (2, 'Hotel Mar',    80, 120.00, 'S', 4);
INSERT INTO Hotel VALUES (3, 'Hotel Costa', 120, 200.00, 'S', 5);
INSERT INTO Hotel VALUES (4, 'Hotel Prado',  30,  60.00, 'N', 2);
INSERT INTO Hotel VALUES (5, 'Hotel Centro', 95, 150.00, 'S', 4);

INSERT INTO Empleados VALUES (1, 'Ana',    2500, 10);
INSERT INTO Empleados VALUES (2, 'Luis',   1800, 10);
INSERT INTO Empleados VALUES (3, 'Marta',  3200, 20);
INSERT INTO Empleados VALUES (4, 'Carlos', 2900, 20);
INSERT INTO Empleados VALUES (5, 'Elena',  NULL, 20);
COMMIT;
```

---
---

## Ejercicio 1 — ¿Qué datos necesito y de dónde vienen?

> **Concepto trabajado:** distinguir qué información viene de la BD,
> cuál se calcula y cuál simplemente se muestra.

---

### El enunciado

> *"Muestra si el Hotel Sol es caro o barato. Se considera caro
> si su precio supera 100 €."*

---

### Paso 1 — Identifica qué necesitas saber

Contesta antes de escribir nada:

- ¿Qué dato necesito para resolver el problema? `______________`
- ¿Ese dato lo tengo en la BD o lo invento yo? `______________`
- ¿En qué tabla y columna está? `______________`
- ¿Cómo sé de qué hotel concretamente quiero el dato? `______________`

---

### Paso 2 — Decide qué variables hacen falta

Completa la tabla. No escribas código, solo rellena los huecos:

| Variable | ¿Para qué sirve? | Tipo aproximado |
|---|---|---|
| `v_precio` | guardar el precio que leo de la BD | `NUMBER` |
| ¿necesito más? | | |

---

### Paso 3 — Escribe el plan en palabras

Escribe los pasos de tu programa en español, numerados, sin ningún símbolo de PL/SQL:

```
1. Ir a la tabla Hotel y leer el precio del Hotel Sol.
2. Guardar ese precio en una variable.
3. Si el precio es mayor de 100...
   ...mostrar "caro"
   Si no...
   ...mostrar "barato"
```

---

### Paso 4 — Ahora escribe el código

Traduce tu plan del paso 3 a PL/SQL. Si el código no coincide con tu plan,
corrige el plan, no el código.

---
---

## Ejercicio 2 — ¿Qué cambia y qué no cambia?

> **Concepto trabajado:** distinguir qué es un dato fijo (constante),
> qué es un dato que varía (variable) y qué es un resultado que se calcula.

---

### El enunciado

> *"Para el hotel con HotelID = 2, sube su precio un 15 %
> si tiene piscina, o un 5 % si no tiene."*

---

### Paso 1 — Clasifica cada elemento

Coloca cada elemento en su columna:

**Elementos:** `HotelID = 2`, `precio actual`, `15%`, `5%`,
`¿tiene piscina?`, `precio nuevo`, `la subida que corresponde`

| Dato fijo (no cambia) | Dato que leo de la BD | Resultado que calculo |
|---|---|---|
| | | |

---

### Paso 2 — ¿Qué viene antes?

Ordena estas acciones. Pon 1 al primero, 2 al segundo, etc.:

```
___ Actualizar el precio en la BD con UPDATE
___ Leer el precio actual del hotel
___ Calcular cuánto es el 15% (o el 5%) del precio actual
___ Leer si el hotel tiene piscina
___ Decidir qué porcentaje aplicar
___ Mostrar el precio antiguo y el nuevo
```

---

### Paso 3 — El IF en palabras

Escribe la condición y las dos ramas del `IF` en español sin código:

```
SI  ________________________
    entonces: subida = _____
SI NO
    entonces: subida = _____
```

---

### Paso 4 — Ahora escribe el código

Usa el orden que definiste en el paso 2 y la condición del paso 3.
Comprueba el resultado con un `SELECT` antes de hacer `COMMIT`.

---
---

## Ejercicio 3 — Trazar lo que hace un bucle

> **Concepto trabajado:** entender qué hace un bucle leyéndolo,
> antes de escribir uno propio.

---

### Paso 1 — Lee el bucle y traza su ejecución

Sin ejecutar el código, rellena la tabla indicando el valor de cada variable
al **final** de cada iteración:

```sql
DECLARE
  v_num  NUMBER := 1;
  v_suma NUMBER := 0;
BEGIN
  WHILE v_num <= 5 LOOP
    v_suma := v_suma + v_num;
    v_num  := v_num + 1;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Resultado: ' || v_suma);
END;
```

| Iteración | `v_num` al entrar | `v_suma` antes de sumar | `v_suma` después de sumar | `v_num` al salir |
|---|---|---|---|---|
| 1 | 1 | 0 | | |
| 2 | | | | |
| 3 | | | | |
| 4 | | | | |
| 5 | | | | |
| (sale) | 6 | | | |

¿Qué muestra `PUT_LINE`? `__________`
¿Cuántas veces se ejecuta el cuerpo del bucle? `__________`

---

### Paso 2 — Detecta el error

El siguiente bucle tiene un problema lógico. Encuéntralo y explícalo:

```sql
DECLARE
  v_num  NUMBER := 1;
  v_suma NUMBER := 0;
BEGIN
  WHILE v_num <= 5 LOOP
    v_num  := v_num + 1;
    v_suma := v_suma + v_num;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Resultado: ' || v_suma);
END;
```

Traza las primeras dos iteraciones para demostrar el error:

| Iteración | `v_num` al entrar | `v_num` después de +1 | `v_suma` después de sumar |
|---|---|---|---|
| 1 | 1 | | |
| 2 | | | |

¿Cuál es el problema? ¿Qué resultado incorrecto da?

---

### Paso 3 — ¿Qué bucle necesito?

Para cada situación decide si usarías `FOR` o `WHILE` y explica por qué
en una frase:

| Situación | ¿FOR o WHILE? | ¿Por qué? |
|---|---|---|
| Subir el precio de un hotel un 5% hasta que supere 200 € | | |
| Mostrar los hoteles con HotelID del 1 al 5 | | |
| Doblar un número hasta que supere 1000 | | |
| Calcular la suma de 1 + 2 + ... + 20 | | |

---
---

## Ejercicio 4 — El mapa del programa

> **Concepto trabajado:** diseñar la estructura completa de un programa
> antes de escribir una sola línea de código.

---

### El enunciado

> *"Para cada hotel, muestra su nombre y clasifícalo como
> 'Económico' (menos de 100 €), 'Estándar' (entre 100 y 150 €)
> o 'Premium' (más de 150 €).
> Al final muestra cuántos hay en cada categoría."*

---

### Paso 1 — ¿Cuántas filas procesas?

- ¿El programa trabaja con un solo hotel o con varios? `__________`
- ¿Necesitas un bucle? `__________`
- ¿Qué tipo de estructura recorre varias filas de una tabla? `__________`

---

### Paso 2 — Dibuja el flujo

Completa este esquema con palabras (no código):

```
INICIO
  │
  ├─ Declarar: _________________________
  │
  ├─ Abrir cursor sobre: _______________
  │
  └─ BUCLE ────────────────────────────┐
       │                               │
       ├─ Leer siguiente hotel         │
       ├─ Si no hay más → SALIR ───────┘
       │
       ├─ SI precio < 100
       │     → ________________________
       │     → sumar 1 a: ______________
       │
       ├─ SI precio entre 100 y 150
       │     → ________________________
       │     → sumar 1 a: ______________
       │
       └─ SI precio > 150
             → ________________________
             → sumar 1 a: ______________

  Cerrar cursor
  Mostrar resumen: ____________________
FIN
```

---

### Paso 3 — Variables del programa

Lista todas las variables que necesitas. Para cada una indica su nombre,
para qué sirve y si su valor cambia en cada iteración del bucle:

| Nombre | Para qué sirve | ¿Cambia en cada iteración? |
|---|---|---|
| `UnHotel` | guardar los datos del hotel actual | Sí |
| `v_economicos` | | |
| | | |

---

### Paso 4 — Escribe el código

Usa el mapa del paso 2 y las variables del paso 3.
Si en algún momento el código no sigue el mapa, vuelve al mapa y corrígelo.

---
---

## Ejercicio 5 — Encontrar el error lógico

> **Concepto trabajado:** leer código ajeno, entender qué hace
> y detectar por qué no hace lo que debería.

---

### Código con errores lógicos

El siguiente bloque pretende mostrar todos los hoteles con precio
superior a 100 €, marcando con `'★'` los que además tienen piscina.
Tiene **tres errores lógicos** (no de sintaxis: el código se ejecuta sin errores
de compilación, pero el resultado es incorrecto). Encuéntralos:

```sql
DECLARE
  CURSOR C IS SELECT * FROM Hotel WHERE PrecioHab > 100;
  UnHotel C%ROWTYPE;
BEGIN
  OPEN C;
  LOOP
    EXIT WHEN C%NOTFOUND;          -- línea A
    FETCH C INTO UnHotel;          -- línea B
    IF TienePiscina = 'S' THEN     -- línea C
      DBMS_OUTPUT.PUT_LINE(UnHotel.Nombre || ' ★');
    ELSE
      DBMS_OUTPUT.PUT_LINE(UnHotel.Nombre);
    END IF;
  END LOOP;
  CLOSE C;
END;
```

---

### Para cada error

Describe qué hace la línea incorrecta, qué debería hacer
y cómo lo corregirías:

**Error 1 — líneas A y B:**

- ¿Qué pasa si `EXIT WHEN` va antes del `FETCH`? Traza la última iteración:
  ```
  Iteración final (ya no hay más filas):
    EXIT WHEN C%NOTFOUND → ¿vale TRUE o FALSE en este momento? ______
    FETCH C INTO UnHotel → ¿qué contiene UnHotel ahora? ______
  ```
- ¿Cómo se corrige?

**Error 2 — línea C:**

- ¿Falta algo antes de `TienePiscina`? ¿Cuál es la forma correcta de acceder al campo?

**Error 3 — (reflexión):**

- Si la tabla `Hotel` está vacía, ¿se ejecuta el cuerpo del bucle alguna vez?
  ¿Supone eso algún problema con la versión corregida?

---
---

## Ejercicio 6 — De español a código

> **Concepto trabajado:** traducir un enunciado en lenguaje natural
> a estructura de programa, paso a paso.

---

### El enunciado

> *"Sube el salario de los empleados del departamento 10
> según su salario actual:
> — Si gana menos de 2.000 €: súbelo un 10 %.
> — Si gana entre 2.000 y 3.000 €: súbelo un 5 %.
> — Si gana más de 3.000 €: no se toca.
> — Si no tiene salario registrado: muestra un aviso.
> Al final confirma los cambios."*

---

### Paso 1 — Subraya los datos

En el enunciado anterior:
- Rodea con un círculo los **datos que vienen de la BD**.
- Subraya los **números fijos** (umbrales, porcentajes).
- Marca con una flecha las **acciones** que el programa debe realizar.

---

### Paso 2 — ¿Cuántos empleados?

- ¿El programa trabaja con uno o varios empleados? `__________`
- ¿Necesitas un cursor o un `SELECT INTO`? `__________`
- ¿Qué pasa con los empleados de otros departamentos? `__________`

---

### Paso 3 — El árbol de decisiones

Dibuja las ramas del `IF` antes de escribir código.
Ten en cuenta que hay cuatro situaciones posibles y el orden importa:

```
Salario del empleado
       │
       ├─ ES NULL → ________________________________
       │
       ├─ ES menor de 2.000 → _____________________
       │
       ├─ ESTÁ entre 2.000 y 3.000 → _______________
       │
       └─ ES mayor de 3.000 → _____________________
```

> **Pregunta:** ¿Por qué hay que comprobar `NULL` antes de comparar
> con los números? ¿Qué pasaría si lo comprobas al final?

---

### Paso 4 — Escribe el código

Usa el cursor y el árbol de decisiones que diseñaste.
Comprueba el resultado con un `SELECT` antes del `COMMIT`.

---
---

## Ejercicio 7 — ¿Qué devuelve este código?

> **Concepto trabajado:** leer código y predecir su salida
> sin ejecutarlo, usando los datos de las tablas.

---

### Datos actuales de la tabla

| HotelID | Nombre | Nhabs | PrecioHab | TienePiscina | Calif |
|---|---|---|---|---|---|
| 1 | Hotel Sol | 45 | 80 | N | 3 |
| 2 | Hotel Mar | 80 | 120 | S | 4 |
| 3 | Hotel Costa | 120 | 200 | S | 5 |
| 4 | Hotel Prado | 30 | 60 | N | 2 |
| 5 | Hotel Centro | 95 | 150 | S | 4 |

---

### Bloque A — Predice la salida

```sql
DECLARE
  v_count NUMBER;
  v_media NUMBER;
BEGIN
  SELECT COUNT(*), AVG(PrecioHab)
  INTO   v_count, v_media
  FROM   Hotel
  WHERE  TienePiscina = 'S';

  IF v_media > 150 THEN
    DBMS_OUTPUT.PUT_LINE('Media alta: ' || ROUND(v_media, 0));
  ELSE
    DBMS_OUTPUT.PUT_LINE('Media normal: ' || ROUND(v_media, 0));
  END IF;
  DBMS_OUTPUT.PUT_LINE('Hoteles con piscina: ' || v_count);
END;
```

Antes de ejecutarlo escribe qué esperas ver:

```
Línea 1: ________________________________
Línea 2: ________________________________
```

Luego ejecútalo. ¿Coincide? Si no coincide, ¿en qué te equivocaste?

---

### Bloque B — Traza el cursor

```sql
DECLARE
  CURSOR C IS
    SELECT Nombre, PrecioHab FROM Hotel
    WHERE  Calif >= 4
    ORDER  BY PrecioHab;
  UnHotel C%ROWTYPE;
  v_total NUMBER := 0;
BEGIN
  OPEN C;
  LOOP
    FETCH C INTO UnHotel;
    EXIT WHEN C%NOTFOUND;
    v_total := v_total + UnHotel.PrecioHab;
    DBMS_OUTPUT.PUT_LINE(UnHotel.Nombre);
  END LOOP;
  CLOSE C;
  DBMS_OUTPUT.PUT_LINE('Total: ' || v_total);
END;
```

Rellena la tabla **usando los datos de arriba** sin ejecutar el código:

| Iteración | Hotel leído | PrecioHab | v_total acumulado |
|---|---|---|---|
| 1 | | | |
| 2 | | | |
| 3 | | | |
| (sale) | — | — | |

¿Qué líneas aparecen por pantalla y en qué orden?

---
---

## Ejercicio 8 — Descomponer un problema complejo

> **Concepto trabajado:** cuando un problema parece difícil,
> dividirlo en problemas más pequeños que ya sabes resolver.

---

### El enunciado

> *"Para cada departamento muestra su número, el número de empleados
> que tiene y el salario medio. Si el salario medio es inferior a 2.200 €,
> márcalo como 'Departamento en riesgo'."*

---

### Paso 1 — Divide el problema

Este problema tiene dos partes independientes. Identifícalas y resuélvelas por separado:

**Subproblema A** (más sencillo, no necesita bucle):

> *"Muestra el número de empleados y el salario medio
> del departamento 10."*

Escribe y prueba este bloque primero. Cuando funcione, pasa al siguiente.

---

**Subproblema B** (añade el bucle):

> *"Repite lo anterior para todos los departamentos."*

¿Qué necesitas añadir al subproblema A para que funcione para todos?
Escribe solo las diferencias, no repitas el código completo:

```
Necesito añadir: ________________________________
Necesito cambiar: ________________________________
El número de departamento ya no es fijo, sino: ___
```

---

### Paso 2 — Añade la condición

Ahora que el bucle funciona, añade el `IF` que marca los departamentos en riesgo.
¿Qué variable ya tienes del paso anterior que puedes usar en el `IF`? `__________`

---

### Paso 3 — El código completo

Ensambla las dos partes. El código completo no debería sorprenderte:
ya lo tienes todo resuelto por partes.

---
---

## Ejercicio 9 — Razonar sobre NULL

> **Concepto trabajado:** entender cómo el valor NULL afecta
> a las condiciones y por qué es necesario tratarlo antes de comparar.

---

### Paso 1 — Verdadero o falso

Dado que `v_sal = NULL`, indica si cada expresión es `TRUE`, `FALSE` o `NULL`:

| Expresión | Resultado |
|---|---|
| `v_sal > 1000` | |
| `v_sal = NULL` | |
| `v_sal IS NULL` | |
| `v_sal < 5000` | |
| `NOT (v_sal IS NULL)` | |
| `v_sal > 1000 OR v_sal IS NULL` | |
| `v_sal > 1000 AND v_sal IS NULL` | |

---

### Paso 2 — El IF trampa

El siguiente bloque intenta clasificar el salario del empleado con DNI = 5
(que tiene salario `NULL`). ¿Qué rama del `IF` se ejecuta? ¿Es la correcta?

```sql
DECLARE
  v_sal Empleados.Salario%TYPE;
BEGIN
  SELECT Salario INTO v_sal FROM Empleados WHERE DNI = 5;

  IF v_sal < 2000 THEN
    DBMS_OUTPUT.PUT_LINE('Salario bajo');
  ELSIF v_sal >= 2000 THEN
    DBMS_OUTPUT.PUT_LINE('Salario normal');
  END IF;
END;
```

- ¿Qué vale `v_sal` después del `SELECT INTO`? `__________`
- `v_sal < 2000` → ¿TRUE, FALSE o NULL? `__________`
- `v_sal >= 2000` → ¿TRUE, FALSE o NULL? `__________`
- ¿Qué muestra el programa? `__________`
- ¿Es el resultado correcto? ¿Cómo lo arreglarías?

---

### Paso 3 — La regla

Completa esta regla general con tus palabras:

> *"Antes de comparar una variable con un número, siempre debo comprobar
> primero si esa variable es _______, porque si lo es, cualquier comparación
> devolverá _______ y ninguna rama del IF se ejecutará."*

---

### Paso 4 — Aplícala

Reescribe el bloque del paso 2 de forma correcta. El orden de las comprobaciones
en el `IF` debe seguir la regla que acabas de escribir.

---
---

## Ejercicio 10 — Diseña el programa tú solo

> **Concepto trabajado:** aplicar todo el proceso de los ejercicios anteriores
> a un enunciado nuevo, sin guía de pasos.

---

### El enunciado

> *"Recorre todos los hoteles. Para cada uno:
> — Si su precio es mayor que el precio medio de todos los hoteles,
>   márcalo como 'Por encima de la media' y auméntalo un 3 %.
> — Si su precio es igual o menor que la media,
>   márcalo como 'En la media o por debajo' y no lo toques.
> Al terminar muestra cuántos hoteles se han subido
> y cuál es el nuevo precio medio."*

---

### Tu proceso (obligatorio antes de escribir código)

Responde estas preguntas en este orden. Usa el espacio que necesites:

**1. ¿Qué datos necesito de la BD antes de entrar al bucle?**

```
_______________________________________________
```

**2. ¿Qué variables necesito? (nombre y para qué sirve cada una)**

```
_______________________________________________
```

**3. ¿Qué hace el programa para cada hotel? Escríbelo en español:**

```
Para cada hotel:
  1. ____________________________________________
  2. SI ________________________________________
        → ______________________________________
     SI NO
        → ______________________________________
```

**4. ¿Qué hace el programa después del bucle?**

```
_______________________________________________
```

**5. ¿Hay algún caso especial que pueda romper el programa?**
*(Piensa en NULLs, tablas vacías, hotel con precio igual a la media...)*

```
_______________________________________________
```

---

### Ahora escribe el código

Solo cuando hayas respondido las cinco preguntas.

Cuando termines, verifica el resultado con:
```sql
SELECT AVG(PrecioHab) FROM Hotel;
```

¿El nuevo precio medio tiene sentido respecto a lo que esperabas?
Haz `ROLLBACK` para restaurar los datos originales.
