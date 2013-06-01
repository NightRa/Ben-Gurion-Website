//Created By Ilan Godik
package model;

import db.DB;

public class UserAnswer implements Model<UserAnswer> {
    public final int id;

    public final int userID;

    public final int questionID;

    public final int answer;

    public UserAnswer(int id, int userID, int questionID, int answer) {
        this.id = id;
        this.userID = userID;
        this.questionID = questionID;
        this.answer = answer;
    }

    public UserAnswer(String[] params) {
        this(Integer.parseInt(params[0]), Integer.parseInt(params[1]), Integer.parseInt(params[2]), Integer.parseInt(params[3]));
    }

    public UserAnswer(DB db, int userID, int questionID) {
        //Could throw IndexOutOfBounds Exception if no such entry exists.
        this(db.select("select * from userAnswers where userID=" + userID + " and questionID=" + questionID + ";")[0]);
    }

    @Override
    public void save(DB db) {
        db.update("update userAnswers set userID=" + id + ",questionID=" + questionID + ",answer=" + answer + " where id=" + id);
    }

    @Override
    public UserAnswer create(DB db) {
        db.update("insert into userAnswers (userID,questionID,answer) values (" + userID + "," + questionID + "," + answer + ");");
        return new UserAnswer(db, userID, questionID);
    }

    @Override
    public void delete(DB db) {
        db.update("delete from userAnswers where id=" + id);
    }
}
