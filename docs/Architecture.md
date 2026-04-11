# Arquitectura de aplicación

La solución se diseñará bajo el patrón de arquitectura MVC (Modelo-Vista-Controlador), garantizando que el sistema sea modular, seguro y escalable. 
Este proyecto se encuentra mediante los componentes son:

1. **Cliente / Frontend (Vista):** Navegador Web Chrome ejecutando HTML5, CSS y Bootstrap. Garantiza que la interfaz sea ligera y rápida para la computadora de recepción.

2. **Servidor de Aplicaciones / Web Server (Controlador):** GlassFish se encargará de hospedar la aplicación, recibir las peticiones HTTP del navegador, procesar los Servlets y gestionar las sesiones (cookies/tokens) de los empleados.

3. **Capa de Lógica (Modelo):** Java SE/EE utilizando el Framework Spring (o Java puro con clases DAO) para procesar las reglas de negocio (calcular vigencias y procesar el login).

4. **Servidor de Base de Datos (Repositorio):** Hospedado localmente en la máquina del gimnasio para cumplir con el requerimiento de disponibilidad sin depender de internet, garantizando la seguridad y privacidad de la información.