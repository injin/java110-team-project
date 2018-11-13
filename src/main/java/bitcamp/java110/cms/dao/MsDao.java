package bitcamp.java110.cms.dao;

import java.util.List;

import bitcamp.java110.cms.domain.Ms;

public interface MsDao {

    List<Ms> viewlist(); 
    int insert(Ms ms);
    Ms findByNo(int no);
    int delete(int no);
    int update(Ms ms);
}
