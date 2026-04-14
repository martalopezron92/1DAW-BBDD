# CSI Bases de Datos: Reconstruye el Sistema

## Contexto narrativo
El departamento de datos de **ByteBites** (una plataforma de pedidos de comida) ha sufrido un desastre: la base de datos principal esta mal disenada y provoca errores constantes.

Vuestro equipo ha sido contratado como unidad forense de datos. Teneis 2 horas para investigar, reconstruir y validar un diseno correcto antes de que el sistema vuelva a produccion.

## Objetivo de la mision
Aplicar lo trabajado en clase para pasar de una estructura defectuosa a un modelo relacional coherente y normalizado, dejando todo preparado para la futura implementacion en SQL (sin escribir DDL formal todavia).

## Lo que vamos a entrenar hoy
- Deteccion de redundancias y anomalias.
- Identificacion y justificacion de dependencias funcionales.
- Descomposicion a tablas coherentes.
- Definicion de claves primarias y foraneas.
- Verificacion de 1FN, 2FN y 3FN.
- Preparacion mental para el salto a diseno fisico / DDL.

## Organizacion
- Duracion total: **120 minutos**.
- Equipos: **3 personas**.
- Roles por equipo: Analista, Disenador/a, Validador/a.
- Portavoz: puede rotar o coincidir con un rol.

## Reglas del juego
1. Cada equipo recibe un caso con una estructura inicial mal disenada.
2. Debeis avanzar por fases en orden.
3. Las decisiones deben estar justificadas, no solo "porque si".
4. Podeis pedir pistas, pero restan puntos.
5. Se puntua mucho mas la calidad del razonamiento que la velocidad.

## Caso principal (Caso A): ByteBites

### Tabla inicial sospechosa
Tabla: `PEDIDO_GENERAL`

| Atributo | Descripcion breve |
|---|---|
| id_pedido | Identificador del pedido |
| fecha_pedido | Fecha y hora |
| id_cliente | Identificador cliente |
| nombre_cliente | Nombre cliente |
| telefono_cliente | Telefono cliente |
| email_cliente | Email cliente |
| direccion_cliente | Direccion envio |
| cod_postal | Codigo postal |
| ciudad | Ciudad |
| id_repartidor | Repartidor asignado |
| nombre_repartidor | Nombre repartidor |
| zona_reparto | Zona repartidor |
| id_restaurante | Restaurante del pedido |
| nombre_restaurante | Nombre restaurante |
| categoria_restaurante | Categoria principal |
| telefono_restaurante | Telefono restaurante |
| id_producto | Producto pedido |
| nombre_producto | Nombre producto |
| precio_producto | Precio unitario |
| cantidad | Cantidad producto |
| metodo_pago | Tarjeta, Bizum, efectivo |
| estado_pedido | Preparando, enviado, entregado |
| total_pedido | Importe total |
| observaciones | Texto libre |

### Pistas del escenario
- Un pedido puede incluir varios productos.
- Un cliente puede hacer muchos pedidos.
- Un restaurante ofrece muchos productos.
- El total del pedido no deberia contradecir los importes por linea.


## Fases obligatorias

### Fase 1. Investigacion
Detectad problemas de diseno, redundancias, anomalias y dependencias dudosas.

Entregable de fase:
- Lista priorizada de problemas detectados.
- Al menos 4 dependencias funcionales justificadas.

### Fase 2. Reconstruccion
Proponed una descomposicion en tablas y definid claves primarias y relaciones.

Entregable de fase:
- Primer borrador de esquema relacional.
- PK y FK propuestas.

### Fase 3. Validacion
Comprobad 1FN, 2FN y 3FN. Corregid lo necesario.

Entregable de fase:
- Checklist de normalizacion completado.
- Ajustes realizados y motivo.

### Fase 4. Preparacion para implementacion
Sin escribir DDL, dejad cada tabla en formato pre-SQL:
- nombre tabla
- atributos
- PK
- FK

Entregable de fase:
- "Diccionario de tablas final".

### Fase 5. Defensa expres
Exponed en 2 minutos:
1. Los 3 problemas mas graves del modelo inicial.
2. Como quedo vuestro modelo final.
3. Una decision de diseno que os costo tomar y como la justificais.

## Temporizacion de aula (120 min)
- 0-10 min: briefing CSI, reparto de roles y caso.
- 10-30 min: Fase 1 Investigacion.
- 30-60 min: Fase 2 Reconstruccion.
- 60-80 min: Fase 3 Validacion.
- 80-100 min: Fase 4 Preparacion pre-SQL.
- 100-115 min: Fase 5 Defensas expres.
- 115-120 min: cierre, ranking amable y conexion con DDL.

## Sistema de puntos (resumen rapido)
- Puntos por fase completada con calidad.
- Bonus por buena justificacion y correcciones elegantes.
- Penalizacion por pistas.
- Bonus pequeno por preguntas tecnicas respetuosas a otros equipos.

Detalle completo en `sistema_puntuacion.md`.

## Material que debe entregar cada grupo
1. Ficha de grupo completa (`ficha_grupo.md` como plantilla).
2. Esquema final pre-SQL (fase 4).
3. Defensa oral expres de 2 minutos.

## Criterio clave para ganar
No gana quien corre mas. Gana quien **razona mejor**, justifica sus decisiones con criterio y entrega un modelo solido y coherente.

Buena suerte, equipo CSI.
