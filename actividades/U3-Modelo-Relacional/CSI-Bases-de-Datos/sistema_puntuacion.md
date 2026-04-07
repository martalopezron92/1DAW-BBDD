# Sistema de Puntuacion - CSI Bases de Datos

## Filosofia
- Se premia la calidad del razonamiento y la justificacion.
- La velocidad solo desempata, no decide por si sola.
- Se reparten recompensas parciales para mantener motivacion.
- Pueden ganar varios grupos en categorias distintas.

## Escala total sugerida
- Puntuacion base maxima: **100 puntos**
- Bonus posibles: hasta **+15 puntos**
- Penalizaciones por pistas: hasta **-9 puntos**

## Puntos por fases (base)
| Fase | Criterio | Max puntos |
|---|---|---|
| Fase 1 Investigacion | Problemas detectados + DF justificadas | 25 |
| Fase 2 Reconstruccion | Tablas, PK, FK y coherencia relacional | 25 |
| Fase 3 Validacion | Comprobacion 1FN, 2FN, 3FN con evidencia | 20 |
| Fase 4 Preparacion pre-SQL | Diccionario final claro y util para DDL | 20 |
| Fase 5 Defensa expres | Claridad, sintesis, solidez de argumentos | 10 |

Total base: 100

## Rubrica rapida por fase

### Fase 1 (0-25)
- 0-10: detecta problemas superficiales, poca evidencia.
- 11-18: detecta problemas relevantes y varias DF.
- 19-25: identifica problemas clave, anomalias completas y DF bien justificadas.

### Fase 2 (0-25)
- 0-10: descomposicion confusa.
- 11-18: descomposicion aceptable con algun fallo de claves/relaciones.
- 19-25: modelo relacional coherente, PK/FK correctas y justificadas.

### Fase 3 (0-20)
- 0-8: validacion incompleta o declarativa sin pruebas.
- 9-14: valida formas normales con argumentos basicos.
- 15-20: valida con criterio y corrige errores detectados.

### Fase 4 (0-20)
- 0-8: tablas incompletas o poco claras.
- 9-14: estructura casi lista para SQL.
- 15-20: estructura limpia, consistente y lista para traducir a DDL.

### Fase 5 (0-10)
- 0-4: explicacion desordenada.
- 5-7: explicacion correcta pero poco sintetica.
- 8-10: defensa clara, precisa y bien argumentada.

## Bonus (max +15)
| Bonus | Puntos |
|---|---|
| Justificacion excelente de una decision dificil | +3 |
| Correccion elegante detectada en validacion | +3 |
| Pregunta tecnica respetuosa que mejora el debate | +2 |
| Detectar inconsistencia real en otra defensa (sin polemica) | +2 |
| Entrega especialmente clara y ordenada | +2 |
| Conexion explicita con futura implementacion DDL | +3 |

## Penalizacion por pistas
| Tipo de pista | Coste |
|---|---|
| Pista nivel 1 (orientacion general) | -1 |
| Pista nivel 2 (pregunta guiada directa) | -2 |
| Pista nivel 3 (casi desbloqueo explicito) | -3 |

Regla sugerida: maximo 3 pistas por equipo.

## Recompensas parciales (durante la clase)
- Primer equipo que complete Fase 1 con >= 20 puntos: mini recompensa.
- Equipos que alcancen >= 15 en Fase 3: mini recompensa tecnica.
- Mejor defensa expres (>= 8 en Fase 5): mini recompensa final.

## Categorias de reconocimiento final (para que ganen varios)
1. Premio "Mejor analisis forense" (Fase 1).
2. Premio "Mejor arquitectura relacional" (Fase 2-4).
3. Premio "Mejor defensa tecnica" (Fase 5).
4. Premio "Equipo mas equilibrado" (buen rendimiento global).

## Canje orientativo por chuches o mini premios
| Rango de puntos finales | Recompensa sugerida |
|---|---|
| 110 o mas | 3 piezas por persona + diploma simbolico |
| 95-109 | 2 piezas por persona |
| 80-94 | 1 pieza por persona |
| 65-79 | 1 pieza por equipo |
| <65 | bonus de recuperacion: opcion de mejora guiada |

Nota: adapta cantidades al material disponible.

## Hoja rapida de seguimiento del profesor
| Equipo | F1/25 | F2/25 | F3/20 | F4/20 | F5/10 | Bonus | Penaliz | Total |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Equipo 1 |  |  |  |  |  |  |  |  |
| Equipo 2 |  |  |  |  |  |  |  |  |
| Equipo 3 |  |  |  |  |  |  |  |  |
| Equipo 4 |  |  |  |  |  |  |  |  |
| Equipo 5 |  |  |  |  |  |  |  |  |
| Equipo 6 |  |  |  |  |  |  |  |  |
