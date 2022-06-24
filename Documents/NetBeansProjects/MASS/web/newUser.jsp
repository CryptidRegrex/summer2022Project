<%-- 
    Document   : newUser
    Created on : Jun 21, 2022, 6:06:40 PM
    Author     : JDTobiason
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="theme.css"/>
        <title>Create a New Account</title>
    </head>
    <body>
        <h1>Create An Account</h1>
        
        <form action="createUser.jsp">
            <label for="username">User Name:</label>
            <input type="text" name="usernameNew" required="true"> 
            <label for="password">Password:</label>
            <input type="password" name="passwordOne" required="true">
            <label for"password">Re-type Password:</label>
            <input type="password" name="passwordTwo" required="true">
            <br>
            <br>
            <input type="submit" value="Create New User" id="cNewButton" name="cUserNew">
        </form>
    </body>
</html>
