//Created By Ilan Godik
package servlets;

import jdbc.RealDB;
import logic.Login;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("inputUsername");
        String password = req.getParameter("inputPassword");
        HttpSession session = req.getSession(true);
        Object user = session.getAttribute("user");
        if(user==null){
            Login login = new Login(new RealDB(), username, password);
            session.setAttribute("user", login.getUser());
        }
        resp.sendRedirect("");
//        getServletContext().getRequestDispatcher("/index.jsp").forward(req,resp);
    }
}
