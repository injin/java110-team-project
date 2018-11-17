package bitcamp.java110.cms.dao;

import java.util.Map;

public interface MovieAnlyDao {
  //  회원 선호 영화 분석 mv_mv_anly 테이블
  void signIn(Map<String, Integer> params);
  void update(Map<String, String> params);
  void signOut(int mno);
}
