//Created By Ilan Godik
package util;

import javax.servlet.http.HttpServletRequest;

public class ServletUtil {
    public static void mark(HttpServletRequest req, String field) {
        req.setAttribute(field, new Object());
    }

    public static boolean marked(HttpServletRequest req, String field){
        return req.getAttribute(field)!=null;
    }
}
