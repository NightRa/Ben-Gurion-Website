//Created By Ilan Godik
package jdbc;

import java.sql.*;

public class RealDB implements DB {
    private Connection con;

    public RealDB(){
        this("127.0.0.1", 3306, "website", "root", "root");
    }

    public RealDB(String ip, int port, String db, String user, String pass) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://" + ip + ":" + port + "/" + db, user, pass);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(String sql) {
        try {
            Statement st = con.createStatement();
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public String[][] select(String sql) {
        String result[][] = null;
        try {
            Statement st = con.createStatement(
                ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_UPDATABLE);
            ResultSet res = st.executeQuery(sql);
            int m = res.getMetaData().getColumnCount();
            res.last();
            int n = res.getRow();
            result = new String[n][m];
            res.beforeFirst();

            int row = 0;
            while (res.next()) {
                for (int col = 0; col < m; col++)
                    result[row][col] = res.getString(col + 1);
                row++;
            }
            res.close();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}