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
                    <li><a href="index.jsp">Ver Inicio</a></li>
                    <li><a href="lista.jsp">Lista Paises</a></li>
                    <li><a href="tabla.jsp">Tabla Paises</a></li>
                </ul>
            </nav>
            <h1>Calculadora de Edad y Signo Zodiacal</h1>
            
        </header>
        <br>
        <section>
            <h2>Ingrese su fecha de nacimiento</h2>
            <form action="zodiaco.jsp" method="post">
                <label for="fechaNacimiento">Fecha de Nacimiento:</label>
                <input type="date" id="fechaNacimiento" name="fechaNacimiento">
                <button type="submit">Calcular</button>
            </form>
        </section>

        <section>
            <% 
                JspCalendar calendar = new JspCalendar();
                
                if (request.getParameter("fechaNacimiento") != null) {
                    String fechaStr = request.getParameter("fechaNacimiento");
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    Date fechaNacimiento = sdf.parse(fechaStr);
                    calendar.setFechaNacimiento(fechaNacimiento);
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
