# RELACION DE EJERCIOS MODELO E-R (1C)
 
## EJERCICIO 1: CLUB NÁUTICO
 
*Se guarda el nombre, dirección, DNI, teléfono y fecha de ingreso de cada socio y sus embarcaciones (propiedad).
 
*Cada embarcación tiene una matrícula, nombre, es de un tipo y unas dimensiones. Figura un único socio como su propietario.
 
*Cada amarre se identifica conjuntamente por zona y número. También se guarda la última lectura de los contadores de agua y luz, la embarcación a la que está asignado (única) y la fecha de asignación del amarre a la embarcación. No puede haber varios amarres asignados a la misma embarcación.
 
*Un socio puede ser propietario de uno o más amarres. En tal caso se guarda la fecha de compra del amarre. Un amarre puede ser propiedad de un solo socio. No hay ninguna relación entre la fecha de compra de un amarre y su fecha de asignación.
 
*Los amarres del club náutico se dividen en zonas. Cada zona se identifica por una letra, contiene un determinado tipo de barcos y todos sus amarres tienen la misma profundidad y anchura. Lógicamente, un amarre pertenece a una sola zona.
 
*Los empleados se identifican por un código. Además sabemos su nombre, dirección,teléfono, especialidad y por cada zona el número de barcos de los que se encarga.
 
*Cada empleado está asignado a una o varias zonas. En cada zona puede trabajar más de un empleado.
 
## EJERCICIO 2: ZOO
 
Diseña un esquema E/R que recoja la información sobre un zoo según la siguiente descripción:
 
*Para cada especie interesa saber sus nombres vulgar y científico, una pequeña descripción, los diferentes hábitat naturales en los que puede vivir y la zona del parque en la que se encuentran
 
*Lógicamente hay varias especies que pueden vivir en un mismo hábitat natural y en una misma zona del zoo puede haber más de una especie.
 
*Por cada hábitat se almacena su nombre, clima, vegetación predominante y el continente o continentes en los que se encuentra. Para cada zona del parque se guarda su nombre y extensión en hectáreas.
 
*No hay dos especies con el mismo nombre científico ni dos hábitat o dos zonas con el mismo nombre.
 
*Se han establecido varios itinerarios que recorren el zoo. Cada uno consta de un código identificativo, duración y longitud del recorrido, y las zonas y especies incluidas. Varios itinerarios pueden incluir la misma zona o la misma especie. A cada itinerario se le asignan uno o más guías.
 
*Se organizan varias visitas diarias. Cada una se identifica por su itinerario y número. Además se tiene la hora de comienzo, el máximo número de visitantes y el guía (único) asignado.
 
*Para cada guía se guarda su DNI, nombre, dirección, teléfono y fecha de alta como guía. Un guía puede llevar varios itinerarios y varias visitas.
 

## EJERCICIO 3: MUNDIAL DE FÚTBOL
 
Diseña un esquema E/R que recoja la siguiente información sobre el mundial de fútbol Corea-Japón 2002. 

*En esta BD iremos almacenando información sobre las selecciones 
participantes y sus jugadores, el resultado obtenido en cada partido, los controles antidopaje a los que se han sometido los jugadores, y por último, los hoteles en los que se aloja cada selección.
 
*Para cada selección interesa guardar el código con el cual se identifica, el nombre del país, el número total de goles marcados hasta el momento en el mundial y la camiseta que viste.
 
*Para cada partido jugado entre dos selección se almacena la fecha en la que se jugó,el resultado (0-0, 2-0, 0-1,...) y los árbitros que dirigieron el partido (incluidos jueces de línea, etc.). Dos equipos pueden jugar entre sí más de una vez si van superando las
eliminatorias.
 
*Para cada jugador de cada selección, se guarda su número de DNI (que incluye el código del país), nombre, fecha de nacimiento, los clubes a los que ha pertenecido dicho jugador durante el último año y el número de goles marcados en el mundial.
 
*Cuando finaliza el mundial todo jugador ha debido pasar por un control antidopaje obligatorio. Además, los jugadores pueden ser requeridos para realizar uno o más controles adicionales. En cada control se registra la fecha y el lugar en el que se realizó.
 
*Por cuestiones de organización se desea guardar información sobre los hoteles en los que se aloja cada selección. Los equipos jugarán los partidos en diferentes sedes, por lo que se alojarán en distintos hoteles. En un mismo hotel sólo se alojará un único
equipo en todo el mundial. 

*En la BD cada hotel se identifica mediante un código, y además tiene un nombre, una dirección y un teléfono. Cada selección reserva un número concreto de habitaciones en cada hotel. Este último dato también figurará en la BD.
 
## EJERCICIO 4: EMPRESA
 
Una empresa necesita organizar la siguiente información referente a su organización interna.
 
*La empresa está organizada en una serie de departamentos. Cada departamento tiene un código, nombre y presupuesto anual.
 
*Cada departamento está ubicado en un centro de trabajo. La información que se desea guardar del centro de trabajo es el código de centro, nombre, población y dirección del centro.
 
*La empresa tiene una serie de empleados. Cada empleado tiene un teléfono, fecha de alta en la empresa, NIF y nombre. De cada empleado también interesa saber el número de hijos que tiene y el salario de cada empleado.
 
*A esta empresa también le interesa tener guardada información sobre los hijos de los empleados. Cada hijo de un empleado tendrá un código, nombre y fecha de nacimiento.
 
*Se desea mantener también información sobre las habilidades de los empleados (por ejemplo,mercadotecnia, trato con el cliente, fresador, operador de telefonía, etc…). Cada habilidad tendrá una descripción y un código.
 
Sobre este supuesto diseñar el modelo E/R y el modelo relacional teniendo en cuenta los siguientes aspectos.
 
*Un empleado está asignado a un único departamento. Un departamento estará compuesto por uno o más empleados.
 
*Cada departamento se ubica en un único centro de trabajo. Estos se componen de uno o más departamentos.
 
*Un empleado puede tener varios hijos.
 
*Un empleado puede tener varias habilidades, y una misma habilidad puede ser poseída por empleados diferentes.
 
*Un centro de trabajo es dirigido por un empleado. Un mismo empleado puede dirigir centros de trabajo distintos.
 
 