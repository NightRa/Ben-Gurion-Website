//Created By Ilan Godik
package model;

import db.DB;

public class Question implements Model<Question> {
    public final int id;
    public final int number;
    public final String text;
    public final int answer;


    public Question(int id, int number, String text, int answer) {
        this.id = id;
        this.number = number;
        this.text = text;
        this.answer = answer;
    }

    public Question(String[] params) {
        this(Integer.parseInt(params[0]), Integer.parseInt(params[1]), params[2], Integer.parseInt(params[3]));
    }

    public Question(DB db, int id) {
        this(db.select("SELECT * FROM questions where id=" + id + ";")[0]);
    }

    public static Question getByNumber(DB db, int number) {
        return new Question(db.select("SELECT * FROM questions where number=" + number + ";")[0]);
    }

    @Override
    public void save(DB db) {
        db.update("UPDATE questions SET number=" + number + ", text='" + text + "', answer=" + answer + " WHERE id=" + id + ";");
    }

    @Override
    public Question create(DB db) {
        db.update("INSERT INTO questions (number,text,answer) VALUES (" + number + ",'" + text + "'," + answer + ");");
        return getByNumber(db, number);
    }

    @Override
    public void delete(DB db) {
        db.update("delete from questions where id=" + id);
    }
}
