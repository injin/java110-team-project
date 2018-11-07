package bitcamp.java110.cms.dao;

import java.util.Map;
import bitcamp.java110.cms.domain.Genre;

public interface GenreDao {
  Genre findByNo(int grno);
  Genre findByName(String grName);
  int insert(int no, Genre gr);
  Map <Integer, String> list();
}
