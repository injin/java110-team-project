package bitcamp.java110.cms.service;

import java.util.List;

import bitcamp.java110.cms.domain.Ms;


public interface MsService {
    void add(Ms ms);
    List<Ms> list();
    Ms get(int no);
    void delete(int no);
    
}
