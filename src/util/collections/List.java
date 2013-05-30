//Created By Ilan Godik
package util.collections;

public abstract class List<T> {
    public abstract boolean isEmpty();

    public abstract T head();

    public abstract List<T> tail();

    public List<T> add(T e) {
        return new Cons<T>(e, this);
    }

    public static <T> List<T> list(T... elems) {
        if (elems.length == 0) return new Nil<T>();

        List<T> acc = new Cons<T>(elems[0], new Nil<T>());

        for (int i = elems.length - 1; i >= 0; i--) {
            acc = new Cons<T>(elems[i], acc);
        }

        return acc;
    }

    public String mkString(String pre, String sep, String end) {
        if (this.isEmpty()) return "";
        else return mkStringAcc(sep, end, pre);
    }

    private String mkStringAcc(String sep, String end, String acc) {
        if (this.isEmpty()) return acc + end;
        else return tail().mkStringAcc(sep, end, acc + head() + sep);
    }

    public String mkString(String sep) {
        return mkString("", sep, "");
    }


}
