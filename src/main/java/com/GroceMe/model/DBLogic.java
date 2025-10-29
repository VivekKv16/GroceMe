package com.GroceMe.model;

import com.GroceMe.Connection.ProvideConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBLogic {
    public static Connection con;
    public static PreparedStatement ps;

    public static boolean createAccount(String name,long phone,String password) throws ClassNotFoundException, SQLException {
        con= ProvideConnection.giveMeConnection();
        String sqry="insert into users(name,phone,password) values(?,?,?)";
        ps=con.prepareStatement(sqry);
        ps.setString(1,name);
        ps.setLong(2,phone);
        ps.setString(3,password);
        int update=ps.executeUpdate();
        if(update>0){
            return true;
        }
        else{
            return false;
        }

    }

    public static AccountUser login(long phone, String password) throws SQLException, ClassNotFoundException {
        con = ProvideConnection.giveMeConnection();
        String sqry = "SELECT id, name, phone, password FROM users WHERE phone=? AND password=?";
        ps = con.prepareStatement(sqry);
        ps.setLong(1, phone);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            long phoneNumber = rs.getLong("phone");
            String pass = rs.getString("password");

            AccountUser u = new AccountUser();
            u.setId(id);
            u.setName(name);
            u.setPhone(phoneNumber);
            u.setPassword(pass);

            return u;
        } else {
            return null;
        }
    }

    public static void address(int id, String address) throws SQLException, ClassNotFoundException {
        con = ProvideConnection.giveMeConnection();
        String sqry = "select * from users where id=?";
        ps = con.prepareStatement(sqry);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if(rs.next()){
            String updateaddress = "update users set address=? where id=?";
            ps.setString(1, address);
            ps.setInt(2, id);
        }
        else{
            String insertaddress = "insert into users(id,address) values(?,?)";
            ps = con.prepareStatement(insertaddress);
            ps.setInt(1, id);
            ps.setString(2, address);
        }
    }


    public static void updateAddress(int id, String address) throws SQLException, ClassNotFoundException {
        con = ProvideConnection.giveMeConnection();
        String updateQuery = "UPDATE users SET address=? WHERE id=?";
        ps = con.prepareStatement(updateQuery);
        ps.setString(1, address);
        ps.setInt(2, id);
        ps.executeUpdate();
    }

}
