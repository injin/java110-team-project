package bitcamp.java110.cms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bitcamp.java110.cms.dao.MsDao;
import bitcamp.java110.cms.domain.Ms;
import bitcamp.java110.cms.service.MsService;

@Service
public class MsServiceImpl implements MsService{

    @Autowired
    MsDao msDao;

    @Override
    public void add(Ms ms) {

        msDao.insert(ms);
    }


    @Override
    public List<Ms> list() {

        return msDao.viewlist();
    }

    @Override
    public Ms get(int no) {

        return msDao.findByNo(no);
    }


    @Override
    public void delete(int no) {

        msDao.delete(no);

    }

   

}
