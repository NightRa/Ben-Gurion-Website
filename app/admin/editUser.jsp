<%--suppress HtmlFormInputWithoutLabel --%>
<%--Created by Ilan Godik--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="db.DB" %>
<%@ page import="db.RealDB" %>
<%@page import="static util.Marking.*" %>
<%@page import="static util.Input.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    User adminUser = (User) session.getAttribute("user");
    if (adminUser == null || !adminUser.isAdmin) response.sendRedirect("/");
    else {
        int userID = Integer.parseInt(request.getParameter("id"));
        DB db = new RealDB();
        String[] userParams = db.select("SELECT * FROM users WHERE id=" + userID)[0];
        User user = new User(userParams);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>לוח בקרה | שינוי פרטי משתמש</title>
        <link rel="stylesheet" href="../css/profile.css"/>
        <link rel="stylesheet" href="../css/buttons.css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body dir="rtl">
        <%@include file="../menu.jsp" %>
        <div class="container">
            <h1>לוח בקרה | בחירת משתמש</h1>

            <div class="profile-menu">
                <a class="active" href="/admin/users.jsp">עריכת משתמשים</a>
                <a href="/admin/questions.jsp">עריכת שאלות</a>
                <a href="/admin/addQuestion.jsp">הוספת שאלה</a>
            </div>

            <form class="fields" id="fields" action="/editUser" method="post" onsubmit="return validate()">
                <%if (marked(request, "success")) {%>

                <div class="status success">נתונים עודכנו בהצלחה!</div>

                <%}%>

                <div class="status failure" id="fail"
                     style="display: <%=marked(request,"failed")?"block":"none"%>">
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

                <%=textInput(request, "username", "שם משתמש", user.username)%>
                <%=textInput(request, "email", "אימייל", user.email)%>
                <%=mField(request, "newPassword", "סיסמא", "password")%>
                <%=mField(request, "passwordCheck", "וידוי סיסמא", "password")%>
                <%=textInput(request, "firstName", "שם פרטי", user.firstName)%>
                <%=textInput(request, "lastName", "שם משפחה", user.lastName)%>
                <%=textInput(request, "birthYear", "שנת לידה", String.valueOf(user.birthYear))%>

                <input style="display: none" name="id" value="<%=user.id%>"/>

                <div class="center">
                    <button type="submit" class="btn btn-success">הרשמה</button>
                </div>
            </form>
        </div>

        <script src="../js/validation/Validation.js"></script>
        <script type="text/javascript">
            function checks() {
                return check("username", "רווח בשם משתמש", checkSpace) &
                        check("username", "שם משתמש ריק", checkEmpty) &
                        check("email", "רווח באימייל", checkSpace) &
                        check("email", "אימייל ריק", checkEmpty) &
                        check("email", "אימייל לא תקין", checkEmail) &
                        check("firstName", "רווח בשם פרטי", checkSpace) &
                        check("firstName", "שם פרטי ריק", checkEmpty) &
                        check("lastName", "רווח בשם משפחה", checkSpace) &
                        check("lastName", "שם משפחה ריק", checkEmpty) &
                        check("birthYear", "אנא וודא כי ישנו מספר בשנת הלידה", checkNumber) &
                        check("newPassword", "רווח בסיסמא", checkSpace) &
                        checkEquals("newPassword", "passwordCheck", "סיסמאות לא מתאימות")
            }
        </script>
    </body>
</html>
<%}%>
