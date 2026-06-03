# Ejercicios — Clase 3: SQL en PL/SQL y Cursores explícitos

## Esquema de referencia

```sql
Hotel         (HotelID, Nombre, Nhabs, PrecioHab, TienePiscina CHAR(1), Calif)
Empleados     (DNI, Nombre, Salario, Dpto)
Departamentos (NumDpto, NombreDpto, Num_Emp)
Pieza         (P#, Nombre, Peso, Precio)
```

---

### Ejercicio 3.1


Escribe un bloque que:

1. Declare una variable `UnHotel` usando `%ROWTYPE` sobre la tabla `Hotel`.
2. Recupere el hotel con `HotelID = 3` de la BD y lo cargue en esa variable.
3. Muestre: `Hotel 3: Hotel Costa — Precio: 200 €`

---

### Ejercicio 3.2 — Comparación de hoteles

Escribe un bloque que:

1. Lea en un registro el hotel con menor precio de la BD (`MIN(PrecioHab)`).  
   *(Pista: necesitarás dos SELECT INTO: uno para el precio mínimo y otro para el hotel.)*
2. Lea en otro registro el hotel con mayor precio.
3. Muestre ambos hoteles y la diferencia de precio entre ellos.

---


### Ejercicio 3.3 — SELECT INTO con funciones de agregación

Escribe un bloque que calcule y muestre en un solo bloque:

- Número total de hoteles
- Precio medio de habitación (redondeado a 2 decimales)
- Hotel más caro (nombre y precio)
- Hotel más barato (nombre y precio)

Usa variables individuales y `%TYPE` para todas las declaraciones.

---

### Ejercicio 3.4 — Actualización basada en SELECT INTO

Escribe un bloque que:

1. Calcule el `PrecioHab` medio de todos los hoteles.
2. Suba un 20% el precio de todos los hoteles que tengan un precio inferior a esa media.
3. Muestre el número de hoteles actualizados usando `SQL%ROWCOUNT`.
4. Haga `ROLLBACK` para no alterar los datos.

---

### Ejercicio 3.5 — Gestión de un empleado

Escribe un bloque que gestione el empleado con `DNI = 3`:

1. Lea todos sus datos en un `%ROWTYPE`.
2. Si su salario es menor que el salario medio de su departamento, auméntalo hasta la media.
3. Si ya está por encima, muestra `'El salario ya supera la media del departamento'`.
4. En cualquier caso, muestra el salario final del empleado.
5. Haz `COMMIT` si se modificó, `ROLLBACK` si no.

---


### Ejercicio 3.6 — Primer cursor con LOOP

Escribe un bloque completo que use un cursor con bucle `LOOP` para listar todos los hoteles que tengan piscina (`TienePiscina = 'S'`), mostrando su nombre y precio por habitación. Al final indica cuántos hoteles se han listado usando `%ROWCOUNT`.

---

### Ejercicio 3.7 — Cursor con WHILE

Reescribe el ejercicio 4.2 usando un bucle `WHILE`. Recuerda que con WHILE hay que hacer un FETCH antes de entrar al bucle y otro al final de cada iteración.

> ¿Qué ocurre si olvidas el FETCH inicial?

---

### Ejercicio 3.8 — Cursor con FOR

Reescribe el ejercicio 4.2 usando un bucle `FOR cursor`. Compara los tres bloques (LOOP, WHILE, FOR): ¿cuál es más conciso? ¿En qué casos preferirías LOOP o WHILE sobre FOR?

---

### Ejercicio 3.9 — Ecotasa hotelera

Escribe un bloque con cursor que aplique la siguiente lógica a todos los hoteles:

- Si tiene piscina y más de 80 habitaciones: subir `PrecioHab` en 15 €
- Si tiene piscina y 80 o menos habitaciones: subir `PrecioHab` en 8 €
- Si no tiene piscina y más de 80 habitaciones: subir `PrecioHab` en 5 €
- Si no tiene piscina y 80 o menos habitaciones: no modificar

Muestra un resumen al final con cuántos hoteles de cada categoría se han procesado. Haz `ROLLBACK` al terminar.

---

### Ejercicio 3.10 — Cursor sobre múltiples tablas

Escribe un bloque con cursor que liste todos los empleados junto con el nombre de su departamento. Para cada empleado muestra:  
`Ana García (Dpto: Ventas) — Salario: 2.500 €`

> **Pista:** El cursor puede contener un `JOIN` entre `Empleados` y `Departamentos`.






