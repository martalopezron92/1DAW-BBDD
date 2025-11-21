## EJERCICIOS INICIALES ENTIDAD RELACIÓN III

## PARTE 1: RELACIONES TERNARIAS

### **Recordatorio Teórico**

**¿Cuándo usar una relación ternaria?**

* **USA relación ternaria SI:**
- La relación solo tiene sentido con las TRES entidades juntas
- No puedes expresar la semántica con relaciones binarias
- Hay atributos que dependen de las tres entidades simultáneamente

* **NO uses relación ternaria SI:**
- Puedes descomponer en relaciones binarias sin perder información
- La relación es realmente dos binarias independientes

**Ejemplo clásico:**
```
PROVEEDOR suministra PRODUCTO a PROYECTO
- Solo tiene sentido juntas (no es lo mismo "proveedor suministra producto" que "proveedor suministra producto A proyecto X")
```

---

### **Ejercicio 1: Sistema de Suministros Industrial**

Una empresa industrial tiene:
- **Proveedores** que suministran materiales
- **Productos** (materias primas)
- **Proyectos** de construcción

Un proveedor puede suministrar diferentes productos a diferentes proyectos. La cantidad suministrada y el precio dependen de QUÉ proveedor suministra QUÉ producto a QUÉ proyecto.

**Preguntas:**
1. ¿Es necesaria una relación ternaria? Justifica
2. ¿Podrías modelarlo con relaciones binarias? ¿Perderías información?
3. ¿Qué atributos tiene la relación ternaria?
4. Dibuja el diagrama E/R con la notación correcta

**Pista:** Piensa si "Proveedor X suministra Producto Y" tiene sentido sin saber el proyecto.

---

### **Ejercicio 2: Hospital - Cirugías**

En un hospital:
- Los **médicos** realizan operaciones
- Los **pacientes** son operados
- Los **quirófanos** son utilizados para las operaciones

Cada operación involucra un médico específico, un paciente específico y un quirófano específico. Se registra la fecha y duración de cada operación.

**Preguntas:**
1. ¿Necesitas una relación ternaria MÉDICO-PACIENTE-QUIRÓFANO?
2. ¿O es mejor tener una entidad OPERACIÓN relacionada con las tres?
3. Diseña ambas alternativas (ternaria vs entidad intermedia)
4. ¿Cuál es mejor? Justifica con pros y contras
5. ¿Qué pasa si quieres registrar operaciones programadas futuras?

---

### **Ejercicio 3: Universidad - Docencia**

En una universidad:
- **Profesores** imparten clases
- **Asignaturas** son impartidas
- **Aulas** son utilizadas

Un profesor imparte una asignatura en un aula específica. El horario (día y hora) depende de la combinación profesor-asignatura-aula.

**Preguntas:**
1. Analiza si es una relación ternaria genuina
2. ¿Podría un profesor impartir la misma asignatura en diferentes aulas?
3. ¿Podría un aula usarse para diferentes asignaturas con diferentes profesores?
4. Diseña el modelo con relación ternaria
5. ¿Qué información se perdería si usaras solo binarias?

**Variante:** ¿Cambiaría tu diseño si un profesor siempre usa la misma aula para todas sus asignaturas?

---

### **Ejercicio 4: Farmacia - Recetas**

Una farmacia gestiona:
- **Médicos** que prescriben medicamentos
- **Medicamentos** que se recetan
- **Pacientes** que reciben las recetas

Un médico prescribe un medicamento específico a un paciente concreto, indicando dosis y duración del tratamiento.

**Preguntas:**
1. ¿Es una relación ternaria MÉDICO-MEDICAMENTO-PACIENTE?
2. ¿Tiene sentido "el médico prescribe el medicamento" sin saber a quién?
3. Diseña el modelo usando una relación ternaria
4. Diseña una alternativa usando una entidad RECETA
5. Compara ambos diseños: ¿cuál prefieres y por qué?
6. ¿Qué pasa si quieres registrar recetas no dispensadas aún?

---

### **Ejercicio 5: Agencia de Viajes**

Una agencia de viajes organiza:
- **Guías turísticos** que acompañan grupos
- **Destinos** turísticos a visitar
- **Grupos** de turistas

Un guía acompaña a un grupo específico a un destino concreto. El idioma utilizado depende del guía y del grupo.

**Preguntas:**
1. Analiza si necesitas relación ternaria GUÍA-DESTINO-GRUPO
2. ¿Un guía siempre lleva los mismos grupos? ¿Siempre al mismo destino?
3. ¿Qué atributos tendría la relación ternaria?
4. Diseña el modelo E/R completo
5. Propón una alternativa sin relación ternaria (entidad VIAJE)
6. ¿Cuándo usarías cada diseño?

**Caso especial:** ¿Cambiaría si quieres registrar viajes que aún no tienen guía asignado?

---

## PARTE 2: RELACIONES REDUNDANTES

### **Recordatorio Teórico**

**Relación redundante:**
> Una relación es redundante si su información puede derivarse de otras relaciones existentes en el modelo.

**¿Cómo detectarlas?**
- Si existe una **ruta alternativa** entre dos entidades que proporciona la misma información
- Si la relación puede **calcularse transitivamente** desde otras relaciones

**Ejemplo:**
```
Si: EMPLEADO trabaja_en DEPARTAMENTO
Y: DEPARTAMENTO pertenece_a EDIFICIO
Entonces: EMPLEADO trabaja_en EDIFICIO (redundante - se deriva de las otras dos)
```

**Cuándo mantener "redundancia":**
- Por **rendimiento** (evitar JOINs complejos)
- Por **cardinalidad diferente** (no es realmente redundante)
- Por **semántica diferente** (significan cosas distintas)

---

### **Ejercicio 6: Empresa - Estructura Organizativa**

Tienes el siguiente modelo:

```
EMPLEADO trabaja_en DEPARTAMENTO (1:N)
DEPARTAMENTO pertenece_a DIVISIÓN (1:N)
DIVISIÓN pertenece_a EMPRESA (1:N)
EMPLEADO trabaja_en EMPRESA (1:N)
```

**Preguntas:**
1. ¿Qué relación es redundante? Justifica
2. Dibuja el camino transitivo que hace redundante la relación
3. ¿Hay algún caso donde mantener EMPLEADO-EMPRESA podría ser útil?
4. Rediseña el modelo eliminando la redundancia
5. ¿Cómo obtendrías la empresa de un empleado sin la relación directa?

---

### **Ejercicio 7: Universidad - Inscripciones**

Modelo propuesto:

```
ESTUDIANTE cursa ASIGNATURA (N:M)
ASIGNATURA pertenece_a CARRERA (N:1)
ESTUDIANTE inscrito_en CARRERA (N:1)
ESTUDIANTE asiste_a FACULTAD (N:1)
CARRERA impartida_en FACULTAD (N:1)
```

**Preguntas:**
1. Identifica TODAS las relaciones redundantes
2. Para cada una, explica por qué es redundante
3. ¿La relación ESTUDIANTE-CARRERA es redundante? Analiza cuidadosamente
4. ¿La relación ESTUDIANTE-FACULTAD es redundante?
5. Rediseña eliminando solo las redundancias reales
6. Justifica qué relaciones mantendrías y por qué

**Pista:** Un estudiante puede cursar asignaturas de diferentes carreras.

---

### **Ejercicio 8: Sistema de Salud**

Modelo dado:

```
PACIENTE atendido_por MÉDICO (N:M)
MÉDICO trabaja_en HOSPITAL (N:1)
PACIENTE ingresado_en HOSPITAL (N:1)
MÉDICO especialista_en ESPECIALIDAD (N:1)
PACIENTE tratado_en ESPECIALIDAD (N:M)
```

**Preguntas:**
1. ¿La relación PACIENTE-HOSPITAL es redundante?
2. ¿La relación PACIENTE-ESPECIALIDAD es redundante?
3. Analiza cada relación y decide si es realmente redundante
4. ¿Hay diferencia entre "paciente ingresado en hospital" y "paciente atendido por médico que trabaja en hospital"?
5. ¿Un paciente puede ser atendido por médicos de diferentes hospitales?
6. Rediseña el modelo correctamente

---

### **Ejercicio 9: Biblioteca - Sistema de Préstamos**

Modelo inicial:

```
USUARIO presta EJEMPLAR (N:M) [con fecha]
EJEMPLAR es_copia_de LIBRO (N:1)
USUARIO presta LIBRO (N:M)
LIBRO escrito_por AUTOR (N:M)
USUARIO interesado_en AUTOR (N:M)
```

**Preguntas:**
1. ¿USUARIO-LIBRO es redundante si ya existe USUARIO-EJEMPLAR-LIBRO?
2. ¿Qué información aporta cada relación?
3. ¿USUARIO-AUTOR es redundante?
4. Diferencia entre "prestar un ejemplar" vs "prestar un libro" vs "interesado en autor"
5. Rediseña el modelo eliminando solo la redundancia real
6. ¿Cuándo sería útil mantener USUARIO-LIBRO aunque parezca redundante?

---

### **Ejercicio 10: Comercio Online - Productos**

Modelo propuesto:

```
CLIENTE compra PRODUCTO (N:M) [a través de PEDIDO]
PEDIDO contiene PRODUCTO (1:N)
PRODUCTO pertenece_a CATEGORÍA (N:1)
CLIENTE interesado_en CATEGORÍA (N:M)
PROVEEDOR suministra PRODUCTO (N:M)
PROVEEDOR asociado_a CATEGORÍA (N:M)
```

**Preguntas:**
1. ¿CLIENTE-PRODUCTO es redundante con CLIENTE-PEDIDO-PRODUCTO?
2. ¿PROVEEDOR-CATEGORÍA es redundante con PROVEEDOR-PRODUCTO-CATEGORÍA?
3. ¿CLIENTE-CATEGORÍA es redundante o tiene semántica diferente?
4. Analiza la diferencia entre "comprar productos" y "estar interesado en categoría"
5. Identifica qué relaciones son realmente redundantes
6. Justifica qué relaciones mantendrías para mejorar el rendimiento

---

## PARTE 3: MODELO E/R EXTENDIDO

### **Recordatorio Teórico**

**Especialización/Generalización:**

Una **superclase** (generalización) se divide en **subclases** (especializaciones).

**Restricciones:**

| Tipo | Descripción | Notación |
|------|-------------|----------|
| **exclusiva (d)** | Una ocurrencia puede estar SOLO en una subclase | ⊕ (XOR) |
| **inclusiva (s)** | Una ocurrencia puede estar en VARIAS subclases | ∧ (AND) |
| **Total (t)** | TODA ocurrencia de la superclase DEBE estar en alguna subclase | Doble línea |
| **Parcial (p)** | Puede haber ocurrencias que NO estén en ninguna subclase | Línea simple |

---

### **Ejercicio 11: Universidad - Tipos de Personas**

En una universidad hay:
- **PERSONA** (superclase): DNI, Nombre, Fecha_Nacimiento
  - **ESTUDIANTE**: Num_Expediente, Carrera
  - **PROFESOR**: Num_Empleado, Departamento, Especialidad
  - **PERSONAL_ADMIN**: Num_Empleado, Puesto, Edificio

**Preguntas:**
1. ¿La especialización es disjunta o solapada? Justifica
2. ¿Es total o parcial? Justifica
3. Dibuja el diagrama con la notación correcta (d/o, t/p)
4. ¿Puede una persona ser estudiante y profesor simultáneamente?
5. ¿Puede haber personas que no sean ninguna de las tres?
6. Si permitimos que profesores sean también estudiantes (doctorado), ¿cómo cambiaría?

**Variante:** ¿Qué pasa con visitantes, familiares, etc.?

---

### **Ejercicio 12: Empresa de Transporte - Vehículos**

Una empresa de transporte tiene:
- **VEHÍCULO** (superclase): Matrícula, Marca, Modelo, Año
  - **CAMIÓN**: Capacidad_Carga, Num_Ejes
  - **AUTOBÚS**: Num_Plazas, Tipo_Servicio
  - **FURGONETA**: Volumen_Carga, Refrigerada

Además, los vehículos pueden tener:
- **PROPIO**: Fecha_Compra, Valor_Compra
- **ALQUILADO**: Empresa_Alquiler, Fecha_Inicio_Alquiler, Coste_Mensual

**Preguntas:**
1. ¿Cuántas jerarquías IS-A hay en este modelo?
2. Para la jerarquía por tipo (Camión/Autobús/Furgoneta):
   - ¿Disjunta o solapada? ¿Total o parcial?
3. Para la jerarquía por propiedad (Propio/Alquilado):
   - ¿Disjunta o solapada? ¿Total o parcial?
4. ¿Puede un vehículo ser Camión Y Autobús?
5. ¿Puede un vehículo ser Propio Y Alquilado?
6. ¿Puede haber vehículos que no sean ni Propio ni Alquilado?
7. Dibuja el diagrama completo con ambas jerarquías

---

### **Ejercicio 13: Hospital - Personal Médico**

En un hospital:
- **EMPLEADO** (superclase): DNI, Nombre, Fecha_Contratación
  - **MÉDICO**: Num_Colegiado, Especialidad
    - **MÉDICO_RESIDENTE**: Año_Residencia, Médico_Tutor
    - **MÉDICO_ADJUNTO**: Servicio_Asignado
    - **JEFE_SERVICIO**: Servicio_Dirigido, Num_Personal_a_Cargo
  - **ENFERMERO**: Num_Colegiado, Turno
  - **ADMINISTRATIVO**: Departamento, Puesto

**Preguntas:**
1. Identifica TODAS las jerarquías (puede haber múltiples niveles)
2. Para EMPLEADO → MÉDICO/ENFERMERO/ADMINISTRATIVO:
   - ¿(d, t), (d, p), (o, t) o (o, p)? Justifica
3. Para MÉDICO → RESIDENTE/ADJUNTO/JEFE:
   - ¿Qué restricciones? ¿Un médico puede ser Adjunto y Jefe?
4. ¿Puede haber médicos que no sean ni Residente, ni Adjunto, ni Jefe?
5. ¿Puede un médico estar "en formación" (Residente) y ser también Adjunto?
6. Dibuja el diagrama jerárquico completo con notación correcta

---

### **Ejercicio 14: Banco - Tipos de Cuentas y Clientes**

Un banco tiene:
- **CUENTA** (superclase): Num_Cuenta, Saldo, Fecha_Apertura
  - **CUENTA_CORRIENTE**: Tarjeta_Débito, Descubierto_Máximo
  - **CUENTA_AHORRO**: Interés_Anual, Saldo_Mínimo
  - **CUENTA_NÓMINA**: Empresa_Nómina, Comisión_Cero

Y también:
- **CLIENTE** (superclase): DNI/CIF, Nombre, Dirección
  - **CLIENTE_PARTICULAR**: Fecha_Nacimiento, Profesión
  - **CLIENTE_EMPRESA**: Razón_Social, Sector, Num_Empleados
  - **CLIENTE_AUTÓNOMO**: Actividad, Fecha_Alta_Autónomo

**Preguntas:**
1. Para la jerarquía CUENTA:
   - ¿Una cuenta puede ser Corriente Y Ahorro simultáneamente?
   - ¿Debe ser al menos una de ellas?
   - ¿Qué restricciones aplicas? (d/o, t/p)
2. Para la jerarquía CLIENTE:
   - ¿Disjunta o solapada? (¿puede alguien ser Particular y Autónomo?)
   - ¿Total o parcial? (¿todos los clientes son de algún tipo?)
3. ¿Cómo modelarías que un Autónomo tiene características de Particular (persona física) y Empresa (actividad económica)?
4. Dibuja ambas jerarquías con notación correcta
5. ¿Qué problemas surgen si un autónomo debe estar en dos subclases?

**Caso especial:** Muchos autónomos son personas físicas con actividad empresarial. ¿Cómo resolverías el conflicto?

---

### **Ejercicio 15: Plataforma de Contenidos - Multimedia**

Una plataforma de streaming gestiona:
- **CONTENIDO** (superclase): ID, Título, Duración, Fecha_Publicación
  - **VIDEO**: Resolución, Formato_Video, Codec
    - **PELÍCULA**: Director, Año_Producción, Calificación_Edad
    - **SERIE**: Num_Temporadas, Num_Episodios_Total
    - **DOCUMENTAL**: Tema, Narrador, Institución
  - **AUDIO**: Bitrate, Formato_Audio
    - **PODCAST**: Presentador, Frecuencia_Publicación
    - **AUDIOLIBRO**: Autor, Narrador, Duración_Capítulos
    - **MÚSICA**: Artista, Álbum, Género

Además, el contenido puede ser:
- **GRATUITO**: Con_Anuncios, Num_Anuncios_Por_Hora
- **PREMIUM**: Incluido_Suscripción, Nivel_Suscripción_Requerido
- **PAGO_POR_VISIÓN**: Precio, Período_Disponibilidad

**Preguntas:**
1. Identifica TODAS las jerarquías (hay 3 niveles en una de ellas)
2. Para CONTENIDO → VIDEO/AUDIO:
   - ¿Restricciones? ¿Puede ser ambos?
3. Para VIDEO → PELÍCULA/SERIE/DOCUMENTAL:
   - ¿Disjunta o solapada? ¿Un contenido puede ser Serie y Documental?
4. Para CONTENIDO → GRATUITO/PREMIUM/PPV:
   - ¿Restricciones? ¿Puede un contenido ser Gratuito Y Premium?
5. ¿Debe TODO contenido tener un modelo de monetización?
6. Dibuja el diagrama completo con todas las jerarquías
7. Indica todas las restricciones (d/o, t/p) para cada jerarquía

**Análisis adicional:**
- ¿Qué pasa con contenido en "prueba gratuita"?
- ¿Cómo modelarías contenido que es Premium pero también tiene versión gratuita con anuncios?

---

## 📊 EJERCICIOS DE INTEGRACIÓN

### **Ejercicio BONUS: Sistema Completo de Gestión Deportiva**

Diseña el modelo E/R extendido completo para un complejo deportivo:

**Entidades base:**
- **PERSONA**: DNI, Nombre, Fecha_Nacimiento, Dirección
  - **SOCIO**: Num_Socio, Fecha_Alta, Tipo_Cuota
    - **SOCIO_INFANTIL**: Tutor_Responsable (otra PERSONA)
    - **SOCIO_ADULTO**: Profesión, Empresa
    - **SOCIO_SENIOR**: Pensionista, Descuento_Especial
  - **EMPLEADO**: Num_Empleado, Fecha_Contratación
    - **ENTRENADOR**: Titulación, Especialidades[]
    - **MONITOR**: Actividades[], Horario
    - **PERSONAL_MANTENIMIENTO**: Área_Asignada

- **INSTALACIÓN**: Cod_Instalación, Nombre, Capacidad
  - **PISTA**: Superficie, Iluminación, Cubierta
    - **PISTA_TENIS**: Num_Pista, Tipo_Suelo
    - **PISTA_PADEL**: Num_Pista, Cristales
    - **CAMPO_FÚTBOL**: Dimensiones, Césped_Artificial
  - **PISCINA**: Profundidad_Min, Profundidad_Max, Temperatura
  - **GIMNASIO**: Equipamiento[], Aforo_Máximo
  - **SALA_ACTIVIDADES**: Tipo_Suelo, Espejos, Equipo_Sonido

**Relaciones ternarias:**
- Un SOCIO reserva una INSTALACIÓN para un HORARIO específico
- Un ENTRENADOR imparte CLASE_GRUPAL en INSTALACIÓN (horario incluido)
- Un MONITOR supervisa ACTIVIDAD en INSTALACIÓN (horario)

**Preguntas del ejercicio integrador:**
1. Dibuja el diagrama E/R completo con TODAS las jerarquías
2. Especifica (e/o, i/p) para cada jerarquía y justifica
3. Identifica si necesitas relaciones ternarias o son decomponibles
4. Detecta posibles redundancias en el modelo
5. ¿Puede una persona ser SOCIO y EMPLEADO simultáneamente?
6. ¿Cómo modelarías que algunos socios son también entrenadores voluntarios?
7. Propón atributos adicionales relevantes
8. Establece las cardinalidades de todas las relaciones

