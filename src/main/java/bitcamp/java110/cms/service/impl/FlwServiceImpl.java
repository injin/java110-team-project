package bitcamp.java110.cms.service.impl;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import bitcamp.java110.cms.dao.FlwDao;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.service.FlwService;

@Service
public class FlwServiceImpl implements FlwService{

     @Autowired
     FlwDao flwDao;

     
   @Override
    public List<Member> list(Map<String,Object> condition) {
        return flwDao.flwlist(condition);
    }

   @Override
   public List<Member> listAll(int mno) {
       return flwDao.flwlistall(mno);
   }

   @Override
   public int getTotalCnt(int mno) {
       return flwDao.getTotalCnt(mno);
   }

    @Override
    public void delete(Map<String, Object> condition) {
        flwDao.flwdelete(condition);
    }
    
    
    @Override
    public boolean add(Map<String, Object> condition) {
        
         if(flwDao.flwadd(condition)>0)
            return true;
         else
             return false;
                    
    }
    
 
}
