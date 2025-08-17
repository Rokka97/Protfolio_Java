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

    <!-- Left NavBar -->
    <nav class="navbar navbar-dark bg-dark position-fixed h-100 flex-column" id="sidebar" style="width: 180px; top: 0; left: 0; z-index: 1030;">
        <div class="container-fluid p-0 h-100 d-flex flex-row" id="sidebarContainer" >

            <div class="collapse navbar-collapse show flex-column flex-grow-1" id="navbarNav">
                <ul class="navbar-nav flex-column w-100 px-3 py-2">
                    <li class="nav-item py-2"><a class="nav-link ps-2" href="#titulo">Sobre mí</a></li>
                    <li class="nav-item py-2"><a class="nav-link ps-2" href="#proyectos">Proyectos</a></li>
                    <li class="nav-item py-2"><a class="nav-link ps-2" href="#habilidades">Habilidades</a></li>
                    <li class="nav-item py-2"><a class="nav-link ps-2" href="#contacto">Contacto</a></li>
                </ul>
            </div>
            <a id="nombreNavBar" class="navbar-brand p-1 text-center mt-auto" href="#">Leandro Becerra</a>
        </div>
    </nav>

<!-- Seccion Titulo -->
    <header id="titulo" class="vh-100 w-100 px-5 d-flex flex-column justify-content-center align-items-center  text-white">
        <h1>¡Hola! Soy Leandro Becerra</h1>
        <p>Desarrollador web en formación, actualmente cursando el tercer año de Ingeniería en Informática.
            Me gusta aprender cosas nuevas; ingresé a esta carrera porque me apasiona entender cómo funcionan los
            computadores y la programación. Actualmente me estoy formando en varios lenguajes de programación, aún en
            busca de especializarme en alguno.</p>
    </header>

<!-- Seccion Proyectos -->


    <section id="proyectos" class="container p-5 scroll-offset">
        <h2 class="text-center mb-4 text-white">Mis Proyectos</h2>
        <div class="row g-4">
            <%
                List<Proyecto> proyectos = (List<Proyecto>) request.getAttribute("proyectos");
                if (proyectos != null) {
                    for (Proyecto p : proyectos) {
            %>
            <div class="col-md-4 d-flex align-items-stretch">
                <div class="card h-100" id="cardProyecto">
                    <img src="imagen?id=<%= p.getId() %>" class="card-img-top" alt="" style="object-fit: cover; height: 200px;">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title"><%= p.getTitulo() %></h5>
                        <p class="card-text flex-grow-1"><%= p.getDescripcion() %></p>
                        <p class="card-text"><strong>Tecnologías:</strong> <%= p.getTecnologias() %></p>
                        <a href="<%= p.getUrl() %>" class="btn btn-primary mt-auto" target="_blank">Ir a Proyecto</a>
                    </div>
                </div>
            </div>
            <%
                    }}
            %>
        </div>
    </section>
<!-- Seccion de habilidades -->
<section id="habilidades" class="py-5 scroll-offset">
    <div class="container">
        <h2 class="text-center mb-4">Habilidades</h2>
        <!-- Primera fila -->
        <div class="row justify-content-center mb-4">
            <div class="col-md-3 col-sm-4 col-6 text-center mb-4 pt-2 imageHover" onclick="window.location.href = 'https://es.wikipedia.org/wiki/HTML5';">
                <img src="logos/html5.svg" alt="HTML5" class="img-fluid" style="max-height: 80px;">
                <p class="mt-2 mb-0 fw-bold">HTML5</p>
            </div>
            <div class="col-md-3 col-sm-4 col-6 text-center mb-4 pt-2 imageHover" onclick="window.location.href = 'https://es.wikipedia.org/wiki/CSS';">
                <img src="logos/css_old.svg" alt="CSS3" class="img-fluid" style="max-height: 80px;">
                <p class="mt-2 mb-0 fw-bold">CSS3</p>
            </div>
            <div class="col-md-3 col-sm-4 col-6 text-center mb-4 pt-2 imageHover" onclick="window.location.href = 'https://www.java.com/es/';">
                <img src="logos/java.svg" alt="Java" class="img-fluid" style="max-height: 80px;">
                <p class="mt-2 mb-0 fw-bold">Java</p>
            </div>
            <div class="col-md-3 col-sm-4 col-6 text-center mb-4 pt-2 imageHover" onclick="window.location.href = 'https://kotlinlang.org/';">
                <img src="logos/kotlin.svg" alt="Kotlin" class="img-fluid" style="max-height: 80px;">
                <p class="mt-2 mb-0 fw-bold">Kotlin</p>
            </div>
        </div>
        <!-- Segunda fila -->
        <div class="row justify-content-center">
            <div class="col-md-3 col-sm-4 col-6 text-center mb-4 pt-2 imageHover" onclick="window.location.href = 'https://developer.mozilla.org/es/docs/Web/JavaScript';">
                <img src="logos/javascript.svg" alt="JavaScript" class="img-fluid" style="max-height: 80px;">
                <p class="mt-2 mb-0 fw-bold">JavaScript</p>
            </div>
            <div class="col-md-3 col-sm-4 col-6 text-center mb-4 pt-2 imageHover" onclick="window.location.href = 'https://www.android.com/';">
                <img src="logos/android-icon.svg" alt="Android" class="img-fluid" style="max-height: 80px;">
                <p class="mt-2 mb-0 fw-bold">Android</p>
            </div>
            <div class="col-md-3 col-sm-4 col-6 text-center mb-4 pt-2 imageHover" onclick="window.location.href = 'https://github.com/';">
                <img src="logos/github_light.svg" alt="GitHub" class="img-fluid" style="max-height: 80px;">
                <p class="mt-2 mb-0 fw-bold">GitHub</p>
            </div>
            <div class="col-md-3 col-sm-4 col-6 text-center mb-4 pt-2 imageHover" onclick="window.location.href = 'https://git-scm.com/';">
                <img src="logos/git.svg" alt="Git" class="img-fluid" style="max-height: 80px;">
                <p class="mt-2 mb-0 fw-bold">Git</p>
            </div>
        </div>
    </div>
</section>

<!-- Seccion contacto -->
<section id="contacto" class="container p-5">
    <h2 class="text-center mb-4">Contáctame</h2>
    
    <%-- Mostrar mensajes de éxito o error --%>
    <%
        String success = request.getParameter("success");
        String error = request.getParameter("error");
        
        if ("mensaje_enviado".equals(success)) {
    %>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>¡Éxito!</strong> Tu mensaje ha sido enviado correctamente. Nos pondremos en contacto contigo pronto.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <%
        } else if ("campos_vacios".equals(error)) {
    %>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Error:</strong> Por favor, completa todos los campos del formulario.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <%
        } else if ("error_base_datos".equals(error)) {
    %>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Error:</strong> Ha ocurrido un problema al enviar tu mensaje. Por favor, inténtalo de nuevo más tarde.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <%
        }
    %>
    
    <form action="ContactoServlet" method="post">
        <div class="mb-3">
            <label for="nombre" class="form-label">Nombre</label>
            <input type="text" class="form-control" id="nombre" name="nombre" required>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="mb-3">
            <label for="descripcion" class="form-label">Descripción</label>
            <textarea class="form-control" id="descripcion" name="descripcion" rows="4" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Enviar</button>
    </form>
</section>
<!-- Footer -->
<footer class="bg-dark text-white text-center py-3">
    © 2025 Leandro Becerra || Ing.Informática
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>