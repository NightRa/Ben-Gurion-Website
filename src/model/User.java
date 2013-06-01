//Created By Ilan Godik
package model;

import db.DB;
import logic.Login;

public class User implements Model<User> {
    public final int id;
    public final String username;
    public final String passHash;
    public final String email;
    public final String firstName;
    public final String lastName;
    public final int birthYear;
    public final boolean isAdmin;

    public User(int id, String username, String passHash, String email, String firstName, String lastName, int birthYear, boolean isAdmin) {
        this.id = id;
        this.username = username;
        this.passHash = passHash;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.birthYear = birthYear;
        this.isAdmin = isAdmin;
    }

    // Could throw IndexOutOfBoundsException, but is accepted, as it's the fault of the caller.
    public User(String[] params) {
        this(Integer.parseInt(params[0]), params[1], params[2], params[3], params[4], params[5], Integer.parseInt(params[6]), params[7].equals("1"));
    }

    @Override
    public void save(DB db) {
        db.update("UPDATE users SET username='" + username + "',password='" + passHash + "',email='" + email + "',privateName='" + firstName + "', lastName='" + lastName + "',birthYear='" + birthYear + "',admin='" + (isAdmin ? "1" : "0") + "' WHERE id='" + id + "';");
    }


    public User create(DB db) {
        db.update("INSERT INTO users (username,password,email,privateName,lastName,birthYear) VALUES ('" + username + "','" + passHash + "','" + email + "','" + firstName + "','" + lastName + "','" + birthYear + "');");
        Login login = new Login(db, username, passHash);
        return login.getUser();
    }

    @Override
    public void delete(DB db) {
        db.update("DELETE FROM users WHERE ID=" + id + "");
    }
}
