package bitcamp.java110.cms.dao;

import java.util.List;
import bitcamp.java110.cms.domain.Hs;

public interface HsDao {

  int insert(Hs hs);
  List<Hs> list();
  Hs findByno(int no);
  int update(Hs hs);
  int delete(int no);
}
