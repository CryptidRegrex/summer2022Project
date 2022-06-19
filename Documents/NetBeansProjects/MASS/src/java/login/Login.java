/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package login;
import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author JDTobiason
 */
public class Login {
    
    //private String user;
    //private String pass;
    
    
    public Login(String username, String password) {
        //user = username;
        //pass = password;
    }
    
    public static String checkUser(String user, String pass) {
        
        String test = "Outside try";
        try {
            String url = "jdbc:mysql://localhost:3306/mass?allowPublicKeyRetrieval=true&useSSL=false";
            Connection con = DriverManager.getConnection(url,"root","1234");
            Statement createCon = con.createStatement();
            ResultSet rs;
            rs = createCon.executeQuery("SELECT * FROM user_database");
            
            while(rs.next()) {
                test = "Inside while";
                if (user.compareTo(rs.getString("user_name")) == 0 && pass.compareTo(rs.getString("pass")) == 0)
                {
                    test = "Inside if";
                }

            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        return "Yes";
    }
    
}
