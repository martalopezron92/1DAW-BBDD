# Ejercicios de Recuperación – DML en Oracle

> **Asignatura:** BBDD – 1º DAW  
> **Tema:** DML (Data Manipulation Language) – Consultas `SELECT`  
> **Herramienta:** Oracle + DBeaver  
> **Contenidos:** `JOIN`, subconsultas, `GROUP BY`, `HAVING`, `WHERE`, `ORDER BY`, `CASE WHEN`.

Este cuaderno de ejercicios está pensado para los alumnos que han suspendido el examen de recuperación. Contiene **30 ejercicios de dificultad incremental** sobre un esquema nuevo para practicar los mismos conceptos que se evalúan.

**Nota:** Se omiten funciones específicas de Oracle; se trabaja con la sintaxis estándar de SQL vistas en clase.

---

## Esquema de base de datos: Tienda online

### Tablas

```sql
CREATE TABLE CATEGORIAS (
    COD_CAT    NUMBER(2) PRIMARY KEY,
    NOMBRE_CAT VARCHAR2(30) NOT NULL
);

CREATE TABLE PRODUCTOS (
    COD_PROD   NUMBER(4) PRIMARY KEY,
    NOMBRE_PROD VARCHAR2(50) NOT NULL,
    COD_CAT    NUMBER(2) NOT NULL,
    PRECIO_PROD NUMBER(6,2) NOT NULL,
    STOCK_PROD  NUMBER(4) NOT NULL,
    CONSTRAINT FK_PROD_CAT FOREIGN KEY (COD_CAT) REFERENCES CATEGORIAS(COD_CAT)
);

CREATE TABLE CLIENTES (
    COD_CLI       NUMBER(4) PRIMARY KEY,
    NOMBRE_CLI    VARCHAR2(30) NOT NULL,
    CIUDAD_CLI    VARCHAR2(20) NOT NULL,
    FECHA_ALTA_CLI DATE NOT NULL
);

CREATE TABLE EMPLEADOS (
    COD_EMP    NUMBER(4) PRIMARY KEY,
    NOMBRE_EMP VARCHAR2(30) NOT NULL,
    CIUDAD_EMP VARCHAR2(20) NOT NULL,
    CARGO_EMP  VARCHAR2(20) NOT NULL,
    SALARIO_EMP NUMBER(8,2) NOT NULL,
    COD_JEFE   NUMBER(4),
    CONSTRAINT FK_EMP_JEFE FOREIGN KEY (COD_JEFE) REFERENCES EMPLEADOS(COD_EMP)
);

CREATE TABLE VENTAS (
    COD_VENTA NUMBER(6) PRIMARY KEY,
    COD_CLI   NUMBER(4) NOT NULL,
    COD_PROD  NUMBER(4) NOT NULL,
    COD_EMP   NUMBER(4) NOT NULL,
    CANTIDAD  NUMBER(3) NOT NULL,
    FECHA_VENTA DATE NOT NULL,
    CONSTRAINT FK_VEN_CLI FOREIGN KEY (COD_CLI) REFERENCES CLIENTES(COD_CLI),
    CONSTRAINT FK_VEN_PROD FOREIGN KEY (COD_PROD) REFERENCES PRODUCTOS(COD_PROD),
    CONSTRAINT FK_VEN_EMP FOREIGN KEY (COD_EMP) REFERENCES EMPLEADOS(COD_EMP)
);
```

### Datos de ejemplo

```sql
-- CATEGORIAS
INSERT INTO CATEGORIAS VALUES (1, 'Informática');
INSERT INTO CATEGORIAS VALUES (2, 'Libros');
INSERT INTO CATEGORIAS VALUES (3, 'Música');
INSERT INTO CATEGORIAS VALUES (4, 'Hogar');
INSERT INTO CATEGORIAS VALUES (5, 'Deportes');

-- PRODUCTOS
INSERT INTO PRODUCTOS VALUES (1001, 'Disco Duro SSD 500GB', 1,  55.00,  20);
INSERT INTO PRODUCTOS VALUES (1002, 'Ratón inalámbrico',    1,  18.50,  35);
INSERT INTO PRODUCTOS VALUES (1003, 'Teclado mecánico',     1,  75.00,  15);
INSERT INTO PRODUCTOS VALUES (1004, 'Monitor 24 pulgadas',  1, 140.00,   8);
INSERT INTO PRODUCTOS VALUES (1005, 'Oracle para novatos',  2,  22.00,  40);
INSERT INTO PRODUCTOS VALUES (1006, 'SQL básico',           2,  19.50,  30);
INSERT INTO PRODUCTOS VALUES (1007, 'Álbum rock clásico',   3,  12.00,  25);
INSERT INTO PRODUCTOS VALUES (1008, 'CD pop internacional', 3,  14.00,  20);
INSERT INTO PRODUCTOS VALUES (1009, 'Lámpara de escritorio',4,  32.00,  12);
INSERT INTO PRODUCTOS VALUES (1010, 'Set de sartenes',      4,  48.00,  10);
INSERT INTO PRODUCTOS VALUES (1011, 'Balón de fútbol',      5,  21.00,  22);
INSERT INTO PRODUCTOS VALUES (1012, 'Cuerda de saltar',     5,   8.50,  50);

-- CLIENTES
INSERT INTO CLIENTES VALUES (2001, 'Ana García',     'Granada',    TO_DATE('2023-01-15','YYYY-MM-DD'));
INSERT INTO CLIENTES VALUES (2002, 'Luis Pérez',     'Sevilla',    TO_DATE('2023-02-20','YYYY-MM-DD'));
INSERT INTO CLIENTES VALUES (2003, 'María López',    'Granada',    TO_DATE('2023-03-10','YYYY-MM-DD'));
INSERT INTO CLIENTES VALUES (2004, 'Carlos Ruiz',    'Málaga',     TO_DATE('2023-04-05','YYYY-MM-DD'));
INSERT INTO CLIENTES VALUES (2005, 'Elena Torres',   'Sevilla',    TO_DATE('2023-05-12','YYYY-MM-DD'));
INSERT INTO CLIENTES VALUES (2006, 'Javier Martín',  'Málaga',     TO_DATE('2023-06-18','YYYY-MM-DD'));
INSERT INTO CLIENTES VALUES (2007, 'Sofía Navarro',  'Granada',    TO_DATE('2023-07-22','YYYY-MM-DD'));
INSERT INTO CLIENTES VALUES (2008, 'Pedro Sánchez',  'Córdoba',    TO_DATE('2023-08-30','YYYY-MM-DD'));

-- EMPLEADOS
INSERT INTO EMPLEADOS VALUES (3001, 'Beatriz Hernández', 'Granada', 'Vendedor',   1450.00, NULL);
INSERT INTO EMPLEADOS VALUES (3002, 'David Jiménez',     'Sevilla', 'Vendedor',   1380.00, 3001);
INSERT INTO EMPLEADOS VALUES (3003, 'Carmen Díaz',       'Granada', 'Vendedor',   1420.00, 3001);
INSERT INTO EMPLEADOS VALUES (3004, 'Francisco Moreno',  'Málaga',  'Vendedor',   1360.00, 3001);
INSERT INTO EMPLEADOS VALUES (3005, 'Isabel Romero',     'Sevilla', 'Responsable',2100.00, NULL);
INSERT INTO EMPLEADOS VALUES (3006, 'Antonio Vega',      'Granada', 'Almacén',    1250.00, 3005);

-- VENTAS
INSERT INTO VENTAS VALUES (5001, 2001, 1001, 3001, 2, TO_DATE('2024-01-10','YYYY-MM-DD'));
INSERT INTO VENTAS VALUES (5002, 2001, 1005, 3001, 1, TO_DATE('2024-01-15','YYYY-MM-DD'));
INSERT INTO VENTAS VALUES (5003, 2002, 1002, 3002, 1, TO_DATE('2024-01-20','YYYY-MM-DD'));
INSERT INTO VENTAS VALUES (5004, 2002, 1011, 3002, 3, TO_DATE('2024-02-05','YYYY-MM-DD'));
INSERT INTO VENTAS VALUES (5005, 2003, 1003, 3003, 1, TO_DATE('2024-02-12','YYYY-MM-DD'));
INSERT INTO VENTAS VALUES (5006, 2003, 1009, 3003, 2, TO_DATE('2024-02-18','YYYY-MM-DD'));
INSERT INTO VENTAS VALUES (5007, 2004, 1004, 3004, 1, TO_DATE('2024-03-01','YYYY-MM-DD'));
INSERT INTO VENTAS VALUES (5008, 2004, 1006, 3004, 2, TO_DATE('2024-03-08','YYYY-MM-DD'));
INSERT INTO VENTAS VALUES (5009, 2005, 1007, 3002, 4, TO_DATE('2024-03-15','YYYY-MM-DD'));
INSERT INTO VENTAS VALUES (5010, 2005, 1012, 3002, 5, TO_DATE('2024-03-22','YYYY-MM-DD'));
INSERT INTO VENTAS VALUES (5011, 2006, 1001, 3004, 1, TO_DATE('2024-04-02','YYYY-MM-DD'));
INSERT INTO VENTAS VALUES (5012, 2006, 1010, 3004, 1, TO_DATE('2024-04-10','YYYY-MM-DD'));
INSERT INTO VENTAS VALUES (5013, 2007, 1008, 3003, 2, TO_DATE('2024-04-18','YYYY-MM-DD'));
INSERT INTO VENTAS VALUES (5014, 2007, 1005, 3003, 1, TO_DATE('2024-04-25','YYYY-MM-DD'));
INSERT INTO VENTAS VALUES (5015, 2008, 1002, 3001, 2, TO_DATE('2024-05-03','YYYY-MM-DD'));
INSERT INTO VENTAS VALUES (5016, 2001, 1011, 3001, 1, TO_DATE('2024-05-12','YYYY-MM-DD'));
INSERT INTO VENTAS VALUES (5017, 2003, 1004, 3003, 1, TO_DATE('2024-05-20','YYYY-MM-DD'));
INSERT INTO VENTAS VALUES (5018, 2005, 1003, 3002, 1, TO_DATE('2024-05-28','YYYY-MM-DD'));

COMMIT;
```

---

## Ejercicios

### Nivel 1

#### Ejercicio 1
Listar el nombre y la ciudad de todos los clientes que viven en Granada. Ordenar alfabéticamente por nombre.

#### Ejercicio 2
Mostrar el nombre y el precio de los productos de la categoría "Informática" cuyo precio sea mayor a 50 €. Ordenar por precio descendente.

#### Ejercicio 3
Obtener el nombre, cargo y salario de los empleados cuyo salario esté entre 1300 € y 1500 €. Ordenar por salario ascendente.

#### Ejercicio 4
Listar los productos cuyo stock sea menor o igual a 15 unidades. Mostrar nombre del producto, stock y nombre de la categoría. Ordenar por stock ascendente.

#### Ejercicio 5
Mostrar las ventas realizadas en marzo de 2024. Indicar el código de venta, la fecha, la cantidad y el nombre del cliente. Ordenar por fecha.

---

### Nivel 2

#### Ejercicio 6
Listar el nombre de cada cliente junto con el total de ventas que ha realizado (número de compras, no importe). Ordenar de mayor a menor número de compras.

#### Ejercicio 7
Mostrar el nombre de cada producto y el nombre de su categoría. Ordenar por categoría y, dentro de ella, por nombre de producto.

#### Ejercicio 8
Obtener el nombre del cliente, el nombre del producto y la cantidad comprada de todas las ventas. Ordenar por nombre de cliente.

#### Ejercicio 9
Listar el nombre de cada empleado y el nombre de su jefe (si tiene). Ordenar por nombre de empleado.

#### Ejercicio 10
Mostrar el nombre de cada vendedor (cargo = 'Vendedor') y el número total de ventas que ha gestionado. Ordenar por número de ventas descendente.

---

### Nivel 3

#### Ejercicio 11
Mostrar el nombre del cliente, el nombre del producto, el nombre de la categoría y la cantidad de cada venta. Ordenar por fecha de venta.

#### Ejercicio 12
Listar el nombre del empleado que gestionó la venta, el nombre del cliente, el producto comprado y la fecha, solo para las ventas de productos de la categoría "Música". Ordenar por fecha.

#### Ejercicio 13
Obtener el nombre del cliente, el producto y el importe total de cada línea de venta (`cantidad × precio`). Ordenar por importe descendente.

#### Ejercicio 14
Mostrar todos los productos, incluidos los que no se han vendido, con el total de unidades vendidas de cada uno. Ordenar por unidades vendidas descendente.

#### Ejercicio 15
Listar las ciudades de los clientes y el número de ventas realizadas a clientes de cada ciudad, pero solo para las ciudades que tengan más de 2 ventas. Ordenar por número de ventas descendente.

---

### Nivel 4

#### Ejercicio 16
Calcular el importe total vendido por cada categoría. Mostrar nombre de categoría e importe total. Ordenar por importe descendente.

#### Ejercicio 17
Mostrar el nombre de cada cliente y el importe total gastado (`SUM(cantidad × precio)`). Ordenar por importe descendente.

#### Ejercicio 18
Listar los productos de los que se hayan vendido más de 2 unidades en total. Mostrar nombre del producto y total de unidades vendidas. Ordenar por unidades descendente.

#### Ejercicio 19
Obtener el nombre de cada ciudad donde trabaja al menos un empleado, junto con el salario medio de los empleados de esa ciudad. Ordenar por salario medio descendente.

#### Ejercicio 20
Mostrar el mes (nombre o número) y el número de ventas de cada mes del año 2024. Ordenar cronológicamente.

---

### Nivel 5

#### Ejercicio 21
Mostrar el nombre y el precio del producto más caro de la tienda.

#### Ejercicio 22
Listar los clientes que han comprado el producto "Disco Duro SSD 500GB". Mostrar nombre del cliente y fecha de compra. Ordenar por fecha.

#### Ejercicio 23
Obtener los productos cuyo precio sea superior al precio medio de todos los productos. Mostrar nombre y precio. Ordenar por precio descendente.

#### Ejercicio 24
Mostrar el nombre de los empleados que tienen un salario superior al salario medio de todos los empleados. Ordenar por salario descendente.

#### Ejercicio 25
Listar los clientes que no han realizado ninguna compra. Ordenar por nombre.

---

### Nivel 6

#### Ejercicio 26
Mostrar el nombre de cada cliente, el importe total gastado y una clasificación (`CASE WHEN`) que indique:
- "Cliente VIP" si ha gastado más de 200 €.
- "Cliente regular" si ha gastado entre 50 € y 200 €.
- "Cliente ocasional" si ha gastado menos de 50 €.
Ordenar por importe descendente.

#### Ejercicio 27
Listar los productos con su categoría, precio y una etiqueta (`CASE WHEN`) según su precio:
- "Económico" si precio < 15 €.
- "Medio" si precio está entre 15 € y 50 €.
- "Premium" si precio > 50 €.
Ordenar por categoría y precio.

#### Ejercicio 28
Mostrar el nombre de cada cliente que haya comprado productos de más de una categoría distinta. Indicar también cuántas categorías diferentes ha comprado. Ordenar por número de categorías descendente.

#### Ejercicio 29
Obtener el nombre del producto más vendido (el que mayor cantidad total de unidades haya vendido) y el total de unidades vendidas.

#### Ejercicio 30
Listar, para cada categoría, el producto más caro. Mostrar nombre de categoría, nombre del producto y precio. Ordenar por categoría.

---

## Soluciones

<details>
<summary>Haz clic para ver las soluciones</summary>

### Nivel 1

**Ejercicio 1**
```sql
SELECT NOMBRE_CLI, CIUDAD_CLI
FROM CLIENTES
WHERE CIUDAD_CLI = 'Granada'
ORDER BY NOMBRE_CLI;
```

**Ejercicio 2**
```sql
SELECT P.NOMBRE_PROD, P.PRECIO_PROD
FROM PRODUCTOS P
JOIN CATEGORIAS C ON P.COD_CAT = C.COD_CAT
WHERE C.NOMBRE_CAT = 'Informática' AND P.PRECIO_PROD > 50
ORDER BY P.PRECIO_PROD DESC;
```

**Ejercicio 3**
```sql
SELECT NOMBRE_EMP, CARGO_EMP, SALARIO_EMP
FROM EMPLEADOS
WHERE SALARIO_EMP BETWEEN 1300 AND 1500
ORDER BY SALARIO_EMP;
```

**Ejercicio 4**
```sql
SELECT P.NOMBRE_PROD, P.STOCK_PROD, C.NOMBRE_CAT
FROM PRODUCTOS P
JOIN CATEGORIAS C ON P.COD_CAT = C.COD_CAT
WHERE P.STOCK_PROD <= 15
ORDER BY P.STOCK_PROD;
```

**Ejercicio 5**
```sql
SELECT V.COD_VENTA, V.FECHA_VENTA, V.CANTIDAD, C.NOMBRE_CLI
FROM VENTAS V
JOIN CLIENTES C ON V.COD_CLI = C.COD_CLI
WHERE V.FECHA_VENTA BETWEEN TO_DATE('2024-03-01','YYYY-MM-DD')
                        AND TO_DATE('2024-03-31','YYYY-MM-DD')
ORDER BY V.FECHA_VENTA;
```

### Nivel 2

**Ejercicio 6**
```sql
SELECT C.NOMBRE_CLI, COUNT(V.COD_VENTA) AS NUM_COMPRAS
FROM CLIENTES C
JOIN VENTAS V ON C.COD_CLI = V.COD_CLI
GROUP BY C.COD_CLI, C.NOMBRE_CLI
ORDER BY NUM_COMPRAS DESC;
```

**Ejercicio 7**
```sql
SELECT P.NOMBRE_PROD, C.NOMBRE_CAT
FROM PRODUCTOS P
JOIN CATEGORIAS C ON P.COD_CAT = C.COD_CAT
ORDER BY C.NOMBRE_CAT, P.NOMBRE_PROD;
```

**Ejercicio 8**
```sql
SELECT C.NOMBRE_CLI, P.NOMBRE_PROD, V.CANTIDAD
FROM VENTAS V
JOIN CLIENTES C ON V.COD_CLI = C.COD_CLI
JOIN PRODUCTOS P ON V.COD_PROD = P.COD_PROD
ORDER BY C.NOMBRE_CLI;
```

**Ejercicio 9**
```sql
SELECT E.NOMBRE_EMP, J.NOMBRE_EMP AS JEFE
FROM EMPLEADOS E
LEFT JOIN EMPLEADOS J ON E.COD_JEFE = J.COD_EMP
ORDER BY E.NOMBRE_EMP;
```

**Ejercicio 10**
```sql
SELECT E.NOMBRE_EMP, COUNT(V.COD_VENTA) AS NUM_VENTAS
FROM EMPLEADOS E
JOIN VENTAS V ON E.COD_EMP = V.COD_EMP
WHERE E.CARGO_EMP = 'Vendedor'
GROUP BY E.COD_EMP, E.NOMBRE_EMP
ORDER BY NUM_VENTAS DESC;
```

### Nivel 3

**Ejercicio 11**
```sql
SELECT C.NOMBRE_CLI, P.NOMBRE_PROD, CA.NOMBRE_CAT, V.CANTIDAD
FROM VENTAS V
JOIN CLIENTES C ON V.COD_CLI = C.COD_CLI
JOIN PRODUCTOS P ON V.COD_PROD = P.COD_PROD
JOIN CATEGORIAS CA ON P.COD_CAT = CA.COD_CAT
ORDER BY V.FECHA_VENTA;
```

**Ejercicio 12**
```sql
SELECT E.NOMBRE_EMP, C.NOMBRE_CLI, P.NOMBRE_PROD, V.FECHA_VENTA
FROM VENTAS V
JOIN EMPLEADOS E ON V.COD_EMP = E.COD_EMP
JOIN CLIENTES C ON V.COD_CLI = C.COD_CLI
JOIN PRODUCTOS P ON V.COD_PROD = P.COD_PROD
JOIN CATEGORIAS CA ON P.COD_CAT = CA.COD_CAT
WHERE CA.NOMBRE_CAT = 'Música'
ORDER BY V.FECHA_VENTA;
```

**Ejercicio 13**
```sql
SELECT C.NOMBRE_CLI, P.NOMBRE_PROD, V.CANTIDAD * P.PRECIO_PROD AS IMPORTE
FROM VENTAS V
JOIN CLIENTES C ON V.COD_CLI = C.COD_CLI
JOIN PRODUCTOS P ON V.COD_PROD = P.COD_PROD
ORDER BY IMPORTE DESC;
```

**Ejercicio 14**
```sql
SELECT P.NOMBRE_PROD, COALESCE(SUM(V.CANTIDAD),0) AS UNIDADES_VENDIDAS
FROM PRODUCTOS P
LEFT JOIN VENTAS V ON P.COD_PROD = V.COD_PROD
GROUP BY P.COD_PROD, P.NOMBRE_PROD
ORDER BY UNIDADES_VENDIDAS DESC;
```

**Ejercicio 15**
```sql
SELECT C.CIUDAD_CLI, COUNT(V.COD_VENTA) AS NUM_VENTAS
FROM CLIENTES C
JOIN VENTAS V ON C.COD_CLI = V.COD_CLI
GROUP BY C.CIUDAD_CLI
HAVING COUNT(V.COD_VENTA) > 2
ORDER BY NUM_VENTAS DESC;
```

### Nivel 4

**Ejercicio 16**
```sql
SELECT CA.NOMBRE_CAT, SUM(V.CANTIDAD * P.PRECIO_PROD) AS IMPORTE_TOTAL
FROM VENTAS V
JOIN PRODUCTOS P ON V.COD_PROD = P.COD_PROD
JOIN CATEGORIAS CA ON P.COD_CAT = CA.COD_CAT
GROUP BY CA.COD_CAT, CA.NOMBRE_CAT
ORDER BY IMPORTE_TOTAL DESC;
```

**Ejercicio 17**
```sql
SELECT C.NOMBRE_CLI, SUM(V.CANTIDAD * P.PRECIO_PROD) AS TOTAL_GASTADO
FROM CLIENTES C
JOIN VENTAS V ON C.COD_CLI = V.COD_CLI
JOIN PRODUCTOS P ON V.COD_PROD = P.COD_PROD
GROUP BY C.COD_CLI, C.NOMBRE_CLI
ORDER BY TOTAL_GASTADO DESC;
```

**Ejercicio 18**
```sql
SELECT P.NOMBRE_PROD, SUM(V.CANTIDAD) AS UNIDADES
FROM PRODUCTOS P
JOIN VENTAS V ON P.COD_PROD = V.COD_PROD
GROUP BY P.COD_PROD, P.NOMBRE_PROD
HAVING SUM(V.CANTIDAD) > 2
ORDER BY UNIDADES DESC;
```

**Ejercicio 19**
```sql
SELECT CIUDAD_EMP, AVG(SALARIO_EMP) AS SALARIO_MEDIO
FROM EMPLEADOS
GROUP BY CIUDAD_EMP
ORDER BY SALARIO_MEDIO DESC;
```

**Ejercicio 20**
```sql
SELECT EXTRACT(MONTH FROM FECHA_VENTA) AS MES, COUNT(*) AS NUM_VENTAS
FROM VENTAS
WHERE FECHA_VENTA BETWEEN TO_DATE('2024-01-01','YYYY-MM-DD')
                      AND TO_DATE('2024-12-31','YYYY-MM-DD')
GROUP BY EXTRACT(MONTH FROM FECHA_VENTA)
ORDER BY MES;
```

### Nivel 5

**Ejercicio 21**
```sql
SELECT NOMBRE_PROD, PRECIO_PROD
FROM PRODUCTOS
WHERE PRECIO_PROD = (SELECT MAX(PRECIO_PROD) FROM PRODUCTOS);
```

**Ejercicio 22**
```sql
SELECT C.NOMBRE_CLI, V.FECHA_VENTA
FROM CLIENTES C
JOIN VENTAS V ON C.COD_CLI = V.COD_CLI
JOIN PRODUCTOS P ON V.COD_PROD = P.COD_PROD
WHERE P.NOMBRE_PROD = 'Disco Duro SSD 500GB'
ORDER BY V.FECHA_VENTA;
```

**Ejercicio 23**
```sql
SELECT NOMBRE_PROD, PRECIO_PROD
FROM PRODUCTOS
WHERE PRECIO_PROD > (SELECT AVG(PRECIO_PROD) FROM PRODUCTOS)
ORDER BY PRECIO_PROD DESC;
```

**Ejercicio 24**
```sql
SELECT NOMBRE_EMP, SALARIO_EMP
FROM EMPLEADOS
WHERE SALARIO_EMP > (SELECT AVG(SALARIO_EMP) FROM EMPLEADOS)
ORDER BY SALARIO_EMP DESC;
```

**Ejercicio 25**
```sql
SELECT NOMBRE_CLI
FROM CLIENTES
WHERE COD_CLI NOT IN (SELECT DISTINCT COD_CLI FROM VENTAS)
ORDER BY NOMBRE_CLI;
```

### Nivel 6

**Ejercicio 26**
```sql
SELECT C.NOMBRE_CLI,
       SUM(V.CANTIDAD * P.PRECIO_PROD) AS TOTAL_GASTADO,
       CASE
           WHEN SUM(V.CANTIDAD * P.PRECIO_PROD) > 200 THEN 'Cliente VIP'
           WHEN SUM(V.CANTIDAD * P.PRECIO_PROD) >= 50 THEN 'Cliente regular'
           ELSE 'Cliente ocasional'
       END AS CLASIFICACION
FROM CLIENTES C
JOIN VENTAS V ON C.COD_CLI = V.COD_CLI
JOIN PRODUCTOS P ON V.COD_PROD = P.COD_PROD
GROUP BY C.COD_CLI, C.NOMBRE_CLI
ORDER BY TOTAL_GASTADO DESC;
```

**Ejercicio 27**
```sql
SELECT P.NOMBRE_PROD, C.NOMBRE_CAT, P.PRECIO_PROD,
       CASE
           WHEN P.PRECIO_PROD < 15 THEN 'Económico'
           WHEN P.PRECIO_PROD <= 50 THEN 'Medio'
           ELSE 'Premium'
       END AS ETIQUETA
FROM PRODUCTOS P
JOIN CATEGORIAS C ON P.COD_CAT = C.COD_CAT
ORDER BY C.NOMBRE_CAT, P.PRECIO_PROD;
```

**Ejercicio 28**
```sql
SELECT C.NOMBRE_CLI, COUNT(DISTINCT P.COD_CAT) AS NUM_CATEGORIAS
FROM CLIENTES C
JOIN VENTAS V ON C.COD_CLI = V.COD_CLI
JOIN PRODUCTOS P ON V.COD_PROD = P.COD_PROD
GROUP BY C.COD_CLI, C.NOMBRE_CLI
HAVING COUNT(DISTINCT P.COD_CAT) > 1
ORDER BY NUM_CATEGORIAS DESC;
```

**Ejercicio 29**
```sql
SELECT P.NOMBRE_PROD, SUM(V.CANTIDAD) AS UNIDADES
FROM PRODUCTOS P
JOIN VENTAS V ON P.COD_PROD = V.COD_PROD
GROUP BY P.COD_PROD, P.NOMBRE_PROD
HAVING SUM(V.CANTIDAD) = (
    SELECT MAX(TOTAL)
    FROM (SELECT SUM(CANTIDAD) AS TOTAL FROM VENTAS GROUP BY COD_PROD)
);
```

**Ejercicio 30**
```sql
SELECT C.NOMBRE_CAT, P.NOMBRE_PROD, P.PRECIO_PROD
FROM CATEGORIAS C
JOIN PRODUCTOS P ON C.COD_CAT = P.COD_CAT
WHERE P.PRECIO_PROD = (
    SELECT MAX(PRECIO_PROD)
    FROM PRODUCTOS
    WHERE COD_CAT = P.COD_CAT
)
ORDER BY C.NOMBRE_CAT;
```

</details>

---
