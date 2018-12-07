package bitcamp.java110.cms.dao;

import java.util.List;
import bitcamp.java110.cms.domain.Theme;

public interface RecommendDao {
  String getTitle(int thmno);
  List<Theme> getAllTitle();
  List<Integer> findMgrRcmdListById(int thmno);
  int getCount();
}
