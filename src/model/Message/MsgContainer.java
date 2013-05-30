//Created By Ilan Godik
package model.Message;

import util.collections.List;
import util.collections.Nil;

public class MsgContainer {
    public final List<String> errors;
    public final List<String> successes;

    public MsgContainer(List<String> errors, List<String> successes) {
        this.errors = errors;
        this.successes = successes;
    }

    public MsgContainer(){
        this(new Nil<String>(),new Nil<String>());
    }

    public MsgContainer addError(String msg){
        return new MsgContainer(errors.add(msg),successes);
    }

    public MsgContainer addSuccess(String msg){
        return new MsgContainer(errors,successes.add(msg));
    }
}
