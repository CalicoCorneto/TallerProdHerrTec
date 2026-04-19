<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Editar Cliente - Gimnasio</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        
        <nav class="navbar navbar-dark bg-dark shadow-sm">
            <div class="container">
                <span class="navbar-brand mb-0 h1">Editar Miembro</span>
            </div>
        </nav>

        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card shadow border-0">
                        <div class="card-header bg-white py-3">
                            <h5 class="mb-0 fw-bold">Actualizar información</h5>
                        </div>
                        <div class="card-body p-4">
                            <form action="/Actualizar" method="POST">
                                <input type="hidden" name="id" value="${cliente.id}">
                                
                                <div class="mb-3">
                                    <label class="form-label fw-bold">Nombre</label>
                                    <input type="text" name="nombre" class="form-control" value="${cliente.nombre}" required>
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label fw-bold">Apellido</label>
                                    <input type="text" name="apellido" class="form-control" value="${cliente.apellido}" required>
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label fw-bold">Teléfono</label>
                                    <input type="text" name="telefono" class="form-control" value="${cliente.telefono}" required>
                                </div>
                                
                                <div class="mb-4">
                                    <label class="form-label fw-bold">Estatus de Mensualidad</label>
                                    <select name="mensualidad" class="form-select">
                                        <option value="Pagada" ${cliente.mensualidad == 'Pagada' ? 'selected' : ''}>Pagado</option>
                                        <option value="Pendiente" ${cliente.mensualidad == 'Pendiente' ? 'selected' : ''}>Pendiente</option>
                                    </select>
                                </div>
                                
                                <div class="d-grid gap-2">
                                    <button type="submit" class="btn btn-primary btn-lg shadow-sm">Actualizar</button>
                                    <a href="/panel" class="btn btn-link text-muted">Cancelar y volver al inicio</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>