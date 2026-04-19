<%@page import="java.util.List"%>
<%@page import="gimnasio.Cliente"%>
<%@page import="gimnasio.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%      
    Usuario usr = (Usuario) session.getAttribute("usuario");
    if (usr == null) {
        response.sendRedirect("/login");
        return; 
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Panel Principal - Gimnasio</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        
        <nav class="navbar navbar-dark bg-dark shadow">
            <div class="container-fluid">
                <span class="navbar-brand mb-0 h1">GYM - Fitness Studio</span>
                <div class="d-flex align-items-center text-white">
                    <span class="me-3">Bienvenido, <%= usr.getNombre() %></span>
                    <a href="/Salir" class="btn btn-outline-danger btn-sm">Cerrar Sesión</a>
                </div>
            </div>
        </nav>

        <div class="container mt-4">
            
            <%
                List<Cliente> lista = (List<Cliente>) request.getAttribute("listaClientes");
                int total = 0, pagados = 0, deudores = 0;
                
                if(lista != null){
                    total = lista.size();
                    for(Cliente c : lista){
                        if(c.getMensualidad().equals("Pagada")) pagados++;
                        else deudores++;
                    }
                }
            %>

            <div class="row mb-4 text-center">
                <div class="col-md-4">
                    <div class="card text-white bg-primary mb-3 shadow-sm border-0">
                        <div class="card-body">
                            <h5 class="card-title">Total Clientes</h5>
                            <h1 class="display-4 fw-bold"><%= total %></h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-white bg-success mb-3 shadow-sm border-0">
                        <div class="card-body">
                            <h5 class="card-title">Al Corriente</h5>
                            <h1 class="display-4 fw-bold"><%= pagados %></h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-white bg-danger mb-3 shadow-sm border-0">
                        <div class="card-body">
                            <h5 class="card-title">Deudores</h5>
                            <h1 class="display-4 fw-bold"><%= deudores %></h1>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card mb-4 shadow-sm border-0">
                <div class="card-header bg-white">
                    <h5 class="mb-0 fw-bold">Registrar nuevo cliente</h5>
                </div>
                <div class="card-body">
                    <form action="/AgregarCliente" method="POST" class="row g-3 align-items-center">
                        <div class="col-md-3">
                            <input type="text" name="nombre" class="form-control" placeholder="Nombre(s)" required>
                        </div>
                        <div class="col-md-3">
                            <input type="text" name="apellido" class="form-control" placeholder="Apellido(s)" required>
                        </div>
                        <div class="col-md-3">
                            <input type="text" name="telefono" class="form-control" placeholder="Teléfono celular" required>
                        </div>
                        <div class="col-md-2">
                            <select name="mensualidad" class="form-select">
                                <option value="Pagada">Pagado</option>
                                <option value="Pendiente">Pendiente</option>
                            </select>
                        </div>
                        <div class="col-md-1">
                            <button type="submit" class="btn btn-success w-100 fw-bold" title="Agregar">+</button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="card shadow-sm border-0 mb-5">
                <div class="card-body">
                    <h5 class="card-title mb-3 fw-bold">Lista de clientes activos</h5>
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead class="table-dark">
                                <tr>
                                    <th>ID</th>
                                    <th>Nombre</th>
                                    <th>Apellido</th>
                                    <th>Teléfono</th>
                                    <th>Mensualidad</th>
                                    <th class="text-center">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    if (lista != null) {
                                        for (Cliente c : lista) {
                                %>
                                <tr>
                                    <td><strong><%= c.getId() %></strong></td>
                                    <td><%= c.getNombre() %></td>
                                    <td><%= c.getApellido() %></td>
                                    <td><%= c.getTelefono() %></td>
                                    <td>
                                        <span class="badge <%= c.getMensualidad().equals("Pendiente") ? "bg-danger" : "bg-success" %> p-2">
                                            <%= c.getMensualidad() %>
                                        </span>
                                    </td>
                                    <td class="text-center">
                                        <a href="/Editar?id=<%= c.getId() %>" class="btn btn-outline-primary btn-sm me-1">Editar</a>
                                        <a href="/EliminarCliente?id=<%= c.getId() %>" class="btn btn-outline-danger btn-sm">Eliminar</a>
                                    </td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div> <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <%            
            String mensaje = (String) request.getAttribute("mensaje");
            String color = (String) request.getAttribute("color");
            
            if (mensaje != null) {
        %>
            <div class="toast-container position-fixed bottom-0 end-0 p-4" style="z-index: 11;">
                <div id="alertaSnackbar" class="toast align-items-center text-white bg-<%= color %> border-0 shadow-lg" role="alert" aria-live="assertive" aria-atomic="true">
                    <div class="d-flex">
                        <div class="toast-body fw-bold fs-6">
                            <%= mensaje %>
                        </div>
                        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Cerrar"></button>
                    </div>
                </div>
            </div>
            
            <script>                
                document.addEventListener('DOMContentLoaded', function () {
                    var toastEl = document.getElementById('alertaSnackbar');                    
                    var toast = new bootstrap.Toast(toastEl, { delay: 3000 }); 
                    toast.show();
                });
            </script>
        <%
            }
        %>
        
    </body>
</html>