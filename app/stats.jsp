<%--Created by Ilan Godik--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //Scary NPE Risk And divided by zero
    long avgNanoTime = (Long) application.getAttribute("totalTime") / (Integer) application.getAttribute("timeRecords");
%>
<html>
    <head>
        <title>סטטיסטיקה</title>
    </head>
    <body>
        Avg load time:
        <%=avgNanoTime%>
        nano seconds.
        <br>
        Which is about <%=avgNanoTime / 1000000%> ms.
        <br>
        Total time: <%=application.getAttribute("totalTime")%>
        <br>
        Time records: <%=application.getAttribute("timeRecords")%>
    </body>
</html>
