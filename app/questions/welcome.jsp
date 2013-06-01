<%--Created by Ilan Godik--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>ברוך הבא</title>
        <link rel="stylesheet" href="../css/welcome.css"/>
        <link rel="stylesheet" href="../css/buttons.css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body dir=rtl>
        <%@include file="../menu.jsp" %>
        <div class="container">
            <h1>ברוך הבא</h1>

            <div class="welcome">
                <p>לאחר שעיינת וקראת את דפי המידע אודות ספינת אלטלנה,</p>

                <p>תוכל להבחן בשאלון אמריקאי ולראות עד כמה הפנמת את החומר.</p>

                <p>על מנת להבחן, עליך תחילה להרשם או להתחבר.</p>

                <div class="center">
                    <a href="/user/register.jsp" class="btn btn-success">הרשמה</a>
                </div>

                <div class="center">
                    <a onclick="toggle_visibility('login');" data-target="#" class="btn btn-success">התחברות</a>
                </div>
            </div>
        </div>
    </body>
</html>
