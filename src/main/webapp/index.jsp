<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                <li class="nav-item"><a class="nav-link" href="#proyectos">Proyectos</a></li>
                <li class="nav-item"><a class="nav-link" href="#habilidades">Habilidades</a></li>
                <li class="nav-item"><a class="nav-link" href="#contacto">Contacto</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Seccion Titulo -->
    <header class="vh-100 w-100 px-5 d-flex flex-column justify-content-center align-items-center bg-dark text-white">
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
        <div class="col-md-4">
            <div class="card">
                <img src="img/Basta_game.jpg" class="card-img-top" alt="img Basta Game">
                <div class="card-body">
                    <h5 class="card-title">Juego Basta</h5>
                    <p class="card-text">App interactiva con UI dinámica y lógica de juego.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <img src="img/radar_eventos.png" class="card-img-top" alt="imagen Radar Eventos">
                <div class="card-body">
                    <h5 class="card-title">Pagina web Radar Eventos</h5>
                    <p class="card-text">Radar Eventos es una Single Page Application (SPA) desarrollada en React para
                        la gestión y visualización de eventos. Incluye autenticación de usuarios, administración de
                        eventos y usuarios, y un panel de perfil personal.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <img src="img/to_do_list.png" class="card-img-top" alt="img To do List">
                <div class="card-body">
                    <h5 class="card-title">To do List</h5>
                    <p class="card-text">Proyecto para la creacion de tareas y gestion mediante notificaciones, desarrollado
                    en HTML, JS, PHP y SQL para la gestion de los usuarios, tareas y notificaciones.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"> API Pagina web Radar Eventos</h5>
                    <p class="card-text">Este proyecto es una API RESTful desarrollada en PHP para la gestión de
                        usuarios y eventos, con autenticación JWT y control de roles (administrador y realizador).</p>
                </div>
            </div>
        </div>
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