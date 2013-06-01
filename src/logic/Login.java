//Created By Ilan Godik
package logic;

import db.DB;
import model.User;
import util.CryptoUtil;

public class Login {
    public final DB db;
    public final String username;
    public final String pass;

    public Login(DB db, String username, String pass) {
        this.db = db;
        this.username = username;
        this.pass = pass;
    }

    public boolean isValid() {
        String[][] users = db.select("select password from users where username = '" + username + "';");
        if (users.length == 0) return false;
        String hash = users[0][0];
        String newHash = CryptoUtil.md5(pass);
        return hash.equals(newHash);
    }

    public User getUser() {
        String[][] row = db.select("select * from users where username = '" + username + "';");
        if (row.length == 0) return null;
        else {
            String[] userData = row[0];
            int id = Integer.parseInt(userData[0]);
            int birthYear = Integer.parseInt(userData[6]);
            boolean isAdmin = userData[7].equals("1");
            User user = new User(id, userData[1], userData[2], userData[3], userData[4], userData[5], birthYear, isAdmin);
            return user;
        }
    }

}
