package bitcamp.java110.cms.dao;


import java.util.List;
import bitcamp.java110.cms.domain.Genre;

public interface GenreDao {
  List<Genre> list();
//  Genre findByNo(int grno);
//  Genre findByName(String grName);
//  int insert(int no, Genre gr);
}
