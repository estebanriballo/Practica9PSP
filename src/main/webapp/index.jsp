<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Práctica 9</title>
        <link rel="stylesheet" href="styles.css"/>
    </head>
    <body>
        <header>
            <h1>Pagina Web Práctica 9</h1>
            <nav>
                <ul>
                    <li><a href="">Inicio</a></li>
                    <li><a href="zodiaco.jsp">Ver Zodiaco</a></li>
                    <li><a href="lista.jsp">Lista Paises</a></li>
                    <li><a href="tabla.jsp">Tabla Paises</a></li>
                </ul>
            </nav>
        </header>
        
        <!-- Sección principal con el formulario -->
        <main>
            <h2>Formulario de Registro</h2>
            <form action="procesarRegistro.jsp" method="post">
                <div>
                    <label for="nombre">Nombre:</label>
                    <input type="text" id="nombre" name="nombre" required>
                </div>
                <div>
                    <label for="apellido">Apellido:</label>
                    <input type="text" id="apellido" name="apellido" required>
                </div>
                <div>
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div>
                    <label for="fechaNacimiento">Fecha de Nacimiento:</label>
                    <!-- El input type="date" muestra un selector de fecha en navegadores modernos -->
                    <input type="date" id="fechaNacimiento" name="fechaNacimiento" required>
                </div>
                <div>
                    <input type="submit" value="Enviar">
                </div>
            </form>
        </main>
        
        <footer>
            <p>&copy; 2025 Esteban Riballo Moreno, Hugo Pérez Muñoz y Miguel Pavón Limones</p>
        </footer>
    </body>
</html>

