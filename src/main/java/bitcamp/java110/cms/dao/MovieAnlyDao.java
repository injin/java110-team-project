package bitcamp.java110.cms.dao;

import java.util.List;
import java.util.Map;

public interface MovieAnlyDao {
  //  회원 선호 영화 분석 mv_mv_anly 테이블
  void signIn(Map<String, Integer> params);
  void update(Map<String, Object> params);
  void insertNotExists(Map<String, Integer> params);
  void insertPost(Map<String, Object> params);
  int findOne(Map<String, Object> params);
  void signOut(int mno);
  int getOneFav(int mno);
  List<Integer> getFavMvList(int mno);
  void insertGrNotExists(Map<String, Integer> params);
  void insertGrAllNotExists(Map<String, Object> params);
  boolean checkGrExist(int mvno);
}
