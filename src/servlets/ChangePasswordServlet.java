//Created By Ilan Godik
package servlets;

import db.DB;
import db.RealDB;
import logic.Login;
import model.User;
import util.CryptoUtil;
import util.InputValidation;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import static util.Marking.mark;

public class ChangePasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            DB db = new RealDB();
            InputValidation valid = new InputValidation(req, db);

            String oldPass = valid.check("oldPassword");
            String newPass = valid.check("newPassword");
            String passCheck = valid.check("passwordCheck");

            Login login = new Login(db, user.username, oldPass);
            if (!login.isValid()) {
                valid.fail("password-incorrect");
                valid.fail("oldPassword");
            }

            if (!newPass.equals(passCheck)) {
                valid.fail("passwordCheck");
            }

            if (!valid.hasFailed()) {
                String passHash = CryptoUtil.md5(newPass);
                User updated = new User(user.id, user.username, passHash, user.email, user.firstName, user.lastName, user.birthYear, user.isAdmin);
                updated.save(db);
                session.setAttribute("user", updated);
                mark(req, "success");
            }
        }

        req.getRequestDispatcher("/user/password.jsp").forward(req, resp);
    }
}
