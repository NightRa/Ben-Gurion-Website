//Created By Ilan Godik
package util;

import javax.servlet.http.HttpServletRequest;

import static util.ServletUtil.marked;

public class Input {
    public static String mText(HttpServletRequest req, String field, String msg) {
        if (marked(req, field)) return msg + "<br/>";
        else return "";
    }

    public static String mField(HttpServletRequest req, String name, String text, String type) {
        String cssClass = marked(req, "fail-" + name) ? "class='fail'" : "";
        String template =
            "<div class='field'>" +
                "   <label for='" + name + "'>" + text + ":</label>" +
                "   <input type='" + type + "' name='" + name + "' id='" + name + "' " + cssClass + "/>" +
                "</div>";
        return template;
    }

    public static String textInput(HttpServletRequest req, String name, String text) {
        return mField(req, name, text, "text");
    }
}
