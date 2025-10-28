# Modelos de Bases de Datos y Arquitectura Cliente-Servidor

## 1. Modelos de Bases de Datos

Los **modelos de bases de datos** definen la forma en que los datos se estructuran, organizan y relacionan entre sí dentro de un sistema. Cada modelo tiene su propia forma de representar la información, y conocerlos es fundamental para entender cómo funcionan los sistemas gestores de bases de datos (SGBD).

Los tres modelos más extendidos son: **Jerárquico, en Red y Relacional.**

---

### 🏗️ Modelo Jerárquico

- Organiza los datos **en forma de árbol**.  
- Cada nodo **padre** puede tener varios **hijos**, pero cada hijo **solo tiene un padre**.  
- Representa relaciones **uno a muchos (1:N)**.  
- Fue uno de los primeros modelos utilizados en los años 60 (por ejemplo, el sistema **IMS de IBM**).  

**Estructura visual:**

```
Empresa
 ├── Departamento Ventas
 │     ├── Empleado Ana
 │     └── Empleado Luis
 └── Departamento Informática
       ├── Empleado Marta
       └── Empleado Juan
```

📌 *Ejemplo real:* Un sistema de nóminas donde cada departamento tiene varios empleados.  
💡 *Ventaja:* Simplicidad y velocidad en accesos predefinidos.  
⚠️ *Desventaja:* Falta de flexibilidad: un registro solo puede pertenecer a un nodo padre.

---

### 🔗 Modelo en Red

- Evolución del modelo jerárquico.  
- Permite que un nodo **tenga varios padres**, es decir, puede participar en **múltiples relaciones**.  
- Representa relaciones **muchos a muchos (N:M)**.  
- Define la información en **registros (nodos)** y las relaciones entre ellos mediante **enlaces o punteros**.

**Estructura visual:**

```
Clientes ↔️ Pedidos ↔️ Productos
```

📌 *Ejemplo real:* Un cliente puede realizar varios pedidos, y cada pedido puede incluir varios productos.  
💡 *Ventaja:* Más flexible que el jerárquico, permite relaciones complejas.  
⚠️ *Desventaja:* Su mantenimiento y diseño son más complejos, ya que hay que gestionar los enlaces manualmente.

---

### 🧱 Modelo Relacional

- Propuesto por **E. F. Codd (1970)** y es el modelo más usado actualmente.  
- La información se organiza en **tablas (relaciones)** con **filas (tuplas)** y **columnas (atributos)**.  
- Cada tabla tiene una **clave primaria** que identifica de forma única cada registro.  
- Se pueden establecer **relaciones** entre tablas mediante **claves externas (foreign keys)**.  

**Ejemplo visual:**

**Tabla CLIENTES**

| ID_CLIENTE | NOMBRE | CIUDAD |
|-------------|---------|--------|
| 1 | Ana | Sevilla |
| 2 | Luis | Cádiz |

**Tabla PEDIDOS**

| ID_PEDIDO | ID_CLIENTE | FECHA |
|------------|-------------|-------|
| 101 | 1 | 2025-01-12 |
| 102 | 2 | 2025-02-01 |

📌 *Ejemplo real:* Una tienda online con una base de datos que relaciona clientes con sus pedidos.  
💡 *Ventajas:* Independencia lógica y física de los datos, simplicidad en la estructura y uso de **SQL** para consultar los datos.  
⚠️ *Desventaja:* Puede requerir una planificación cuidadosa cuando existen muchas relaciones y tablas.

---

### 🔍 Comparativa entre modelos

| Característica | Jerárquico | En Red | Relacional |
|----------------|-------------|---------|-------------|
| Estructura | Árbol | Gráfico | Tablas |
| Tipo de relación | 1:N | N:M | N:M |
| Flexibilidad | Baja | Media | Alta |
| Facilidad de uso | Media | Baja | Alta |
| Lenguaje asociado | Punteros | Enlaces | SQL |

---

## 2. Arquitectura Cliente-Servidor

La **arquitectura cliente-servidor** es la forma en que se **organizan los equipos y programas** que participan en la gestión y uso de una base de datos.

Esta arquitectura divide el sistema en **dos partes principales**:

- **Servidor:** Es el ordenador central que almacena la base de datos y ejecuta el **SGBD (Sistema Gestor de Bases de Datos)**.  
- **Cliente:** Son los ordenadores o aplicaciones desde los que los usuarios realizan consultas o modificaciones, conectándose al servidor a través de una red.

**Esquema básico:**

```
[Cliente] 🧑‍💻 ─────── consulta SQL ───────▶ [Servidor BD] 🖥️
      ◀─────── resultados / datos ─────────
```

---

### 🔹 Componentes principales

| Componente | Función | Dónde se ejecuta |
|-------------|----------|------------------|
| **Gestión de datos** | Manipula y administra la información de la base de datos | Servidor |
| **Interfaz de usuario** | Muestra la información y permite interactuar con el sistema | Cliente |
| **Lógica de aplicación** | Procesa las reglas de negocio y valida las operaciones | Puede estar en cliente o servidor |

---

### 🔸 Tipos de configuraciones cliente-servidor

1. **🖥️ Anfitrión (monoequipo):**  
   - Cliente y servidor se encuentran en el mismo equipo.  
   - Los datos y las aplicaciones están en un mismo sistema.  
   - 💡 *Ejemplo:* MySQL instalado localmente y accedido mediante phpMyAdmin.  

2. **🧩 Cliente/Servidor clásico:**  
   - La base de datos reside en un servidor y los usuarios acceden a través de la red.  
   - 💡 *Ejemplo:* PCs de una oficina conectados al servidor con Oracle o SQL Server.  

3. **🌍 Bases de datos distribuidas:**  
   - La información está repartida en varios servidores, pero el usuario la percibe como una única base.  
   - 💡 *Ejemplo:* Multinacional con servidores de bases de datos en distintos países.  

4. **☁️ Con servidor de aplicaciones:**  
   - Existe un servidor adicional donde se ejecutan las aplicaciones.  
   - Los clientes acceden mediante navegadores web o apps.  
   - 💡 *Ejemplo:* Moodle, Gmail, o ERP como Odoo.  

---

### ⚙️ Ventajas y desventajas

**Ventajas:**
- Centralización del control y los datos.  
- Mayor seguridad y facilidad de mantenimiento.  
- Acceso simultáneo de múltiples usuarios.  
- Permite escalabilidad y conexión remota.  

**Desventajas:**
- Si el servidor falla, el sistema completo se interrumpe.  
- Mayor coste de infraestructura.  
- Necesidad de una red estable y de buen ancho de banda.  

---

### 🔁 Evolución hacia la arquitectura con servidor de aplicaciones

En los sistemas modernos, muchas aplicaciones se basan en una arquitectura **multicapa (three-tier)**:

1. **Capa de presentación (Cliente)** → interfaz con el usuario (web o app).  
2. **Capa de lógica (Servidor de aplicaciones)** → gestiona las reglas del negocio.  
3. **Capa de datos (Servidor de base de datos)** → almacena y protege la información.  

**Ejemplo visual:**

```
[Cliente Web] 🌐 ⇄ [Servidor de Aplicaciones] ⚙️ ⇄ [Servidor de BD] 🗄️
```

💡 *Ejemplo real:* En una tienda online, el cliente usa un navegador para comprar, el servidor de aplicaciones gestiona las operaciones del carrito, y el servidor de base de datos guarda los productos y pedidos.

---

## 3. Conclusión

Los **modelos de bases de datos** determinan *cómo se organiza la información*, mientras que la **arquitectura cliente-servidor** describe *cómo se accede a ella* desde diferentes equipos.

Ambos conceptos son esenciales para comprender el funcionamiento de los sistemas modernos de información, desde pequeñas bases de datos locales hasta complejas aplicaciones web distribuidas.

**Resumen visual:**

```
MODELADO DE DATOS        ARQUITECTURA
--------------------     -------------------------
Jerárquico               Cliente ─ Servidor
En Red                   BD Distribuida
Relacional               Servidor de Aplicaciones
Orientado a Objetos      En la nube / Web
```

📚 *Ejemplo final:* Una tienda online utiliza un **modelo relacional** para organizar clientes y pedidos en tablas, y una **arquitectura cliente-servidor** para permitir que los usuarios accedan a esos datos desde cualquier lugar a través de una aplicación web.
