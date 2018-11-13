package bitcamp.java110.cms.dao;

import java.util.List;
import bitcamp.java110.cms.domain.Member;

public interface MemberDao2 {

  int insert(Member member);
  Member findById(String id);
  List<Member> findByNick (String nick);
  void update(Member member);
  
}
