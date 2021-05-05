public class SessionIdGetPageClass {
    public String getSessionIdFromVFPage() {
        if(Test.isRunningTest()) {
            return 'session_id';
        } 
        return 'session_id';
    }   
}