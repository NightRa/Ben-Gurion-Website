//Created By Ilan Godik
package db;

public interface DB {
    public void update(String sql);

    public String[][] select(String sql);
}
