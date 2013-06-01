//Created By Ilan Godik
package model;

import db.DB;

public class Answer implements Model<Answer> {
    public final int id;
    public final int number;
    public final int questionID;
    public final String text;

    public Answer(int id, int number, int questionID, String text) {
        this.id = id;
        this.number = number;
        this.questionID = questionID;
        this.text = text;
    }

    public Answer(String[] params) {
        this(Integer.parseInt(params[0]), Integer.parseInt(params[1]), Integer.parseInt(params[2]), params[3]);
    }

    public Answer(DB db, int number, int questionID) {
        this(db.select("select * from answers where number=" + number + " AND questionId=" + questionID + ";")[0]);
    }

    @Override
    public void save(DB db) {
        db.update("update answers set number=" + number + ", questionId=" + questionID + ", text='" + text + "' where id=" + id + ";");
    }

    @Override
    public Answer create(DB db) {
        db.update("insert into answers (number,questionId,text) values (" + number + "," + questionID + ",'" + text + "');");
        return this;
    }

    @Override
    public void delete(DB db) {
        db.update("delete from answers where id=" + id);
    }
}
