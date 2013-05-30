//Created By Ilan Godik
package util.collections;

public class Nil<T> extends List<T> {
    @Override
    public boolean isEmpty() {
        return true;
    }

    @Override
    public T head() {
        return null;
    }

    @Override
    public List<T> tail() {
        return null;
    }
}
