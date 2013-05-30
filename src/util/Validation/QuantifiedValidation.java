//Created By Ilan Godik
package util.Validation;

import db.DB;

public class QuantifiedValidation extends Validation {
    private final DB db;
    public final String table;
    public final String field;
    public final int amount;

    public QuantifiedValidation(DB db, String table, String field, int amount) {
        this.db = db;
        this.table = table;
        this.field = field;
        this.amount = amount;
    }

    @Override
    public boolean isValid(String s) {
        boolean valid = super.isValid(s);
        String[][] result = db.select("SELECT '" + field + "' FROM '" + table + "' WHERE '" + field + "'='" + s + "';");
        return valid && result.length <= 1;
    }
}
