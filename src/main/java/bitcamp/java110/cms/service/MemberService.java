package bitcamp.java110.cms.service;

import bitcamp.java110.cms.domain.Member;

public interface MemberService {
  void add (Member member);
  void update (Member member);
  Member findById (String id);
}
