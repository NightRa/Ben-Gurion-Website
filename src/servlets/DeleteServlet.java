//Created By Ilan Godik
package servlets;

import db.DB;
import db.RealDB;
import logic.Login;
import model.User;
import util.Validation.InputValidation;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class DeleteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            DB db = new RealDB();
            InputValidation valid = new InputValidation(req, db);

            String oldPass = valid.check("password");

            Login login = new Login(db, user.username, oldPass);
            if (!login.isValid()) {
                valid.fail("password-incorrect");
                valid.fail("password");
            }

            if (!valid.hasFailed()) {
                user.delete(db);
                session.setAttribute("user", null);
                resp.sendRedirect("/");
            } else {
                req.getRequestDispatcher("/user/delete.jsp").forward(req, resp);
            }
        }
    }
}
