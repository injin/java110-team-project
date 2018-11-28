package bitcamp.java110.cms.dao;

import java.util.List;
import java.util.Map;

import bitcamp.java110.cms.domain.Member;

public interface FlwDao { 

    List<Member> flwlist(Map<String,Object> condition);
    int getTotalCnt(int mno);
    int flwdelete(Map<String, Object> condition);
    int flwadd(Map<String, Object> condition);
    int insertForPost(Map<String, Object> condition);
    List<Member> listForPost(int no);
    void signOut1(int mno);
    void signOut2(int mno);
    void signOut3(int mno);
    List<Member> flwlistall(int mno);
}
