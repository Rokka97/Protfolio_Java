package org.example.portfolio;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


@WebServlet("/proyectos")
public class ProyectosServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(ProyectosServlet.class.getName());
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dbPath = getServletContext().getRealPath("/WEB-INF/database/portfolio.db");
        if (dbPath == null) {
            LOGGER.log(Level.SEVERE, "No se pudo obtener la ruta de la base de datos");
            request.setAttribute("errorMessage", "Error de configuración de base de datos");
            request.setAttribute("proyectos", new ArrayList<>());
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }
        dbPath = dbPath.trim();
        List<Proyecto> lista = new ArrayList<>();

        try {
            Class.forName("org.sqlite.JDBC");

            try (Connection con = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
                 Statement stmt = con.createStatement();
                 ResultSet rs = stmt.executeQuery("SELECT * FROM proyectos")) {

                while (rs.next()) {
                    Proyecto p = new Proyecto();
                    p.setId(rs.getInt("id"));
                    p.setTitulo(rs.getString("titulo"));
                    p.setDescripcion(rs.getString("descripcion"));
                    p.setTecnologias(rs.getString("tecnologias"));
                    p.setUrl(rs.getString("url"));
                    lista.add(p);
                }
            }
        } catch (ClassNotFoundException e) {
            LOGGER.log(Level.SEVERE, "Driver de SQLite no encontrado", e);
            request.setAttribute("errorMessage", "Error de configuración de base de datos");
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error de conexión a la base de datos", e);
            request.setAttribute("errorMessage", "Unable to retrieve projects");
        }

        request.setAttribute("proyectos", lista);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}

