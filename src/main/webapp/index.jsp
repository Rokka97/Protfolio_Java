<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="org.example.portfolio.Proyecto" %>
<%
    // Si la lista de proyectos no fue preparada por el servlet, redirige la petición para cargarla.
    if (request.getAttribute("proyectos") == null) {
        request.getRequestDispatcher("/proyectos").forward(request, response);
        return;
    }
%>
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


    <section id="proyectos" class="container my-5 scroll-offset">
        <h2 class="text-center mb-4">Mis Proyectos</h2>
        <div class="row g-4">
            <%
                List<Proyecto> proyectos = (List<Proyecto>) request.getAttribute("proyectos");
                if (proyectos != null) {
                    for (Proyecto p : proyectos) {
            %>
            <div class="col-md-4 d-flex align-items-stretch">
                <div class="card h-100">
                    <img src="imagen?id=<%= p.getId() %>" class="card-img-top" alt="" style="object-fit: cover; height: 200px;">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title"><%= p.getTitulo() %></h5>
                        <p class="card-text flex-grow-1"><%= p.getDescripcion() %></p>
                        <p class="card-text"><strong>Tecnologías:</strong> <%= p.getTecnologias() %></p>
                        <a href="<%= p.getUrl() %>" class="btn btn-primary mt-auto" target="_blank">Ver más</a>
                    </div>
                </div>
            </div>
            <%
                    }}
            %>
        </div>
    </section>
<!-- Seccion de habilidades -->
<section id="habilidades" class="bg-light py-5 scroll-offset">
    <div class="container">
        <h2 class="text-center mb-4">Habilidades</h2>
        <!-- Primera fila -->
        <div class="row justify-content-center mb-4">
            <div class="col-md-3 col-sm-4 col-6 text-center mb-4">
                <img src="logos/html5.svg" alt="HTML5" class="img-fluid" style="max-height: 80px;">
                <p class="mt-2 mb-0 fw-bold">HTML5</p>
            </div>
            <div class="col-md-3 col-sm-4 col-6 text-center mb-4">
                <img src="logos/css_old.svg" alt="CSS3" class="img-fluid" style="max-height: 80px;">
                <p class="mt-2 mb-0 fw-bold">CSS3</p>
            </div>
            <div class="col-md-3 col-sm-4 col-6 text-center mb-4">
                <img src="logos/java.svg" alt="Java" class="img-fluid" style="max-height: 80px;">
                <p class="mt-2 mb-0 fw-bold">Java</p>
            </div>
            <div class="col-md-3 col-sm-4 col-6 text-center mb-4">
                <img src="logos/kotlin.svg" alt="Kotlin" class="img-fluid" style="max-height: 80px;">
                <p class="mt-2 mb-0 fw-bold">Kotlin</p>
            </div>
        </div>
        <!-- Segunda fila -->
        <div class="row justify-content-center">
            <div class="col-md-3 col-sm-4 col-6 text-center mb-4">
                <img src="logos/javascript.svg" alt="JavaScript" class="img-fluid" style="max-height: 80px;">
                <p class="mt-2 mb-0 fw-bold">JavaScript</p>
            </div>
            <div class="col-md-3 col-sm-4 col-6 text-center mb-4">
                <img src="logos/android-icon.svg" alt="Android" class="img-fluid" style="max-height: 80px;">
                <p class="mt-2 mb-0 fw-bold">Android</p>
            </div>
            <div class="col-md-3 col-sm-4 col-6 text-center mb-4">
                <img src="logos/github_light.svg" alt="GitHub" class="img-fluid" style="max-height: 80px;">
                <p class="mt-2 mb-0 fw-bold">GitHub</p>
            </div>
            <div class="col-md-3 col-sm-4 col-6 text-center mb-4">
                <img src="logos/git.svg" alt="Git" class="img-fluid" style="max-height: 80px;">
                <p class="mt-2 mb-0 fw-bold">Git</p>
            </div>
        </div>
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