//Created By Ilan Godik
package model;

import db.DB;

public interface Model<T> {
    public void save(DB db);
    public T create(DB db);
    public void delete(DB db);
}
