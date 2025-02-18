<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Países</title>
    <link rel="stylesheet" href="lista.css"/>
</head>
<body>
    <article>
    <header>
        <nav>
            <ul>
                <li><a href="#">Lista Paises</a></li>
                <li><a href="index.jsp">Inicio</a></li>
                <li><a href="zodiaco.jsp">Zodiaco</a></li>
                <li><a href="tabla.jsp">Tabla Paises</a></li>
            </ul>
        </nav>
        <h1>Lista de Países</h1>
    </header>
    <br>
    <%
        Class.forName("org.postgresql.Driver");

        Connection con = null;
        Statement statement = null;
        ResultSet rs = null;
        
        try {
            String url = "jdbc:postgresql://localhost:5432/p9DB";
            String user = "admin";
            String password = "admin";
            con = DriverManager.getConnection(url, user, password);

            statement = con.createStatement();
            rs = statement.executeQuery("SELECT * FROM paises ORDER BY continente");

            String continente = "";
            boolean first = true;
            
            while (rs.next()) {
                String continenteActual = rs.getString("continente");

                if (!continenteActual.equals(continente)) {
                    if (!first) { 
    %>
                        </div> <!-- Cierra el div.countries del continente anterior -->
                    </div> <!-- Cierra el div.continent del continente anterior -->
    <%
                    }
    %>
                    <div class="continent">
                        <h2><%= continenteActual %></h2>
                        <div class="countries">
    <%
                    continente = continenteActual;
                    first = false;
                }
    %>
                            <div class="country">
                                <img src="<%= rs.getString("bandera") %>" alt="Bandera de <%= rs.getString("nombre") %>" class="flag">
                                <span><%= rs.getString("nombre") %></span>
                            </div>
    <%
            }
            if (!first) {
    %>
                        </div> <!-- Cierra el div.countries del último continente -->
                    </div> <!-- Cierra el div.continent del último continente -->
    <%
            }
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { }
            if (statement != null) try { statement.close(); } catch (SQLException e) { }
            if (con != null) try { con.close(); } catch (SQLException e) { }
        }
    %>
    <footer>
            <p>&copy; 2025 Esteban Riballo Moreno, Hugo Pérez Muñoz y Miguel Pavón Limones</p>
    </footer>
</article>
</body>
</html>
