package bitcamp.java110.cms.dao;

import java.util.List;

public interface RecommendDao {
  String getTitle(int thmno);
  List<Integer> findMgrRcmdListById(int thmno);
  int getCount();
}
