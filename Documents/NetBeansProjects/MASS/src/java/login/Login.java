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
    
    private static Boolean checkLength(String user, String passw) {
        Boolean ret = false;
        if (user.length() <= 20 && passw.length() <= 20) {
            ret = true;
        }
        return ret;
    }
    
    public static Boolean checkUser(String user, String passw) {
        
        Boolean re = false;
        Boolean testCheck = false;
        if (user == null || passw == null) {
            testCheck = false;
        }
        else if (checkLength(user, passw)) {
            testCheck = true;
        }
        else {
            testCheck = false;
        }
        
        //Create a connection to the database
        if (testCheck) {
            try {
                String url = "jdbc:mysql://localhost:3306/mass?allowPublicKeyRetrieval=true&useSSL=false";
                Connection con = DriverManager.getConnection(url,"root","1234");
                Statement createCon = con.createStatement();
                ResultSet rs;
                rs = createCon.executeQuery("SELECT user_name, pass FROM user_database");
                //Check to see if the user exists and they have the right password to return true
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
                con.close();
            }
            catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else {
            re = false;
        }

        return re;
    }
    
    public static Boolean createNewUser(String newUser, String passw, String passw2) {
        Boolean re = false;
        Boolean testCheck = false;
        if (newUser == null || passw == null || passw2 == null) {
            testCheck = false;
        }
        else if (checkLength(newUser, passw)) {
            testCheck = true;
        }
        else {
            testCheck = false;
        }
        
        //Create a connection to our database
        if (testCheck) {
            try {
                String url = "jdbc:mysql://localhost:3306/mass?allowPublicKeyRetrieval=true&useSSL=false";
                Connection con = DriverManager.getConnection(url,"root","1234");
                Statement createCon = con.createStatement();
                ResultSet rs;
                rs = createCon.executeQuery("SELECT user_name, pass FROM user_database");


                //Check for unique user name and matching password
                while(rs.next()) {
                    if (newUser.compareTo(rs.getString("user_name")) == 0 && passw.compareTo(rs.getString("pass")) == 0)
                    {
                        re = false;
                        break;
                    }
                    else if(passw.compareTo(passw2) != 0) {
                        re = false;
                        break;
                    }
                    else {
                        re = true;
                    }
                }
                //If no conflicts then we are going to add the user to the database
                if (re) {
                    String sql = "INSERT INTO user_database (user_name, pass)" + " VALUES (?, ?)";
                    PreparedStatement sqlInsert = con.prepareStatement(sql);
                    sqlInsert.setString(1, newUser);
                    sqlInsert.setString(2, passw);
                    sqlInsert.execute();
                }
                con.close();

            }
            catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return re;
    }
    
    public static void setUser(String user) {
        u = user;
    }
    
    public String getUser() {
        return u;
    }
    
}
