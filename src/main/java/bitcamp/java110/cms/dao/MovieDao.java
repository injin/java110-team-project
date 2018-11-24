package bitcamp.java110.cms.dao;

import java.util.Map;
import bitcamp.java110.cms.domain.Movie;

public interface MovieDao {
  
  int insert(Map<String, Object> params);
  int insertByObj(Movie movie);
  int insertNotExists(Movie movie);
  Movie findByNo(int no);
  String getTitleById(int id);
}
