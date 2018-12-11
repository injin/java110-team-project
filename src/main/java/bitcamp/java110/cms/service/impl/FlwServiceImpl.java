package bitcamp.java110.cms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import bitcamp.java110.cms.dao.FlwDao;
import bitcamp.java110.cms.dao.MlogDao;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.domain.Mlog;
import bitcamp.java110.cms.service.FlwService;

@Service
public class FlwServiceImpl implements FlwService{

     @Autowired
     FlwDao flwDao;

     @Autowired
     MlogDao mlogDao;
     
   @Override
    public List<Member> list(Map<String,Object> condition) {
        return flwDao.flwlist(condition);
    }

   public List<Member> listAll(int mno) {
       return flwDao.flwlistall(mno);
   }

   @Override
   public int getTotalCnt(int mno) {
       return flwDao.getTotalCnt(mno);
   }

    @Override
    public boolean delete(int mno, int flw) {
      
        Map<String,Object> condition =  new HashMap<>();
        condition.put("mno", mno);
        condition.put("flw", flw);
        
        if (flwDao.flwdelete(condition) > 0) {
          return true;
        } else {
          return false;
        }
    }
    
    
    @Override
    public boolean add(Map<String, Object> condition) {
        
      Mlog mlog = new Mlog();
      mlog.setMno((int)condition.get("mno"));
      mlog.setDirect("fr");
      mlog.setIndirect(condition.get("flwNick").toString());
      mlog.setAct("fl");
      mlog.setUrl("../reviewFeed/Feed?id="+ condition.get("flw"));
      
      mlogDao.insert(mlog);
      
      
         if(flwDao.flwadd(condition)>0)
            return true;
         else
             return false;
                    
    }
    
    
    @Override
    public boolean flwCheck(int mno, int flw) {
        Map<String, Object> condition = new HashMap<>();
        condition.put("mno", mno);
        condition.put("flw", flw);
        
        return flwDao.flwCheck(condition);
    }
 
}
