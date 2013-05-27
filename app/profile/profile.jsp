<%--Created by Ilan Godik--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <a class="active" href="#">פרטים אישיים</a>
                <a href="#">שינוי סיסמא</a>
                <a href="#">ציוני שאלון</a>
            </div>

            <form class="profile" action="/profile" method="post">
                <%if(request.getAttribute("success")!=null){%>
                <div class="status">
                    נתונים עודכנו בהצלחה!
                </div>
                <%}%>
                <div class="field">
                    <label for="username">שם משתמש:</label>
                    <input type="text"  name="username" id="username" value="<%=user.username%>"
                           class="<%=request.getAttribute("fail-username")!=null?"fail":""%>"/>
                    <%if(request.getAttribute("fail-username-taken")!= null){%>
                        <span>כבר בשימוש</span>
                    <%}%>
                </div>
                <div class="field">
                    <label for="email">אימייל:</label>
                    <input type="text" name="email" id="email" value="<%=user.email%>"
                           class="<%=request.getAttribute("fail-email")!=null?"fail":""%>"/>
                    <%if(request.getAttribute("fail-email-taken")!= null){%>
                        <span>כבר בשימוש</span>
                    <%}%>
                </div>
                <div class="field">
                    <label for="firstName">שם פרטי:</label>
                    <input type="text" name="firstName" id="firstName" value="<%=user.firstName%>"
                           class="<%=request.getAttribute("fail-firstName")!=null?"fail":""%>"/>
                </div>
                <div class="field">
                    <label for="lastName">שם משפחה:</label>
                    <input type="text" name="lastName" id="lastName" value="<%=user.lastName%>"
                           class="<%=request.getAttribute("fail-lastName")!=null?"fail":""%>"/>
                </div>
                <div class="field">
                    <label for="birthYear">שנת לידה:</label>
                    <input type="text" name="birthYear" id="birthYear" value="<%=user.birthYear%>"
                           class="<%=request.getAttribute("fail-birthYear")!=null?"fail":""%>"/>
                </div>

                <div class="center">
                    <button type="submit" class="btn btn-success">שמירה</button>
                </div>
            </form>
        </div>
    </body>
</html>
<%}%>
