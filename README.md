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
├── .idea/                    
├── .mvn/                    
├── src/
│   └── main/
│       ├── java/
│       │   └── org/example/portfolio/
│       │       ├── ContactoServlet.java     
│       │       ├── ImagenServlet.java      
│       │       ├── Proyecto.java           
│       │       └── ProyectosServlet.java   
│       └── webapp/
│           ├── WEB-INF/
│           │   ├── database/               
│           │   └── web.xml                  
│           ├── css/
│           │   └── styles.css               
│           ├── logos/                        
│           └── index.jsp                   
├── test_current_layout.html                
├── test_logo_position.html
├── test_reorganized_sidebar.html
├── test_sidebar_layout.html
├── test_vertical_alignment.html
├── .gitignore                                
├── README.md                                
├── mvnw / mvnw.cmd                          
└── pom.xml                                




