# PRÁCTICA GUIADA: Primer entorno de trabajo con Oracle Database XE y DBeaver

**Asignatura:** Bases de Datos  
**Curso:** 1º DAW  
**Nivel:** Iniciación  
**Tiempo estimado:** 90-120 minutos  
**Modalidad:** Práctica individual guiada

---

## Objetivo final de la práctica

Al terminar esta práctica deberías ser capaz de:

- Tener **Oracle Database XE** instalado y funcionando en tu equipo.
- Tener **DBeaver** instalado como herramienta de trabajo.
- Crear una **conexión** a Oracle desde DBeaver.
- Crear tu **propio usuario** en Oracle.
- Crear una **tabla**, insertar datos y consultarlos.

> **IMPORTANTE**  
> En esta práctica vas a preparar tu entorno de trabajo desde cero. No se da nada por supuesto y debes seguir los pasos en orden.

---

# 1. Introducción

En esta práctica vas a montar tu primer entorno real de base de datos con **Oracle Database XE** y **DBeaver**.

### ¿Qué es Oracle Database XE?

**Oracle Database Express Edition (XE)** es una versión gratuita de Oracle pensada para aprender, practicar y desarrollar proyectos pequeños. Es un sistema gestor de bases de datos muy usado en entornos profesionales y educativos.

### ¿Qué es DBeaver?

**DBeaver** es una herramienta gráfica que permite conectarse a bases de datos, ejecutar consultas SQL, ver tablas y trabajar de forma cómoda sin tener que escribir todo desde consola.

> **COMPROBACIÓN**  
> Antes de empezar, asegúrate de tener permisos para instalar programas en Windows y conexión a Internet para descargar el software.

---

# 2. Instalación de Oracle Database XE

## 2.1. Descarga

1. Abre tu navegador.
2. Busca la página oficial de **Oracle Database XE para Windows**.
3. Descarga el instalador correspondiente.
4. Guarda el archivo en una carpeta fácil de localizar, por ejemplo `Descargas`.

**Captura sugerida:** página de descarga de Oracle XE o archivo descargado en tu equipo.

## 2.2. Instalación paso a paso en Windows

1. Haz clic derecho sobre el instalador y selecciona **Ejecutar como administrador**.
2. Pulsa **Next / Siguiente** en la pantalla inicial.
3. Acepta la licencia (**Accept the license agreement**).
4. Deja la ruta de instalación por defecto, salvo que tu profesor indique otra.
5. Cuando el instalador pida una contraseña para las cuentas administrativas, escribe una contraseña segura.

Ejemplo de contraseña:

```text
Oracle123
```

> **IMPORTANTE**  
> Esa contraseña será la de usuarios administrativos como `SYSTEM`.  
> **Apúntala y no la olvides**, porque la necesitarás para conectarte desde DBeaver.

6. Continúa hasta finalizar la instalación.
7. Espera a que el proceso termine por completo.
8. Pulsa **Finish / Finalizar**.

## 2.3. ¿Qué servicios instala Oracle?

Normalmente Oracle XE instala varios servicios de Windows. Los más importantes son:

- **`OracleServiceXE`** → arranca la base de datos.
- **`Oracle...TNSListener`** → permite que otras aplicaciones se conecten a Oracle.
- Otros servicios auxiliares que pueden variar según la versión.

> **No hace falta memorizar todos los nombres**, pero sí saber que si estos servicios están parados, no podrás conectarte.

## 2.4. Comprobar que Oracle está funcionando

### Opción 1: comprobar desde Servicios de Windows

1. Pulsa `Win + R`.
2. Escribe:

```text
services.msc
```

3. Pulsa **Enter**.
4. Busca servicios que empiecen por **Oracle**.
5. Comprueba que al menos el servicio de base de datos y el listener estén en estado **En ejecución**.

> **COMPROBACIÓN**  
> Deberías ver servicios como `OracleServiceXE` en estado **Running / En ejecución**.

> **ERROR TÍPICO**  
> Si el servicio está **detenido**, DBeaver no podrá conectarse.  
> Solución: clic derecho sobre el servicio → **Iniciar**.

**Captura sugerida:** ventana de `services.msc` mostrando los servicios de Oracle en ejecución.

---

# 3. Instalación de DBeaver

## 3.1. Descarga e instalación

1. Abre tu navegador.
2. Busca la web oficial de **DBeaver Community**.
3. Descarga la versión para **Windows**.
4. Ejecuta el instalador.
5. Sigue el asistente dejando las opciones por defecto.
6. Finaliza la instalación.

**Captura sugerida:** instalador de DBeaver o primera ventana del programa.

## 3.2. Primera apertura

1. Abre **DBeaver**.
2. Si aparece una ventana inicial o una pantalla de bienvenida, ciérrala o continúa.
3. Es posible que DBeaver te pida descargar el **driver JDBC de Oracle** la primera vez que crees la conexión.

> **IMPORTANTE**  
> Si DBeaver pide descargar controladores, acepta. Son necesarios para que el programa pueda comunicarse con Oracle.

> **COMPROBACIÓN**  
> Deberías ver la ventana principal de DBeaver con el panel de conexiones vacío o casi vacío.

---

# 4. Conexión a Oracle desde DBeaver

## 4.1. Crear una nueva conexión

1. En DBeaver, pulsa en **Nueva conexión**.
2. Selecciona **Oracle** como tipo de base de datos.
3. Si te pide descargar el driver, pulsa **Download / Descargar**.

## 4.2. Rellenar los parámetros de conexión

Introduce estos datos:

- **Host:** `localhost`
- **Puerto:** `1521`
- **Usuario:** `SYSTEM`
- **Contraseña:** la que pusiste al instalar Oracle

### ¿SID o Service Name?

En Oracle XE actual, lo más habitual es usar:

- **Service Name:** `XEPDB1`

No suele ser recomendable empezar usando `XE` como SID para esta práctica, porque normalmente el trabajo con usuarios y tablas se hará en **`XEPDB1`**.

## 4.3. Probar la conexión

1. Pulsa **Test Connection**.
2. Si todo está correcto, DBeaver mostrará un mensaje de conexión exitosa.
3. Guarda la conexión con un nombre como:

```text
Oracle SYSTEM - XEPDB1
```

> **COMPROBACIÓN**  
> Deberías ver un mensaje parecido a **Connected** o **Success**.

> **ERROR TÍPICO: servicio parado**  
> Si la prueba falla, revisa si los servicios de Oracle están arrancados en `services.msc`.

> **ERROR TÍPICO: SID o Service Name incorrecto**  
> Si usas un identificador incorrecto, la conexión puede fallar o conectarte al contenedor equivocado.  
> Para esta práctica utiliza preferentemente **`Service Name = XEPDB1`**.

**Captura sugerida:** ventana de configuración de la conexión con los parámetros rellenados y la prueba correcta.

---

# 5. Concepto clave: usuarios en Oracle

En muchos sistemas gestores se habla de **crear una base de datos** con instrucciones como `CREATE DATABASE`.

En **Oracle**, para el trabajo habitual en clase, **no vamos a crear una base de datos nueva** cada vez. En su lugar:

- Oracle ya tiene una base de datos funcionando.
- Cada alumno trabajará con su **propio usuario**.
- Ese usuario tendrá su **propio esquema (schema)**.
- Dentro de ese esquema estarán sus tablas, vistas y otros objetos.

> **IMPORTANTE**  
> En Oracle, para esta práctica, tu “espacio de trabajo” será tu **usuario/schema**, no una base de datos independiente.

Ejemplo:

- Usuario `ALUMNO1` → tendrá sus propias tablas.
- Usuario `ALUMNO2` → tendrá otras tablas diferentes.

---

# 6. Crear un usuario nuevo

Ahora vas a crear un usuario nuevo desde la conexión de `SYSTEM`.

## 6.1. Abrir un editor SQL

1. En DBeaver, entra en la conexión creada con `SYSTEM`.
2. Abre un **SQL Editor**.
3. Escribe las siguientes sentencias:

```sql
CREATE USER alumno IDENTIFIED BY alumno123;
GRANT CONNECT, RESOURCE TO alumno;
ALTER USER alumno QUOTA UNLIMITED ON USERS;
```

## 6.2. ¿Qué hace cada sentencia?

- `CREATE USER alumno IDENTIFIED BY alumno123;`  
  Crea un usuario llamado `alumno` con contraseña `alumno123`.

- `GRANT CONNECT, RESOURCE TO alumno;`  
  Le concede permisos básicos para conectarse y crear objetos como tablas.

- `ALTER USER alumno QUOTA UNLIMITED ON USERS;`  
  Le permite usar espacio en el tablespace `USERS`, necesario para crear sus tablas sin errores de cuota.

> **IMPORTANTE**  
> Puedes cambiar `alumno` por tu nombre o tus iniciales, por ejemplo `pablo`, `maria1`, `ana_daw`, etc., siempre que tu profesor lo permita.

> **ERROR TÍPICO: ORA-01950**  
> Si al crear tablas aparece un error relacionado con el tablespace `USERS`, suele faltar la cuota.  
> La tercera sentencia del ejemplo evita ese problema.

> **ERROR TÍPICO: ORA-65096**  
> Si Oracle indica que el nombre de usuario no es válido, normalmente estás conectado al contenedor incorrecto.  
> Revisa que tu conexión usa **`XEPDB1`** y no otro valor.

## 6.3. Comprobar que el usuario existe

Puedes ejecutar esta consulta:

```sql
SELECT username, account_status
FROM all_users
WHERE username = 'ALUMNO';
```

> **COMPROBACIÓN**  
> Deberías ver una fila con el usuario `ALUMNO`.

**Captura sugerida:** editor SQL con las sentencias ejecutadas correctamente o consulta mostrando el usuario creado.

---

# 7. Conectarse con el nuevo usuario

Ahora ya no vas a trabajar con `SYSTEM`, sino con tu propio usuario.

## 7.1. Crear una nueva conexión en DBeaver

1. Pulsa **Nueva conexión** otra vez.
2. Selecciona **Oracle**.
3. Rellena los datos:

- **Host:** `localhost`
- **Puerto:** `1521`
- **Service Name:** `XEPDB1`
- **Usuario:** `alumno`
- **Contraseña:** `alumno123`

4. Pulsa **Test Connection**.
5. Guarda la conexión con un nombre como:

```text
Oracle alumno - XEPDB1
```

> **COMPROBACIÓN**  
> Deberías poder conectarte sin usar `SYSTEM`.

> **IMPORTANTE**  
> A partir de este momento, ese usuario será tu **entorno de trabajo personal**.

**Captura sugerida:** conexión creada con tu usuario personal.

---

# 8. Crear la primera tabla

Ya dentro de tu conexión como `alumno`, abre un editor SQL y ejecuta:

```sql
CREATE TABLE prueba (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(50)
);
```

## ¿Qué significa este ejemplo?

- `id NUMBER PRIMARY KEY` → columna numérica que identifica cada fila de forma única.
- `nombre VARCHAR2(50)` → columna de texto de hasta 50 caracteres.

> **COMPROBACIÓN**  
> Si todo ha ido bien, la tabla `PRUEBA` aparecerá en el árbol de objetos de DBeaver dentro de **Tables**.

> **ERROR TÍPICO**  
> Si no aparece la tabla, prueba a refrescar la conexión con **F5** o clic derecho → **Refresh**.

**Captura sugerida:** tabla `PRUEBA` visible en DBeaver.

---

# 9. Insertar datos

Ahora vamos a guardar información en la tabla.

Ejecuta:

```sql
INSERT INTO prueba (id, nombre) VALUES (1, 'Ana');
COMMIT;
```

## ¿Por qué usamos `COMMIT`?

En Oracle, después de insertar, modificar o borrar datos, conviene confirmar los cambios con:

```sql
COMMIT;
```

Así los cambios quedan guardados de forma definitiva.

> **COMPROBACIÓN**  
> La sentencia debe ejecutarse sin errores y mostrar que se ha insertado 1 fila.

> **ERROR TÍPICO**  
> Si intentas insertar otro registro con `id = 1`, Oracle dará error porque la clave primaria no puede repetirse.

**Captura sugerida:** ejecución correcta del `INSERT` y del `COMMIT`.

---

# 10. Consultar datos

Para ver el contenido de la tabla, ejecuta:

```sql
SELECT * FROM prueba;
```

## Resultado esperado

Deberías obtener una tabla parecida a esta:

| ID | NOMBRE |
|----|--------|
| 1  | Ana    |

> **COMPROBACIÓN**  
> Si ves la fila insertada, significa que tu tabla funciona correctamente y ya puedes trabajar con Oracle.

**Captura sugerida:** resultado de la consulta `SELECT * FROM prueba;` en DBeaver.

---

# 11. Mini reto final

Completa ahora un pequeño reto por tu cuenta.

## Reto

1. Crea una nueva tabla llamada `modulos` con esta estructura:

```sql
CREATE TABLE modulos (
    codigo NUMBER PRIMARY KEY,
    nombre VARCHAR2(60)
);
```

2. Inserta al menos **dos filas**.
3. Haz un `COMMIT`.
4. Consulta los datos con `SELECT * FROM modulos;`.

### Ejemplo de ayuda

```sql
INSERT INTO modulos (codigo, nombre) VALUES (1, 'Bases de Datos');
INSERT INTO modulos (codigo, nombre) VALUES (2, 'Lenguajes de Marcas');
COMMIT;

SELECT * FROM modulos;
```

> **COMPROBACIÓN**  
> Si puedes crear la tabla, insertar filas y consultarlas, has superado el reto final.

---

# 12. Entrega

Debes entregar un documento o carpeta con las siguientes evidencias:

1. **Captura de la instalación de Oracle XE** o de los servicios en ejecución.
2. **Captura de la instalación o primera apertura de DBeaver**.
3. **Captura de la conexión a Oracle con `SYSTEM`**.
4. **Captura del usuario creado** (`alumno` o el nombre que hayas elegido).
5. **Captura de la conexión con tu nuevo usuario**.
6. **Captura de la tabla `PRUEBA` creada**.
7. **Captura del `INSERT` y del `SELECT * FROM prueba;`**.
8. **Captura del mini reto final** con la tabla adicional y sus datos.

---

## Resumen final: ¿con qué deberías terminar?

Al finalizar esta práctica debes tener:

- ✅ **Oracle funcionando** en tu equipo.
- ✅ **DBeaver instalado**.
- ✅ **Conexión correcta** a Oracle.
- ✅ **Tu propio usuario/schema** creado.
- ✅ **Una tabla funcionando** con datos reales.

Si has llegado hasta aquí, ya tienes preparado tu primer entorno de trabajo real para seguir practicando SQL con Oracle.

---

## Anexo: SQL completo de la práctica

```sql
CREATE USER alumno IDENTIFIED BY alumno123;
GRANT CONNECT, RESOURCE TO alumno;
ALTER USER alumno QUOTA UNLIMITED ON USERS;

CREATE TABLE prueba (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(50)
);

INSERT INTO prueba (id, nombre) VALUES (1, 'Ana');
COMMIT;

SELECT * FROM prueba;
```

> **RECOMENDACIÓN FINAL**  
> Guarda bien tus credenciales y acostúmbrate a trabajar siempre con tu **usuario personal**, no con `SYSTEM`, salvo cuando necesites tareas de administración.
