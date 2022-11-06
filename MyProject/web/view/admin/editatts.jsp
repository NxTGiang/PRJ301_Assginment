<%-- 
    Document   : editatts
    Created on : Nov 5, 2022, 10:35:32 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="helper" class="util.DateTimeHelper"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table{
                margin-top: 5px;
            }
            td{
                padding: 2px 5px ;
                text-align: center;
            }
            .present{
                color: Green;
            }

            .absent{
                color: red;
            }
            .header td{
                padding: 2px 7px;
            }

            .description{
                padding: 2px 7px;
            }
            tr{
                border: none;
            }
            a{
                text-decoration: none;
                color: rgb(93, 121, 205);
            }
            .title{
                font-size: 40px;
                margin-bottom: 15px;
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
                text-decoration: none;
            }
            .header{
                background-color: rgb(60, 105, 173);
                color: white;
                text-align: center;
            }
            html{
                margin: 20px 150px;
                font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            }
            .top-left{
                text-align: left;
            }
            .top-left a{
                margin: 2px 5px;
                border-radius: 5px;
                padding: 2px 4px;
                font-weight: bold;
                background-color: rgb(60, 105, 173);
            }
            .all{
                width: 100%;
                overflow: auto;
            }
            .left{
                width: 20%;
                float: left;
            }
            .mid{
                margin-top: 24px;
                width: 30%;
                float: left;
            }
            .right{
                margin-top: 24px;
                width: 50%;
                float: right;
            }
        </style>
    </head>
    <body>
        <div class='title'>Edit Attandance</div>
        <div class='top'>
            <div class="top-left">
                <a class="header">Edit Attandance</a>
            </div>
            <div class='top-right'>
                <a class="header">${requestScope.username}</a> |
                <a class="header" href="../logout">Log out</a>
            </div>
        </div>
        <div class="all">
            <div class="left">
                <form action="editatts" method="GET">
                    <span>Lecturer: </span>
                    <select name="lid">
                        <c:forEach items="${requestScope.lecs}" var="lec">
                            <option value="${lec.id}">
                                ${lec.account.username}
                            </option>
                        </c:forEach>
                    </select>
                    <input type="submit" value="View"/>
                    <c:if test="${param.lid ne null}">
                        <table border="1px">
                            <tr class="header">
                                <td>No.</td>
                                <td>Group Name</td>
                            </tr>
                            <c:forEach items="${requestScope.groups}" var="group" varStatus="loop">
                                <tr>
                                    <td>${loop.index+1}</td>
                                    <td><a href="editatts?lid=${param.lid}&gid=${group.id}"> ${group.name}</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>

                </form>
            </div>
            <c:if test="${param.gid ne null}">

                <div class="mid">
                    <table border="1px">
                        <tr class="header">
                            <td>Session_No</td>
                            <td>Date</td>
                            <td>Slot</td>
                        </tr>
                        <c:forEach items="${requestScope.sessions}" var="ses">
                            <tr>
                                <td>${ses.index}</td>
                                <td>${ses.date}</td>
                                <td>${ses.timeslot.id} <a href="editatts?lid=${param.lid}&gid=${param.gid}&sesid=${ses.id}">Edit</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </c:if>
            <c:if test="${param.sesid ne null}">
                <div class="right">
                    <form action="editatts" method="POST">
                        <input type="hidden" name="lid" value="${param.lid}">
                        <input type="hidden" name="gid" value="${param.gid}">
                        <input type="hidden" name="sesid" value="${param.sesid}"/>
                        <table border="1px">
                            <tr class="header">
                                <td>No.</td>
                                <td>StudentID</td>
                                <td>Full Name</td>
                                <c:if test="${helper.compare(requestScope.ses.date,requestScope.today) lt 0}">
                                    <td>Present</td>
                                    <td>Absent</td>
                                </c:if>
                                <c:if test="${helper.compare(requestScope.ses.date,requestScope.today) eq 0}">
                                    <c:if test="${requestScope.ses.attandated}">
                                        <td>Present</td>
                                        <td>Absent</td>
                                    </c:if>
                                    <c:if test="${!requestScope.ses.attandated}">
                                        <td>Status</td>
                                    </c:if>

                                </c:if>
                                <c:if test="${helper.compare(requestScope.ses.date,requestScope.today) gt 0}">
                                    <td>Status</td>
                                </c:if>
                                <td>Description</td>
                            </tr>
                            <c:forEach items="${requestScope.ses.attandances}" var="a" varStatus="loop">
                                <tr>
                                    <td>${loop.index+1}</td>
                                    <td>${a.student.id}
                                        <input type="hidden" name="stdid" value="${a.student.id}"/>
                                    </td>
                                    <td>${a.student.name}</td>
                                    <c:if test="${helper.compare(requestScope.ses.date,requestScope.today) lt 0}">
                                        <td><input type="radio"
                                                   <c:if test="${a.present}">
                                                       checked="checked"
                                                   </c:if>
                                                   name="present${a.student.id}" value="present" /></td>
                                        <td><input type="radio"
                                                   <c:if test="${!a.present}">
                                                       checked="checked"
                                                   </c:if>
                                                   name="present${a.student.id}" value="absent" /></td>
                                        </c:if>
                                        <c:if test="${helper.compare(requestScope.ses.date,requestScope.today) eq 0}">
                                            <c:if test="${!requestScope.ses.attandated}">
                                            <td class="absent">Not yet</td>
                                        </c:if>

                                        <c:if test="${requestScope.ses.attandated}">


                                            <c:if test="${a.present}">
                                                <td class="present"> Present </td>
                                            </c:if>
                                            <c:if test="${!a.present}">
                                                <td class="absent"> Absent </td>
                                            </c:if>

                                        </c:if>

                                    </c:if>
                                    <c:if test="${helper.compare(requestScope.ses.date,requestScope.today) gt 0}">

                                        <td class="absent">Not yet</td>

                                    </c:if>
                                    <c:if test="${helper.compare(requestScope.ses.date,requestScope.today) lt 0}">
                                        <td class="description"><input type="text" name="description${a.student.id}" value="${a.description}" /></td>
                                        </c:if>
                                        <c:if test="${helper.compare(requestScope.ses.date,requestScope.today) ge 0}">

                                        <td class="description">${a.description}</td>
                                    </c:if>
                                </tr>   

                            </c:forEach>

                        </table>
                        <input  <c:if test="${helper.compare(requestScope.ses.date,requestScope.today) ge 0}">
                                hidden
                            </c:if>
                            type="submit" value="Save"/>
                    </form>
                </div>
            </c:if>
        </div>
        <div class="absent">*Editable session in past</div>
    </body>
</html>
