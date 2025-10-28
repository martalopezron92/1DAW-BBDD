# PRÁCTICA 1: ANÁLISIS COMPARATIVO - SISTEMAS DE FICHEROS VS BASES DE DATOS

**Asignatura:** Bases de Datos  
**Curso:** 1º DAW  
**Tiempo estimado:** 90 minutos  
**Tipo:** Teórica-Analítica  

## OBJETIVOS
- Identificar los problemas de los sistemas de ficheros
- Comparar ventajas y desventajas entre ficheros y BBDD
- Aplicar los conceptos teóricos a casos prácticos reales
- Desarrollar capacidad de análisis crítico

## ENUNCIADO

### CASO PRÁCTICO: GESTIÓN DE UNA BIBLIOTECA

La biblioteca del instituto "San Ignacio" quiere informatizar su sistema de gestión. Actualmente manejan toda la información en papel y están evaluando dos opciones:

**OPCIÓN A:** Sistema basado en ficheros  
**OPCIÓN B:** Sistema de base de datos

#### INFORMACIÓN A GESTIONAR:
- **Libros:** ISBN, título, autor, editorial, año, número de ejemplares, ubicación
- **Usuarios:** DNI, nombre, apellidos, dirección, teléfono, email, fecha de alta
- **Préstamos:** código préstamo, ISBN libro, DNI usuario, fecha préstamo, fecha devolución prevista, fecha devolución real
- **Autores:** código autor, nombre, apellidos, nacionalidad, fecha nacimiento
- **Editoriales:** código editorial, nombre, dirección, teléfono

### PARTE 1: DISEÑO CON FICHEROS (25 puntos)

1.1. **Diseña la estructura de ficheros** necesaria para la OPCIÓN A. Para cada fichero especifica:
   - Nombre del fichero
   - Campos que contiene
   - Tipo de datos de cada campo
   - Campo clave

1.2. **Identifica al menos 5 problemas específicos** que tendría este sistema basado en ficheros, relacionándolos con los conceptos vistos en teoría.

### PARTE 2: ANÁLISIS COMPARATIVO (35 puntos)

2.1. **Completa la siguiente tabla comparativa:**

| Aspecto | Sistema de Ficheros | Sistema de BBDD | Justificación |
|---------|-------------------|-----------------|---------------|
| Redundancia de datos | | | |
| Consistencia | | | |
| Seguridad | | | |
| Acceso concurrente | | | |
| Flexibilidad consultas | | | |
| Coste inicial | | | |
| Mantenimiento | | | |

2.2. **Pon 3 ejemplos concretos** de situaciones problemáticas que podrían ocurrir en la biblioteca con el sistema de ficheros y explica cómo se resolverían con una BBDD.

### PARTE 3: TOMA DE DECISIONES (25 puntos)

3.1. **Recomienda cuál de las dos opciones** sería mejor para la biblioteca. Justifica tu respuesta con al menos 4 argumentos basados en los conceptos teóricos.

3.2. **Propón 3 medidas específicas** que implementarías para minimizar los problemas del sistema elegido.

### PARTE 4: APLICACIÓN PRÁCTICA (15 puntos)

4.1. **Describe un escenario real** (diferente al de la biblioteca) donde sí sería recomendable usar un sistema de ficheros en lugar de una BBDD. Explica por qué.

4.2. **Identifica 3 SGBD comerciales** y menciona una característica principal de cada uno.

## CRITERIOS DE EVALUACIÓN
- **Comprensión conceptual:** Dominio de los conceptos teóricos
- **Aplicación práctica:** Capacidad de aplicar teoría a casos reales
- **Análisis crítico:** Argumentación y justificación de decisiones
- **Comunicación:** Claridad y precisión en las respuestas

## ENTREGA
- Documento en formato PDF o Word
- Respuestas claras y bien estructuradas
- Máximo 8 páginas