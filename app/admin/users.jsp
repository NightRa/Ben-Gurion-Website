<%--Created by Ilan Godik--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="db.RealDB" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    User user = (User) session.getAttribute("user");
    if (user == null || !user.isAdmin) response.sendRedirect("/");
    else {
        final int entriesPerPage = 3;
        final String pageParam = request.getParameter("page");
        final int pageNumber;
        if (pageParam == null) pageNumber = 1;
        else pageNumber = Integer.parseInt(pageParam);


        final int from = (pageNumber - 1) * entriesPerPage;
        RealDB db = new RealDB();
        final int totalNumUsers = Integer.parseInt(db.select("SELECT COUNT(*) FROM users")[0][0]);
        final String[][] userParams = db.select("SELECT * FROM users LIMIT " + from + "," + entriesPerPage);
        // I really want to use map here. T_T
        final User[] users = new User[userParams.length];
        for (int i = 0; i < userParams.length; i++) {
            users[i] = new User(userParams[i]);
        }
%>
<html>
    <head>
        <title>לוח בקרה | בחירת משתמש</title>
        <link rel="stylesheet" href="../css/admin/users.css"/>
        <link rel="stylesheet" href="../css/buttons.css"/>
    </head>
    <body dir="rtl">
        <%@include file="../menu.jsp" %>
        <div class="container">
            <h1>לוח בקרה | בחירת משתמש</h1>

            <div class="profile-menu">
                <a class="active" href="/admin/users.jsp">עריכת משתמשים</a>
                <a href="/user/password.jsp">שינוי סיסמא</a>
                <a href="/user/delete.jsp">מחיקת משתמש</a>
                <a href="/user/grades.jsp">ציוני שאלון</a>
            </div>

            <div class="fields">
                <div class="field header">
                    <div class="username">שם משתמש</div>
                    <div class="email">אימייל</div>
                    <div class="cell">עריכה</div>
                </div>

                <%
                    for (User u : users) {
                %>
                <div class="field">
                    <div class="username"><%=u.username%>
                    </div>
                    <div class="email"><%=u.email%>
                    </div>
                    <a class="edit" href="/admin/editUser.jsp?id=<%=u.id%>"></a>
                </div>
                <%}%>

                <div class="field">
                    <a <%=pageNumber != 1 ? ("href='/admin/users.jsp?page=" + (pageNumber - 1)) + "'" : ""%>
                            class="cell right"></a>

                    <div class="cell"><%=totalNumUsers%> משתמשים</div>
                    <a <%=pageNumber * entriesPerPage <= totalNumUsers ?
                            ("href='/admin/users.jsp?page=" + (pageNumber + 1)) + "'" : ""%>
                            class="cell left"></a>
                </div>
            </div>

        </div>
    </body>
</html>
<%}%>
