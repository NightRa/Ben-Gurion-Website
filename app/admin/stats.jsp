<%--Created by Ilan Godik--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/stats/statsHeader.jsp" %>
<%@ page import="db.DB" %>
<%@ page import="db.RealDB" %>
<%
    Long totalTimeN = (Long) application.getAttribute("totalTime");
    Integer timeRecordsN = (Integer) application.getAttribute("timeRecords");
    if (totalTimeN == null || timeRecordsN == null || timeRecordsN == 0) {
        out.println("totalTimeN:" + totalTimeN);
        out.println("timeRecordsN:" + timeRecordsN);

    } else {
        long avgNanoTime = totalTimeN / timeRecordsN;
        long avgTimeMS = avgNanoTime / 1000000;
        DB db = new RealDB();
        String userNumber = db.select("SELECT COUNT(*) FROM users")[0][0];
        String questionNumber = db.select("SELECT COUNT(*) FROM questions")[0][0];
%>

<!DOCTYPE html>
<html>
    <head>
        <title>סטטיסטיקה</title>
        <link rel="stylesheet" href="/css/profile.css"/>
        <link rel="stylesheet" href="/css/buttons.css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body dir=rtl>
        <%@include file="/menu.jsp" %>
        <div class="container">
            <h1>לוח בקרה | סטטיסטיקה</h1>

            <div class="profile-menu">
                <a href="/admin/users.jsp">עריכת משתמשים</a>
                <a href="/admin/questions.jsp">עריכת שאלות</a>
                <a href="/admin/addQuestion.jsp">הוספת שאלה</a>
                <a class="active" href="/admin/stats.jsp">סטטיסטיקה</a>
            </div>

            <div class="fields">
                <p>הזמן הממוצע לטעינת דף באתר הוא: <%=avgNanoTime%> ננו שניות</p>

                <p>הזמן הממוצע לטעינת דף באתר הוא: <%=avgTimeMS%> מילי שניות</p>

                <p>מספר המשתמשים הרשומים באתר הוא: <%=userNumber%>
                </p>

                <p>מספר השאלות בשאלון: <%=questionNumber%>
                </p>
            </div>

        </div>
    </body>
</html>

<%}%>
<%@include file="/stats/statsFooter.jsp" %>
