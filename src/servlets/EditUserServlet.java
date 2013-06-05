//Created By Ilan Godik
package servlets;

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

import static util.Marking.mark;

public class EditUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        User adminUser = (User) session.getAttribute("user");
        int id = Integer.parseInt(req.getParameter("id"));
        if (adminUser != null && adminUser.isAdmin) {
            RealDB db = new RealDB();
            User user = new User(db.select("SELECT * FROM users WHERE id=" + id)[0]);

            InputValidation valid = new InputValidation(req, db);

            String username = valid.check("username");
            valid.checkTaken("username", user.username);

            String email = valid.check("email");
            valid.checkTaken("email", user.email);


            String newPassHash;
            if (req.getParameter("newPassword").isEmpty()) {
                newPassHash = user.passHash;
            } else {
                String pass = valid.spaceCheck("newPassword");
                String passCheck = valid.spaceCheck("passwordCheck");

                newPassHash = CryptoUtil.md5(pass);

                if (!pass.equals(passCheck)) {
                    valid.fail("passwordCheck");
                }
            }


            String firstName = valid.check("firstName");
            String lastName = valid.check("lastName");

            Integer birthYear = valid.checkNumber("birthYear");

            if (!valid.hasFailed()) {
                User updated = new User(user.id, username, newPassHash, email, firstName, lastName, birthYear, user.isAdmin);
                updated.save(db);
                mark(req, "success");
            }
        }

        req.getRequestDispatcher("/admin/editUser.jsp?id=" + id).forward(req, resp);
    }
}
