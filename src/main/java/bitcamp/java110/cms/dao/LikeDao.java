package bitcamp.java110.cms.dao;

import bitcamp.java110.cms.domain.Like;

public interface LikeDao {
  
  Like findOne(Like like);
  int add(Like like);
  int delete(Like like);
}
