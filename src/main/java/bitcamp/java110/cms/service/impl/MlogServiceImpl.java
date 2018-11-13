package bitcamp.java110.cms.service.impl;

import java.util.List;
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
  public List<Mlog> getList() {
    // TODO Auto-generated method stub
    return logDao.list();
 
  
  }
}
