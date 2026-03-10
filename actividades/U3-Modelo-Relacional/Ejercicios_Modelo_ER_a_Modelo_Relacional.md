# Ejercicios de Modelo Relacional

## Introducción

Esta colección de ejercicios está diseñada para practicar el paso del modelo Entidad/Relación (E/R) al modelo relacional. Los enunciados se centran en situaciones habituales de diseño de bases de datos y permiten trabajar, de forma progresiva, contenidos clave como jerarquías, entidades débiles y tipos de atributos.

En cada ejercicio se pide:

- diseñar el modelo E/R
- transformarlo al modelo relacional
- indicar claves primarias y claves foráneas cuando corresponda

---

## Ejercicios

### Ejercicio 1

**Enunciado**

Una empresa almacena información sobre sus empleados.

De cada empleado se guarda:
- DNI
- Nombre, compuesto por nombre y apellidos
- Fecha de nacimiento
- Dirección, compuesta por calle, número, ciudad y código postal

**Se pide**

1. Diseñar el modelo E/R identificando los atributos compuestos.
2. Pasar el modelo al modelo relacional.

---

### Ejercicio 2

**Enunciado**

En una academia se almacenan datos de los profesores.

De cada profesor se conoce:
- Código de profesor
- Nombre
- Especialidad
- Teléfonos de contacto, pudiendo tener varios

**Se pide**

1. Diseñar el modelo E/R identificando el atributo multievaluado.
2. Transformarlo al modelo relacional.

---

### Ejercicio 3

**Enunciado**

Un sistema almacena información de clientes.

De cada cliente se conoce:
- DNI
- Nombre
- Dirección, compuesta por calle, número y ciudad
- Correos electrónicos, pudiendo tener varios

**Se pide**

1. Identificar atributos compuestos y multievaluados.
2. Diseñar el modelo relacional.

---

### Ejercicio 4

**Enunciado**

Una empresa gestiona pedidos.

Cada pedido tiene:
- Número de pedido
- Fecha

Cada pedido está compuesto por varias líneas de pedido, de las que se conoce:
- Número de línea
- Cantidad
- Precio

Las líneas no existen sin el pedido.

**Se pide**

1. Identificar la entidad débil.
2. Diseñar el modelo relacional indicando la clave primaria.

---

### Ejercicio 5

**Enunciado**

Un hospital registra pacientes.

De cada paciente se conoce:
- Número de paciente
- Nombre

Cada paciente puede tener varios historiales médicos, donde se guarda:
- Número de historial
- Diagnóstico
- Fecha

Los historiales dependen del paciente.

**Se pide**

1. Diseñar el modelo E/R.
2. Transformarlo al modelo relacional.

---

### Ejercicio 6

**Enunciado**

Una empresa tiene empleados que pueden ser:
- Programadores
- Administrativos

De todos los empleados se guarda:
- DNI
- Nombre
- Salario

De los programadores además:
- Lenguaje principal

De los administrativos además:
- Departamento

**Se pide**

1. Diseñar la jerarquía exclusiva.
2. Pasarla al modelo relacional.

---

### Ejercicio 7

**Enunciado**

En una universidad existen personas.

Una persona puede ser:
- Profesor
- Estudiante
- Ambos a la vez

De persona:
- DNI
- Nombre

De profesor:
- Departamento

De estudiante:
- Carrera

**Se pide**

1. Diseñar el modelo E/R con jerarquía inclusiva.
2. Transformarlo al modelo relacional.

---

### Ejercicio 8

**Enunciado**

Una biblioteca almacena información sobre libros.

De cada libro se conoce:
- ISBN
- Título

Cada libro tiene varias ediciones, que dependen del libro:
- Número de edición
- Año

Además, cada edición puede tener varios traductores.

**Se pide**

1. Diseñar el modelo E/R.
2. Transformarlo al modelo relacional.

---

### Ejercicio 9

**Enunciado**

En un sistema educativo existen usuarios que pueden ser:
- Alumno
- Profesor

De usuario:
- ID
- Nombre
- Emails, pudiendo tener varios

De alumno:
- Curso

De profesor:
- Departamento

**Se pide**

1. Diseñar el modelo E/R.
2. Pasarlo al modelo relacional.

---

### Ejercicio 10

**Enunciado**

Una empresa logística gestiona vehículos.

De cada vehículo se guarda:
- Matrícula
- Marca
- Modelo

Los vehículos pueden ser:
- Camiones, con capacidad de carga
- Furgonetas, con volumen

Cada vehículo tiene conductores asignados, y de cada conductor se quiere guardar también varios teléfonos.

**Se pide**

1. Diseñar el modelo E/R completo.
2. Identificar jerarquías y atributos multievaluados.
3. Transformarlo al modelo relacional.
