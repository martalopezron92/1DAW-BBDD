# Guia del Profesor: CSI Bases de Datos

## 1. Sentido didactico de la actividad
Esta sesion de 2 horas funciona como puente natural entre:
- Modelo E-R
- Modelo relacional
- Normalizacion (hasta 3FN)
- Preparacion para DDL

No se pide escribir `CREATE TABLE`, pero el alumnado deja listo un esquema pre-SQL con PK, FK y restricciones basicas. Eso reduce la carga cognitiva cuando empiece el tema de diseno fisico.

## 2. Objetivos didacticos observables
Al final de la sesion, cada grupo deberia poder:
1. Detectar redundancias y anomalias en una estructura inicial defectuosa.
2. Explicar al menos 4 dependencias funcionales relevantes.
3. Proponer una descomposicion coherente a varias tablas.
4. Justificar PK/FK con sentido funcional.
5. Validar 1FN, 2FN y 3FN de forma argumentada.
6. Presentar tablas finales en formato cercano a implementacion.

## 3. Materiales que necesitas preparar antes
- Copias impresas o digitales de:
  - `actividad_csi_bases_datos.md`
  - `ficha_grupo.md`
  - `roles_equipo.md`
  - `sistema_puntuacion.md`
- Hoja de seguimiento rapido para ti (puedes usar la tabla de `sistema_puntuacion.md`).
- Reloj visible o temporizador proyectado.
- Recompensas pequenas: chuches, caramelos, mini snacks, pegatinas o puntos extra simbolicos.

## 4. Temporalizacion minuto a minuto (120 min)

### Bloque 0. Lanzamiento (0-10 min)
Tu accion:
- Presenta la narrativa CSI en 2-3 minutos.
- Explica que se evalua razonamiento, no velocidad.
- Forma grupos de 3 y reparte roles.
- Entrega caso y ficha.

Accion alumnado:
- Se organiza por roles.
- Lee caso y aclara dudas de enunciado.

Intervencion recomendada:
- Evita explicarles la solucion de inicio.
- Aclara solo reglas y objetivos.

### Bloque 1. Fase 1 Investigacion (10-30 min)
Tu accion:
- Recorre grupos y fuerza verbalizacion: "Que problema exacto veis aqui?".
- Si un grupo solo enumera "esta mal", exige evidencia concreta.

Accion alumnado:
- Lista problemas, anomalias y dependencias funcionales.

Criterio de avance:
- Minimo 6 problemas detectados + 4 DF justificadas.

### Bloque 2. Fase 2 Reconstruccion (30-60 min)
Tu accion:
- Pide borrador de tablas en papel.
- Comprueba que separan entidades y relaciones con criterio.
- Si mezclan datos de cliente/pedido/linea en una sola tabla, redirige con pregunta guiada.

Accion alumnado:
- Descompone a tablas.
- Define PK y FK iniciales.

Criterio de avance:
- Esquema relacional legible y coherente.

### Bloque 3. Fase 3 Validacion (60-80 min)
Tu accion:
- Exige check de 1FN, 2FN, 3FN por escrito.
- Detecta falsas seguridades ("esta en 3FN porque si").

Accion alumnado:
- Revisa dependencias parciales y transitivas.
- Ajusta esquema.

Criterio de avance:
- Justificacion minima de cada forma normal.

### Bloque 4. Fase 4 Preparacion pre-SQL (80-100 min)
Tu accion:
- Pide formato estandar por tabla: nombre, atributos, PK, FK, restricciones basicas.
- Recuerda: todavia sin DDL formal.

Accion alumnado:
- Redacta estructura final util para pasar luego a SQL.

Criterio de avance:
- Diccionario de tablas final completo.

### Bloque 5. Fase 5 Defensa expres (100-115 min)
Tu accion:
- Cronometra 2 minutos por grupo + 1 minuto de pregunta rapida.
- Puntua en directo con la rubrica.

Accion alumnado:
- Expone problemas clave, solucion y justificacion.

### Bloque 6. Cierre puente a DDL (115-120 min)
Tu accion:
- Cierra con esta idea: "Hoy ya habeis hecho el 80% del trabajo de diseno; en DDL solo lo convertiremos a sintaxis SQL".
- Entrega recompensas por tramos de puntos.

## 5. Cuadro de intervencion docente (cuando y como ayudar)
- Si grupo bloqueado 5+ minutos: ofrece pista nivel 1 (coste bajo).
- Si hay confusion de entidades/atributos: pregunta "esto describe al pedido, al cliente o a la linea?".
- Si no justifican DF: pide ejemplo de dos filas que violen su propuesta.
- Si van muy rapidos pero superficiales: penaliza por falta de justificacion.

## 6. Errores tipicos esperables
1. Mantener `total_pedido` sin discutir si es derivado.
2. Mezclar datos de pedido y linea en la misma relacion final.
3. Olvidar tabla intermedia para detalle de productos por pedido.
4. No separar datos de restaurante y producto.
5. Confundir 2FN con 3FN.
6. Proponer PK no estables (ejemplo: nombre de cliente).

## 7. Sistema de puntuacion recomendado
Usa la matriz del archivo `sistema_puntuacion.md`.
Prioriza:
- Razonamiento y evidencia.
- Correccion conceptual.
- Defensa oral breve y clara.

No priorices:
- Terminar primero.
- Soluciones copiadas sin explicar.

## 8. Conexion explicita con la siguiente unidad (DDL)
Mensaje final sugerido:
1. "Hoy habeis decidido que tablas existen y como se relacionan."
2. "En DDL aprenderemos a convertir exactamente este diseno en sentencias `CREATE TABLE`, `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `UNIQUE`".
3. "Si el diseno logico es bueno, el SQL sale casi solo".

## 9. Variante de emergencia por tiempo
Si vas justo de tiempo (ultimo tramo):
- Reduce defensas a 90 segundos por grupo.
- Evalua solo 2 decisiones clave: descomposicion + justificacion de una DF critica.

## 10. Evidencias para calificacion formativa
Guarda o revisa:
- Ficha de grupo completa.
- Coherencia de esquema final.
- Mini defensa oral.

Estas evidencias te permiten valorar competencia sin examen tradicional y preparar mejor el inicio de DDL en la proxima sesion.
