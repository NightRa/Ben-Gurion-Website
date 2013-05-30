//Created By Ilan Godik
package util.Validation;

public class IntValidator extends Validation {
    @Override
    public boolean isValid(String s) {
        boolean valid = super.isValid(s);
        try {
            Integer.parseInt(s);
            return valid;
        } catch (Exception e) {
            return false;
        }
    }
}
