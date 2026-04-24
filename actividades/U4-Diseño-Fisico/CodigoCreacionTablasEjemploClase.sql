-- ============================================================
-- Script SQL para crear las tablas de ejemplo EMP y DEPT
-- ============================================================

--DROP TABLE eje_dept CASCADE CONSTRAINT;
--DROP TABLE eje_emp;

-- --------------------------------------------------------------
-- 1. Crear tabla DEPT (Departamentos)
-- --------------------------------------------------------------

CREATE TABLE eje_dept (
    deptno  NUMBER(2)    NOT NULL PRIMARY KEY,
    dname   VARCHAR2(14),
    loc     VARCHAR2(13)
);

-- Insertar datos de departamentos
INSERT INTO eje_dept (deptno, dname, loc) VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO eje_dept (deptno, dname, loc) VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO eje_dept (deptno, dname, loc) VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO eje_dept (deptno, dname, loc) VALUES (40, 'OPERATIONS', 'BOSTON');

COMMIT;

-- --------------------------------------------------------------
-- 2. Crear tabla EMP (Empleados)
-- --------------------------------------------------------------

CREATE TABLE eje_emp (
    empno      NUMBER(4)     NOT NULL PRIMARY KEY,
    ename      VARCHAR2(10),
    job        VARCHAR2(9),
    mgr        NUMBER(4),
    hiredate   DATE,
    sal        NUMBER(7,2),
    comm       NUMBER(7,2),
    deptno     NUMBER(2),
    CONSTRAINT fk_emp_dept 
        FOREIGN KEY (deptno) 
        REFERENCES eje_dept(deptno)
);

-- Insertar datos de empleados
INSERT INTO eje_emp VALUES (7369, 'SMITH', 'CLERK', 7902, TO_DATE('17/12/80', 'DD/MM/YY'), 800, NULL, 20);
INSERT INTO eje_emp VALUES (7499, 'ALLEN', 'SALESMAN', 7698, TO_DATE('20/02/81', 'DD/MM/YY'), 1600, 300, 30);
INSERT INTO eje_emp VALUES (7521, 'WARD', 'SALESMAN', 7698, TO_DATE('22/02/81', 'DD/MM/YY'), 1250, 500, 30);
INSERT INTO eje_emp VALUES (7566, 'JONES', 'MANAGER', 7839, TO_DATE('02/04/81', 'DD/MM/YY'), 2975, NULL, 20);
INSERT INTO eje_emp VALUES (7654, 'MARTIN', 'SALESMAN', 7698, TO_DATE('28/09/81', 'DD/MM/YY'), 1250, 1400, 30);
INSERT INTO eje_emp VALUES (7698, 'BLAKE', 'MANAGER', 7839, TO_DATE('01/05/81', 'DD/MM/YY'), 2850, NULL, 30);
INSERT INTO eje_emp VALUES (7782, 'CLARK', 'MANAGER', 7839, TO_DATE('09/06/81', 'DD/MM/YY'), 2450, NULL, 10);
INSERT INTO eje_emp VALUES (7788, 'SCOTT', 'ANALYST', 7566, TO_DATE('09/12/82', 'DD/MM/YY'), 3000, NULL, 20);
INSERT INTO eje_emp VALUES (7839, 'KING', 'PRESIDENT', NULL, TO_DATE('17/11/81', 'DD/MM/YY'), 5000, NULL, 10);
INSERT INTO eje_emp VALUES (7844, 'TURNER', 'SALESMAN', 7698, TO_DATE('08/09/81', 'DD/MM/YY'), 1500, 0, 30);
INSERT INTO eje_emp VALUES (7876, 'ADAMS', 'CLERK', 7788, TO_DATE('12/01/83', 'DD/MM/YY'), 1100, NULL, 20);
INSERT INTO eje_emp VALUES (7900, 'JAMES', 'CLERK', 7698, TO_DATE('03/12/81', 'DD/MM/YY'), 950, NULL, 30);
INSERT INTO eje_emp VALUES (7902, 'FORD', 'ANALYST', 7566, TO_DATE('03/12/81', 'DD/MM/YY'), 3000, NULL, 20);
INSERT INTO eje_emp VALUES (7934, 'MILLER', 'CLERK', 7782, TO_DATE('23/01/82', 'DD/MM/YY'), 1300, NULL, 10);

COMMIT;

-- --------------------------------------------------------------
-- 3. Verificar datos insertados
-- --------------------------------------------------------------
SELECT 'Tabla DEPT' AS verificacion, COUNT(*) AS num_filas FROM eje_dept
UNION ALL
SELECT 'Tabla EMP', COUNT(*) FROM eje_emp;

-- --------------------------------------------------------------
-- 4. Visualizacion de las tablas
-- --------------------------------------------------------------
SELECT * FROM eje_dept;
SELECT * FROM eje_emp;