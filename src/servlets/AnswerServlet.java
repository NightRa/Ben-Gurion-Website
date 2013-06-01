//Created By Ilan Godik
package servlets;

import db.DB;
import db.RealDB;
import model.Question;
import model.User;
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
            InputValidation valid = new InputValidation(req,db);
            String answerS = req.getParameter("answer");
            if(answerS == null) valid.fail("select");
            else{
                int questionID = Integer.parseInt(req.getParameter("questionID"));
                Question question = new Question(db,questionID);
                int answer = Integer.parseInt(answerS);


            }
        }

        resp.sendRedirect("/questions/questions.jsp");
    }
}
