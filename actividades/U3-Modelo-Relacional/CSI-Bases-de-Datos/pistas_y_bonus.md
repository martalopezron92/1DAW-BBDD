# Pistas, Comodines y Bonus - CSI Bases de Datos

## 1. Uso recomendado
Este material lo gestiona el profesor para desbloquear equipos sin romper la dinamica competitiva.

Regla general:
- Cada pista tiene coste de puntos.
- El equipo decide si "compra" la pista.
- Maximo recomendado: 3 pistas por equipo.

## 2. Pistas escalonadas por fases

### Fase 1 Investigacion
#### Pista I1 (coste -1)
Pregunta guia:
"Cuantas entidades diferentes crees que estan mezcladas en la tabla inicial?"

#### Pista I2 (coste -2)
Sugerencia:
"Revisa si datos de cliente, restaurante y repartidor se repiten cada vez que hay una linea de producto del mismo pedido".

#### Pista I3 (coste -3)
Desbloqueo casi directo:
"Si para un `id_pedido` aparecen varios `id_producto`, necesitas separar cabecera de pedido y detalle".

### Fase 2 Reconstruccion
#### Pista R1 (coste -1)
"Empieza dibujando solo 4 tablas maestras: cliente, pedido, producto y restaurante".

#### Pista R2 (coste -2)
"Pregunta critica: donde pondrias `cantidad` para que tenga sentido?"

#### Pista R3 (coste -3)
"`cantidad` pertenece a la relacion pedido-producto, no al producto aislado ni al pedido aislado".

### Fase 3 Validacion
#### Pista V1 (coste -1)
"Comprueba 2FN especialmente en tablas con clave compuesta".

#### Pista V2 (coste -2)
"Busca atributos no clave que dependan de otro atributo no clave (posible problema de 3FN)".

#### Pista V3 (coste -3)
"No dejes datos descriptivos de cliente o restaurante dentro de pedido si ya tienes sus tablas".

### Fase 4 Preparacion pre-SQL
#### Pista P1 (coste -1)
"Piensa en formato `tabla -> atributos, PK, FK, restricciones`".

#### Pista P2 (coste -2)
"Marca restricciones minimas: NOT NULL en campos criticos, UNIQUE en identificadores alternativos".

#### Pista P3 (coste -3)
"Si guardas total del pedido, explica como evitarias inconsistencias con el detalle".

## 3. Comodines de aula (sin mal ambiente)

### Comodin A: 30 segundos de consulta tecnica
- Cada equipo tiene 1 uso gratis.
- Puede hacer una pregunta cerrada al profesor.
- No da respuesta completa, solo orientacion.

### Comodin B: Intercambio de evidencia
- Un equipo comparte una buena practica con otro (sin dar la solucion entera).
- Ambos equipos reciben +1 por colaboracion tecnica.
- Maximo 1 vez por equipo.

### Comodin C: Revision express del profesor
- El profesor revisa en 60 segundos una sola tabla propuesta.
- Coste: -1 punto.
- El feedback se limita a: "correcta", "revisar PK", "revisar FK", "revisar 3FN".

## 4. Bonus de calidad (aplicables por el profesor)

### Bonus B1: Justificacion excelente (+3)
Se concede cuando el equipo explica una decision compleja con ejemplo concreto y criterio.

### Bonus B2: Correccion elegante (+3)
Se concede cuando detectan y corrigen por si mismos un error de normalizacion importante.

### Bonus B3: Defensa tecnica clara (+2)
Se concede por una defensa sintetica, precisa y bien estructurada en 2 minutos.

### Bonus B4: Conexion con DDL (+3)
Se concede si relacionan su salida final con futuros `CREATE TABLE`, PK, FK y restricciones.

## 5. Frases utiles para feedback rapido del profesor
- "Buena deteccion, ahora justificad con dependencia funcional".
- "La idea va bien, pero os falta separar cabecera y detalle".
- "Esto parece 2FN, revisad si realmente cumple 3FN".
- "Decision correcta y bien defendida: bonus".

## 6. Politica de clima de clase
- Cualquier bonus por detectar fallos en otra defensa debe hacerse con tono respetuoso.
- No se permiten burlas ni comparaciones personales.
- El foco es aprender mejor, no "ganar humillando".
