<%--suppress HtmlFormInputWithoutLabel --%>
<%--Created by Ilan Godik--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="static util.Marking.*" %>
<%@page import="static util.Input.*" %>
<%@ page import="db.DB" %>
<%@ page import="db.RealDB" %>
<%@ page import="model.Answer" %>
<%@ page import="model.Question" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    User adminUser = (User) session.getAttribute("user");
    if (adminUser == null || !adminUser.isAdmin) response.sendRedirect("/");
    else {
        int id = Integer.parseInt(request.getParameter("id"));
        DB db = new RealDB();
        String[] questionParams = db.select("SELECT * FROM questions WHERE id=" + id)[0];
        Question question = new Question(questionParams);
        Answer a1 = new Answer(db.select("select * from answers where questionId=" + id + " and number=1")[0]);
        Answer a2 = new Answer(db.select("select * from answers where questionId=" + id + " and number=2")[0]);
        Answer a3 = new Answer(db.select("select * from answers where questionId=" + id + " and number=3")[0]);
        Answer a4 = new Answer(db.select("select * from answers where questionId=" + id + " and number=4")[0]);
%>
<html>
    <head>
        <title>לוח בקרה | עריכת שאלה</title>
        <link rel="stylesheet" href="../css/profile.css"/>
        <link rel="stylesheet" href="../css/buttons.css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body dir="rtl">
        <%@include file="../menu.jsp" %>
        <div class="container">
            <h1>לוח בקרה | עריכת שאלה</h1>

            <div class="profile-menu">
                <a href="/admin/users.jsp">עריכת משתמשים</a>
                <a class="active" href="/admin/questions.jsp">עריכת שאלות</a>
                <a href="/admin/addQuestion.jsp">הוספת שאלה</a>
            </div>

            <form class="fields" id="fields" action="/editQuestion" method="post" onsubmit="return validate()">
                <%if (marked(request, "success")) {%>

                <div class="status success">נתונים עודכנו בהצלחה!</div>

                <%}%>

                <div class="status failure" id="fail"
                     style="display: <%=marked(request,"failed")?"block":"none"%>">
                    <%=mText(request, "fail-correctAnswer", "על התשובה הנכונה להיות מספר בין 1 ל4")%>
                </div>

                <div class="field">
                    <label for="question">כותרת השאלה:</label>
                    <input type="text" name="question" id="question" value="<%=question.text%>"/>
                </div>
                <div class="field">
                    <label for="answer1">תשובה 1:</label>
                    <input type="text" name="answer1" id="answer1" value="<%=a1.text%>"/>
                </div>
                <div class="field">
                    <label for="answer2">תשובה 2:</label>
                    <input type="text" name="answer2" id="answer2" value="<%=a2.text%>"/>
                </div>
                <div class="field">
                    <label for="answer3">תשובה 3:</label>
                    <input type="text" name="answer3" id="answer3" value="<%=a3.text%>"/>
                </div>
                <div class="field">
                    <label for="answer4">תשובה 4:</label>
                    <input type="text" name="answer4" id="answer4" value="<%=a4.text%>"/>
                </div>
                <div class="field">
                    <label for="correctAnswer">תשובה נכונה:</label>
                    <input type="text" name="correctAnswer" id="correctAnswer" value="<%=question.answer%>"/>
                </div>

                <input style="display: none" name="id" value="<%=id%>"/>

                <div class="center">
                    <button type="submit" class="btn btn-success">הרשמה</button>
                </div>
            </form>
        </div>
    </body>
</html>
<%}%>
