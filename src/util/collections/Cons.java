//Created By Ilan Godik
package util.collections;

public class Cons<T> extends List<T> {
    public final T head;
    public final List<T> tail;

    public Cons(T head, List<T> tail) {
        this.head = head;
        this.tail = tail;
    }

    @Override
    public boolean isEmpty() {
        return false;
    }

    @Override
    public T head() {
        return head;
    }

    @Override
    public List<T> tail() {
        return tail;
    }
}
