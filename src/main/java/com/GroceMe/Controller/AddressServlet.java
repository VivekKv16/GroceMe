package com.GroceMe.Controller;

import com.GroceMe.model.DBLogic;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/address")
public class AddressServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        if (session == null) {
            resp.sendRedirect("login.html");
            return;
        }

        int userId = (int) session.getAttribute("id");
        String newAddress = req.getParameter("address");

        try {
            DBLogic.updateAddress(userId, newAddress);
            session.setAttribute("address", newAddress);
            resp.sendRedirect("dashboard.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            resp.sendRedirect("dashboard.jsp?error=1");
        }
    }
}
