package bitcamp.java110.cms.dao;

import java.util.List;
import java.util.Map;
import bitcamp.java110.cms.domain.Member;

public interface FlwDao {

    List<Member> flwlist(int no); 
    int flwdelete(Map<String, Object> condition);
    int flwadd(Map<String, Object> condition);
    void signOut(int mno);
}
