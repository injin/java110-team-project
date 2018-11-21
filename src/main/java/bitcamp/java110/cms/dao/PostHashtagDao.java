package bitcamp.java110.cms.dao;

import java.util.Map;

public interface PostHashtagDao {
  
  int insert(Map<String, Object> params);
  int delete(int no);
  void signOut(int mno);
}
