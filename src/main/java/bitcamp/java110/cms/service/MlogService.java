package bitcamp.java110.cms.service;

import java.util.List;
import bitcamp.java110.cms.domain.Mlog;

public interface MlogService {

  public List<Mlog> getList(int mno);
  public List<Mlog> getListByType(int mno, String type);
  public List<Mlog> getListMore(int mno, String type, int lastno);

}
