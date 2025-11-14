# RELACIÓN EJERCICIOS MODELO E-R (1A)
 
 
## Ejercicio 1.
 
Una persona asiste a clases particulares de una academia de inglés. Cada persona se ubica en un grupo en función de su nivel de inglés. Hay un grupo por cada nivel de inglés. 

En la academia hay varios profesores de nacionalidades distintas. Cada profesor da clase a varios grupos. Cada grupo está formado por varios alumnos. A cada grupo sólo le imparte clase un profesor.
 
**Obtener el modelo E/R y completarlo con los atributos que sean correspondientes.**
 
 
 
## Ejercicio 2.
 
 
En un centro de salud un médico atiende a varios pacientes y cada paciente está asignado a un solo médico. Cada médico pasa consulta en una o varias salas. En cada sala pasan consulta varios médicos.
 
Del médico interesa conocer sus datos personales y el año en que se colegió. De la sala interesa conocer su ubicación. Y del paciente, además de sus datos personales se quiere guardar el historial médico.
 
**a) Representar el modelo E/R.**
 
**b) Se quiere saber en qué sala pasa consulta cada médico en cada momento.**
 
 
 
## Ejercicio 3.
 
En una autoescuela hay varios profesores y varios coches de prácticas. Se quiere guardar información respecto a los alumnos que se matriculan, el profesor que se les asigna y el coche que conducirán.
 
Cada alumno da clase a con un profesor en un coche. El alumno siempre va a conducir el mismo coche para habituarse a él y va a dar clase con el mismo profesor.
 
**a) Construir el modelo E/R**
 
**b) Si un día un profesor no puede dar clase, el alumno puede cambiar de profesor aunque no de coche, ¿Cómo afectaría esta nueva situación?**
 
 
## Ejercicio 4.
 
En un banco se tienen varias sucursales. Un cliente puede ir a cualquier sucursal y abrir una cuenta. En realidad el cliente puede abrir varias cuentas en la misma o distinta sucursal. Una cuenta puede pertenecer a uno o a varios clientes distintos.
 
Sobre una determinada cuenta se pueden realizar varias transacciones. Cada sucursal viene identificada por un número de sucursal, también interesa conocer la ciudad en la que se encuentra ubicada y el activo disponible.
 
Por su parte, cada cuenta tiene asociado un número de cuenta y saldo.
Del cliente interesa almacenar el DNI, el nombre, la dirección y la ciudad en la que reside.
 
Cada transacción que se realiza sobre una cuenta tiene un número (de transacción) diferente. Además, se marca la fecha del día, el tipo de operación que se realiza (Ingreso/Extracción) y la cantidad que se mueve.
 
**Construir el modelo E/R.**
 
 
## Ejercicio 5.
 
Se quiere construir el modelo de E/R que representa la formulación química inorgánica.
 
Para ello es necesario conocer información de los elementos ( H,O,Fe,….) y de los compuestos (H2O,HSO4,CO2,...). 

La información básica será la misma para todos los compuestos, pero dispondrán de información específica en función de que su estado sea
sólido, líquido o gaseoso.
 
De los elementos se guardará la información que aparece en la tabla periódica: nombre,símbolo, peso atómico, número atómico.
 
Entre los datos de la información básica de los componentes se encuentra el nombre. Si son gases interesa apuntar el coeficiente de expansión y la temperatura de licuación. Si son líquidos,  la densidad y la temperatura de evaporación. Y si son sólidos el color, olor y dureza.
 
 
## Ejercicio 6 (LIGA DE FUTBOL PROFESIONAL).
 
La liga de futbol profesional (LFP) tiene el proyecto de implementar una base de datos
con estadísticas de la temporada.
 
En dicha base de datos los futbolistas vendrán identificados por su nº de ficha, interesando además su nombre, apellidos, fecha de nacimiento, peso y estatura.
 
Los equipos vienen identificados por su nombre. También se guarda su año de 
fundación, nombre del presidente, nº de socios y estadio en el que juega.
 
Un futbolista puede militar en equipos distintos a lo largo de su carrera deportiva, pero no simultáneamente. De cada contrato entre jugador y club interesa reflejar fecha de 
comienzo, duración, ficha anual y cláusula de rescisión.
 
 
Los equipos disputan partidos entre sí, de los que se guarda la fecha, el resultado y la jornada a la que corresponden. Cada jugador participa en diferentes partidos (puede que ninguno), siendo relevante el nº de minutos disputados, los goles anotados ( o recibidos si se trata del portero) y las tarjetas recibidas.
 
De los árbitros interesa saber el nº de colegiado, el colegio arbitral al que pertenece, así como su nombre, apellidos y nº de temporadas en la categoría. Cada partido lo arbitran cuatro colegiados (arbitro principal, auxiliares de banda, y cuarto arbitro), siendo de interés saber la función de cada uno de ellos en el mismo.
 
**Construir el modelo E/R.**
 