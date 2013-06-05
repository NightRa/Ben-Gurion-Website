//Created By Ilan Godik
package servlets;

import db.DB;
import db.RealDB;
import model.User;
import util.CryptoUtil;
import util.InputValidation;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        DB db = new RealDB();
        InputValidation valid = new InputValidation(req, db);

        String username = valid.check("username");
        valid.checkTaken("username", "");

        String email = valid.check("email");
        valid.checkTaken("email", "");

        String pass = valid.check("password");
        String passCheck = valid.check("passwordCheck");

        if (!pass.equals(passCheck)) {
            valid.fail("passwordCheck");
        }

        String firstName = valid.check("firstName");
        String lastName = valid.check("lastName");

        Integer birthYear = valid.checkNumber("birthYear");

        if (!valid.hasFailed()) {
            HttpSession session = req.getSession();
            User user = new User(0, username, CryptoUtil.md5(pass), email, firstName, lastName, birthYear, false);
            user.create(db);
            session.setAttribute("user", user);
            resp.sendRedirect("/");
        } else {
            req.getRequestDispatcher("/user/register.jsp").forward(req, resp);
        }
    }
}
