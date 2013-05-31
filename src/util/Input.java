//Created By Ilan Godik
package util;

import javax.servlet.http.HttpServletRequest;

import static util.Marking.marked;

public class Input {
    public static String mText(HttpServletRequest req, String field, String msg) {
        if (marked(req, field)) return msg + "<br/>";
        else return "";
    }

    public static String mField(HttpServletRequest req, String name, String text, String type) {
        return mField(req, name, text, type, null);
    }

    public static String mField(HttpServletRequest req, String name, String text, String type, String value) {
        String cssClass = marked(req, "fail-" + name) ? "class='fail' " : "";
        String parameter = req.getParameter(name);
        if (value == null) {
            if (parameter != null) {
                value = parameter;
            } else {
                value = "";
            }
        }
        String valueAtt = "value='" + value + "' ";
        String template =
            "<div class='field'>" +
                "   <label for='" + name + "'>" + text + ":</label>" +
                "   <input type='" + type + "' name='" + name + "' id='" + name + "' " + cssClass + valueAtt + "/>" +
                "</div>";
        return template;
    }

    public static String textInput(HttpServletRequest req, String name, String text) {
        return textInput(req, name, text, null);
    }

    public static String textInput(HttpServletRequest req, String name, String text, String value) {
        return mField(req, name, text, "text", value);
    }
}
