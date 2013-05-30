//Created By Ilan Godik
package model.Message;

public class SuccessMessage extends Message {

    protected SuccessMessage(String message) {
        super(message);
    }

    @Override
    public String cssClass() {
        return "msg-success";
    }
}
