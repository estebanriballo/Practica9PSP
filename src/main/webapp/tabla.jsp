<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabla Paises</title>
        <link rel="stylesheet" href="tablas.css"/>
    </head>
    <body>
        <article>
        <header>
            <nav>
                <ul>
                    <li><a href="#">Tabla Paises</a></li>
                    <li><a href="index.jsp">Inicio</a></li>
                    <li><a href="zodiaco.jsp">Zodiaco</a></li>
                    <li><a href="lista.jsp">Lista Paises</a></li>
                </ul>
            </nav>
            <h1>Tabla Paises</h1>
        </header>
        <br>
        
        <%
            Class.forName("org.postgresql.Driver");
            
            Connection con = null;
            Statement statement = null;
            ResultSet rs = null;
            
            try{
                String url = "jdbc:postgresql://localhost:5432/p9DB";
                String user = "admin";
                String password = "admin";
                con = DriverManager.getConnection(url, user, password);

                statement = con.createStatement();
                rs = statement.executeQuery("SELECT * FROM paises order by continente");
        %>
        
        <table>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Continente</th>
                <th>Poblacion</th>
                <th>Bandera</th>
                <th>Fecha Independencia</th>
            </tr>
            <% while(rs.next()) { %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("nombre") %></td>
                <td><%= rs.getString("continente") %></td>
                <td><%= rs.getInt("poblacion") %></td>
                <td><img src="<%= rs.getString("bandera") %>" width="50"></td>
                <td>
                <% 
                    java.sql.Date fecha = rs.getDate("fecha_independencia");
                    if (fecha != null) {
                        out.println(fecha.toString());
                    } else {
                        out.println("No se ha independizado");
                    }
                %>
                </td>
            </tr>
            <% } %>
        </table>
        <%
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
