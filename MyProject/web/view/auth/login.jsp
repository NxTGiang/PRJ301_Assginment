<%-- 
    Document   : login
    Created on : Oct 27, 2022, 10:23:25 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="login" method="POST">
            Username: <input type="text" name="username" value="${user}"/> <br/>
            password: <input type="password" name="password" value="${pass}" /> <br/>
            <input type="checkbox"  name="remember" value="1"/> Remember me <br/>
            <input type="submit" value="Login" /> 
        </form>   
    </body>
</html>
