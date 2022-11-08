<%-- 
    Document   : chooserole
    Created on : Nov 7, 2022, 11:56:08 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            #container {
                width: 50%;
                margin: auto;
                text-align: center;
            }
            #first {
                width:48%;
                float: left;
                background-color: #f5f5f5;
            }
            #second {
                width: 48%;
                float: left;
                background-color: #f5f5f5;
            }
            #clear {
                clear: both;
            }
            #space{
                width: 4%;
                float: left;
                height: 200px;
            }
            table{
                border: 1px solid black;
                margin: 0 auto;
                table-layout:fixed;
                width:100%;
                text-align:center;
            }
            td{
                color: red;
                padding-left: 100px;
                text-align: left;
            }
            .login{
                margin-top: 150px;
                margin-bottom: 10px;
                font-size: 40px;
                text-align: center;
            }
            table:hover{
                border: 1px solid rgb(60, 105, 173);
            }
            a{
                text-decoration: none;
                color: rgb(93, 121, 205);
                font-size: 20px;
            }
        </style>
    </head>
    <body>
        <div class='login'>Login as</div>
            <div id = "container" >
                <div id="first">
                    <table>
                        <tr>
                            <th><a href="lecturer/home">Lecturer</a></th>
                        </tr>
                        <tr>
                            <td>*View timetable</td>
                        </tr>
                        <tr>
                            <td>*Take attandance</td>
                        </tr>
                        <tr>
                            <td>*Edit attandance (in day)</td>
                        </tr>
                        <tr>
                            <td>*View attandance status</td>
                        </tr>
                    </table>
                </div>
                <div id = "space" >
                </div>
                <div id = "second" >
                    <table>
                        <tr>
                            <th><a href="admin/editatts">Administrator</a></th>
                        </tr>
                        <tr>
                            <td>*View all session</td>
                        </tr>
                        <tr>
                            <td>*Edit attandance (in past)</td>
                        </tr>
                    </table>
                </div>
                <div id = "clear" ></div>
            </div>  
</body>
</html>
