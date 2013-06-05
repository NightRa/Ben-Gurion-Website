//Created By Ilan Godik
package servlets;

import db.DB;
import db.RealDB;
import model.Answer;
import model.Question;
import model.User;
import util.InputValidation;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import static util.Marking.mark;


public class AddQuestionServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null && user.isAdmin) {
            String question = req.getParameter("question");
            String answer1 = req.getParameter("answer1");
            String answer2 = req.getParameter("answer2");
            String answer3 = req.getParameter("answer3");
            String answer4 = req.getParameter("answer4");

            DB db = new RealDB();
            InputValidation valid = new InputValidation(req, db);

            Integer correctAnswer = valid.checkNumber("correctAnswer");

            if (correctAnswer != null) {
                if (correctAnswer < 1 || correctAnswer > 4) {
                    valid.fail("correctAnswer");
                }
            }

            if (!valid.hasFailed()) {
                int questionCount = Integer.parseInt(db.select("SELECT count(*) FROM questions")[0][0]);
                //noinspection ConstantConditions
                Question q = new Question(0/*Doesn't matter*/, questionCount + 1, question, correctAnswer);
                q.create(db);
                q = Question.getByNumber(db, questionCount + 1); //Get the question with the ID.
                Answer a1 = new Answer(0, 1, q.id, answer1);
                a1.create(db);
                Answer a2 = new Answer(0, 2, q.id, answer2);
                a2.create(db);
                Answer a3 = new Answer(0, 3, q.id, answer3);
                a3.create(db);
                Answer a4 = new Answer(0, 4, q.id, answer4);
                a4.create(db);
                mark(req, "add-success");
                req.getRequestDispatcher("/admin/questions.jsp").forward(req, resp);
            } else {
                req.getRequestDispatcher("/admin/addQuestion.jsp").forward(req, resp);
            }
        }
    }
}
