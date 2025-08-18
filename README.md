# 🌐 Portafolio Web Dinámico — Leandro Becerra

Este proyecto es un portafolio web dinámico desarrollado como parte de mi formación en Ingeniería en Informática.

---

## 🚀 Características

- Diseño responsivo con **Bootstrap 5** y **normalize.css**
- Navegación lateral fija tipo sidebar
- Secciones: *Sobre mí*, *Proyectos*, *Habilidades*, *Contacto*
- Carga dinámica de proyectos desde base de datos SQLite
- Imágenes servidas como BLOB mediante servlet
- Formulario de contacto con validación y mensajes de éxito/error
- Modularización con JSP y servlets
- Paleta visual profesional en tonos oscuros y azules

---

## 🧰 Tecnologías utilizadas

| Frontend              | Backend         | Base de Datos | Otros         |
|-----------------------|-----------------|---------------|---------------|
| HTML5                 | Java (JSP)      | SQLite        | Git & GitHub  |
| CSS3 + normalize.css  | Servlets        |               | Bootstrap 5   |
| Bootstrap             |                 |               |               |

---

## Estructura del Proyecto

Protfolio_Java/
├── .idea/                     # Configuración del entorno de desarrollo (IntelliJ)
├── .mvn/                      # Archivos de configuración para Maven
├── src/
│   └── main/
│       ├── java/
│       │   └── org/example/portfolio/
│       │       ├── ContactoServlet.java      # Manejo de formulario de contacto
│       │       ├── ImagenServlet.java        # Carga y visualización de imágenes
│       │       ├── Proyecto.java             # Clase modelo para proyectos
│       │       └── ProyectosServlet.java     # Lógica para listar proyectos
│       └── webapp/
│           ├── WEB-INF/
│           │   ├── database/                 # Base de datos SQLite (si aplica)
│           │   └── web.xml                   # Configuración de despliegue (Servlets)
│           ├── css/
│           │   └── styles.css                # Estilos principales del sitio
│           ├── logos/                        # Íconos SVG para tecnologías
│           └── index.jsp                     # Página principal del portafolio
├── test_current_layout.html                 # Pruebas de diseño y layout
├── test_logo_position.html
├── test_reorganized_sidebar.html
├── test_sidebar_layout.html
├── test_vertical_alignment.html
├── .gitignore                                # Exclusión de archivos en Git
├── README.md                                 # Documentación del proyecto
├── mvnw / mvnw.cmd                           # Scripts para ejecutar Maven
└── pom.xml                                   # Dependencias y configuración Maven




