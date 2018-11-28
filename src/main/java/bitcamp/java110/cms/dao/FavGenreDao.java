package bitcamp.java110.cms.dao;

import java.util.List;
import java.util.Map;

public interface FavGenreDao {
  //  회원 선호 장르
  void insert(Map<String, Object> params);
  void signOut(int mno);
  List<Integer> getFavGnrList(int mno);
  void deleteAll(int mno);
}
