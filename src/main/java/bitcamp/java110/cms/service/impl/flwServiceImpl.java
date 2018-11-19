package bitcamp.java110.cms.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bitcamp.java110.cms.dao.FlwDao;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.service.FlwService;

@Service
public class flwServiceImpl implements FlwService{

     @Autowired
     FlwDao flwDao;



   @Override
    public List<Member> list(int no) {

        return flwDao.flwlist(no);
       
    }


    @Override
    public void delete(Map<String, Object> condition) {
        
        flwDao.flwdelete(condition);
    }
    
    
    @Override
    public void add(Map<String, Object> condition) {
       
        flwDao.flwadd(condition);
        
    }
    
 
}
