package com.GroceMe.Controller;


import com.GroceMe.model.AccountUser;
import com.GroceMe.model.DBLogic;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long phone = Long.parseLong(req.getParameter("phone"));
        String password = req.getParameter("password");

        try {
            AccountUser user = DBLogic.login(phone, password);
            if (user != null) {
                HttpSession session = req.getSession();
                session.setAttribute("id", user.getId());
                session.setAttribute("name", user.getName());
                session.setAttribute("phone", user.getPhone());
                session.setAttribute("password", user.getPassword());
                session.setAttribute("address", user.getAddress());
                resp.sendRedirect("dashboard.jsp");
        } else {
                resp.getWriter().println("<script>alert('Invalid phone or password'); window.location='login.html';</script>");
                RequestDispatcher rd = req.getRequestDispatcher("login.html");
                rd.forward(req, resp);
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }


}
