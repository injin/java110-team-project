package bitcamp.java110.cms.dao;

import java.util.List;
import bitcamp.java110.cms.domain.Mlog;

public interface MlogDao {
  
  List<Mlog> list(int mno);
  int insert(Mlog mlog);
  
}
