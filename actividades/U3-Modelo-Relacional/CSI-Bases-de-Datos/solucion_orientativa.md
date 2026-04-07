# Solucion Orientativa - CSI Bases de Datos

## 1. Caso A (ByteBites): analisis de partida
Relacion inicial: `PEDIDO_GENERAL`

## 2. Problemas esperables en la tabla inicial
1. Mezcla de varias entidades en una sola tabla (pedido, cliente, repartidor, restaurante, producto).
2. Redundancia fuerte de datos de cliente, repartidor y restaurante en cada linea de producto.
3. Riesgo de inconsistencia en `total_pedido` frente a suma de lineas.
4. Problemas de insercion: no puedo registrar un restaurante sin pedido.
5. Problemas de borrado: al borrar el ultimo pedido de un cliente, pierdo sus datos historicos.
6. Problemas de actualizacion: cambiar telefono_restaurante exige actualizar muchas filas.
7. Potencial multivalor encubierto en pedido-productos (repeticiones por id_pedido).

## 3. Dependencias funcionales orientativas
Estas DF son una guia de referencia para discutir en clase:

1. `id_pedido -> fecha_pedido, id_cliente, id_repartidor, metodo_pago, estado_pedido, observaciones`
2. `id_cliente -> nombre_cliente, telefono_cliente, email_cliente, direccion_cliente, cod_postal, ciudad`
3. `id_repartidor -> nombre_repartidor, zona_reparto`
4. `id_restaurante -> nombre_restaurante, categoria_restaurante, telefono_restaurante`
5. `id_producto -> nombre_producto, precio_producto, id_restaurante`
6. `(id_pedido, id_producto) -> cantidad`

Notas docentes:
- Puede discutirse si el precio de producto historico debe congelarse por linea de pedido.
- Si se quiere historico correcto, en detalle de pedido conviene guardar `precio_unitario_aplicado`.

## 4. Propuesta de descomposicion relacional (orientativa)

### Tabla `CLIENTE`
- `id_cliente` (PK)
- `nombre_cliente`
- `telefono_cliente`
- `email_cliente` (UNIQUE sugerido)
- `direccion_cliente`
- `cod_postal`
- `ciudad`

### Tabla `REPARTIDOR`
- `id_repartidor` (PK)
- `nombre_repartidor`
- `zona_reparto`

### Tabla `RESTAURANTE`
- `id_restaurante` (PK)
- `nombre_restaurante`
- `categoria_restaurante`
- `telefono_restaurante`

### Tabla `PRODUCTO`
- `id_producto` (PK)
- `id_restaurante` (FK -> RESTAURANTE.id_restaurante)
- `nombre_producto`
- `precio_base`

### Tabla `PEDIDO`
- `id_pedido` (PK)
- `fecha_pedido`
- `id_cliente` (FK -> CLIENTE.id_cliente)
- `id_repartidor` (FK -> REPARTIDOR.id_repartidor, nullable si asignacion tardia)
- `metodo_pago`
- `estado_pedido`
- `observaciones`
- `total_calculado` (opcional; si se almacena, debe definirse politica de consistencia)

### Tabla `DETALLE_PEDIDO`
- `id_pedido` (FK -> PEDIDO.id_pedido)
- `id_producto` (FK -> PRODUCTO.id_producto)
- `cantidad`
- `precio_unitario_aplicado` (recomendado para historico real)
- PK compuesta: (`id_pedido`, `id_producto`)

## 5. Comprobacion de formas normales

### 1FN
- Atributos atomicos en cada tabla.
- Repeticion de productos por pedido resuelta con `DETALLE_PEDIDO`.

### 2FN
- En `DETALLE_PEDIDO`, los no clave (`cantidad`, `precio_unitario_aplicado`) dependen de la clave completa (`id_pedido`, `id_producto`).
- No se dejan atributos que dependan solo de parte de la clave compuesta.

### 3FN
- Datos de cliente/repartidor/restaurante separadas para evitar dependencias transitivas desde pedido.
- Atributos descriptivos dependen de la PK de su tabla y no de otros no clave.

## 6. Estructura final pre-SQL (ejemplo de salida esperada)

### CLIENTE
- Atributos: id_cliente, nombre_cliente, telefono_cliente, email_cliente, direccion_cliente, cod_postal, ciudad
- PK: id_cliente
- FK: -
- Restricciones basicas: nombre_cliente NOT NULL, email_cliente UNIQUE

### REPARTIDOR
- Atributos: id_repartidor, nombre_repartidor, zona_reparto
- PK: id_repartidor
- FK: -
- Restricciones basicas: nombre_repartidor NOT NULL

### RESTAURANTE
- Atributos: id_restaurante, nombre_restaurante, categoria_restaurante, telefono_restaurante
- PK: id_restaurante
- FK: -
- Restricciones basicas: nombre_restaurante NOT NULL

### PRODUCTO
- Atributos: id_producto, id_restaurante, nombre_producto, precio_base
- PK: id_producto
- FK: id_restaurante -> RESTAURANTE
- Restricciones basicas: precio_base > 0

### PEDIDO
- Atributos: id_pedido, fecha_pedido, id_cliente, id_repartidor, metodo_pago, estado_pedido, observaciones, total_calculado(opcional)
- PK: id_pedido
- FK: id_cliente -> CLIENTE, id_repartidor -> REPARTIDOR
- Restricciones basicas: fecha_pedido NOT NULL, estado_pedido con dominio controlado

### DETALLE_PEDIDO
- Atributos: id_pedido, id_producto, cantidad, precio_unitario_aplicado
- PK: (id_pedido, id_producto)
- FK: id_pedido -> PEDIDO, id_producto -> PRODUCTO
- Restricciones basicas: cantidad > 0, precio_unitario_aplicado > 0

## 7. Observaciones pedagogicas para la correccion
- Aceptar variantes razonables si estan bien justificadas.
- No exigir una unica solucion exacta si respeta coherencia relacional y normalizacion.
- Premiar especialmente:
  - justificaciones de DF
  - decisiones sobre atributos derivados
  - claridad en PK/FK

## 8. Mini solucion de variantes (resumen)

### Caso B Streaming (resumen)
Tablas orientativas:
- USUARIO
- SUSCRIPCION
- PERFIL
- CONTENIDO
- VISUALIZACION

Claves:
- PK simple en entidades maestras.
- PK compuesta en `VISUALIZACION` (id_perfil, id_contenido, fecha_hora_inicio) o con id propio + UNIQUE segun enfoque.

### Caso C Gimnasio (resumen)
Tablas orientativas:
- SOCIO
- CUOTA
- MONITOR
- CLASE
- RESERVA_CLASE

Claves:
- PK en entidades principales.
- FK en reservas para socio y clase.
- Restriccion de aforo en clase tratada como regla de negocio.

## 9. Puente explicito a DDL
La estructura final obtenida hoy se traduce en la siguiente unidad a:
- `CREATE TABLE`
- `PRIMARY KEY`
- `FOREIGN KEY`
- `NOT NULL`, `UNIQUE`, `CHECK`

Mensaje docente sugerido:
"Lo dificil era pensar bien el modelo. La sintaxis SQL sera la formalizacion de lo que ya habeis decidido con criterio".
