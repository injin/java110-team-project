package bitcamp.java110.cms.dao;

import java.util.List;
import java.util.Map;
import bitcamp.java110.cms.domain.Theme;

public interface RecommendDao {
  String getTitle(int thmno);
  List<Theme> getAllTitle();
  int addTheme(String thm);
  int addMovieList(Map<String, Object> params);
  int deleteAll(int thmno);
  int deleteTheme(int thmno);
  List<Integer> findMgrRcmdListById(int thmno);
  int getCount();
}
