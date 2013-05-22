//Created By Ilan Godik
package util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class CryptoUtil {
    public static String md5(String s) {
        byte[] hex = new byte[0];
        try {
            hex = MessageDigest.getInstance("MD5").digest(s.getBytes());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return new BigInteger(1, hex).toString(16);
    }
}
