# PRÁCTICA: DISEÑO DE MODELOS ENTIDAD-RELACIÓN

**Asignatura:** Bases de Datos  
**Curso:** 1º DAW  
**Unidad:** U2 - Modelo Entidad/Relación  
**Tiempo estimado:** 180 minutos  
**Tipo:** Diseño y Modelado  
**Puntuación:** 10 puntos (5 puntos cada ejercicio)

## OBJETIVOS
- Aplicar los conceptos del modelo Entidad-Relación a casos reales complejos
- Identificar correctamente entidades, relaciones y atributos
- Diferenciar entidades fuertes de débiles (por identificación y por existencia)
- Diseñar jerarquías de especialización/generalización
- Establecer cardinalidades y participaciones correctas
- Utilizar la notación estándar del modelo E/R

## COMPETENCIAS A DESARROLLAR
- Análisis de requisitos y extracción de información relevante
- Modelado conceptual de bases de datos
- Aplicación de conceptos teóricos a casos prácticos
- Representación gráfica normalizada de esquemas E/R

---

## EJERCICIO 1: AUTOESCUELA "MALAGUETA" (5 puntos)

### ENUNCIADO

La autoescuela "Malagueta" quiere diseñar una base de datos para gestionar todo lo relacionado con los profesores, clases, alumnos y exámenes de la autoescuela.

En la autoescuela existen dos tipos de profesores, aquellos que imparten la teoría y aquellos que imparten la práctica. En algunos casos, los profesores pueden impartir algunas veces la teoría y otras dedicarse a las clases prácticas. De los profesores queremos conocer su dni, nombre, apellidos y los años que llevan en la empresa. De los profesores de prácticas se quiere saber en qué turnos dan sus clases (mañana o tarde).

Los profesores que dan clases prácticas siempre lo hacen con el mismo vehículo, aunque un vehículo puede ser usado por varios profesores. De los vehículos se quiere conocer matricula, modelo y kilometraje. Si el vehículo es una moto, además se quiere conocer la cilindrada y si es un camión el tonelaje. En el caso de los coches no es necesario ninguna información adicional.

De los alumnos queremos conocer el dni, nombre, dirección y también si está matriculado como alumno de la parte teórica o de la parte práctica. Un alumno puede venir recomendado por otro alumno y un alumno puede recomendar a varios (recibe un descuento por cada alumno al que ha recomendado la autoescuela).

Un alumno siempre va a dar clase con el mismo profesor y con el mismo coche.

Las clases prácticas que da cada alumno son también registradas. De las clases prácticas que da cada alumnos sólo se desea almacenar la fecha de la práctica y el precio que el alumno ha pagado (no se puede añadir ningún atributo adicional).

Por otro lado, los exámenes teóricos que hacen los alumnos también son registrados en la base de datos. Un alumno puede presentarse varias veces, por lo que puede hacer varios exámenes y un examen es realizado por varios alumnos. De cada examen realizado por los alumnos se quiere saber la fecha en la que dicho alumno lo hizo.

### SE PIDE:
1. Diseñar el diagrama Entidad-Relación completo
2. Identificar y señalar claramente:
   - Entidades fuertes y débiles (indicar tipo de dependencia)
   - Atributos de cada entidad (incluyendo claves primarias)
   - Relaciones entre entidades
   - Cardinalidades y participaciones
   - Jerarquías de especialización/generalización (si existen)
3. Utilizar la notación estándar vista en clase

---

## EJERCICIO 2: CAMPEONATO DE PARCHÍS (5 puntos)

### ENUNCIADO

En el pueblo de "Villavacía" se organiza un campeonato internacional de parchís cada cuatro años. La alcaldesa del ayuntamiento nos ha pedido gestionar el campeonato con una Base de Datos, por lo que tendremos que gestionar dicho campeonato. Nos ha dado la siguiente información:

Los participantes en el campeonato son los jugadores y los árbitros. De ambos se quiere conocer su número de licencia federativa, su nombre, apellidos y ranking. De los jugadores además se especifica su categoría (junior/senior/veterano). En el campeonato no se puede participar como jugador y árbitro a la vez (evidentemente).

Los países participantes envían a jugadores y árbitros al campeonato. Hay países que no envían participantes. Los participantes sólo pueden ser enviados por un único país. Los países se identifican por un código. También queremos saber el nombre del país y el número de clubes que tiene su federación.

Las partidas del campeonato se identifican por un código, la juegan cuatro jugadores y las arbitra un árbitro. Se quiere registrar la fecha de la partida y el color del jugador ganador. De alguna manera se debe registrar también el color con el que juega cada jugador.

Tanto jugadores como árbitros se alojan en los hoteles donde se juegan las partidas del campeonato. Se quiere conocer en qué hotel y en qué fechas se ha alojado cada participante. Debemos tener en cuenta que un participante no tiene por qué alojarse en el mismo hotel durante todo el campeonato, ya que puede jugar sus partidas, irse y volver para jugar las de la siguiente ronda. De cada hotel queremos conocer su nombre y sus números de teléfono.

Cada partida se juega en las salas de los hoteles. Las salas se identifican con un código único y de ellas se quiere conocer la infraestructura audiovisual que se dispone para retransmitir las partidas (radio, televisión, internet...). Si un hotel deja de ser sede del campeonato no se necesitará más la información de las salas de dicho hotel. Se desea conocer la cantidad de entradas vendidas en la sala para cada partida que se celebra en dicha sala.

De cada partida se pretenden registrar todos los movimientos que se hacen. La identificación de cada movimiento se establece en base a un número de orden dentro de cada partida. De cada movimiento interesa saber el color de la ficha, cuantas casillas ha movido y si se ha comido otra ficha o no.

### SE PIDE:
1. Diseñar el diagrama Entidad-Relación completo
2. Identificar y señalar claramente:
   - Entidades fuertes y débiles (indicar tipo de dependencia)
   - Atributos de cada entidad (incluyendo claves primarias)
   - Relaciones entre entidades (incluyendo ternarias si son necesarias)
   - Cardinalidades y participaciones
   - Jerarquías de especialización/generalización (si existen)
   - Restricciones de exclusividad/inclusión
3. Utilizar la notación estándar vista en clase

---

## CRITERIOS DE EVALUACIÓN

### SISTEMA DE CALIFICACIÓN

Cada ejercicio se evalúa sobre 5 puntos. La puntuación se asigna positivamente y se penaliza según los siguientes criterios:

#### PUNTUACIÓN POSITIVA (máximo 5 puntos por ejercicio):
- **Identificación correcta de entidades (1 punto):**
  - Todas las entidades necesarias están presentes
  - No hay entidades innecesarias o redundantes

- **Relaciones correctas (1 punto):**
  - Todas las relaciones necesarias están modeladas
  - Tipo de relación correcto (binaria, ternaria, identificadora)

- **Atributos y claves (1 punto):**
  - Atributos asignados a las entidades correctas
  - Claves primarias correctamente identificadas
  - Atributos multivaluados y compuestos identificados

- **Entidades débiles y dependencias (1 punto):**
  - Correcta identificación de entidades débiles
  - Tipo de dependencia correcto (identificación/existencia)
  - Relaciones identificadoras bien marcadas

- **Cardinalidades, jerarquías y notación (1 punto):**
  - Cardinalidades correctas (1:1, 1:N, N:M)
  - Participaciones correctas (total/parcial)
  - Jerarquías IS-A bien diseñadas con restricciones (d/o, t/p)
  - Notación estándar aplicada correctamente

#### PENALIZACIONES (se descuentan de la puntuación obtenida):
- **Detección o uso erróneo de entidades/relaciones:** -0.5 puntos por cada una
- **Detección o uso erróneo de atributos o claves incorrectas:** -0.25 puntos por cada una
- **Detección o uso erróneo de entidades débiles-fuertes:** -0.25 puntos por cada una
- **Detección o uso erróneo de tipo de dependencia:** -0.25 puntos por cada una
- **Jerarquía errónea o no detectada:** -0.5 puntos por cada una
- **Cardinalidades erróneas:** -0.25 puntos por cada una
- **Notación errónea de cardinalidades:** -0.25 puntos por cada una
- **Mala sintaxis:** -0.1 puntos por cada error
  - Entidades en singular, MAYÚSCULAS y nominales
  - Relaciones en minúsculas
  - Atributos multivaluados o compuestos no detectados

**Nota:** La puntuación mínima de cada ejercicio es 0 puntos (no puede ser negativa).

---

## FORMATO DE ENTREGA

### NOMENCLATURA DE ARCHIVOS:
- **Ejercicio 1:** `P01_Apellido1_Apellido2_Autoescuela.pdf` o `.png`
- **Ejercicio 2:** `P01_Apellido1_Apellido2_Parchis.pdf` o `.png`

### CONTENIDO REQUERIDO:
1. **Diagrama E/R completo** (puede ser dibujado a mano escaneado o con herramienta digital)
2. **Leyenda de notación utilizada** (si es necesario)


### HERRAMIENTAS RECOMENDADAS:
- **Dibujo a mano:** Escanear o fotografiar con buena calidad
- **Software:** Draw.io, Lucidchart, Microsoft Visio, DIA, PlantUML
- **Online:** app.diagrams.net (gratuito)

### FORMATO:
- Archivo PDF o imagen PNG/JPG de alta calidad
- Diagrama legible (texto claro, líneas definidas)
- Tamaño adecuado (no pixelado)

---

## RECOMENDACIONES

1. **Lee el enunciado varias veces** antes de empezar a diseñar
2. **Identifica primero las entidades** principales
3. **Determina qué entidades son débiles** y por qué tipo de dependencia
4. **Busca jerarquías** de especialización/generalización
5. **Establece las relaciones** entre entidades
6. **Define las cardinalidades** pensando en casos reales
7. **Revisa la notación** antes de entregar
8. **Verifica que no falten atributos** mencionados en el enunciado

---

## RECURSOS ADICIONALES

- Apuntes de la Unidad 2 disponibles en el aula virtual
- Ejemplos resueltos en clase

---

**¡Éxito en vuestra práctica!**

