# Hoja de Roles por Equipo (grupos de 3)

## Instrucciones rapidas
- Cada equipo asigna 3 roles.
- El rol de portavoz puede rotar o recaer en una de estas 3 personas.
- Todos participan en todas las fases, pero cada rol lidera una parte.

## Rol 1: Analista
Mision:
- Detectar problemas en el modelo inicial.
- Identificar anomalias y dependencias funcionales clave.

Responsabilidades:
1. Liderar Fase 1 (Investigacion).
2. Registrar evidencias concretas de por que algo esta mal.
3. Preparar los 3 problemas mas graves para la defensa final.

Checklist breve:
- [ ] Hemos detectado redundancias reales.
- [ ] Hemos descrito anomalias de insercion/actualizacion/borrado.
- [ ] Tenemos al menos 4 DF justificadas.

## Rol 2: Disenador/a
Mision:
- Convertir el analisis en propuesta de esquema relacional.

Responsabilidades:
1. Liderar Fase 2 (Reconstruccion).
2. Proponer tablas y atributos por entidad/relacion.
3. Definir PK y FK con coherencia.

Checklist breve:
- [ ] Cada tabla tiene PK clara.
- [ ] Las FK representan relaciones reales.
- [ ] No mezclamos datos de entidades distintas sin motivo.

## Rol 3: Validador/a
Mision:
- Comprobar calidad tecnica y consistencia final.

Responsabilidades:
1. Liderar Fase 3 (Validacion) y Fase 4 (Preparacion pre-SQL).
2. Revisar 1FN, 2FN, 3FN con argumentos.
3. Verificar que el formato final esta listo para pasar a DDL.

Checklist breve:
- [ ] 1FN: sin grupos repetidos ni multivalores sin resolver.
- [ ] 2FN: sin dependencias parciales de clave compuesta.
- [ ] 3FN: sin dependencias transitivas no deseadas.
- [ ] Tabla final pre-SQL completa.

## Portavoz (rol rotatorio o fijo)
Mision:
- Defender la solucion del equipo en 2 minutos.

Responsabilidades:
1. Exponer problemas clave detectados.
2. Resumir estructura final y una decision dificil bien justificada.
3. Responder una pregunta del profesor o de otro equipo.

Consejo:
- No memorices: explica el razonamiento del equipo.

## Norma de colaboracion
- Si una persona termina su parte, ayuda a otra.
- No se puntua "trabajo en solitario": se puntua calidad del equipo.
