<%-- 
    Document   : timetable
    Created on : Oct 27, 2022, 12:03:33 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="helper" class="util.DateTimeHelper"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/timetable.css"/>
    </head>
    <body>
        Lecturer: <input type="text" readonly="readonly" value="${requestScope.lecturer.name}"/>
        
        <table>
            <tr class="time">
                <td>
                    <form action="timetable" method="GET">
                        From: <input type="date" name="from" value="${requestScope.from}"/> <br/>
                        To:   <input type="date" name="to" value="${requestScope.to}"/> <br/>
                        <input type="submit" value="View"/> 
                    </form>
                </td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td class="days">${d}<br/>${helper.getDayNameofWeek(d)}</td>
                    </c:forEach>
            </tr>
            <c:forEach items="${requestScope.slots}" var="slot">
                <tr>
                    <td>Slot ${slot.id}</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            <c:forEach items="${requestScope.sessions}" var="ses">
                                <c:if test="${helper.compare(ses.date,d) eq 0 and (ses.timeslot.id eq slot.id)}">
                                    <a class="subject" href="takeatt?id=${ses.id}">${ses.group.name}<br/>-${ses.group.subject.name}</a>
                                    <br/>
                                    <span>at </span>${ses.room.name}
                                    <br/>
                                    <c:if test="${ses.attandated}">
                                        <span class="parentheses">(<span class="attended">Attended</span>)</span>
                                    </c:if>
                                    <c:if test="${!ses.attandated}">
                                        <span class="parentheses">(<span class="not_yet">Not yet</span>)</span>
                                    </c:if>
                                    <br/>
                                    <span class="time-slot">(${slot.description})</span>
                                </c:if>
                                  
                            </c:forEach>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>

