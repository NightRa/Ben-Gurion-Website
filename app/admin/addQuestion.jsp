<%--Created by Ilan Godik--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="static util.Marking.*" %>
<%@page import="static util.Input.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    User user = (User) session.getAttribute("user");
    if (user == null || !user.isAdmin) response.sendRedirect("/");
    else {
%>
<!DOCTYPE html>
<html>
    <head>
        <title>לוח בקרה | הוספת שאלה</title>
        <link rel="stylesheet" href="../css/profile.css"/>
        <link rel="stylesheet" href="../css/buttons.css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body dir="rtl">
        <%@include file="../menu.jsp" %>
        <div class="container">
            <h1>לוח בקרה | הוספת שאלה</h1>

            <div class="profile-menu">
                <a href="/admin/users.jsp">עריכת משתמשים</a>
                <a href="/admin/questions.jsp">עריכת שאלות</a>
                <a class="active" href="/admin/addQuestion.jsp">הוספת שאלה</a>
            </div>

            <form class="fields" action="/addQuestion" method="post">
                <div class="status failure" id="fail"
                     style="display: <%=marked(request,"failed")?"block":"none"%>">
                    <%=mText(request, "fail-correctAnswer", "על התשובה הנכונה להיות מספר בין 1 ל4")%>
                </div>
                <div class="field">
                    <label for="question">כותרת השאלה:</label>
                    <input type="text" name="question" id="question"/>
                </div>
                <div class="field">
                    <label for="answer1">תשובה 1:</label>
                    <input type="text" name="answer1" id="answer1"/>
                </div>
                <div class="field">
                    <label for="answer2">תשובה 2:</label>
                    <input type="text" name="answer2" id="answer2"/>
                </div>
                <div class="field">
                    <label for="answer3">תשובה 3:</label>
                    <input type="text" name="answer3" id="answer3"/>
                </div>
                <div class="field">
                    <label for="answer4">תשובה 4:</label>
                    <input type="text" name="answer4" id="answer4"/>
                </div>
                <div class="field">
                    <label for="correctAnswer">תשובה נכונה:</label>
                    <input type="text" name="correctAnswer" id="correctAnswer"/>
                </div>

                <div class="center">
                    <button type="submit" class="btn btn-success">הוסף</button>
                </div>
            </form>
        </div>
    </body>
</html>
<%}%>
