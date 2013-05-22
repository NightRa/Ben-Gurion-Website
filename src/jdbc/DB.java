//Created By Ilan Godik
package jdbc;

public interface DB {
    public void update(String sql);
    public String[][] select(String sql);
}
