# PRÁCTICA 2: ARQUITECTURA DE BASES DE DATOS Y MODELOS DE DATOS

**Asignatura:** Bases de Datos  
**Curso:** 1º DAW  
**Tiempo estimado:** 90 minutos  
**Tipo:** Teórica-Conceptual  

## OBJETIVOS
- Comprender la arquitectura de 3 niveles de una BBDD
- Distinguir entre los diferentes modelos de datos
- Aplicar conceptos de independencia de datos
- Analizar componentes y usuarios de un SGBD

## ENUNCIADO

### CASO PRÁCTICO: SISTEMA DE GESTIÓN HOSPITALARIA

El Hospital "Virgen del Mar" de Cádiz quiere modernizar su sistema de información. Necesitan gestionar información de pacientes, médicos, consultas, tratamientos y departamentos.

### PARTE 1: MODELOS DE DATOS (30 puntos)

1.1. **Representa la información del hospital** usando los tres modelos de datos vistos en clase:

**Información básica:**
- Departamentos: Cardiología, Traumatología, Pediatría
- Médicos: Dr. García (Cardiología), Dra. López (Traumatología), Dr. Martín (Pediatría)
- Pacientes: Ana Ruiz, Luis Pérez, Marta Silva

a) **Modelo Jerárquico:** Dibuja la estructura en árbol
b) **Modelo en Red:** Representa las relaciones múltiples
c) **Modelo Relacional:** Diseña las tablas correspondientes

1.2. **Completa la tabla comparativa:**

| Característica | Jerárquico | En Red | Relacional |
|---------------|------------|---------|------------|
| Tipo de relación principal | | | |
| Flexibilidad para consultas | | | |
| Facilidad de mantenimiento | | | |
| ¿Permite relaciones N:M? | | | |
| Ejemplo de SGBD | | | |

### PARTE 2: ARQUITECTURA DE 3 NIVELES (35 puntos)

2.1. **Diseña los tres esquemas** para el sistema hospitalario:

**ESQUEMA INTERNO:**
- Define al menos 3 archivos físicos con sus características:
  - Organización (secuencial, indexada, hash)
  - Campos clave
  - Tipo de datos y longitudes

**ESQUEMA CONCEPTUAL:**
- Define las entidades principales
- Especifica al menos 5 reglas de integridad del hospital
- Ejemplo: "Un médico solo puede estar en un departamento"

**ESQUEMAS EXTERNOS:**
- Diseña 3 vistas diferentes para:
  - Personal de recepción
  - Médicos
  - Administración

2.2. **Explica con ejemplos específicos:**
a) ¿Qué es la independencia física de datos?
b) ¿Qué es la independencia lógica de datos?
c) Da un ejemplo de cada una en el contexto hospitalario

### PARTE 3: COMPONENTES DEL SGBD (20 puntos)

3.1. **Para cada componente del SGBD, explica su función en el hospital:**
- **Núcleo:**
- **Lenguajes (DDL, DML, DCL):**
- **Utilidades:**
- **Diccionario de datos:**

3.2. **Proporciona ejemplos específicos** de comandos o acciones que realizaría cada lenguaje en el hospital.

### PARTE 4: USUARIOS DEL SISTEMA (15 puntos)

4.1. **Identifica y describe** qué tipo de usuario del SGBD sería cada perfil:
- Director del hospital
- Programador del sistema informático
- Médico consultando historiales
- Administrativo de base de datos del hospital

4.2. **Define los permisos específicos** que tendría cada tipo de usuario sobre los datos del hospital.

## EJEMPLO DE DESARROLLO

**Para el Esquema Externo de Recepción:**
```
VISTA_RECEPCION:
- Datos del paciente: DNI, Nombre, Teléfono
- Datos de la cita: Fecha, Hora, Médico, Departamento
- NO incluye: Diagnósticos, Tratamientos, Datos médicos confidenciales
```

## CRITERIOS DE EVALUACIÓN
- **Comprensión de modelos:** Correcta representación en cada modelo
- **Arquitectura de niveles:** Distinción clara entre esquemas
- **Independencia de datos:** Comprensión de los conceptos
- **Aplicación práctica:** Contextualización en el caso hospitalario

## ENTREGA
- Documento con diagramas y esquemas claros
- Respuestas justificadas
- Formato PDF o Word
- Fecha límite: [A definir por el profesor]