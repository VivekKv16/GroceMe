package com.GroceMe.Connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ProvideConnection {

    static Connection con;
    public static Connection giveMeConnection() throws ClassNotFoundException, SQLException {
        String url="jdbc:mysql://localhost:3306/grocemedb?user=root&password=vivek";
        Class.forName("com.mysql.cj.jdbc.Driver");
        con= DriverManager.getConnection(url);
        return con;
    }
}
