<%--Created by Ilan Godik--%>
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
        <title>שינוי סיסמא | אילן גודיק</title>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="../css/profile.css"/>
        <link rel="stylesheet" href="../css/buttons.css"/>
    </head>
    <body dir="rtl">
        <%@include file="../menu.jsp" %>

        <div class="container">
            <h1>שינוי סיסמא</h1>

            <div class="profile-menu">
                <a href="/user/profile.jsp">פרטים אישיים</a>
                <a class="active" href="/user/password.jsp">שינוי סיסמא</a>
                <a href="/user/delete.jsp">מחיקת משתמש</a>
            </div>

            <form class="fields" id="fields" action="/password" method="post" onsubmit="return validate()">
                <%if (marked(request, "success")) {%>
                <div class="status success">
                    סיסמא שונתה בהצלחה!
                </div>
                <%}%>

                <div class="status failure" id="fail"
                     style="display: <%=marked(request,"failed")?"block":"none"%>">
                    <%=mText(request, "fail-empty", "אין להשאיר שדות ריקים")%>
                    <%=mText(request, "fail-password-incorrect", "סיסמא שגויה")%>
                    <%=mText(request, "fail-password-space", "רווח בסיסמא")%>
                    <%=mText(request, "fail-passwordCheck", "סיסמאות לא מתאימות")%>
                </div>


                <%=mField(request, "oldPassword", "סיסמא נוכחית", "password")%>
                <%=mField(request, "newPassword", "סיסמא חדשה", "password")%>
                <%=mField(request, "passwordCheck", "וידוי סיסמא", "password")%>

                <div class="center">
                    <button type="submit" class="btn btn-success">שמירה</button>
                </div>
            </form>


            <script src="../js/validation/Validation.js"></script>
            <script type="text/javascript">
                function checks() {
                    return  check("oldPassword", "סיסמא ישנה ריקה", checkEmpty) &
                            check("oldPassword", "רווח בסיסמא ישנה", checkSpace) &
                            check("newPassword", "סיסמא חדשה ריקה", checkEmpty) &
                            check("newPassword", "רווח בסיסמא חדשה", checkSpace) &
                            checkEquals("newPassword", "passwordCheck", "סיסמאות לא מסתאימות")
                }
            </script>
        </div>
    </body>
</html>
<%}%>
