<%--Created by Ilan Godik--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="static util.Marking.*" %>
<%@page import="static util.Input.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    User user = (User) session.getAttribute("user");
    if (user != null) response.sendRedirect("/");
    else {
%>
<!DOCTYPE html>
<html>
    <head>
        <title>הרשמה</title>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="../css/register.css"/>
        <link rel="stylesheet" href="../css/buttons.css"/>
    </head>
    <body dir="rtl">
        <%@include file="../menu.jsp" %>

        <div class="container">
            <h1>הרשמה</h1>

            <form class="fields" action="/register" method="post">
                <%if (marked(request, "success")) {%>

                <div class="status success">נתונים עודכנו בהצלחה!</div>

                <%} else if (marked(request, "failed")) {%>
                <div class="status failure">
                    <%=mText(request, "fail-empty", "אין להשאיר שדות ריקים")%>
                    <%=mText(request, "fail-username-space", "רווח בשם משתמש")%>
                    <%=mText(request, "fail-username-taken", "שם מתשמש תפוס")%>
                    <%=mText(request, "fail-email-space", "רווח באימייל")%>
                    <%=mText(request, "fail-email-taken", "אימייל תפוס")%>
                    <%=mText(request, "fail-password-space", "רווח בסיסמא")%>
                    <%=mText(request, "fail-passwordCheck", "סיסמאות לא מתאימות")%>
                    <%=mText(request, "fail-firstName-space", "רווח בשם פרטי")%>
                    <%=mText(request, "fail-lastName-space", "רווח בשם משפחה")%>
                    <%=mText(request, "fail-birthYear-number", "אנא וודא כי ישנו מספר בשנת הלידה")%>
                </div>
                <%}%>

                <%=textInput(request, "username", "שם משתמש")%>
                <%=textInput(request, "email", "אימייל")%>
                <%=mField(request, "password", "סיסמא", "password")%>
                <%=mField(request, "passwordCheck", "וידוי סיסמא", "password")%>
                <%=textInput(request, "firstName", "שם פרטי")%>
                <%=textInput(request, "lastName", "שם משפחה")%>
                <%=textInput(request, "birthYear", "שנת לידה")%>

                <div class="center">
                    <button type="submit" class="btn btn-success">הרשמה</button>
                </div>
            </form>
        </div>
    </body>
</html>
<%}%>
