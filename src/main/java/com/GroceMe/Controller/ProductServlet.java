package com.GroceMe.Controller;

import com.GroceMe.Connection.ProvideConnection;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String category = req.getParameter("category");
        List<String[]> products = new ArrayList<>();

        try (Connection con = ProvideConnection.giveMeConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM products WHERE category = ?");
            ps.setString(1, category);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String[] p = new String[5];
                p[0] = rs.getString("name");
                p[1] = rs.getString("price");
                p[2] = rs.getString("description");
                p[3] = rs.getString("image");
                p[4] = rs.getString("category");
                products.add(p);
            }

            req.setAttribute("category", category);
            req.setAttribute("products", products);

            RequestDispatcher rd = req.getRequestDispatcher("products.jsp");
            rd.forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
