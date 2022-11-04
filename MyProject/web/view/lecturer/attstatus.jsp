<%-- 
    Document   : attstatus
    Created on : Oct 28, 2022, 8:43:47 AM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/attstatus.css"/>
    </head>
    <body>
        <div class='title'>Attandance Status</div>
        <div class='top'>
            <div>
                
            </div>
            <div class='top-right'>
                <a class="header">${requestScope.username}</a> |
                <a class="header" href="../logout">Log out</a>
            </div>
            
        </div>
        <form action="attstatus"  method="GET">
            
            <select name="gid">
                <c:forEach items="${requestScope.groups}" var="group">
                    <option
                        <c:if test="${requestScope.group.id eq group.id}">
                            selected="selected"
                        </c:if>
                        value="${group.id}">${group.name}</option>
                </c:forEach>

            </select>
            <input type="submit" value="View"/>
        </form>
        <c:if   test="${param.gid ne null}">
            <%! int numSession;%>
            <table>
                <% int numSession=0;%>
                <tr class="header">
                    <td>No</td>
                    <td>ID</td>
                    <td>Full Name</td>
                    <c:forEach items="${requestScope.sessions}" var="ses">
                        <td>Slot ${ses.index}</td>
                        <% numSession++;%>
                    </c:forEach>
                    <td>Absent(%)</td>
                </tr>
                <%! double timeAbsent;%>
                <c:forEach items="${requestScope.students}" var="student" varStatus="loop">
                    <% timeAbsent=0;%>
                    <tr>
                        <td>${loop.index+1}</td>
                        <td>${student.id}</td>
                        <td>${student.name}</td>
                        
                        <c:forEach items="${requestScope.atts}" var="a">
                            
                            <c:if test="${student.id eq a.student.id}">
                                <c:if test="${!a.session.attandated}">
                                    <td>-</td>
                                </c:if>
                                <c:if test="${a.session.attandated}">
                                    <c:if test="${a.present}">
                                        <td class="attended">&#10004</td>
                                    </c:if>
                                    <c:if test="${!a.present}">
                                        <% timeAbsent++;%>
                                        <td class="absent">&#10008</td>
                                    </c:if>
                                </c:if>   
                            </c:if>
                        </c:forEach>
                                        <td <c:if test="<%= timeAbsent*100/numSession >= 20%>">
                                    class="absent"
                            </c:if>><%= timeAbsent*100/numSession %></td>   
                                        
                    </tr>
                </c:forEach>

            </table>
        </c:if>

    </body>
</html>
