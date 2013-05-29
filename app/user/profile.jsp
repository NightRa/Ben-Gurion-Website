<%--Created by Ilan Godik--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="static util.ServletUtil.*" %>
<%!
    public static String mText(HttpServletRequest req,String field,String msg){
        if(marked(req,field)) return msg+"<br/>";
        else return "";
    }
%>
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
                <a href="/user/grades.jsp">ציוני שאלון</a>
            </div>

            <form class="profile" action="/profile" method="post">
                <%if (marked(request, "success")) {%>
                <div class="status success">
                    נתונים עודכנו בהצלחה!
                </div>
                <%}else if(marked(request, "failed")){%>
                <div class="status failure">
                    <%=mText(request,"fail-username-space","רווח בשם משתמש")%>
                    <%=mText(request,"fail-username-taken","שם מתשמש תפוס")%>
                    <%=mText(request,"fail-email-space","רווח באימייל")%>
                    <%=mText(request,"fail-email-taken","אימייל תפוס")%>
                    <%=mText(request,"fail-firstName-space","רווח בשם פרטי")%>
                    <%=mText(request,"fail-lastName-space","רווח בשם משפחה")%>
                    <%=mText(request,"fail-birthYear-number","אנא וודא כי ישנו מספר בשנת הלידה")%>
                </div>
                <%}%>
                <div class="field">
                    <label for="username">שם משתמש:</label>
                    <input type="text" name="username" id="username" value="<%=user.username%>"
                           class="<%=marked(request,"fail-username")?"fail":""%>"/>
                </div>
                <div class="field">
                    <label for="email">אימייל:</label>
                    <input type="text" name="email" id="email" value="<%=user.email%>"
                           class="<%=marked(request,"fail-email")?"fail":""%>"/>
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
