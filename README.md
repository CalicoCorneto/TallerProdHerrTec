# Taller de productividad basada en herramientas tecnológicas

Es la materia escolar de taller de productividad basada en herramientas tecnológicas dónde se aprende a manejar GitHub.<br>
En este caso se eprenderá a:

1. Crear un tablero Kanban.
2. Hacer pruebas unitarias.
3. Crear nuevas ramas.
4. Aprobar Pull request
5. Crear milestones.
6. Crear nuevos problemas (issues)

# Sistema de control de accesos del gimnasio

Este proyecto es una aplicación web desarrollada para erradicar la problemática de control de accesos y pagos vencidos en un gimnasio local. El sistema permite verificar rápidamente el estado de la membresía de un socio y registrar renovaciones, optimizando la administración y evitando pérdidas económicas.

### Gestión del Proyecto

El análisis, planeación, estimación de tiempos y categorización de tareas se gestiona mediante metodologías ágiles en tablero Kanban.

🔗 **[CLIC AQUÍ PARA VER EL TABLERO KANBAN](https://github.com/users/CalicoCorneto/projects/1/views/1)**

El proyecto se divide en cuatro hitos (Milestones) principales para definir la madurez del producto:
* **Cliente / Frontend (Vista):** Navegador Web Chrome ejecutando HTML5, CSS y Bootstrap. Garantiza que la interfaz sea ligera y rápida para la computadora de recepción.

* **Servidor de Aplicaciones / Web Server (Controlador):** GlassFish se encargará de hospedar la aplicación, recibir las peticiones HTTP del navegador, procesar los Servlets y gestionar las sesiones (cookies/tokens) de los empleados.

* **Capa de Lógica (Modelo):** Java SE/EE utilizando el Framework Spring (o Java puro con clases DAO) para procesar las reglas de negocio (calcular vigencias y procesar el login).

* **Servidor de Base de Datos (Repositorio):** Hospedado localmente en la máquina del gimnasio para cumplir con el requerimiento de disponibilidad sin depender de internet, garantizando la seguridad y privacidad de la información.

### Arquitectura de la Aplicación

La solución está construida bajo el patrón de arquitectura **MVC (Modelo-Vista-Controlador)**:

* **Frontend (Vista):** HTML5, CSS, Bootstrap y JSP.
* **Backend (Controlador / Modelo):** Java EE / Spring Framework, Servlets.
* **Base de Datos (Repositorio):** MySQL Server local.
* **Servidor de Aplicaciones:** GlassFish / Tomcat.

### Estructura de Directorios

* `/src/main/java/modelos/`: Clases de lógica de negocio y conexión a BD.
* `/src/main/java/controladores/`: Servlets para procesar las peticiones HTTP.
* `/src/main/webapp/vistas/`: Interfaces de usuario (JSP/HTML).
* `/db/`: Scripts de inicialización de la base de datos.

###  Flujo de Trabajo en Git

El código es administrado siguiendo el flujo estándar:
* `main`: Contiene el código final, es el que esta estable y listo para producción.
* `dev`: Es la rama de integración para el código en desarrollo.
* `branches`: Se generan ramas únicas que se integran a `dev` mediante **Pull Requests**.

###  Integración Continua (CI)

Este repositorio está conectado a **Travis-CI**. Mediante pruebas unitarias (JUnit) y se valida automáticamente la correcta asignación de fechas de renovación (fecha actual + 30 días) antes de permitir la integración de nuevo código.