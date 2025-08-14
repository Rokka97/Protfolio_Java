package org.example.portfolio;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/imagen")
public class ImagenServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(ImagenServlet.class.getName());
    private static final int MAX_IMAGE_SIZE = 5 * 1024 * 1024; // 5MB limit

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idParam = request.getParameter("id");

        // Input validation
        if (idParam == null || idParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de imagen no proporcionado");
            return;
        }

        int id;
        try {
            id = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de imagen inválido");
            return;
        }

        String dbPath = getServletContext().getRealPath("/WEB-INF/database/portfolio.db");

        try {
            Class.forName("org.sqlite.JDBC");

            try (Connection con = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
                 PreparedStatement ps = con.prepareStatement("SELECT imagen FROM proyectos WHERE id = ?")) {

                ps.setInt(1, id);

                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        byte[] imgBytes = rs.getBytes("imagen");

                        // Additional image validation
                        if (imgBytes == null || imgBytes.length == 0) {
                            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Imagen no encontrada");
                            return;
                        }

                        if (imgBytes.length > MAX_IMAGE_SIZE) {
                            response.sendError(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE, "Imagen demasiado grande");
                            return;
                        }

                        response.setContentType("image/png");
                        response.setContentLength(imgBytes.length);
                        response.getOutputStream().write(imgBytes);
                    } else {
                        response.sendError(HttpServletResponse.SC_NOT_FOUND, "Imagen no encontrada");
                    }
                }
            }
        } catch (ClassNotFoundException e) {
            LOGGER.log(Level.SEVERE, "Driver de SQLite no encontrado", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error de configuración de base de datos");
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error de conexión a la base de datos", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error de conexión a la base de datos");
        }
    }
}