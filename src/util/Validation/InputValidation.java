//Created By Ilan Godik
package util.Validation;

import db.DB;

import javax.servlet.http.HttpServletRequest;

import static util.Marking.mark;
import static util.Marking.marked;

public class InputValidation {
    private final HttpServletRequest req;
    private final DB db;

    public InputValidation(HttpServletRequest req, DB db) {
        this.req = req;
        this.db = db;
    }

    public boolean hasFailed() {
        return marked(req, "failed");
    }

    public String checkTaken(String field, String current) {
        String parameter = req.getParameter(field);
        if (!parameter.equals(current) && entries(field, parameter) != 0) {
            fail(field);
            fail(field + "-taken");
        }
        return parameter;
    }

    //To make sure there are no SQL injections.
    public String spaceCheck(String field){
        String parameter = req.getParameter(field);
        if (parameter.contains(" ")) {
            fail(field);
            fail(field + "-space");
        }
        return parameter;
    }

    public String emptyCheck(String field){
        String parameter = req.getParameter(field);
        if (parameter.isEmpty()) {
            fail(field);
            fail("empty");
        }
        return parameter;
    }


    public String check(String field) {
        spaceCheck(field);
        return emptyCheck(field);
    }

    public void fail(String field) {
        mark(req, "failed");
        mark(req, "fail-" + field);
    }

    public int entries(String field, String value) {
        return db.select("SELECT " + field + " FROM users WHERE " + field + "='" + value + "';").length;
    }
}
