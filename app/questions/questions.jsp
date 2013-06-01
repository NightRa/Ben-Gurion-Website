<%--Created by Ilan Godik--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="static util.Marking.*" %>
<%@page import="static util.Input.*" %>
<%@ page import="db.DB" %>
<%@ page import="db.RealDB" %>
<%@ page import="model.Answer" %>
<%@ page import="model.Question" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) response.sendRedirect("/questions/welcome.jsp");
    else {
        DB db = new RealDB();
        int qNumber = Integer.parseInt(db.select("select lastQuestion from users where id=" + user.id)[0][0]);
        int numberOfQuestions = Integer.parseInt(db.select("SELECT count(*) FROM questions")[0][0]);
        if (qNumber > numberOfQuestions) response.sendRedirect("/questions/grade.jsp");
        else {
            Question question = Question.getByNumber(db, qNumber);
%>
<html>
    <head>
        <title>שאלון</title>
        <link rel="stylesheet" href="../css/questions.css"/>
        <link rel="stylesheet" href="../css/buttons.css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body dir=rtl>
        <%@include file="../menu.jsp" %>
        <div class="container">
            <h1>שאלון | שאלה <%=question.number%>
            </h1>

            <div class="qContainer">
                <div class="status failure" id="fail"
                     style="display: <%=marked(request,"failed")?"block":"none"%>">
                    <%=mText(request, "fail-select", "אנא בחר בתשובה כלשהי")%>
                </div>

                <div class="qTable">
                    <div class="header"><%=question.text%>
                    </div>
                    <form id="answers" action="/answer" method="post" onsubmit="return validate()">
                        <%
                            for (int i = 1; i <= 4; i++) {
                        %>
                        <div class="answer-row">
                            <input type="radio" name="answer" value="<%=i%>"/>

                            <div class="answer"><%=new Answer(db, i, question.id).text%>
                            </div>
                        </div>
                        <%}%>

                        <input style="display: none" name="questionID" value="<%=question.id%>"/>

                        <div class="center">
                            <button type="submit" class="btn btn-info">לשאלה הבאה</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>

        <script type="text/javascript">
            function validate() {
                var form = document.getElementById("answers");
                var formChildren = form.children
                for (var i = 0; i < formChildren.length; i++) {
                    var formChild = formChildren[i]
                    var subChildren = formChild.children
                    for (var j = 0; j < subChildren.length; j++) {
                        var child = subChildren[j]
                        if (child.type === 'radio' && child.checked) return true
                    }
                }
                var failBlock = document.getElementById("fail");
                failBlock.style.display = "block";
                failBlock.innerHTML += "אנא בחר בתשובה כלשהי"
                return false
            }
        </script>
    </body>
</html>
<%
        }
    }
%>
