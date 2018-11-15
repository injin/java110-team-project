package bitcamp.java110.cms.dao;

import java.util.Map;
import bitcamp.java110.cms.domain.Movie;

public interface MovieDao {
  
  int insert(Map<String, Object> params);
  Movie findByNo(int no);
}
