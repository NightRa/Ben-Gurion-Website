//Created By Ilan Godik
package servlets;

import db.DB;
import db.RealDB;
import model.User;
import model.UserAnswer;
import util.Validation.InputValidation;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AnswerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            DB db = new RealDB();
            InputValidation valid = new InputValidation(req, db);
            String answerS = req.getParameter("answer");
            if (answerS == null) {
                valid.fail("select");
                req.getRequestDispatcher("/questions/questions.jsp").forward(req, resp);
            } else {
                int questionID = Integer.parseInt(req.getParameter("questionID"));
                int answer = Integer.parseInt(answerS);
                UserAnswer userAnswer = new UserAnswer(0/*Doesn't matter*/, user.id, questionID, answer);
                userAnswer.create(db);


                // I'm in a lack of time, and don't have the time to add a new property to user model.
                int lastQuestion = Integer.parseInt(db.select("SELECT lastQuestion FROM users WHERE id=" + user.id)[0][0]);
                db.update("update users set lastQuestion=" + (lastQuestion + 1) + " where id=" + user.id);
                resp.sendRedirect("/questions/questions.jsp");
            }
        }


    }
}
