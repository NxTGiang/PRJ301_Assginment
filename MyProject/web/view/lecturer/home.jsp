<%-- 
    Document   : home
    Created on : Oct 27, 2022, 11:41:00 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/home.css"/>
    </head>
    <body>
        <h1>Home</h1>
        <a href="lecturer/timetable">Schedule</a> <br/>
        
        <a href="lecturer/attstatus">Attendance Status</a>
        
        
        <a class="header">${requestScope.account.username}</a>
        <a class="header" href="logout">Log out</a>
    </body>
</html>
