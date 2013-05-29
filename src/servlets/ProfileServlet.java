//Created By Ilan Godik
package servlets;

import db.DB;
import db.RealDB;
import model.User;
import util.Validation.IntValidator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import static util.ServletUtil.mark;
import static util.ServletUtil.marked;

public class ProfileServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            RealDB db = new RealDB();

            String username = spaceCheck(req, "username");
            checkTaken(db, req, "username", user.username);

            String email = spaceCheck(req, "email");
            checkTaken(db, req, "email", user.email);

            String firstName = spaceCheck(req, "firstName");
            String lastName = spaceCheck(req, "lastName");

            String birthYear = req.getParameter("birthYear");
            IntValidator validator = new IntValidator();
            if (!validator.isValid(birthYear)) {
                fail(req, "birthYear");
                fail(req, "birthYear-number");
            }

            boolean failed = marked(req, "failed");

            if (!failed) {
                User updated = new User(user.id, username, user.passHash, email, firstName, lastName, Integer.parseInt(birthYear), user.isAdmin);
                updated.save(db);
                session.setAttribute("user", updated);
                mark(req, "success");
            }
        }

        req.getRequestDispatcher("/user/profile.jsp").forward(req, resp);
    }

    private String checkTaken(DB db, HttpServletRequest req, String field, String current) {
        String parameter = req.getParameter(field);
        if (!parameter.equals(current) && entries(db, field, parameter) != 0) {
            fail(req, field);
            fail(req, field + "-taken");
        }
        return parameter;
    }


    //To make sure there are no SQL injections.
    private String spaceCheck(HttpServletRequest req, String field) {
        String parameter = req.getParameter(field);
        if (parameter.contains(" ")) {
            fail(req, field);
            fail(req, field + "-space");
        }
        return parameter;
    }

    private void fail(HttpServletRequest req, String field) {
        mark(req, "failed");
        mark(req, "fail-" + field);
    }

    private int entries(DB db, String field, String value) {
        return db.select("SELECT " + field + " FROM users WHERE " + field + "='" + value + "';").length;
    }
}
