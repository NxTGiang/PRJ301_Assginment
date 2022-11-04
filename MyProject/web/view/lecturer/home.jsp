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
        <style>
            html{
                margin: 20px 150px;
                font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            }
            .top{
                display: flex;
                justify-content: space-between;
                background-color: #f5f5f5;
                height: 30px;
                padding-top: 5px;
                margin-bottom: 30px;
            }
            .top-right{
                text-align: right;
            }
            .top-right a{
                margin: 2px 5px;
                border-radius: 5px;
                padding: 2px 4px;
                font-weight: bold;
                background-color: rgb(60, 105, 173);
            }
            h1{
                color: #333333;
            }
            .title{
                font-size: 40px;
                margin-bottom: 15px;
            }
        </style>
    </head>
    <body>
        <div class='title'>FPT University Academic Portal</div>
        <div class='top'>
            <div>
                
            </div>
            <div class='top-right'>
                <a class="header">${requestScope.account.username}</a> |
                <a class="header" href="logout">Log out</a>
            </div>
            
        </div>
        <a href="lecturer/timetable">Schedule</a> <br/>
        
        <a href="lecturer/attstatus">Attendance Status</a>
        
        
        
    </body>
</html>
