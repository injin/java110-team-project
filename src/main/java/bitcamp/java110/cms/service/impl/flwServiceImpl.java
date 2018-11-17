package bitcamp.java110.cms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bitcamp.java110.cms.dao.FlwDao;
import bitcamp.java110.cms.domain.Flw;
import bitcamp.java110.cms.service.FlwService;

@Service
public class flwServiceImpl implements FlwService{

     @Autowired
     FlwDao flwDao;

/*    @Override
    public void addFlw(Flw ms) {

        flwDao.insert(ms);
    }*/

   @Override
    public List<Flw> list(int no) {

        return flwDao.flwlist(no);
       
    }


 /*   @Override
    public Flw get(int no) {

        return flwDao.findByNo(no);
    }


    @Override
    public void delete(int no) {

        flwDao.delete(no);

    }
*/

}
