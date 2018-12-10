package bitcamp.java110.cms.service;

import java.util.List;
import bitcamp.java110.cms.domain.Member;

public interface MemberService {
  void add(Member member);
  boolean init(Member member);
  boolean update(Member member);
  List<Member> findByNick(String keyword);
  Member findByMno(int tgtMno);
  void signOut(int mno);
  List<Integer> getFavGnrDBList(int mno);
  void saveMvId(int mvno);
}
