<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Iniciar sesion - Gym fitness studio</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background: linear-gradient(135deg, #1d2b64 0%, #f8cdda 100%);
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .card-login {
                width: 100%;
                max-width: 500px;
                padding: 20px;
                border: none;
                border-radius: 15px;
            }                       
        </style>
    </head>
    <body>
        <div class="card card-login shadow-lg">
            <div class="card-body text-center">
                <img src="../../Assets/Logo_gymFS.png" alt="Gym fitness" class="img-fluid w-75 mx-auto d-block mb-3"/>            
                <p class="text-muted">Ingresa tus datos</p>
                
                <form action="/Validar" method="post">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="txtuser" id="userInput" placeholder="Usuario" required>
                        <label for="userInput">Usuario</label>
                    </div>
                    <div class="form-floating mb-4">
                        <input type="password" class="form-control" name="txtpass" id="passInput" placeholder="Contraseña" required>
                        <label for="passInput">Contraseña</label>
                    </div>
                    
                    <button type="submit" class="btn btn-dark w-100 py-3 fw-bold shadow-sm">Iniciar sesión</button>
                </form>
            </div>
            <div class="card-footer bg-transparent border-0 text-center">
                <small class="text-muted">Gym Fitness Studio © 2026</small>
            </div>
        </div>
    </body>
</html>