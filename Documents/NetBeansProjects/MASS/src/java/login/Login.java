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
    
    private static String u;
    private static String p;
    
    
    public Login(String username, String password) {
        //user = username;
        //pass = password;
    }
    
    public static Boolean checkUser(String user, String passw) {
        
        Boolean re = false;
        
        /*if (user.compareTo("try") == 0) {
            re = true;
        }*/
        try {
            String url = "jdbc:mysql://localhost:3306/mass?allowPublicKeyRetrieval=true&useSSL=false";
            Connection con = DriverManager.getConnection(url,"root","1234");
            Statement createCon = con.createStatement();
            ResultSet rs;
            rs = createCon.executeQuery("SELECT user_name, pass FROM user_database");
            
            while(rs.next()) {
                if (user.compareTo(rs.getString("user_name")) == 0 && passw.compareTo(rs.getString("pass")) == 0)
                {
                    re = true;
                    break;
                }
                else {
                    re = false;
                }
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        return re;
    }
    
    public static int createNewUser(String user, String passw) {
              Boolean re = false;
              int test = 1;
        
        /*if (user.compareTo("try") == 0) {
            re = true;
        }*/
        try {
            String url = "jdbc:mysql://localhost:3306/mass?allowPublicKeyRetrieval=true&useSSL=false";
            Connection con = DriverManager.getConnection(url,"root","1234");
            Statement createCon = con.createStatement();
            ResultSet rs;
            rs = createCon.executeQuery("SELECT user_name, pass FROM user_database");
            
            while(rs.next()) {
                if (user.compareTo(rs.getString("user_name")) == 0 && passw.compareTo(rs.getString("pass")) == 0)
                {
                    re = true;
                    break;
                }
                else {
                    re = false;
                }
            }
            
            if (re) {
                test = createCon.executeUpdate("INSERT INTO user_database (user_name, pass) VALUES (user, pass)");
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        return test;
    }
    
    public static void setUser(String user) {
        u = user;
    }
    
    public String getUser() {
        return u;
    }
    
}
