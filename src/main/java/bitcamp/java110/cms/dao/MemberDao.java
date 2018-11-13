package bitcamp.java110.cms.dao;

import bitcamp.java110.cms.domain.Member;

public interface MemberDao {

  int insert(Member member);
  Member findById(String id);
  void update(Member member);
  
  /**
   * 제하 작업중 주석
   * 회원 탈퇴를 위한.
   * 외래키 적용 테이블부터 지워가야함.
   */
  void signOut(int mno);
}
