package bitcamp.java110.cms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import bitcamp.java110.cms.dao.MlogDao;
import bitcamp.java110.cms.domain.Mlog;
import bitcamp.java110.cms.service.MlogService;

@Service
public class MlogServiceImpl implements MlogService {

  @Autowired MlogDao logDao;
  
  public List<Mlog> getList;

  @Override
  public List<Mlog> getList(int mno) {
    return logDao.list(mno);
  }

  @Override
  public List<Mlog> getListByType(int mno, String type) {
    
    Map<String, Object> params = new HashMap<>();
    params.put("mno", mno);
    params.put("type", type);
    return logDao.listByType(params);
  }

  @Override
  public List<Mlog> getListMore(int mno, String type, int lastno) {
    Map<String, Object> params = new HashMap<>();
    params.put("mno", mno);
    params.put("type", type);
    params.put("lastno", lastno);
    return logDao.listMore(params);
  }
}
