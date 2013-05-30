//Created By Ilan Godik
package model.Message;

public class ErrorMessage extends Message{
    protected ErrorMessage(String message) {
        super(message);
    }

    @Override
    public String cssClass() {
        return "msg-error";
    }
}
