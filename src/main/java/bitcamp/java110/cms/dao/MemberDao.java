package bitcamp.java110.cms.dao;

import java.util.List;
import bitcamp.java110.cms.domain.Member;

public interface MemberDao {

  int insert(Member member);
  Member findById(String id);
  List<Member> findByNick (String keyword);
  void update(Member member);
}
