package bitcamp.java110.cms.dao;

import java.util.List;
import java.util.Map;
import bitcamp.java110.cms.domain.Mlog;

public interface MlogDao {
  
  List<Mlog> list(int mno);
  List<Mlog> listByType(Map<String, Object> params);
  List<Mlog> listMore(Map<String, Object> params);
  int insert(Mlog mlog);
  void signOut1(int mno);
  void signOut2(int mno);
}
