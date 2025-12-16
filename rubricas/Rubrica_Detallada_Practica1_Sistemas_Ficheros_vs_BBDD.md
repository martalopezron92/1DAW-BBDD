# RÚBRICA DETALLADA - PRÁCTICA 1: SISTEMAS DE FICHEROS VS BASES DE DATOS

**Asignatura:** Bases de Datos  
**Curso:** 1º DAW  
**Puntuación total:** 100 puntos  
**Tiempo estimado:** 90 minutos  

---

## TABLA RESUMEN DE PUNTUACIÓN

| Parte | Puntuación Máxima | Peso |
|-------|-------------------|------|
| Parte 1: Diseño con Ficheros | 25 puntos | 25% |
| Parte 2: Análisis Comparativo | 35 puntos | 35% |
| Parte 3: Toma de Decisiones | 25 puntos | 25% |
| Parte 4: Aplicación Práctica | 15 puntos | 15% |
| **TOTAL** | **100 puntos** | **100%** |

---

## PARTE 1: DISEÑO CON FICHEROS (25 puntos)

### 1.1. Estructura de ficheros (15 puntos)

| Nivel | Puntos | Descriptor | Indicadores de logro |
|-------|--------|------------|---------------------|
| **Excelente** | 14-15 | Diseño completo, preciso y eficiente | • Identifica correctamente los 5 ficheros necesarios (Libros, Usuarios, Préstamos, Autores, Editoriales)<br>• Todos los campos están correctamente especificados<br>• Los tipos de datos son apropiados y específicos (VARCHAR con longitud, DATE, INT, etc.)<br>• Las claves primarias están correctamente identificadas<br>• Considera campos adicionales útiles (fechas de auditoría, estados, etc.) |
| **Bueno** | 12-13 | Diseño correcto con pequeños detalles mejorables | • Identifica 4-5 ficheros correctamente<br>• La mayoría de campos están presentes<br>• Tipos de datos correctos aunque genéricos<br>• Claves primarias bien identificadas<br>• Estructura funcional aunque no óptima |
| **Suficiente** | 9-11 | Diseño básico que cumple requisitos mínimos | • Identifica 3-4 ficheros principales<br>• Campos esenciales presentes con algunos olvidos<br>• Tipos de datos básicos pero correctos<br>• Alguna confusión en claves primarias<br>• Estructura funcional con limitaciones |
| **Insuficiente** | 0-8 | Diseño incompleto o con errores importantes | • Menos de 3 ficheros identificados<br>• Campos importantes ausentes<br>• Tipos de datos incorrectos o sin especificar<br>• Claves primarias mal identificadas o ausentes<br>• Estructura no funcional |

**Criterios específicos de evaluación:**
- ✓ Fichero de Libros contiene: ISBN (clave), título, autor, editorial, año, ejemplares, ubicación (3 pts)
- ✓ Fichero de Usuarios contiene: DNI (clave), nombre, apellidos, dirección, teléfono, email, fecha_alta (3 pts)
- ✓ Fichero de Préstamos contiene: código (clave), ISBN, DNI, fechas (3 pts)
- ✓ Ficheros de Autores y Editoriales correctamente estructurados (3 pts)
- ✓ Tipos de datos apropiados y claves claramente identificadas (3 pts)

---

### 1.2. Identificación de problemas (10 puntos)

| Nivel | Puntos | Descriptor | Indicadores de logro |
|-------|--------|------------|---------------------|
| **Excelente** | 9-10 | Identifica 5+ problemas con profundidad analítica | • Identifica al menos 5 problemas diferentes y específicos<br>• Relaciona cada problema con conceptos teóricos (redundancia, inconsistencia, etc.)<br>• Proporciona ejemplos concretos del caso de la biblioteca<br>• Demuestra comprensión profunda de las limitaciones |
| **Bueno** | 7-8 | Identifica 4-5 problemas con buena relación teórica | • Identifica 4-5 problemas relevantes<br>• Relaciona con la teoría de forma adecuada<br>• Ejemplos contextualizados<br>• Buen nivel de comprensión |
| **Suficiente** | 5-6 | Identifica 3 problemas básicos | • Identifica 3 problemas principales<br>• Relación básica con la teoría<br>• Ejemplos genéricos pero correctos<br>• Comprensión suficiente |
| **Insuficiente** | 0-4 | Menos de 3 problemas o incorrectos | • Identifica menos de 3 problemas<br>• Sin relación clara con la teoría<br>• Sin ejemplos o ejemplos incorrectos<br>• Comprensión insuficiente |

**Problemas esperados (incluir al menos 3):**
- ✓ Redundancia de datos (información repetida en múltiples ficheros) (2 pts)
- ✓ Inconsistencia (modificaciones en un fichero no reflejadas en otros) (2 pts)
- ✓ Dificultad en acceso concurrente (múltiples usuarios simultáneos) (2 pts)
- ✓ Falta de integridad referencial (relaciones entre ficheros no garantizadas) (2 pts)
- ✓ Limitaciones en consultas complejas (búsquedas que cruzan varios ficheros) (2 pts)
- ✓ Seguridad limitada (control de acceso por fichero, no por dato) (2 pts)
- ✓ Dependencia de programas (cambios en estructura requieren modificar código) (2 pts)

---

## PARTE 2: ANÁLISIS COMPARATIVO (35 puntos)

### 2.1. Tabla comparativa (20 puntos)

| Nivel | Puntos | Descriptor | Indicadores de logro |
|-------|--------|------------|---------------------|
| **Excelente** | 18-20 | Análisis completo, preciso y bien justificado | • Los 7 aspectos completados correctamente<br>• Justificaciones específicas y técnicas<br>• Demuestra comprensión profunda de diferencias<br>• Usa terminología técnica apropiada<br>• Comparaciones equilibradas y objetivas |
| **Bueno** | 15-17 | Análisis correcto con justificaciones adecuadas | • 6-7 aspectos completados correctamente<br>• Justificaciones claras y correctas<br>• Buena comprensión de diferencias<br>• Terminología apropiada<br>• Comparaciones correctas |
| **Suficiente** | 11-14 | Análisis básico que cumple mínimos | • 5-6 aspectos completados<br>• Justificaciones básicas pero correctas<br>• Comprensión suficiente<br>• Terminología básica<br>• Comparaciones simples |
| **Insuficiente** | 0-10 | Análisis incompleto o incorrecto | • Menos de 5 aspectos completados<br>• Justificaciones incorrectas o ausentes<br>• Comprensión insuficiente<br>• Terminología incorrecta<br>• Comparaciones erróneas |

**Aspectos clave a evaluar (cada aspecto vale aproximadamente 3 puntos):**

| Aspecto | Sistema de Ficheros (esperado) | Sistema de BBDD (esperado) | Justificación (esperada) |
|---------|-------------------------------|---------------------------|-------------------------|
| **Redundancia** | Alta/Problemática | Baja/Controlada | BBDD normaliza datos, ficheros duplican información |
| **Consistencia** | Difícil de mantener | Garantizada por SGBD | Transacciones ACID en BBDD, manual en ficheros |
| **Seguridad** | Básica (nivel fichero) | Avanzada (nivel registro/campo) | BBDD permite permisos granulares |
| **Acceso concurrente** | Problemático/Bloqueos | Gestionado por SGBD | Mecanismos de bloqueo y control de concurrencia |
| **Flexibilidad consultas** | Limitada/Programática | Alta/SQL | Lenguaje declarativo vs código procedural |
| **Coste inicial** | Bajo | Alto | BBDD requiere licencias, hardware, formación |
| **Mantenimiento** | Complejo a largo plazo | Estructurado y manejable | SGBD centraliza gestión |

---

### 2.2. Ejemplos de situaciones problemáticas (15 puntos)

| Nivel | Puntos | Descriptor | Indicadores de logro |
|-------|--------|------------|---------------------|
| **Excelente** | 14-15 | 3 ejemplos específicos, detallados y resolutivos | • Describe 3 situaciones concretas y realistas de la biblioteca<br>• Explica claramente el problema en sistema de ficheros<br>• Detalla la solución específica con BBDD<br>• Usa conceptos técnicos (triggers, constraints, transactions, etc.)<br>• Ejemplos variados que cubren diferentes problemáticas |
| **Bueno** | 11-13 | 2-3 ejemplos bien desarrollados | • Describe 2-3 situaciones contextualizadas<br>• Explica el problema adecuadamente<br>• Solución con BBDD es correcta<br>• Usa algunos conceptos técnicos<br>• Buenos ejemplos aunque menos variados |
| **Suficiente** | 8-10 | 2 ejemplos básicos pero correctos | • Describe 2 situaciones básicas<br>• Problema explicado de forma simple<br>• Solución básica pero correcta<br>• Terminología básica<br>• Ejemplos funcionales |
| **Insuficiente** | 0-7 | 1 ejemplo o ejemplos incorrectos | • Solo 1 ejemplo o ninguno<br>• Problema mal explicado<br>• Solución incorrecta o ausente<br>• Sin terminología técnica<br>• Ejemplos no funcionales |

**Ejemplos esperados (3 situaciones diferentes):**

**Ejemplo tipo A - Redundancia/Inconsistencia (5 pts):**
- Problema: Usuario cambia de dirección, se actualiza en fichero de Usuarios pero no en fichero de Préstamos activos
- Solución BBDD: Clave foránea con UPDATE CASCADE o tabla única de usuarios referenciada

**Ejemplo tipo B - Concurrencia (5 pts):**
- Problema: Dos bibliotecarios prestan el último ejemplar disponible simultáneamente
- Solución BBDD: Transacciones con bloqueos, control de concurrencia ACID

**Ejemplo tipo C - Integridad/Consultas (5 pts):**
- Problema: Consultar libros por autor requiere buscar en fichero de Autores, luego en Libros, gestión manual de relaciones
- Solución BBDD: JOIN entre tablas, restricciones de integridad referencial, consultas declarativas

---

## PARTE 3: TOMA DE DECISIONES (25 puntos)

### 3.1. Recomendación justificada (15 puntos)

| Nivel | Puntos | Descriptor | Indicadores de logro |
|-------|--------|------------|---------------------|
| **Excelente** | 14-15 | Recomendación clara con 4+ argumentos sólidos | • Recomienda BBDD (respuesta esperada) con convicción<br>• Presenta 4 o más argumentos técnicamente correctos<br>• Argumentos basados en teoría (RA1, RA2, RA3)<br>• Considera el contexto específico de la biblioteca<br>• Argumentación estructurada y convincente<br>• Menciona escalabilidad, seguridad, integridad, etc. |
| **Bueno** | 12-13 | Recomendación adecuada con 3-4 argumentos | • Recomienda BBDD con buenos fundamentos<br>• Presenta 3-4 argumentos correctos<br>• Basados en teoría vista en clase<br>• Contextualizado al caso<br>• Argumentación clara |
| **Suficiente** | 9-11 | Recomendación básica con 2-3 argumentos | • Recomienda BBDD con fundamentos básicos<br>• Presenta 2-3 argumentos válidos<br>• Relación básica con teoría<br>• Algo contextualizado<br>• Argumentación simple |
| **Insuficiente** | 0-8 | Recomendación incorrecta o sin justificación | • Recomendación inadecuada o sin fundamento<br>• Menos de 2 argumentos<br>• No basados en teoría<br>• Sin contextualización<br>• Argumentación deficiente |

**Argumentos esperados (incluir al menos 4):**
- ✓ Volumen de datos y escalabilidad futura (4 pts)
- ✓ Múltiples usuarios concurrentes (bibliotecarios) (3 pts)
- ✓ Necesidad de integridad referencial (libros-autores-préstamos) (3 pts)
- ✓ Consultas complejas frecuentes (búsquedas, estadísticas) (3 pts)
- ✓ Seguridad y control de acceso (datos sensibles de usuarios) (2 pts)

---

### 3.2. Medidas específicas (10 puntos)

| Nivel | Puntos | Descriptor | Indicadores de logro |
|-------|--------|------------|---------------------|
| **Excelente** | 9-10 | 3 medidas prácticas, viables y detalladas | • Propone 3 medidas específicas y realistas<br>• Medidas contextualizadas al sistema elegido<br>• Explica implementación de cada medida<br>• Considera aspectos técnicos y organizativos<br>• Medidas complementarias entre sí |
| **Bueno** | 7-8 | 2-3 medidas adecuadas | • Propone 2-3 medidas apropiadas<br>• Bien contextualizadas<br>• Explicación correcta<br>• Considera varios aspectos<br>• Medidas coherentes |
| **Suficiente** | 5-6 | 2 medidas básicas | • Propone 2 medidas básicas<br>• Contextualización básica<br>• Explicación simple<br>• Un aspecto considerado<br>• Medidas válidas |
| **Insuficiente** | 0-4 | Menos de 2 medidas o incorrectas | • Menos de 2 medidas<br>• No contextualizadas<br>• Sin explicación<br>• No viables<br>• Medidas incoherentes |

**Medidas esperadas para BBDD (incluir 3):**
- ✓ Plan de backups automáticos diarios (3-4 pts)
- ✓ Formación específica del personal en el SGBD (3-4 pts)
- ✓ Definición de perfiles de usuario y permisos (3-4 pts)
- ✓ Mantenimiento preventivo y monitorización del sistema (2-3 pts)
- ✓ Plan de contingencia ante fallos (2-3 pts)
- ✓ Optimización periódica (índices, estadísticas) (2-3 pts)

---

## PARTE 4: APLICACIÓN PRÁCTICA (15 puntos)

### 4.1. Escenario recomendable para ficheros (8 puntos)

| Nivel | Puntos | Descriptor | Indicadores de logro |
|-------|--------|------------|---------------------|
| **Excelente** | 7-8 | Escenario realista y perfectamente justificado | • Propone escenario donde ficheros son realmente más apropiados<br>• Escenario diferente al de la biblioteca<br>• Justificación técnica sólida (simplicidad, bajo volumen, etc.)<br>• Demuestra comprensión de cuándo NO usar BBDD<br>• Ejemplo concreto y viable |
| **Bueno** | 6 | Escenario adecuado con buena justificación | • Escenario apropiado para ficheros<br>• Diferente de biblioteca<br>• Justificación correcta<br>• Buen criterio técnico<br>• Ejemplo válido |
| **Suficiente** | 4-5 | Escenario básico pero válido | • Escenario donde ficheros funcionan<br>• Distinto del caso principal<br>• Justificación básica<br>• Criterio aceptable<br>• Ejemplo simple |
| **Insuficiente** | 0-3 | Escenario incorrecto o sin justificación | • Escenario donde BBDD sería mejor<br>• No diferenciado<br>• Sin justificación<br>• Criterio erróneo<br>• Ejemplo no válido |

**Escenarios válidos esperados (proponer 1):**
- ✓ Archivos de log o registro simple (8 pts)
- ✓ Configuración de aplicaciones (archivos .ini, .config) (8 pts)
- ✓ Datos temporales o caché (8 pts)
- ✓ Transferencia de datos entre sistemas (CSV, JSON) (8 pts)
- ✓ Aplicación personal/monousuario con datos mínimos (7 pts)

**Criterios de validación:**
- Bajo volumen de datos o datos temporales
- Usuario único o sin concurrencia
- Sin necesidad de consultas complejas
- Simplicidad como prioridad
- No requiere integridad referencial compleja

---

### 4.2. SGBD comerciales (7 puntos)

| Nivel | Puntos | Descriptor | Indicadores de logro |
|-------|--------|------------|---------------------|
| **Excelente** | 7 | 3 SGBD con características precisas y relevantes | • Identifica 3 SGBD comerciales diferentes<br>• Nombra correctamente (Oracle, SQL Server, MySQL, PostgreSQL, etc.)<br>• Característica principal específica y correcta para cada uno<br>• Características relevantes y distintivas<br>• Demuestra conocimiento del mercado |
| **Bueno** | 5-6 | 2-3 SGBD con características correctas | • Identifica 2-3 SGBD comerciales<br>• Nombres correctos<br>• Características correctas<br>• Algo distintivas<br>• Conocimiento adecuado |
| **Suficiente** | 3-4 | 2 SGBD con características básicas | • Identifica 2 SGBD<br>• Nombres conocidos<br>• Características genéricas<br>• Poco distintivas<br>• Conocimiento básico |
| **Insuficiente** | 0-2 | Menos de 2 SGBD o información incorrecta | • Menos de 2 SGBD<br>• Nombres incorrectos<br>• Características erróneas<br>• No distintivas<br>• Sin conocimiento |

**SGBD comerciales esperados (incluir 3):**
- ✓ **Oracle Database:** Orientado a grandes empresas, alta disponibilidad (2-3 pts)
- ✓ **Microsoft SQL Server:** Integración con ecosistema Microsoft (2-3 pts)
- ✓ **MySQL:** Open source, ampliamente usado en web (2-3 pts)
- ✓ **PostgreSQL:** Open source, cumplimiento estándares SQL (2-3 pts)
- ✓ **MongoDB:** Base de datos NoSQL orientada a documentos (2-3 pts)
- ✓ **IBM DB2:** Optimizado para mainframes y grandes volúmenes (2-3 pts)

---

## CRITERIOS TRANSVERSALES (No suman puntos adicionales, pero pueden penalizar)

### Presentación y Formato

| Aspecto | Excelente | Aceptable | Penalización |
|---------|-----------|-----------|--------------|
| **Formato del documento** | PDF/Word profesional, bien estructurado | Formato correcto básico | -2 pts si es ilegible |
| **Extensión** | 5-8 páginas óptimas | 4-9 páginas aceptable | -3 pts si >10 o <3 páginas |
| **Ortografía y redacción** | Sin errores, redacción clara | Errores menores | -2 pts si >10 errores |
| **Estructura de respuestas** | Numeración clara, respuestas identificadas | Estructura básica | -2 pts si es confuso |

### Uso de Terminología Técnica

| Nivel | Descripción | Impacto |
|-------|-------------|---------|
| **Excelente** | Usa correctamente: SGBD, redundancia, inconsistencia, integridad referencial, concurrencia, normalización, transacciones ACID, DDL/DML, claves primarias/foráneas | Valoración positiva |
| **Bueno** | Usa la mayoría de términos correctamente | Neutral |
| **Insuficiente** | No usa o usa incorrectamente terminología técnica | Puede reducir hasta 5 pts del total |

### Coherencia y Consistencia

| Aspecto | Excelente | Problemático | Penalización |
|---------|-----------|--------------|--------------|
| **Coherencia entre partes** | Todas las respuestas coherentes entre sí | Contradicciones importantes | -3 pts |
| **Aplicación de teoría** | Relaciona consistentemente con conceptos teóricos | Sin relación teórica | -5 pts |
| **Contextualización** | Todas las respuestas contextualizadas al caso biblioteca | Respuestas genéricas sin contexto | -3 pts |

---

## ESCALA DE CALIFICACIÓN FINAL

| Calificación | Puntos | Nivel de Logro |
|--------------|--------|----------------|
| **Sobresaliente (9-10)** | 90-100 pts | Excelente comprensión y aplicación de conceptos. Todas las partes completadas con nivel excelente o bueno. Argumentación sólida y técnicamente correcta. |
| **Notable (7-8.9)** | 70-89 pts | Buena comprensión y aplicación. La mayoría de partes en nivel bueno. Argumentación correcta con terminología apropiada. |
| **Bien (6-6.9)** | 60-69 pts | Comprensión suficiente. Partes principales en nivel suficiente o bueno. Argumentación básica pero correcta. |
| **Suficiente (5-5.9)** | 50-59 pts | Comprensión mínima aceptable. Partes esenciales completadas en nivel suficiente. Cumple requisitos mínimos. |
| **Insuficiente (0-4.9)** | 0-49 pts | Comprensión insuficiente. Partes importantes no completadas o con errores graves. No cumple requisitos mínimos. |

---

## FEEDBACK Y RETROALIMENTACIÓN

### Plantilla de comentarios para el profesor:

**Fortalezas identificadas:**
- [ ] Excelente comprensión de conceptos teóricos
- [ ] Buenos ejemplos prácticos contextualizados
- [ ] Uso apropiado de terminología técnica
- [ ] Argumentación sólida y bien estructurada
- [ ] Creatividad en propuestas y soluciones

**Áreas de mejora:**
- [ ] Necesita reforzar conceptos de redundancia e inconsistencia
- [ ] Mejorar relación entre teoría y práctica
- [ ] Ampliar vocabulario técnico de bases de datos
- [ ] Desarrollar capacidad de análisis comparativo
- [ ] Profundizar en justificaciones técnicas

**Recomendaciones específicas:**
- Revisar material teórico sobre: _______________
- Practicar con ejercicios adicionales de: _______________
- Consultar recursos complementarios: _______________
- Preparar para próximos contenidos: _______________

---

## RECURSOS ADICIONALES PARA ESTUDIO

### Si el estudiante obtuvo menos de 50 puntos:
- Revisar **UD1_Introduccion.md** completo
- Repasar conceptos básicos de sistemas de ficheros
- Consultar ejemplos adicionales en presentaciones

### Si obtuvo entre 50-69 puntos:
- Profundizar en **UD1_Modelos_y_Arquitectura_BBDD_Actualizado.md**
- Estudiar casos prácticos similares
- Practicar análisis comparativos

### Si obtuvo entre 70-89 puntos:
- Ampliar con lecturas sobre SGBD específicos
- Investigar casos de estudio empresariales
- Preparar para arquitecturas más complejas

### Si obtuvo más de 90 puntos:
- Desafíos adicionales: diseño de BBDD distribuidas
- Profundizar en optimización y rendimiento
- Investigar tendencias actuales (NoSQL, NewSQL)

---

## NOTAS PARA EL PROFESOR

### Consideraciones de aplicación:

1. **Primera evaluación:** En las primeras prácticas, ser más flexible con terminología técnica pero exigir comprensión conceptual

2. **Adaptación por ritmo:** Si el grupo avanza más lento, priorizar Partes 1 y 2; si avanza rápido, exigir más en Partes 3 y 4

3. **Trabajo en parejas:** Si se permite, evaluar:
   - Contribución individual documentada
   - Coherencia en redacción (debe haber uniformidad)
   - Complejidad adicional en las respuestas

4. **Tiempos de entrega:**
   - Entrega en plazo: 100% de la nota
   - 1-2 días retraso: -10%
   - 3-5 días retraso: -25%
   - Más de 5 días: consultar con estudiante

5. **Consultas durante la práctica:**
   - Documentar preguntas frecuentes
   - Permitir consultas de aclaración, no de resolución
   - Valorar positivamente la autonomía

6. **Originalidad:**
   - Verificar similitudes entre trabajos
   - Penalizar copia directa (0 puntos)
   - Valorar creatividad en ejemplos propios

### Conexión con contenidos posteriores:

Esta práctica sirve de base para:
- **UD2 - Modelo E-R:** Comprensión de por qué modelar datos
- **UD3 - Modelo Relacional:** Transición desde problemas de ficheros
- **UD4 - Normalización:** Solución a redundancia identificada aquí
- **UD5 - SQL:** Implementación práctica de soluciones BBDD

---

**Versión:** 1.0  
**Fecha:** Diciembre 2025  
**Próxima revisión:** Evaluación de resultados tras primera aplicación
