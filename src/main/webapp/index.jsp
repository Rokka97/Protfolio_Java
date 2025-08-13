<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="org.example.portfolio.Proyecto" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mi Portafolio</title>
    <!-- CSS Reset (normalize.css) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">

    <!-- Bootstrap cdn -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

    <!-- Estilos css -->
    <link rel="stylesheet" href="css/styles.css">


</head>
    <body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Leandro Dev</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="#titulo">Sobre mí</a></li>
                <li class="nav-item"><a class="nav-link" href="#proyectos">Proyectos</a></li>
                <li class="nav-item"><a class="nav-link" href="#habilidades">Habilidades</a></li>
                <li class="nav-item"><a class="nav-link" href="#contacto">Contacto</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Seccion Titulo -->
    <header id="titulo" class="vh-100 w-100 px-5 d-flex flex-column justify-content-center align-items-center bg-dark text-white">
        <h1>¡Hola! Soy Leandro Becerra</h1>
        <p>Desarrollador web en formación, actualmente cursando el 3 año de ingeniería en infromática. Soy alguien al cual
        le gusta aprender cosas nuevas, ingrese a esta carrera por que me gusta entender como funcionan los computadores y
        y como funciona la programacion, actuelmente me estoy formando en varios lenguajes de programacion aun en busca de
        especializarme en alguno.</p>
    </header>

<!-- Seccion Proyectos -->


    <section id="proyectos" class="container my-5">
        <h2 class="text-center mb-4">Mis Proyectos</h2>
        <div class="row">
            <%
                List<Proyecto> proyectos = (List<Proyecto>) request.getAttribute("proyectos");
                if (proyectos != null) {
                    for (Proyecto p : proyectos) {
            %>
            <div class="col-md-4">
                <div class="card">
                    <img src="imagen?id=<%= p.getId() %>" class="card-img-top" alt="Imagen del proyecto">
                    <div class="card-body">
                        <h5 class="card-title"><%= p.getTitulo() %></h5>
                        <p class="card-text"><%= p.getDescripcion() %></p>
                        <p class="card-text"><strong>Tecnologías:</strong> <%= p.getTecnologias() %></p>
                        <a href="<%= p.getUrl() %>" class="btn btn-primary" target="_blank">Ver más</a>
                    </div>
                </div>
            </div>
            <%
                }}
            %>

        </div>
    </section>
<!-- Seccion de habilidades -->
<section id="habilidades" class="bg-light py-5">
    <div class="container">
        <h2 class="text-center mb-4">Habilidades</h2>
        <ul class="list-group list-group-flush">
            <li class="list-group-item">HTML5, CSS3, Bootstrap</li>
            <li class="list-group-item">Java, JSP, GitHub</li>
            <li class="list-group-item">Android Studio, Kotlin</li>
        </ul>
    </div>
</section>

<!-- Seccion contacto -->
<section id="contacto" class="container my-5">
    <h2 class="text-center mb-4">Contáctame</h2>
    <form action="contacto.jsp" method="post">
        <div class="mb-3">
            <label for="nombre" class="form-label">Nombre</label>
            <input type="text" class="form-control" id="nombre" name="nombre" required>
        </div>
        <div class="mb-3">
            <label for="mensaje" class="form-label">Mensaje</label>
            <textarea class="form-control" id="mensaje" name="mensaje" rows="4" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Enviar</button>
    </form>
</section>
<!-- Footer -->
<footer class="bg-dark text-white text-center py-3">
    © 2025 Leandro Dev
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>