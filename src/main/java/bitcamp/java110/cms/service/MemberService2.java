package bitcamp.java110.cms.service;

import java.util.List;
import bitcamp.java110.cms.domain.Member;

public interface MemberService2 {
  void add (Member member);
  void update (Member member);
  Member findById (String id);
  List<Member> findByNick (String nick);
}
