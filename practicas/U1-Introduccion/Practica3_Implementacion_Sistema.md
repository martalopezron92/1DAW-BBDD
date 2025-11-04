# PRÁCTICA 3: IMPLEMENTACIÓN PRÁCTICA - DISEÑO DE SISTEMA DE INFORMACIÓN

**Asignatura:** Bases de Datos  
**Curso:** 1º DAW  
**Tiempo estimado:** 120 minutos  
**Tipo:** Práctica-Aplicada  

## OBJETIVOS
- Diseñar un sistema de información completo
- Aplicar todos los conceptos teóricos en un caso real
- Tomar decisiones técnicas justificadas
- Crear documentación técnica profesional

## ENUNCIADO

### CASO PRÁCTICO: ACADEMIA DE MÚSICA "ARMONÍA"

La academia de música "Armonía" necesita informatizar completamente su gestión. Actualmente todo se maneja en papel y necesitan un sistema eficiente.

#### INFORMACIÓN DE LA ACADEMIA:
- **Profesores:** DNI, nombre, apellidos, teléfono, email, especialidad musical, años experiencia, salario
- **Alumnos:** DNI, nombre, apellidos, fecha nacimiento, dirección, teléfono, email tutor, nivel musical
- **Instrumentos:** código instrumento, nombre, marca, modelo, estado (nuevo/bueno/regular/malo), aula asignada
- **Aulas:** código aula, nombre, capacidad, tipo (individual/grupal), equipamiento
- **Asignaturas:** código asignatura, nombre, tipo (individual/grupal), duración (30/45/60 min), precio/hora
- **Clases:** código clase, fecha, hora inicio, hora fin, asignatura, profesor, aula, lista alumnos
- **Pagos:** código pago, alumno, mes, año, importe, fecha pago, método pago

### FASE 1: ANÁLISIS Y DECISIÓN TÉCNICA (25 puntos)

1.1. **Justifica la elección técnica:**
   - ¿Recomendarías un sistema de ficheros o una BBDD? 
   - Enumera 5 razones específicas para tu elección
   - ¿Qué SGBD recomendarías? (MySQL, PostgreSQL, SQL Server, etc.) Justifica

1.2. **Identifica los problemas** que tendría un sistema de ficheros para esta academia:
   - Al menos 4 problemas específicos con ejemplos reales
   - Cómo se solucionarían con una BBDD

### FASE 2: DISEÑO DE LA ARQUITECTURA (30 puntos)

2.1. **Modelo de datos relacional:**
   - Diseña las tablas necesarias
   - Especifica campos, tipos de datos y claves primarias
   - Identifica las relaciones entre tablas

**Ejemplo de formato:**
```
TABLA: PROFESORES
- DNI: VARCHAR(10) [PK]
- Nombre: VARCHAR(50)
- Especialidad: VARCHAR(30)
- ...
```

2.2. **Arquitectura cliente-servidor:**
   - Describe qué componentes irían en el servidor
   - Qué tipo de clientes accederían al sistema
   - Propón una configuración específica (local, distribuida, web, etc.)

### FASE 3: ESQUEMAS DE LA BBDD (25 puntos)

3.1. **Esquema Conceptual:**
   - Lista las entidades principales
   - Define 6 reglas de integridad de la academia
   - Ejemplo: "Un profesor no puede dar clase en dos aulas simultáneamente"

3.2. **Esquemas Externos (Vistas):**
Diseña vistas específicas para:

a) **VISTA_PROFESOR:** Información que ve un profesor
b) **VISTA_SECRETARIA:** Información para gestión administrativa  
c) **VISTA_ALUMNO:** Información que puede consultar un alumno
d) **VISTA_DIRECTOR:** Información completa para toma de decisiones

3.3. **Esquema Interno:**
Para la academia, especifica:

a) **¿Dónde se guardarían físicamente los datos?**
   - Servidor local o en la nube
   - Un solo archivo o archivos separados por tipo de información

b) **¿Cómo se harían las copias de seguridad?**
   - Cada día, cada semana o cada mes
   - Qué información es más importante proteger

c) **¿Qué pasaría si la academia crece mucho?**
   - Cómo se adaptaría el sistema a más alumnos y profesores

### FASE 4: COMPONENTES Y USUARIOS (20 puntos)

4.1. **Usuarios del SGBD:**
Identifica y describe:
- **Administrador de datos (DA):** ¿Quién sería en la academia?
- **Administrador de BBDD (DBA):** Funciones específicas
- **Programadores:** Qué aplicaciones desarrollarían
- **Usuarios finales:** Diferentes tipos y permisos

4.2. **Funcionalidades específicas:**
Para cada lenguaje del SGBD, proporciona 2 ejemplos de uso en la academia:
- **DDL (Data Definition Language):** 
- **DML (Data Manipulation Language):**
- **DCL (Data Control Language):**

<!-- ### FASE 5: IMPLEMENTACIÓN Y SEGURIDAD (BONUS - 10 puntos extra)

5.1. **Plan de implementación:**
- Orden de creación de tablas
- Datos iniciales necesarios
- Plan de migración desde el sistema manual

5.2. **Medidas de seguridad:**
- Copias de seguridad
- Control de acceso
- Protección de datos personales (RGPD) -->

## ENTREGABLES

1. **Documento técnico completo** (formato profesional)
2. **Diagramas** de la arquitectura y modelo de datos
3. **Diccionario de datos** con todas las tablas
4. **Manual de usuario** básico para cada tipo de usuario

## METODOLOGÍA DE TRABAJO

- **Individual o parejas** (a decidir por el profesor)
- **Consultas permitidas:** Material de clase, apuntes
- **Presentación oral:** 10 minutos por grupo (opcional)

## CRITERIOS DE EVALUACIÓN

- **Diseño técnico (40%):** Corrección del modelo y arquitectura
- **Justificación (30%):** Calidad de argumentos y decisiones
- **Documentación (20%):** Claridad y profesionalidad
- **Innovación (10%):** Propuestas creativas y viables

## EJEMPLOS DE CONSULTAS A RESOLVER

Tu sistema debe poder responder eficientemente a preguntas como:
- ¿Qué clases tiene un alumno en una semana?
- ¿Cuánto ha pagado un alumno en el año?
- ¿Qué profesores están libres a una hora determinada?
- ¿Cuáles son los instrumentos que necesitan mantenimiento?
- ¿Cuál es la ocupación de cada aula?

## RECURSOS ADICIONALES

- Plantillas de documentación disponibles en aula virtual
- Ejemplos de diagramas en material complementario

**¡Éxito en vuestro proyecto!**