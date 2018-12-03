package bitcamp.java110.cms.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import bitcamp.java110.cms.dao.StatisticDao;
import bitcamp.java110.cms.domain.Statistic;
import bitcamp.java110.cms.service.StatisticService;

@Service
public class StatisticServiceImpl implements StatisticService {

    
    @Autowired
    StatisticDao stscDao;
    
     @Override
    public List<Statistic> list(int no) {
         
        return stscDao.postData(no);
    }
     
     @Override
    public List<Statistic> list2(int no) {
        return stscDao.mvTitl(no);
    }
}
