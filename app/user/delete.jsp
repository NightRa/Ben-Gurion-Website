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
        <title>מחיקת משתמש</title>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="../css/profile.css"/>
        <link rel="stylesheet" href="../css/buttons.css"/>
    </head>
    <body dir="rtl">
        <%@include file="../menu.jsp" %>

        <div class="container">
            <h1>מחיקת משתמש</h1>

            <div class="profile-menu">
                <a href="/user/profile.jsp">פרטים אישיים</a>
                <a href="/user/password.jsp">שינוי סיסמא</a>
                <a class="active" href="/user/delete.jsp">מחיקת משתמש</a>
            </div>

            <form class="fields" id="fields" action="/delete" method="post" onsubmit="return validate()">
                <%if (marked(request, "success")) {%>
                <div class="status success">
                    סיסמא שונתה בהצלחה!
                </div>
                <%}%>

                <div class="status failure" id="fail"
                     style="display: <%=marked(request,"failed")?"block":"none"%>">
                    <%=mText(request, "fail-empty", "אין להשאיר שדות ריקים")%>
                    <%=mText(request, "fail-password-incorrect", "סיסמא שגויה")%>
                </div>


                <%=mField(request, "password", "סיסמא נוכחית", "password")%>

                <div class="center">
                    <button type="submit" class="btn btn-success">מחק משתמש</button>
                </div>
            </form>
        </div>

        <script src="../js/validation/Validation.js"></script>
        <script type="text/javascript">
            function checks() {
                return  check("password", "סיסמא ריקה", checkEmpty) &
                        check("password", "רווח בסיסמא", checkSpace)
            }
        </script>
    </body>
</html>
<%}%>
<%@include file="/stats/statsFooter.jsp" %>
