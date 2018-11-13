package bitcamp.java110.cms.dao;

import java.util.List;
import java.util.Map;
import bitcamp.java110.cms.domain.Post;

public interface PostHashtagDao {
  
  int insert(Map<String, Object> params);
  List<Post> get(String keyword);
  int delete(int no);
}
