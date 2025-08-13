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

@WebServlet("/imagen")
public class ImagenServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String dbPath = getServletContext().getRealPath("/WEB-INF/db/portfolio.db");
        try (Connection con = DriverManager.getConnection("jdbc:sqlite:" + dbPath)) {
            PreparedStatement ps = con.prepareStatement("SELECT imagen FROM proyectos WHERE id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                byte[] imgBytes = rs.getBytes("imagen");
                response.setContentType("image/png");
                response.getOutputStream().write(imgBytes);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
