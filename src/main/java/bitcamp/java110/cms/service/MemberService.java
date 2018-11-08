package bitcamp.java110.cms.service;

import bitcamp.java110.cms.domain.Member;

public interface MemberService {
  void add (Member member);
  Member findById (String id);
}
