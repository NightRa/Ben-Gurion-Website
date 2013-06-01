<%--Created by Ilan Godik--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="db.RealDB" %>
<%@ page import="model.Question" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    User user = (User) session.getAttribute("user");
    if (user == null || !user.isAdmin) response.sendRedirect("/");
    else {
        final int entriesPerPage = 5;
        final String pageParam = request.getParameter("page");
        final int pageNumber;
        if (pageParam == null) pageNumber = 1;
        else pageNumber = Integer.parseInt(pageParam);

        final int from = (pageNumber - 1) * entriesPerPage;
        RealDB db = new RealDB();
        final int totalNumUsers = Integer.parseInt(db.select("SELECT COUNT(*) FROM questions")[0][0]);
        final String[][] questionParams = db.select("SELECT * FROM questions LIMIT " + from + "," + entriesPerPage);
        // I really want to use map here. T_T
        final Question[] questions = new Question[questionParams.length];
        for (int i = 0; i < questionParams.length; i++) {
            questions[i] = new Question(questionParams[i]);
        }
%>
<html>
    <head>
        <title>לוח בקרה | עריכת שאלות</title>
        <link rel="stylesheet" href="../css/admin/users.css"/>
        <link rel="stylesheet" href="../css/buttons.css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body dir="rtl">
        <%@include file="../menu.jsp" %>
        <div class="container">
            <h1>לוח בקרה | עריכת שאלות</h1>

            <div class="profile-menu">
                <a href="/admin/users.jsp">עריכת משתמשים</a>
                <a class="active" href="/admin/questions.jsp">עריכת שאלות</a>
                <a href="/admin/addQuestion.jsp">הוספת שאלה</a>
            </div>

            <div class="fields">
                <div class="field header">
                    <div class="cell">מספר</div>
                    <div class="cell">כותרת</div>
                    <div class="cell">עריכה</div>
                </div>

                <%
                    for (Question q : questions) {
                %>
                <div class="field">
                    <div class="cell"><%=q.number%>
                    </div>
                    <div class="email"><%=q.text.substring(0, Math.min(25, q.text.length()))%>...
                    </div>
                    <a class="edit" href="/admin/editQuestion.jsp?id=<%=q.id%>"></a>
                </div>
                <%}%>

                <div class="field">
                    <a <%=pageNumber != 1 ? ("href='/admin/questions.jsp?page=" + (pageNumber - 1)) + "'" : ""%>
                            class="cell right"></a>

                    <div class="cell"><%=totalNumUsers%> שאלות</div>
                    <a <%=pageNumber * entriesPerPage <= totalNumUsers ?
                            ("href='/admin/questions.jsp?page=" + (pageNumber + 1)) + "'" : ""%>
                            class="cell left"></a>
                </div>
            </div>
        </div>

    </body>
</html>
<%}%>
