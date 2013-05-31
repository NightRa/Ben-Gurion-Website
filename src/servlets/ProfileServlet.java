//Created By Ilan Godik
package servlets;

import db.RealDB;
import model.User;
import util.Validation.InputValidation;
import util.Validation.IntValidator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import static util.Marking.mark;
import static util.Marking.marked;

public class ProfileServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            RealDB db = new RealDB();
            InputValidation valid = new InputValidation(req, db);

            String username = valid.spaceCheck("username");
            valid.checkTaken("username", user.username);

            String email = valid.spaceCheck("email");
            valid.checkTaken("email", user.email);

            String firstName = valid.spaceCheck("firstName");
            String lastName = valid.spaceCheck("lastName");

            String birthYear = req.getParameter("birthYear");
            IntValidator validator = new IntValidator();
            if (!validator.isValid(birthYear)) {
                valid.fail("birthYear");
                valid.fail("birthYear-number");
            }

            if (!valid.hasFailed()) {
                User updated = new User(user.id, username, user.passHash, email, firstName, lastName, Integer.parseInt(birthYear), user.isAdmin);
                updated.save(db);
                session.setAttribute("user", updated);
                mark(req, "success");
            }
        }

        req.getRequestDispatcher("/user/profile.jsp").forward(req, resp);
    }


}
