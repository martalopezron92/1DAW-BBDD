# PARTICIPACIÓN Y TIPOS DE ATRIBUTOS EN EL MODELO E/R

**Asignatura:** Bases de Datos  
**Curso:** 1º DAW  
**Unidad:** U2 - Modelo Entidad-Relación  
**Conceptos:** Participación, Atributos Simples, Compuestos y Multievaluados

---

## 📚 ÍNDICE

1. [Participación de Entidades](#1-participación-de-entidades)
2. [Tipos de Atributos](#2-tipos-de-atributos)
3. [Ejemplos Integrados](#3-ejemplos-integrados)
4. [Ejercicios Prácticos](#4-ejercicios-prácticos)

---

## 1. PARTICIPACIÓN DE ENTIDADES

### 1.1. Definición

La **participación** de una entidad en una relación indica **el número mínimo y máximo de veces que cada instancia de esa entidad puede aparecer en la relación**.

Se representa mediante la notación **(mín, máx)** donde:
- **mín:** Número mínimo de ocurrencias (0 o 1)
- **máx:** Número máximo de ocurrencias (1 o N)

### 1.2. Tipos de Participación

#### 🔹 Participación TOTAL (Obligatoria)
**Definición:** Toda instancia de la entidad DEBE participar al menos una vez en la relación.

**Características:**
- Cardinalidad mínima = 1
- Se representa gráficamente con **doble línea**
- Ejemplo: (1,1) o (1,N)

**Ejemplo:**
```
EMPLEADO (1,1) ─── trabaja_en ─── (1,N) DEPARTAMENTO
```
- Todo EMPLEADO **debe** trabajar en al menos un departamento (mín=1)
- Un DEPARTAMENTO puede tener varios empleados (máx=N)

#### 🔹 Participación PARCIAL (Opcional)
**Definición:** Una instancia de la entidad puede existir sin participar en la relación.

**Características:**
- Cardinalidad mínima = 0
- Se representa gráficamente con **línea simple**
- Ejemplo: (0,1) o (0,N)

**Ejemplo:**
```
PERSONA (0,1) ─── posee ─── (1,1) VEHÍCULO
```
- Una PERSONA puede no tener vehículo (mín=0)
- Un VEHÍCULO debe tener un propietario (mín=1)

### 1.3. Interpretación Práctica

| Notación | Significado | Ejemplo Real |
|----------|-------------|--------------|
| **(0,1)** | Opcional, como máximo 1 | Una persona puede tener 0 o 1 DNI |
| **(1,1)** | Obligatorio, exactamente 1 | Todo empleado trabaja en exactamente 1 departamento |
| **(0,N)** | Opcional, puede tener varios | Un departamento puede tener 0 o muchos empleados |
| **(1,N)** | Obligatorio, al menos 1 | Un pedido debe tener al menos 1 producto |

### 1.4. Ejemplo Completo con Explicación

**Caso: Sistema Universitario**

```
PROFESOR (1,N) ──── imparte ──── (1,N) ASIGNATURA
```

**Interpretación:**
- **PROFESOR (1,N):**
  - **Mínimo 1:** Todo profesor debe impartir al menos una asignatura
  - **Máximo N:** Un profesor puede impartir varias asignaturas
  
- **ASIGNATURA (1,N):**
  - **Mínimo 1:** Toda asignatura debe ser impartida por al menos un profesor
  - **Máximo N:** Una asignatura puede ser impartida por varios profesores (diferentes grupos)

**Restricción:** No puede haber profesores sin asignaturas ni asignaturas sin profesores.

---

## 2. TIPOS DE ATRIBUTOS

### 2.1. Atributos SIMPLES (Atómicos)

#### Definición
Un atributo **simple** es aquel que **no se puede dividir** en partes más pequeñas con significado propio.

#### Características
- ✅ Valor indivisible
- ✅ Representa una información única
- ✅ No tiene componentes

#### Representación Gráfica
```
┌─────────┐
│ PERSONA │
└─────────┘
     ○ edad
     ○ DNI
     ○ email
```
Se representa con un **óvalo simple** conectado a la entidad.

#### Ejemplos

| Atributo | Entidad | ¿Por qué es simple? |
|----------|---------|---------------------|
| **DNI** | PERSONA | Es un valor único, no se divide |
| **precio** | PRODUCTO | Valor numérico indivisible |
| **ISBN** | LIBRO | Código único sin componentes |
| **edad** | ALUMNO | Número entero sin partes |
| **temperatura** | SENSOR | Valor único de medición |

**Ejemplo Completo:**
```
PRODUCTO
├─ cod_producto (simple)
├─ nombre (simple)
├─ precio (simple)
├─ peso (simple)
└─ stock (simple)
```

---

### 2.2. Atributos COMPUESTOS

#### Definición
Un atributo **compuesto** es aquel que **se puede descomponer** en varios subatributos más simples, cada uno con significado propio.

#### Características
- ✅ Divisible en componentes
- ✅ Cada componente tiene significado independiente
- ✅ Se puede acceder a la información completa o a sus partes

#### Representación Gráfica
```
┌─────────┐
│ PERSONA │
└─────────┘
     ○ nombre_completo
    ╱ │ ╲
   ○  ○  ○
nombre apellido1 apellido2
```
Se representa con un **óvalo principal** del que salen líneas hacia **óvalos secundarios** (componentes).

#### Ejemplos Detallados

**1. DIRECCIÓN (El más común)**
```
DIRECCIÓN
├─ calle (simple)
├─ número (simple)
├─ piso (simple)
├─ código_postal (simple)
├─ ciudad (simple)
└─ provincia (simple)
```

**¿Por qué es compuesto?**
- Puedes consultar la dirección completa: "Calle Mayor, 15, 3ºB, 28013, Madrid, Madrid"
- O solo un componente: "¿En qué ciudad vive?" → "Madrid"

**2. NOMBRE_COMPLETO**
```
NOMBRE_COMPLETO
├─ nombre (simple)
├─ apellido1 (simple)
└─ apellido2 (simple)
```

**3. FECHA**
```
FECHA
├─ día (simple)
├─ mes (simple)
└─ año (simple)
```

**Ventaja de los atributos compuestos:**
- Flexibilidad: puedes buscar por ciudad sin necesitar la dirección completa
- Normalización: evitas repetir información (ej: la ciudad)
- Consultas específicas: "Todos los clientes de Madrid"

#### Ejemplo Práctico Completo

```
Entidad: EMPLEADO

Atributos simples:
- DNI
- num_seguridad_social
- salario
- fecha_nacimiento

Atributos compuestos:
- nombre_completo
  ├─ nombre
  ├─ primer_apellido
  └─ segundo_apellido

- dirección
  ├─ calle
  ├─ número
  ├─ piso
  ├─ código_postal
  ├─ ciudad
  └─ provincia

- teléfono_empresa
  ├─ prefijo
  ├─ número
  └─ extensión
```

---

### 2.3. Atributos MULTIEVALUADOS (Multivaluados)

#### Definición
Un atributo **multievaluado** es aquel que puede tener **múltiples valores** para una misma instancia de la entidad.

#### Características
- ✅ Puede tener 0, 1 o varios valores simultáneamente
- ✅ Cada valor es del mismo tipo
- ✅ Número de valores variable por instancia

#### Representación Gráfica
```
┌─────────┐
│ PERSONA │
└─────────┘
     ◎ teléfonos
     ◎ emails
```
Se representa con un **doble óvalo** (óvalo dentro de otro óvalo).

#### Ejemplos Detallados

**1. TELÉFONOS**
```
PERSONA
- nombre: "Ana García"
- teléfonos: {654123456, 912345678, 600111222}
```
Una persona puede tener:
- 0 teléfonos (no tiene)
- 1 teléfono (móvil personal)
- Varios teléfonos (móvil, fijo, trabajo)

**2. EMAILS**
```
CLIENTE
- nombre: "Luis Pérez"
- emails: {luis@gmail.com, l.perez@empresa.com}
```

**3. IDIOMAS**
```
PROFESOR
- nombre: "María López"
- idiomas: {Español, Inglés, Francés, Alemán}
```

**4. TITULACIONES**
```
EMPLEADO
- nombre: "Pedro Ruiz"
- titulaciones: {Grado Informática, Máster Big Data, Certificado AWS}
```

**5. COLORES**
```
COCHE
- matrícula: "1234ABC"
- colores: {Rojo, Negro} ← puede ser bicolor
```

#### Ejemplo Práctico Completo

```
Entidad: AUTOR

Atributos simples:
- DNI: "12345678A"
- nombre: "Gabriel García Márquez"
- fecha_nacimiento: 1927-03-06

Atributos multievaluados:
- nacionalidades: {Colombiana, Mexicana}
- premios: {Nobel Literatura 1982, Premio Rómulo Gallegos 1972}
- géneros: {Realismo mágico, Novela, Cuento}
- idiomas_publicación: {Español, Inglés, Francés, Alemán, ...}
```

#### ⚠️ Problema de los Atributos Multievaluados

Los atributos multievaluados **suelen convertirse en una entidad separada** en el diseño final porque:

1. **Limitan las consultas:** Difícil buscar "todos los clientes con email de Gmail"
2. **No permiten información adicional:** ¿Qué teléfono es el principal?
3. **Complican actualizaciones:** Difícil añadir/eliminar valores

**Solución: Convertir en entidad**

❌ **ANTES (Atributo multievaluado):**
```
PERSONA
- DNI
- nombre
- teléfonos: {654123456, 912345678}
```

✅ **DESPUÉS (Entidad separada):**
```
PERSONA                    TELÉFONO
- DNI          ────<─────  - num_teléfono
- nombre       1      N    - tipo (móvil/fijo/trabajo)
                           - principal (sí/no)
                           - DNI_persona [FK]
```

---

## 3. EJEMPLOS INTEGRADOS

### Ejemplo 1: Sistema de Gestión de Empleados

```
Entidad: EMPLEADO

Atributos SIMPLES:
├─ DNI: "12345678A"
├─ num_empleado: 1523
├─ salario: 2500.00
└─ fecha_alta: 2023-01-15

Atributos COMPUESTOS:
├─ nombre_completo
│  ├─ nombre: "Ana"
│  ├─ apellido1: "García"
│  └─ apellido2: "López"
│
└─ dirección
   ├─ calle: "Calle Mayor"
   ├─ número: 42
   ├─ piso: "3ºB"
   ├─ código_postal: 28013
   ├─ ciudad: "Madrid"
   └─ provincia: "Madrid"

Atributos MULTIEVALUADOS:
├─ teléfonos: {654123456, 912345678}
├─ emails: {ana.garcia@empresa.com, ana.gl@gmail.com}
└─ certificaciones: {Scrum Master, AWS Developer, Java Professional}

Participación en relaciones:
└─ EMPLEADO (1,1) ──trabaja_en──> (0,N) DEPARTAMENTO
   Interpretación: Todo empleado debe trabajar en exactamente 1 departamento
```

---

### Ejemplo 2: Sistema Universitario Completo

```
Entidad: PROFESOR

Atributos SIMPLES:
├─ DNI: "87654321B"
├─ num_profesor: "P-2024-156"
├─ fecha_nacimiento: 1980-05-20
├─ antigüedad: 10 (años)
└─ categoría: "Titular"

Atributos COMPUESTOS:
└─ despacho
   ├─ edificio: "Aulario Norte"
   ├─ planta: 2
   ├─ número: "2.15"
   └─ teléfono_despacho
      ├─ prefijo: 91
      ├─ número: 5551234
      └─ extensión: 4567

Atributos MULTIEVALUADOS:
├─ títulos: {Licenciado Matemáticas, Doctor Informática}
├─ especialidades: {Bases de Datos, Sistemas Operativos}
└─ idiomas: {Español, Inglés, Francés}

Participación en relaciones:
├─ PROFESOR (1,N) ──imparte──> (1,N) ASIGNATURA
│  Todo profesor imparte al menos 1 asignatura, puede impartir varias
│
└─ PROFESOR (0,N) ──tutoriza──> (0,1) ALUMNO
   Un profesor puede tutorizar varios alumnos (o ninguno)
   Un alumno puede tener un tutor (o ninguno)
```

---

### Ejemplo 3: Sistema de Biblioteca

```
Entidad: LIBRO

Atributos SIMPLES:
├─ ISBN: "978-84-9104-456-7"
├─ título: "Cien años de soledad"
├─ año_publicación: 1967
├─ num_páginas: 496
└─ precio: 19.95

Atributos COMPUESTOS:
└─ ubicación
   ├─ sala: "Literatura Hispanoamericana"
   ├─ estantería: "LH-12"
   ├─ balda: 3
   └─ posición: 15

Atributos MULTIEVALUADOS:
├─ autores: {Gabriel García Márquez}
├─ categorías: {Novela, Realismo mágico, Literatura colombiana}
├─ idiomas_disponibles: {Español, Inglés, Francés, Alemán}
└─ palabras_clave: {familia, soledad, Macondo, Colombia, realismo mágico}

Participación en relaciones:
├─ LIBRO (0,N) ──prestado_a──> (0,N) SOCIO
│  Un libro puede estar prestado o no (mín=0)
│  Un socio puede tener varios libros prestados o ninguno
│
└─ LIBRO (1,1) ──pertenece_a──> (1,N) EDITORIAL
   Todo libro pertenece a exactamente 1 editorial (obligatorio)
```

---

## 4. EJERCICIOS PRÁCTICOS

### EJERCICIO 1: Identificación de Tipos de Atributos ⭐

Para cada uno de los siguientes atributos, indica si es SIMPLE, COMPUESTO o MULTIEVALUADO. Justifica tu respuesta.

1. **email** de un CLIENTE
2. **fecha_nacimiento** de una PERSONA
3. **dirección_completa** de una EMPRESA
4. **precio** de un PRODUCTO
5. **teléfonos_contacto** de un PROVEEDOR
6. **coordenadas_GPS** (latitud, longitud) de una UBICACIÓN
7. **colores_disponibles** de un COCHE
8. **nombre_completo** (nombre, apellido1, apellido2) de un ALUMNO
9. **stock** de un ALMACÉN
10. **certificaciones** (ISO9001, ISO14001, etc.) de una EMPRESA

<!-- **Soluciones al final del documento** ↓ -->

---

### EJERCICIO 2: Descomposición de Atributos Compuestos ⭐⭐

Para cada atributo compuesto, indica TODOS los componentes simples que lo forman:

1. **HORARIO_LABORAL** de un EMPLEADO
2. **DATOS_BANCARIOS** de una PERSONA
3. **ESPECIFICACIONES_TÉCNICAS** de un ORDENADOR
4. **DIRECCIÓN_EMAIL** (usuario, dominio) 
5. **PERIODO_TEMPORAL** (fecha_inicio, fecha_fin)

---

### EJERCICIO 3: Conversión de Multievaluados a Entidades ⭐⭐

Convierte los siguientes atributos multievaluados en entidades separadas con sus relaciones correspondientes:

**Ejemplo:**
```
❌ PERSONA { DNI, nombre, teléfonos }

✅ PERSONA { DNI, nombre }
   TELÉFONO { num_teléfono, tipo, DNI_persona [FK] }
   Relación: PERSONA (1,N) ──tiene──> (1,1) TELÉFONO
```

**Casos a resolver:**

1. **AUTOR** con atributo multievaluado **premios**
2. **PRODUCTO** con atributo multievaluado **proveedores**
3. **ALUMNO** con atributo multievaluado **asignaturas_matriculadas**
4. **PELÍCULA** con atributo multievaluado **actores**

---

### EJERCICIO 4: Determinar Participación ⭐⭐

Para cada relación, determina la participación (mín,máx) de cada entidad y justifica:

1. **CLIENTE** compra **PRODUCTO**
   - ¿Un cliente debe comprar al menos un producto?
   - ¿Un producto debe ser comprado por alguien?

2. **MÉDICO** atiende **PACIENTE**
   - ¿Un médico debe atender al menos un paciente?
   - ¿Un paciente debe ser atendido por un médico?

3. **DEPARTAMENTO** tiene **JEFE** (un jefe es un empleado)
   - ¿Un departamento debe tener jefe?
   - ¿Un empleado debe ser jefe de algún departamento?

4. **AUTOR** escribe **LIBRO**
   - ¿Un autor debe haber escrito algún libro?
   - ¿Un libro debe tener autor?

5. **PROFESOR** tutoriza **ALUMNO**
   - ¿Un profesor debe tutorizar alumnos?
   - ¿Un alumno debe tener tutor?

---

### EJERCICIO 5: Caso Completo - Sistema de Gestión Hospitalaria ⭐⭐⭐

Diseña las entidades completas con sus atributos para un sistema hospitalario:

**Entidades:** MÉDICO, PACIENTE, TRATAMIENTO, HABITACIÓN

**Para cada entidad:**
1. Identifica al menos 3 atributos simples
2. Identifica al menos 1 atributo compuesto (si aplica)
3. Identifica al menos 1 atributo multievaluado (si aplica)
4. Define las relaciones con participación (mín,máx)

**Relaciones a considerar:**
- MÉDICO atiende PACIENTE
- PACIENTE recibe TRATAMIENTO
- PACIENTE ingresa en HABITACIÓN
- MÉDICO prescribe TRATAMIENTO

---

### EJERCICIO 6: Corrección de Errores ⭐⭐⭐

Encuentra los 5 errores en el siguiente diseño y corrígelos:

```
Entidad: ESTUDIANTE

Atributos SIMPLES:
- nombre_completo: "Juan Pérez García" 
- edad: 20
- dirección: "Calle Mayor, 15, Madrid"

Atributos COMPUESTOS:
- expediente
  ├─ año: 2024
  └─ número: 1523

Atributos MULTIEVALUADOS:
- email: juan@example.com 
- nota_media: 7.5 ← ERROR?

Participación:
ESTUDIANTE (0,1) ──matriculado_en──> (0,N) ASIGNATURA
(¿Un estudiante puede no estar matriculado en ninguna asignatura?)
```

---

### EJERCICIO 7: Caso Práctico - Red Social ⭐⭐⭐

Diseña el modelo E/R completo para una red social simple:

**Requisitos:**
- Los usuarios tienen nombre, email, fecha_nacimiento, biografía
- Los usuarios tienen múltiples teléfonos de contacto
- Los usuarios pueden tener varias direcciones (personal, trabajo)
- Los usuarios publican posts con fecha, texto, imagen (opcional)
- Los usuarios pueden seguir a otros usuarios
- Los usuarios pueden comentar posts de otros usuarios

**Entrega:**
1. Lista de entidades con sus atributos clasificados (simple/compuesto/multievaluado)
2. Relaciones con participación (mín,máx)
3. Justificación de decisiones de diseño

---

### EJERCICIO 8: Análisis de Restricciones ⭐⭐⭐⭐

Para cada escenario, determina si la participación debe ser total o parcial:

1. **EMPRESA** tiene **SEDE_CENTRAL**
   - ¿Toda empresa debe tener una sede central?
   - ¿Puede una empresa tener varias sedes centrales?
   - Propón: EMPRESA (?,?) ──tiene──> (?,?) SEDE_CENTRAL

2. **LIBRO** tiene **EDICIÓN**
   - ¿Un libro debe tener al menos una edición para existir?
   - ¿Una edición puede existir sin libro?
   - Propón: LIBRO (?,?) ──tiene──> (?,?) EDICIÓN

3. **EMPLEADO** supervisa **EMPLEADO**
   - ¿Todo empleado debe supervisar a alguien?
   - ¿Todo empleado debe ser supervisado?
   - Propón: EMPLEADO (?,?) ──supervisa──> (?,?) EMPLEADO
---

## 📋 RESUMEN DE CONCEPTOS

### Participación
- **Total (mín=1):** Obligatoria, doble línea
- **Parcial (mín=0):** Opcional, línea simple
- **Notación:** (mín, máx)

### Atributos
| Tipo | Característica | Representación | Ejemplo |
|------|----------------|----------------|---------|
| **Simple** | No divisible | Óvalo simple ○ | edad, DNI |
| **Compuesto** | Se divide en componentes | Óvalo ramificado | dirección, nombre_completo |
| **Multievaluado** | Múltiples valores | Doble óvalo ◎ | teléfonos, emails |

### Reglas Prácticas
1. ✅ Si necesitas consultar por componentes → Compuesto
2. ✅ Si puede haber varios valores → Multievaluado
3. ✅ Si el mínimo es 0 → Participación parcial
4. ✅ Si el mínimo es 1 → Participación total
5. ✅ Multievaluados complejos → Convertir en entidad

---

**Documento elaborado por:** Profesora - Bases de Datos 1º DAW  
**Fecha:** 16 de diciembre de 2025  
**Versión:** 1.0
