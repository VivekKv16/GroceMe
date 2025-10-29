package com.GroceMe.Controller;

import com.GroceMe.model.DBLogic;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/SignInServlet")
public class SignInServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name=req.getParameter("name");
        long phone= Long.parseLong(req.getParameter("phone"));
        String password=req.getParameter("password");

        if(name!=null){
            try{
                boolean result= DBLogic.createAccount(name,phone,password);
                if(result){
                    RequestDispatcher rd=req.getRequestDispatcher("login.html");
                    rd.forward(req,resp);
                }
                else{
                    resp.sendRedirect("index.html");
                }
            }
            catch(ClassNotFoundException | SQLException e){
                e.printStackTrace();
            }
        }


    }
}
