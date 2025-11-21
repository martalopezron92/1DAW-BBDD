# EJERCICIOS INICIALES ENTIDAD RELACIÓN IV

## Diferenciación entre Dependencia en EXISTENCIA vs IDENTIFICACIÓN

## RECORDATORIO: ¿Cómo diferenciarlas?

### **Pregunta clave:**
> *"¿La entidad débil NECESITA la clave de la entidad fuerte en su propia clave primaria para identificarse?"*

- **SÍ** → Dependencia en **IDENTIFICACIÓN** 
  - Clave compuesta: FK + discriminante
  - Rombo doble ⬧⬧
  - Ejemplo: HABITACIÓN(#Cod_Hotel FK, #Num_Habitacion)

- **NO** → Dependencia en **EXISTENCIA** 
  - Clave propia independiente
  - Rombo simple ◇
  - Ejemplo: EMPLEADO(#DNI, ..., Cod_Empresa FK)

---

## EJERCICIOS BÁSICOS (Nivel 1)

### **Ejercicio 1: Hospital**

Un hospital tiene varios pacientes ingresados. Cada paciente está identificado por su número de la Seguridad Social. Durante su estancia, un paciente puede recibir múltiples tratamientos. Cada tratamiento se identifica por un código de tratamiento único en todo el hospital.

**Preguntas:**
1. ¿Cuáles son las entidades?
2. ¿Hay entidades débiles? Si es así, ¿cuáles?
3. ¿La dependencia es en existencia o en identificación? Justifica
4. Indica las claves primarias de cada entidad

---

### **Ejercicio 2: Biblioteca**

Una biblioteca gestiona libros. Cada libro tiene un ISBN único. La biblioteca tiene varios ejemplares físicos de cada libro. Los ejemplares se numeran secuencialmente para cada libro (1, 2, 3...). Cada ejemplar puede estar en estados: disponible, prestado, en reparación.

**Preguntas:**
1. ¿Cuáles son las entidades?
2. ¿EJEMPLAR es entidad débil? ¿Por qué?
3. ¿Qué tipo de dependencia tiene? Justifica con la clave primaria
4. ¿Qué pasaría si cada ejemplar tuviera un código de barras único global?

---

### **Ejercicio 3: Universidad - Departamento**

Una universidad tiene varios departamentos. Cada departamento tiene un código único (Cod_Departamento). Los profesores trabajan en un departamento. Cada profesor tiene un número de empleado único en toda la universidad.

**Preguntas:**
1. ¿PROFESOR es entidad débil de DEPARTAMENTO?
2. Si es débil, ¿es por existencia o identificación?
3. Escribe las claves primarias de ambas entidades
4. Si un departamento se cierra, ¿qué debería pasar con sus profesores?

---

### **Ejercicio 4: Supermercado - Facturas**

Un supermercado emite facturas. Cada factura tiene un número de factura único. Dentro de cada factura se incluyen varias líneas con los productos comprados. Cada línea se numera: línea 1, línea 2, línea 3, etc.

**Preguntas:**
1. ¿Cuáles son las entidades?
2. ¿LÍNEA_FACTURA es débil? ¿De qué tipo?
3. ¿Cuál sería la clave primaria de LÍNEA_FACTURA? Justifica
4. ¿Tiene sentido hablar de "la línea 5" sin mencionar la factura?

---

## EJERCICIOS INTERMEDIOS (Nivel 2)

### **Ejercicio 5: Aeropuerto Internacional**

Un aeropuerto internacional tiene varias terminales (T1, T2, T3...). Cada terminal tiene puertas de embarque numeradas (1, 2, 3...). El aeropuerto se identifica por su código IATA (ej: MAD, BCN). Además, el aeropuerto tiene empleados identificados por su DNI único.

**Preguntas:**
1. Identifica TODAS las entidades (fuertes y débiles)
2. Para cada entidad débil, indica si es por existencia o identificación
3. ¿TERMINAL es débil de AEROPUERTO? ¿Cómo se identifica una terminal?
4. ¿PUERTA es débil? ¿De quién depende? ¿Qué tipo de dependencia?
5. ¿EMPLEADO es débil? Justifica
6. Escribe la clave primaria de TERMINAL y de PUERTA

---

### **Ejercicio 6: Empresa Multinacional**

Una empresa tiene oficinas en varias ciudades del mundo. Cada oficina tiene un código único (Cod_Oficina). En cada oficina hay empleados con DNI único. Cada oficina tiene salas de reuniones numeradas (Sala 1, Sala 2...). Las salas pueden tener el mismo número en diferentes oficinas.

**Preguntas:**
1. Identifica entidades fuertes y débiles
2. ¿EMPLEADO es débil de OFICINA? ¿Por qué sí o por qué no?
3. ¿SALA es débil de OFICINA? ¿Qué tipo de dependencia?
4. Compara las claves: EMPLEADO vs SALA
5. ¿Por qué SALA es débil pero EMPLEADO no?

---

### **Ejercicio 7: Banco - Cuentas y Movimientos**

Un banco tiene clientes identificados por DNI. Cada cliente puede tener varias cuentas. Cada cuenta tiene un número de cuenta único en todo el banco (IBAN). Sobre cada cuenta se realizan movimientos (ingresos, retiradas). Cada movimiento tiene un número secuencial dentro de su cuenta.

**Preguntas:**
1. ¿CUENTA es débil de CLIENTE? Justifica
2. ¿MOVIMIENTO es débil? ¿De quién? ¿Qué tipo?
3. Escribe las claves primarias de: CLIENTE, CUENTA, MOVIMIENTO
4. Si eliminamos una cuenta, ¿qué pasa con sus movimientos?

---

### **Ejercicio 8: Polideportivo**

Un polideportivo tiene varias instalaciones deportivas (pistas de tenis, piscina, gimnasio...). Cada instalación tiene un código único (Cod_Instalacion). Las pistas de tenis están numeradas (Pista 1, 2, 3...). El polideportivo también tiene socios identificados por un número de socio único. Los socios realizan reservas de instalaciones.

**Preguntas:**
1. ¿PISTA_TENIS es entidad o atributo de INSTALACION?
2. Si PISTA_TENIS es entidad, ¿es débil? ¿De qué tipo?
3. ¿SOCIO es entidad débil? Justifica
4. ¿RESERVA es entidad? ¿Es débil? Analiza su clave primaria

---

## EJERCICIOS AVANZADOS (Nivel 3)

### **Ejercicio 9: Cadena Hotelera Internacional**

Una cadena hotelera gestiona hoteles en diferentes países. Cada hotel tiene un código único (Cod_Hotel). Cada hotel tiene habitaciones numeradas (101, 102, 201...). Los números de habitación se repiten en diferentes hoteles. Cada habitación puede tener camas identificadas por letra (A, B, C). En cada hotel trabajan empleados con DNI único.

**Preguntas:**
1. Identifica todas las entidades y clasifícalas (fuerte/débil)
2. Para cada entidad débil, indica el tipo de dependencia
3. ¿Cuál es la clave primaria de HABITACION?
4. ¿Cuál es la clave primaria de CAMA?
5. ¿CAMA tiene dependencia directa con HOTEL? Explica
6. ¿EMPLEADO es débil? ¿Por qué?
7. Dibuja el diagrama E/R con la notación correcta (rombos dobles/simples)

---

### **Ejercicio 10: Sistema Educativo Complejo**

Un sistema educativo tiene universidades. Cada universidad tiene facultades identificadas por código de facultad. Cada facultad ofrece titulaciones con código único EN LA FACULTAD (no global). Cada titulación tiene asignaturas con código único EN LA TITULACIÓN. Los profesores tienen DNI único y trabajan en una facultad. Los estudiantes tienen número de expediente único global.

**Preguntas:**
1. Crea una jerarquía de dependencias: ¿Quién depende de quién?
2. Clasifica cada entidad: fuerte, débil-existencia, débil-identificación
3. Escribe la clave primaria de cada entidad
4. ¿PROFESOR es débil? ¿Y ESTUDIANTE?
5. ¿Cuántos niveles de dependencia hay?
6. Si eliminamos una FACULTAD, ¿qué entidades se eliminan en cascada?

---

### **Ejercicio 11: Comercio Electrónico**

Una plataforma de comercio electrónico tiene vendedores identificados por CIF. Cada vendedor publica productos con código único DEL VENDEDOR. Cada producto puede tener variantes (color, talla). Las variantes se identifican con SKU único GLOBAL. Los clientes (DNI único) realizan pedidos (número único global). Cada pedido contiene líneas de pedido numeradas secuencialmente. Cada línea referencia una variante específica.

**Preguntas:**
1. ¿PRODUCTO es débil de VENDEDOR? ¿Qué tipo?
2. ¿VARIANTE es débil? ¿De quién? ¿Qué tipo?
3. ¿LÍNEA_PEDIDO es débil? Analiza
4. Compara: ¿Por qué CLIENTE no es débil pero LÍNEA_PEDIDO sí?
5. Escribe todas las claves primarias
6. ¿Qué pasaría si VARIANTE tuviera SKU único solo dentro del producto?

---

### **Ejercicio 12: Red Social**

En una red social, los usuarios tienen un username único. Cada usuario puede crear posts identificados por un ID único global. Cada post puede tener comentarios. Los comentarios se numeran secuencialmente en cada post. Los comentarios pueden tener respuestas (sub-comentarios) numeradas dentro de su comentario padre.

**Preguntas:**
1. ¿POST es débil de USUARIO? Justifica
2. ¿COMENTARIO es débil de POST? ¿Qué tipo?
3. ¿SUB-COMENTARIO es débil? ¿De quién? ¿Qué tipo?
4. Escribe las claves primarias de: POST, COMENTARIO, SUB-COMENTARIO
5. Si POST tiene ID global único, ¿cambia algo en tu análisis?
<!-- 
---

## EJERCICIOS DE ANÁLISIS CRÍTICO (Nivel 4)

### **Ejercicio 13: Caso Ambiguo - Edificio Residencial**

Un edificio residencial tiene apartamentos. Se te plantean dos opciones de diseño:

**Opción A:**
```
EDIFICIO(#Cod_Edificio, Dirección)
APARTAMENTO(#UUID, Num_Apartamento, Planta, Cod_Edificio FK)
```

**Opción B:**
```
EDIFICIO(#Cod_Edificio, Dirección)
APARTAMENTO(#Cod_Edificio FK, #Num_Apartamento, Planta)
```

**Preguntas:**
1. En la Opción A, ¿APARTAMENTO es débil? ¿Qué tipo?
2. En la Opción B, ¿APARTAMENTO es débil? ¿Qué tipo?
3. ¿Cuál opción es mejor? Justifica pros y contras
4. ¿En qué casos usarías cada opción?
5. Si dos edificios diferentes pueden tener "Apartamento 3A", ¿cuál opción debes usar?

---

### **Ejercicio 14: Rediseño - De Fuerte a Débil**

Tienes este diseño inicial:
```
UNIVERSIDAD(#Cod_Universidad, Nombre)
CURSO(#Cod_Curso, Nombre, Nivel, Cod_Universidad FK)
```

**Preguntas:**
1. En este diseño, ¿CURSO es débil? ¿Por qué?
2. ¿Qué pasaría si varias universidades tuvieran cursos con nombres idénticos?
3. Rediseña el modelo para que CURSO sea débil por identificación
4. Compara ambos diseños: ventajas e inconvenientes
5. ¿Cuándo preferirías usar clave global (fuerte) vs clave local (débil)?

---

### **Ejercicio 15: Caso Real - Sistema Hospitalario Completo**

Un hospital tiene:
- Pacientes (Num. Seguridad Social único)
- Médicos (Num. Colegiado único)
- Departamentos (Cod_Departamento único)
- Habitaciones numeradas por planta (Hab 101, 102, 201...)
- Camas en cada habitación (Cama A, B, C)
- Ingresos hospitalarios (cada paciente puede tener múltiples ingresos, numerados)
- Tratamientos aplicados durante cada ingreso (numerados por ingreso)

**Preguntas:**
1. Clasifica TODAS las entidades (fuerte, débil-existencia, débil-identificación)
2. Para cada entidad débil, justifica tu decisión
3. Escribe la clave primaria de cada entidad
4. ¿MÉDICO es débil de DEPARTAMENTO? Argumenta
5. Dibuja el diagrama E/R completo con la notación correcta
6. Establece la jerarquía completa de dependencias -->

<!-- ---

## 🎯 EJERCICIOS DE APLICACIÓN PRÁCTICA

### **Ejercicio 16: Tu decides - Restaurante**

Un restaurante tiene mesas numeradas (1, 2, 3...). Cada día se anotan las reservas. Diseña el modelo decidiendo:

**Preguntas:**
1. ¿MESA debe ser entidad o atributo?
2. Si MESA es entidad, ¿debe ser fuerte o débil?
3. ¿RESERVA es entidad débil? ¿De qué depende?
4. Diseña dos alternativas diferentes y compáralas
5. Justifica cuál elegirías para un restaurante con:
   - a) Una única sede
   - b) Múltiples sedes (cadena)

---

### **Ejercicio 17: Migración de Diseño**

Te dan este diseño incorrecto:
```
PAIS(#Nombre, Capital, Población)
PROVINCIA(#Nombre, Superficie, Nombre_Pais FK)
```

**Problemas identificados:**
- Los nombres de países se repiten (ej: "España" en cada provincia)
- Los nombres de provincias también (ej: "Córdoba" existe en España y Argentina)

**Tareas:**
1. Identifica los problemas del diseño actual
2. ¿Qué tipo de clave deberían tener PAIS y PROVINCIA?
3. Rediseña correctamente el modelo
4. ¿PROVINCIA debe ser débil de PAÍS? ¿Por qué?
5. Propón dos soluciones: una con débil-identificación y otra con fuerte

---

## ✅ EJERCICIO FINAL INTEGRADOR

### **Ejercicio 18: Sistema Completo de Gestión Académica**

Diseña el modelo E/R completo para:

**Entidades a considerar:**
- Universidad (múltiples universidades)
- Campus (cada universidad tiene varios campus)
- Edificios en cada campus (numerados por campus)
- Aulas en cada edificio (numeradas por edificio)
- Carreras ofrecidas por universidad
- Asignaturas de cada carrera
- Grupos de cada asignatura
- Profesores (DNI único)
- Estudiantes (Num. Expediente único POR UNIVERSIDAD)
- Matrículas (relación estudiante-asignatura)

**Tareas:**
1. Clasifica cada entidad: fuerte, débil-existencia, débil-identificación
2. Justifica cada clasificación
3. Escribe la clave primaria de cada entidad
4. Dibuja el diagrama E/R completo
5. Establece la jerarquía de dependencias
6. Indica los atributos principales de cada entidad
7. Establece las cardinalidades de todas las relaciones

--- -->
