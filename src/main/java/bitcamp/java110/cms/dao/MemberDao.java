package bitcamp.java110.cms.dao;

import java.util.List;
import bitcamp.java110.cms.domain.Member;

public interface MemberDao {

  int insert(Member member);
  Member findById(String id);
  Member findByMno(int mno);
  List<Member> findByNick (String keyword);
  int update(Member member);
  void signOut(int mno);
}
