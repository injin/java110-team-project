package bitcamp.java110.cms.dao;

import java.util.List;
import java.util.Map;
import bitcamp.java110.cms.domain.Like;

public interface LikeDao {
  
  Like findOne(Like like);
  List<Like> findAll(Map<String, Object> params);
  int add(Like like);
  int delete(Like like);
}
