//Created By Ilan Godik
package model;

import db.DB;
import logic.Login;

public class User {
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

    public void save(DB db) {
        db.update("UPDATE users SET username='" + username + "',password='" + passHash + "',email='" + email + "',privateName='" + firstName + "', lastName='" + lastName + "',birthYear='" + birthYear + "',admin='" + (isAdmin ? "1" : "0") + "' WHERE id='" + id + "';");
    }

    public User create(DB db) {
        db.update("INSERT INTO users (username,password,email,privateName,lastName,birthYear) VALUES ('" + username + "','" + passHash + "','" + email + "','" + firstName + "','" + lastName + "','" + birthYear + "');");
        Login login = new Login(db, username, passHash);
        return login.getUser();
    }

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassHash() {
        return passHash;
    }

    public String getEmail() {
        return email;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public int getBirthYear() {
        return birthYear;
    }

    public boolean isAdmin() {
        return isAdmin;
    }
}
