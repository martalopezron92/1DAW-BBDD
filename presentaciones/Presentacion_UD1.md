# 📊 BASES DE DATOS - UNIDAD 1: CONCEPTOS BÁSICOS
## *Versión para Proyección en Clase*

---

## 🎯 OBJETIVOS DE LA UNIDAD

✅ **Comprender** la evolución: Papel → Ficheros → Bases de Datos  
✅ **Identificar** los **7 problemas** de los sistemas de ficheros  
✅ **Conocer** la **arquitectura de 3 niveles** de las BBDD  
✅ **Comparar** los **modelos de datos**: Jerárquico, Red, Relacional  
✅ **Identificar** componentes y usuarios de un **SGBD**

---

## 📅 PLANIFICACIÓN - 6 SESIONES

| **Sesión** | **Contenido Principal** | **Práctica** |
|------------|-------------------------|--------------|
| **1** | 📋 Introducción + Sistemas de Ficheros | - |
| **2** | ❌ Problemas + ✅ SGBD | 🏛️ **Práctica 1:** Biblioteca |
| **3** | 🏗️ Arquitectura 3 Niveles | - |
| **4** | 📊 Modelos de Datos | 🏥 **Práctica 2:** Hospital |
| **5** | ⚙️ Componentes SGBD + Usuarios | - |
| **6** | 📝 Repaso + Presentaciones | ✅ **Entrega Prácticas** |

---

# 📋 SESIÓN 1: INTRODUCCIÓN Y FICHEROS

## 🤔 ¿QUÉ APLICACIONES USAN BASES DE DATOS?
- WhatsApp, Instagram, Netflix, Amazon...
- MySQL, Oracle, PostgreSQL, MongoDB...

## 📚 EVOLUCIÓN DEL ALMACENAMIENTO

```
PAPEL (1980) → FICHEROS DIGITALES (1990) → BASES DE DATOS (2000+)
    📋              💾                        🗄️
   Lento          Más rápido                Inteligente
```

## 💡 EJEMPLO: BIBLIOTECA DE PAPEL
**PROBLEMAS IDENTIFICADOS:**
- ⏰ Búsqueda muy lenta
- 📄 Si se pierde una ficha → pérdida de información  
- 🔄 Difícil mantener actualizado
- 👥 Solo una persona puede usar el fichero

## 💻 SISTEMAS GESTORES DE FICHEROS

### EJEMPLO: FICHERO CLIENTES_BANCO
```
Campo clave: NIF
┌───────────┬──────────────┬─────────┬─────────────┐
│    NIF    │  APELLIDOS   │ NOMBRE  │ NACIMIENTO  │
├───────────┼──────────────┼─────────┼─────────────┤
│12345678A  │García López  │  Ana    │ 15/03/1990  │
│87654321B  │Ruiz Martín   │  Luis   │ 22/07/1985  │
└───────────┴──────────────┴─────────┴─────────────┘
```

## 🎯 ACTIVIDAD: DISEÑO DE FICHERO
**EN GRUPOS:** Diseñad un fichero para una **tienda de ropa**
- ¿Qué campos incluiríais?
- ¿Cuál sería la clave primaria?
- ¿Cómo buscaríais "camisetas rojas, talla M, <20€"?

---

# ❌ SESIÓN 2: PROBLEMAS DE FICHEROS + SGBD

## 🔴 LOS 7 PROBLEMAS DE LOS FICHEROS

### 1️⃣ **REDUNDANCIA E INCONSISTENCIA**
```
FICHERO_CUENTAS_AHORRO:    NIF | Nombre | Dirección | Saldo
FICHERO_CUENTAS_CORRIENTE: NIF | Nombre | Dirección | Nº_Cuenta
```
**PROBLEMA:** ¿Qué pasa si cambio mi dirección solo en un fichero?

### 2️⃣ **DIFICULTAD DE ACCESO** 
**CONSULTA:** "Clientes de Cádiz con >1000€"
**PROBLEMA:** Hay que crear un programa específico para cada consulta

### 3️⃣ **AISLAMIENTO DE DATOS**
```
archivo_alumnos.txt  +  archivo_notas.xls  +  archivo_asignaturas.db
```
**PROBLEMA:** Diferentes formatos → Difícil combinar información

### 4️⃣ **ACCESO CONCURRENTE**
```
Cuenta: 500€
Ana saca 100€ ⟵─────────⟶ Luis saca 200€
¿Resultado? ¿400€ o 300€?
```

### 5️⃣ **SEGURIDAD**
**PROBLEMA:** ¿Puede un alumno modificar sus notas?

### 6️⃣ **INTEGRIDAD**
**REGLAS:** Notas entre 0-10, fechas válidas, campos obligatorios...
**PROBLEMA:** Cada programa debe verificar las reglas por separado

### 7️⃣ **DEPENDENCIA FÍSICA-LÓGICA**
**PROBLEMA:** Si cambio ubicación → hay que modificar todos los programas

## ✅ SOLUCIÓN: SISTEMAS GESTORES DE BASES DE DATOS

### 🔧 COMPONENTES DE UN SISTEMA BD
```
SISTEMA DE BASE DE DATOS
├── 📊 DATOS (la información)
├── 🖥️ HARDWARE (ordenadores, discos...)
├── ⚙️ SOFTWARE (SGBD)
└── 👥 USUARIOS (las personas)
```

### 🏆 VENTAJAS DE LAS BBDD
| **Problema Ficheros** | **Solución BBDD** |
|-----------------------|-------------------|
| Redundancia | Datos únicos |
| Acceso difícil | Lenguajes consulta (SQL) |
| Seguridad | Control permisos |
| Concurrencia | Control transacciones |
| Integridad | Reglas automáticas |

---

# 🏗️ SESIÓN 3: ARQUITECTURA DE 3 NIVELES

## 💡 CONCEPTO: ABSTRACCIÓN
**EJEMPLO:** Móvil → No necesitas saber cómo funciona por dentro
**BBDD:** Tienen "capas" que simplifican el uso

## 📊 ARQUITECTURA DE 3 NIVELES

```
╔══════════════════════════════════════╗
║           NIVELES EXTERNOS           ║ ← Lo que ve cada usuario
║         (Vistas personalizadas)      ║   (Vista médico, vista admin...)
╠══════════════════════════════════════╣
║           NIVEL CONCEPTUAL           ║ ← Problema real completo
║          (Esquema global)            ║   (Todas las tablas y reglas)
╠══════════════════════════════════════╣
║            NIVEL INTERNO             ║ ← Almacenamiento físico
║         (Organización física)        ║   (Archivos, índices, disco...)
╚══════════════════════════════════════╝
```

## 🎯 EJEMPLO: HOSPITAL

### 🔧 **NIVEL INTERNO** (El médico NO lo ve)
```
Disco C:\
├── datos\
│   ├── pacientes.dat (2GB)
│   ├── medicos.dat (500MB)
│   └── citas.dat (1GB)
└── indices\
    └── idx_pacientes.idx
```

### 🌍 **NIVEL CONCEPTUAL** (Visión completa)
- **Entidades:** Pacientes, Médicos, Citas, Tratamientos...
- **Reglas:** Un paciente no puede tener 2 citas simultáneas

### 👁️ **NIVELES EXTERNOS** (Vistas personalizadas)

**👨‍⚕️ VISTA MÉDICO:**
- ✅ Mis pacientes de hoy
- ✅ Historiales médicos  
- ❌ NO ve: Nóminas de otros médicos

**👩‍💼 VISTA ADMINISTRATIVA:**
- ✅ Facturación y seguros
- ✅ Estadísticas
- ❌ NO ve: Diagnósticos médicos

**🤒 VISTA PACIENTE:**
- ✅ Mis citas y historial
- ❌ NO ve: Datos de otros pacientes

## 🌐 ARQUITECTURA CLIENTE-SERVIDOR

### 💡 ¿CÓMO ACCEDEN LOS USUARIOS A LOS DATOS?

```
[Cliente] 🧑‍💻 ─────── consulta ───────▶ [Servidor BD] 🖥️
                ◀─────── datos ─────────
```

**DIVISIÓN DE TAREAS:**
- **🖥️ SERVIDOR:** Almacena la BD y ejecuta el SGBD
- **💻 CLIENTE:** Desde donde los usuarios hacen peticiones

### 🔧 TIPOS DE CONFIGURACIONES

**🖥️ 1. MONOEQUIPO:**
- BD y aplicación en el mismo ordenador
- **Ejemplo:** MySQL + phpMyAdmin en tu portátil

**🧩 2. CLIENTE/SERVIDOR CLÁSICO:**
- BD en servidor central, usuarios desde red
- **Ejemplo:** PCs de consultas → Servidor hospital

**🌍 3. DISTRIBUIDA:**
- Información repartida en varios servidores
- **Ejemplo:** Hospital con sedes en varias ciudades

**☁️ 4. CON SERVIDOR DE APLICACIONES:**
- Servidor intermedio para aplicaciones web
- **Ejemplo:** Acceso por navegador desde cualquier lugar

### ⚖️ VENTAJAS vs DESVENTAJAS

**✅ VENTAJAS:**
- 🎯 Centralización de datos
- 👥 Acceso simultáneo múltiples usuarios
- 🔒 Mayor seguridad
- 🔧 Facilidad de mantenimiento

**⚠️ DESVENTAJAS:**
- 💔 Dependencia del servidor
- 🌐 Necesidad de red estable
- 💰 Mayor coste infraestructura

### 🏥 EJEMPLO PRÁCTICO: HOSPITAL
**¿Cómo accederían los médicos desde diferentes consultas?**

```
[Consulta 1] 💻 ─────┐
[Consulta 2] 💻 ─────┤──── Red Local ────▶ [Servidor BD] 🖥️
[Consulta 3] 💻 ─────┘
```

## 🏆 VENTAJAS

---

# 📊 SESIÓN 4: MODELOS DE DATOS

## 🤔 ¿CÓMO ORGANIZAR LA INFORMACIÓN?
**Pregunta:** ¿Cómo organizaríais la información de vuestra familia?

## 🌳 MODELO JERÁRQUICO

### 📋 **CARACTERÍSTICAS:**
- Estructura de **árbol**
- Cada hijo tiene **un solo padre**
- Relaciones **1:N**

### 💼 **EJEMPLO: ORGANIGRAMA EMPRESA**
```
        EMPRESA
         │
    ┌────┴────┐
   VENTAS     IT
    │         │
 ┌──┴──┐   ┌─┴─┐
Ana  Luis  Marta Juan
```

### ⚠️ **LIMITACIÓN**
**¿Qué pasa si Ana trabaja en Ventas E IT?** → ¡IMPOSIBLE!

---

## 🔗 MODELO EN RED

### 📋 **CARACTERÍSTICAS:**
- Un nodo puede tener **múltiples padres**
- Relaciones **N:M**
- Usa **punteros/enlaces**

### 👥 **EJEMPLO: RED SOCIAL**
```
    JUAN ←──→ MARÍA
     ↕         ↕
   PEDRO ←──→ LUCÍA
```

### ✅ **VENTAJA:** Más flexible que jerárquico  
### ⚠️ **DESVENTAJA:** Complejo de mantener

---

## 🧱 MODELO RELACIONAL ⭐

### 📋 **CARACTERÍSTICAS**
- Propuesto por **E.F. Codd (1970)**
- Información en **tablas**
- **Filas** = registros, **Columnas** = campos
- **Clave primaria** = identifica únicamente
- **Clave externa** = relaciona tablas

### 🏥 **EJEMPLO: HOSPITAL EN TABLAS**

**TABLA PACIENTES:**
| ID_PACIENTE | DNI | NOMBRE | TELÉFONO |
|-------------|-----|---------|----------|
| 1 | 12345678A | Ana García | 666111222 |
| 2 | 87654321B | Luis Ruiz | 666333444 |

**TABLA CITAS:**
| ID_CITA | ID_PACIENTE | ID_MÉDICO | FECHA | HORA |
|---------|-------------|-----------|-------|------|
| 1001 | 1 | 101 | 2025-01-15 | 10:00 |
| 1002 | 2 | 102 | 2025-01-15 | 11:00 |

### 💻 **LENGUAJE SQL**
```sql
-- Consultar todos los pacientes
SELECT * FROM PACIENTES;

-- Buscar citas del Dr. Pérez
SELECT * FROM CITAS WHERE ID_MÉDICO = 101;
```

## 📊 COMPARATIVA MODELOS

| **Aspecto** | **Jerárquico** | **En Red** | **Relacional** ⭐ |
|-------------|----------------|------------|-----------------|
| Estructura | Árbol | Gráfico | Tablas |
| Relaciones | 1:N | N:M | N:M |
| Flexibilidad | Baja | Media | **Alta** |
| Facilidad uso | Media | Baja | **Alta** |
| Lenguaje | Navegación | Punteros | **SQL** |

## 🎯 EJEMPLO REAL: ¿INSTAGRAM?
- **Usuarios:** Tabla con ID, nombre, email...
- **Posts:** Tabla con ID, usuario_id, foto...
- **Comentarios:** Tabla con ID, post_id, usuario_id...
- **Seguimientos:** Tabla con seguidor_id, seguido_id...

**RESPUESTA:** ¡RELACIONAL! Instagram usa PostgreSQL

---

# ⚙️ SESIÓN 5: COMPONENTES SGBD Y USUARIOS

## 🧠 COMPONENTES DEL SGBD

### 1️⃣ **NÚCLEO** 
🎼 **Analogía:** Director de orquesta
- Controla integridad y seguridad
- Coordina comunicación entre niveles
- Gestiona acceso concurrente

### 2️⃣ **LENGUAJES**

**🏗️ DDL (Definición):** Crear estructura
```sql
CREATE TABLE PACIENTES (
    ID INT PRIMARY KEY,
    NOMBRE VARCHAR(50)
);
```

**🔧 DML (Manipulación):** Usar datos  
```sql
SELECT * FROM PACIENTES;
INSERT INTO PACIENTES VALUES (1, 'Ana');
```

**🔒 DCL (Control):** Gestionar permisos
```sql
GRANT SELECT ON PACIENTES TO medico;
```

### 3️⃣ **UTILIDADES**
- Asistentes para crear tablas
- Generadores de formularios
- Herramientas de backup
- Interfaces gráficas (phpMyAdmin, pgAdmin...)

### 4️⃣ **DICCIONARIO DE DATOS**
📚 **Concepto:** "El archivo del archivo"
- Nombres de tablas y campos
- Tipos de datos y restricciones
- Usuarios y permisos

## 👥 TIPOS DE USUARIOS

### 👨‍💻 **PROGRAMADORES**
**Función:** Crean aplicaciones que usan la BD
**Ejemplo:** App del hospital para médicos

### 👥 **USUARIOS FINALES**
- **Ocasionales:** Gerentes (consultas esporádicas)
- **Expertos:** Usan SQL directamente  
- **Simples:** Solo menús e interfaces

### 👨‍💼 **ADMINISTRADOR DE DATOS (DA)**
**Decide QUÉ datos almacenar**
- Define políticas de datos
- Establece reglas de negocio
- NO necesita saber informática

### 👨‍🔧 **ADMINISTRADOR BD (DBA)**  
**Decide CÓMO almacenar los datos**
- Instala y configura SGBD
- Optimiza rendimiento
- Copias de seguridad
- SÍ necesita conocimientos técnicos

## 🎭 ROL-PLAYING: HOSPITAL
**SITUACIÓN:** Gestionar historias clínicas

- **DA (Director):** "¿Qué datos médicos son obligatorios?"
- **DBA (Informático):** "¿En qué servidor? ¿Qué copias?"  
- **Programador:** "¿Cómo será la interfaz?"
- **Médico:** "¿Cómo accedo rápido a la info?"

---

# 📝 SESIÓN 6: REPASO Y EVALUACIÓN

## 🧠 QUIZ REPASO

**❓ ¿Cuál NO es problema de ficheros?**
A) Redundancia  B) **Velocidad** ✅  C) Inconsistencia

**❓ ¿Nivel que define "cómo ve cada usuario"?**  
A) Interno  B) Conceptual  C) **Externo** ✅

**❓ ¿Modelo que permite varios padres?**
A) Jerárquico  B) **En Red** ✅  C) Relacional

## 🎯 RESUMEN UNIDAD COMPLETA

```
BASES DE DATOS: Evolución del almacenamiento
├── 🔴 Problemas ficheros (7) → ✅ Solución: SGBD
├── 🏗️ Arquitectura 3 niveles → Abstracción
├── 📊 Modelos datos → Organización  
└── ⚙️ Componentes SGBD → Funcionamiento
```

## 🏆 CONCEPTOS CLAVE DOMINADOS

✅ **Ficheros vs BBDD:** Ventajas y desventajas  
✅ **Arquitectura 3 niveles:** Interno-Conceptual-Externo  
✅ **Modelos:** Jerárquico < Red < **Relacional**  
✅ **SGBD:** Núcleo + Lenguajes + Utilidades + Diccionario  
✅ **Usuarios:** DA, DBA, Programadores, Finales

## 🔮 PRÓXIMA UNIDAD: MODELO RELACIONAL

**Aprenderéis:**
- 🏗️ **Diseñar** bases de datos relacionales profesionales
- 💻 **Escribir** consultas SQL  
- 🔗 **Crear** relaciones entre tablas
- ⚡ **Optimizar** el rendimiento

## 🎯 PREGUNTA FINAL
**¿Estáis listos para diseñar vuestra primera base de datos real?**

---

## 📚 RECURSOS DE APOYO

### 🔗 **Enlaces útiles:**
- Tutorial SQL interactivo: W3Schools
- Ejemplos prácticos: MySQL Tutorial
- Herramientas: phpMyAdmin, MySQL Workbench

### 📖 **Para profundizar:**
- "Fundamentos de Bases de Datos" - Elmasri & Navathe
- "Diseño de Bases de Datos" - García-Molina

---

*📊 Fin de la Presentación - Unidad 1: Conceptos Básicos de BBDD*  
*🎯 ¡Preparados para ser expertos en Bases de Datos!*