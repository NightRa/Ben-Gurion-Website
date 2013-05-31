<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<%
    User menuUser = (User) session.getAttribute("user");
    boolean loggedIn = menuUser != null;
%>
<div class="menu">
    <div class="right">
        <a href="/" class="home"><img src="/img/home.png" alt="home"/></a>
        <%--<a href="#" class="menu-expand"><img src="/img/arrow.png" alt="Expand"/></a>--%>

        <div class="mid-menu">
            <a href="about.jsp">אודות</a>
            <a class="space"></a>
            <a href="/info/preface.jsp">הקדמה</a>
            <a href="/info/background.jsp">רקע</a>
            <a href="/info/process.jsp">מהלך הפרשה</a>
            <a href="/info/results.jsp">תוצאות הפרשה</a>
            <a href="/info/memory.jsp">הנצחה וזיכרון</a>
        </div>

    </div>
    <div class="left">
        <%if (loggedIn) {%>
        <a href="/logout">התנתק</a>
        <a href="/user/profile.jsp">פרופיל</a>
        <%if (menuUser.isAdmin) {%>
        <a href="/admin">לוח בקרה</a>
        <%}%>
        <span>
        שלום <%=menuUser.firstName%>
        </span>


        <%} else {%>
        <a href="/user/register.jsp">הרשמה</a>
        <!--data-target to fix a jump bug-->
        <a onclick="toggle_visibility('login');" data-target="#">התחברות</a>

        <form action="/login" method="post" class="login" id="login">
            <table>
                <tr>
                    <td><label for="inputUsername">שם משתמש</label></td>
                    <td><input maxlength="32" type="text" id="inputUsername" name="inputUsername"
                               placeholder="שם משתמש"></td>
                </tr>
                <tr>
                    <td><label for="inputPassword">סיסמא</label></td>
                    <td><input maxlength="32" type="password" id="inputPassword" name="inputPassword"
                               placeholder="סיסמא"></td>
                </tr>
            </table>
            <button type="submit" class="btn btn-orange">כניסה</button>
        </form>
        <script type="text/javascript">
            function toggle_visibility(id) {
                var e = document.getElementById(id);
                if (e.style.display == 'block')
                    e.style.display = 'none';
                else
                    e.style.display = 'block';
            }
        </script>
        <%}%>
    </div>
</div>
<%
    Object msg = request.getAttribute("msg");
    if (msg != null) {

%>
<div class="msg">

</div>
<%}%>
