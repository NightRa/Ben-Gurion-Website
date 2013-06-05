<%--Created by Ilan Godik--%>
<%@include file="/stats/statsHeader.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="static util.Marking.*" %>
<%@page import="static util.Input.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    User user = (User) session.getAttribute("user");
    if (user == null) response.sendRedirect("/");
    else {
%>
<!DOCTYPE html>
<html>
    <head>
        <title>פרופיל</title>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="../css/profile.css"/>
        <link rel="stylesheet" href="../css/buttons.css"/>
    </head>
    <body dir="rtl">
        <%@include file="../menu.jsp" %>
        <div class="container">
            <h1>פרופיל</h1>

            <div class="profile-menu">
                <a class="active" href="/user/profile.jsp">פרטים אישיים</a>
                <a href="/user/password.jsp">שינוי סיסמא</a>
                <a href="/user/delete.jsp">מחיקת משתמש</a>
            </div>

            <form class="fields" id="fields" method="post" action="/profile" onsubmit="return validate()">
                <%if (marked(request, "success")) {%>
                <div class="status success">
                    נתונים עודכנו בהצלחה!
                </div>
                <%}%>

                <div class="status failure" id="fail"
                     style="display: <%=marked(request,"failed")?"block":"none"%>">
                    <%=mText(request, "fail-empty", "אין להשאיר שדות ריקים")%>
                    <%=mText(request, "fail-username-space", "רווח בשם משתמש")%>
                    <%=mText(request, "fail-username-taken", "שם מתשמש תפוס")%>
                    <%=mText(request, "fail-email-space", "רווח באימייל")%>
                    <%=mText(request, "fail-email-taken", "אימייל תפוס")%>
                    <%=mText(request, "fail-firstName-space", "רווח בשם פרטי")%>
                    <%=mText(request, "fail-lastName-space", "רווח בשם משפחה")%>
                    <%=mText(request, "fail-birthYear-number", "אנא וודא כי ישנו מספר בשנת הלידה")%>
                </div>

                <%=textInput(request, "username", "שם משתמש", user.username)%>
                <%=textInput(request, "email", "אימייל", user.email)%>
                <%=textInput(request, "firstName", "שם פרטי", user.firstName)%>
                <%=textInput(request, "lastName", "שם משפחה", user.lastName)%>
                <%=textInput(request, "birthYear", "שנת לידה", String.valueOf(user.birthYear))%>

                <div class="center">
                    <button type="submit" class="btn btn-success">שמירה</button>
                </div>
            </form>
        </div>

        <script src="../js/validation/Validation.js"></script>
        <script type="text/javascript">
            function checks() {
                return  check("username", "רווח בשם משתמש", checkSpace) &
                        check("username", "שם משתמש ריק", checkEmpty) &
                        check("email", "רווח באימייל", checkSpace) &
                        check("email", "אימייל ריק", checkEmpty) &
                        check("email", "אימייל לא תקין", checkEmail) &
                        check("firstName", "רווח בשם פרטי", checkSpace) &
                        check("firstName", "שם פרטי ריק", checkEmpty) &
                        check("lastName", "רווח בשם משפחה", checkSpace) &
                        check("lastName", "שם משפחה ריק", checkEmpty) &
                        check("birthYear", "אנא וודא כי ישנו מספר בשנת הלידה", checkNumber)
            }
        </script>
    </body>
</html>
<%}%>
<%@include file="/stats/statsFooter.jsp" %>
