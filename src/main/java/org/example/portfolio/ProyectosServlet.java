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


@WebServlet("/proyectos")
public class ProyectosServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dbPath = getServletContext().getRealPath("/WEB-INF/database/portfolio.db");
        List<Proyecto> lista = new ArrayList<>();

        try (Connection con = DriverManager.getConnection("jdbc:sqlite:" + dbPath)) {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM proyectos");
            while (rs.next()) {
                Proyecto p = new Proyecto();
                p.setId(rs.getInt("id"));
                p.setTitulo(rs.getString("titulo"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setTecnologias(rs.getString("tecnologias"));
                p.setUrl(rs.getString("url"));
                lista.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("proyectos", lista);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}

