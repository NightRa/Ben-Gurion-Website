//Created By Ilan Godik
package model.Message;

public abstract class Message {
    public final String message;

    protected Message(String message) {
        this.message = message;
    }

    public abstract String cssClass();
}
