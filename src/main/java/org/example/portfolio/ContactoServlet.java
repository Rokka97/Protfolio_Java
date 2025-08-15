package org.example.portfolio;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "ContactoServlet", value = "/ContactoServlet")
public class ContactoServlet extends HttpServlet {
    
    private String getDatabasePath() {
        String contextPath = getServletContext().getRealPath("/WEB-INF/database/contacto.db");
        return "jdbc:sqlite:" + contextPath;
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Establecer codificación para caracteres especiales
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        
        // Obtener parámetros del formulario
        String nombre = req.getParameter("nombre");
        String email = req.getParameter("email");
        String descripcion = req.getParameter("descripcion");
        
        // Validar que los parámetros no sean nulos o vacíos
        if (nombre == null || nombre.trim().isEmpty() || 
            email == null || email.trim().isEmpty() || 
            descripcion == null || descripcion.trim().isEmpty()) {
            resp.sendRedirect("index.jsp?error=campos_vacios");
            return;
        }
        
        // Insertar datos en la base de datos
        try {
            insertarContacto(nombre.trim(), email.trim(), descripcion.trim());
            // Redirigir con mensaje de éxito
            resp.sendRedirect("index.jsp?success=mensaje_enviado");
        } catch (SQLException e) {
            e.printStackTrace();
            // Redirigir con mensaje de error
            resp.sendRedirect("index.jsp?error=error_base_datos");
        }
    }
    
    private void insertarContacto(String nombre, String email, String descripcion) throws SQLException {
        String sql = "INSERT INTO contacto (nombre, email, descripcion) VALUES (?, ?, ?)";
        
        try (Connection conn = DriverManager.getConnection(getDatabasePath());
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, nombre);
            pstmt.setString(2, email);
            pstmt.setString(3, descripcion);
            
            pstmt.executeUpdate();
        }
    }
}
