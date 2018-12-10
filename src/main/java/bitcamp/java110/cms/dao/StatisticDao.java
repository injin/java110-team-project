package bitcamp.java110.cms.dao;

import java.util.List;

import bitcamp.java110.cms.domain.Statistic;

public interface StatisticDao {

    
    List<Statistic> postData(int no);
    List<Statistic> mvTitl(int no);
    List<Integer> topGrFilt(int mno);
}
