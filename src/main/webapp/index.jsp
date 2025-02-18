<%@page import="java.sql.*"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Práctica 9</title>
        <link rel="stylesheet" href="styles.css"/>
        <script>
            window.onload = function() {
                var mensaje = '<%= session.getAttribute("mensaje") != null ? session.getAttribute("mensaje") : "" %>';
                if(mensaje !== "") {
                    alert(mensaje);
                    session.removeAttribute("mensaje");
                }
            }
        </script>
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
        <main>
            <h2>Formulario de Registro</h2>
            <form action="index.jsp" method="post">
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
                    <input type="date" id="fechaNacimiento" name="fechaNacimiento" required>
                </div>
                <div>
                    <input type="submit" value="Enviar">
                </div>
            </form>
        </main>
        <%
            String mensaje = "";
            if (request.getParameter("procesado") == null) {

                String fechaStr = request.getParameter("fechaNacimiento");

                Calendar fecha = Calendar.getInstance();
        
                if(fechaStr != null && !fechaStr.isEmpty()){
                    try {
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

                        Date date = sdf.parse(fechaStr);

                        fecha.setTime(date);

                        String formattedDate = sdf.format(fecha.getTime());
                
                        Class.forName("org.postgresql.Driver");

                        Connection con = null;
                        Statement statement = null;
                
                        try{
                            String url = "jdbc:postgresql://localhost:5432/p9DB";
                            String user = "admin";
                            String password = "admin";
                            con = DriverManager.getConnection(url, user, password);

                            statement = con.createStatement();

                            String sql = "UPDATE persona SET fechanac = '" + formattedDate + "' WHERE id = 1";
                    
                            if(statement.executeUpdate(sql) > 0){
                                mensaje = "Se ha actualizado la persona";
                            } else {
                                mensaje = "No se encontró la persona o no se pudo actualizar.";
                            }
                        } catch (Exception e) {
                            mensaje = "Error: " + e.getMessage();
                        } finally {
                            if (statement != null) try { statement.close(); } catch (SQLException e) { }
                            if (con != null) try { con.close(); } catch (SQLException e) { }
                        }
                    } catch (ParseException e) {
                        mensaje = "Error al convertir la fecha: " + e.getMessage();
                    }
                }
                session.setAttribute("mensaje", mensaje);

                response.sendRedirect("index.jsp?procesado=true");
            }
        %>

        <footer>
            <p>&copy; 2025 Esteban Riballo Moreno, Hugo Pérez Muñoz y Miguel Pavón Limones</p>
        </footer>
    </body>
</html>
