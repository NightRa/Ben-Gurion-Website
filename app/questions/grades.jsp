<%@ page import="db.DB" %>
<%@ page import="db.RealDB" %>
<%@ page import="model.Answer" %>
<%@ page import="model.Question" %>
<%@ page import="model.UserAnswer" %>
<%--Created by Ilan Godik--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) response.sendRedirect("/questions/welcome.jsp");
    else {
        DB db = new RealDB();
        String[][] userAnswersS = db.select("select * from userAnswers where userID=" + user.id);
        // I really want to use map... userAnswers.map(new UserAnswer(_)). Maybe Java 8 will do justice...
        UserAnswer[] userAnswers = new UserAnswer[userAnswersS.length];
        int countWrong = 0;
        for (int i = 0; i < userAnswersS.length; i++) {
            userAnswers[i] = new UserAnswer(userAnswersS[i]);
            if (!userAnswers[i].isCorrect(db)) countWrong++;
        }
        int countCorrect = userAnswers.length - countWrong;
        // I really want to use filter... or partition. (I'm a Scala fan)
        UserAnswer[] wrongAnswers = new UserAnswer[countWrong];
        int lastIndex = 0;
        for (UserAnswer userAnswer : userAnswers) {
            if (!userAnswer.isCorrect(db)) wrongAnswers[lastIndex++] = userAnswer;
        }
%>
<html>
    <head>
        <title>שאלון | ציונים</title>
        <link rel="stylesheet" href="../css/grades.css"/>
        <link rel="stylesheet" href="../css/buttons.css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body dir="rtl">
        <%@include file="../menu.jsp" %>
        <div class="container">
            <h1>שאלון | ציונים</h1>

            <div class="grades">
                <div class="status">
                    <p>ענית נכון על
                        <span class="correct"><%=countCorrect%></span>/<span
                                class="total"><%=userAnswers.length%></span> שאלות
                    </p>

                    <p>ולפיכך ציונך הוא: <span
                            class="correct"><%= countCorrect * 100 / userAnswers.length %></span></p>
                </div>
                <div class="details">
                    <div class="header">תשובות שגויות:</div>

                    <%
                        for (UserAnswer answer : wrongAnswers) {
                            Question question = new Question(db, answer.questionID);
                    %>
                    <div class="wrong">
                        <div class="question"><%=question.number%>. <%=question.text%>
                        </div>

                        <span class="header">סימנת:</span>

                        <div class="answer"><%=answer.answer%>
                            . <%=new Answer(db, answer.answer, answer.questionID).text%>
                        </div>

                        <span class="header">תשובה נכונה:</span>

                        <div class="correctAnswer"><%=question.answer%>
                            . <%=new Answer(db, question.answer, question.id).text%>
                        </div>
                    </div>
                    <%}%>
                </div>

                <div class="center">
                    <a href="/questions/reset" class="btn btn-danger">אפס את תשובותי</a>
                </div>
            </div>
        </div>
    </body>
</html>
<%}%>
