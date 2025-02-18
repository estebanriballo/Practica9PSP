<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*" %>
<%@ page import="com.mycompany.practica9psp.JspCalendar" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ver Zodiaco</title>
    <link rel="stylesheet" href="zodiaco.css"/>
</head>
<body>
    <article>
        <header>
            <nav>
                <ul>
                    <li><a href="#">Zodiaco</a></li>
                    <li><a href="index.jsp">Inicio</a></li>
                    <li><a href="lista.jsp">Lista Paises</a></li>
                    <li><a href="tabla.jsp">Tabla Paises</a></li>
                </ul>
            </nav>
            <h1>Calculadora de Edad y Signo Zodiacal</h1>
        </header>
        <br>
        <section>
            <% 
                JspCalendar calendar = new JspCalendar();
                
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
                    rs = statement.executeQuery("SELECT fechanac FROM persona where id = 1");
                
                    if (rs.next()) {
                        java.sql.Date fechaNacimiento = rs.getDate("fechanac");
                        calendar.setFechaNacimiento(fechaNacimiento);
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
            <c:if test="${not empty calendar.fechaNacimiento}">
                <h2>Resultados</h2>
                <p>Edad: <%= calendar.getEdad() %> años</p>
                <p>Signo Zodiacal: <%= calendar.getSignoZodiacal() %></p>
            </c:if>
        </section>
        <footer>
            <p>&copy; 2025 Esteban Riballo Moreno, Hugo Pérez Muñoz y Miguel Pavón Limones</p>
        </footer>
    </article>
</body>
</html>
