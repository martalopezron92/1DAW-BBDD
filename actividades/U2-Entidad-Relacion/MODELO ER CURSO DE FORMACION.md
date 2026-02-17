# EJERCICIO MODELO ER: CURSO DE FORMACIÓN

El departamento de formació n de la empresa “Soluciones Tecnológicas” desea construir una base de datos para planificar y gestionar la formación de sus empleados. 

La empresa organiza cursos de formación a nivel interno de los que se desea conocer el código de curso, el nombre, una descripción, horas y coste.
A veces, para realizar un curso, se necesita haber hecho otro u otros cursos (también ofertados por la empresa) anteriormente. Es por esto que un curso puede tener como requisito haber realizado ese otro u otros cursos previamente. Un curso que es un requisito de otro puede serlo de forma obligatoria o sólo recomendable.
 
Un mismo curso tiene diferentes ediciones, es decir, se imparte en diferentes lugares, fechas (una de inicio y otra de finalización) y con diferentes tipos de horarios (intensivo, de mañana o de tarde). En una misma fecha de inicio sólo puede impartirse una edición de un curso. 

Los cursos se imparten por personal de la propia empresa. 
De los empleados se desea almacenar su código de empleado, nombre y apellidos, dirección, teléfono, nif (Número de Identificación Fiscal), fecha de nacimiento, nacionalidad, sexo, firma y salario, así como si está o no capacitado para impartir cursos. 

Un mismo empleado puede ser docente en una edición de un curso y alumno en otra edición, pero nunca puede ser ambas cosas a la vez (en una misma edición de curso o lo imparte o lo recibe).

**El nombre del fichero debe ser CursosFormación_Apellido1_Apellido2**