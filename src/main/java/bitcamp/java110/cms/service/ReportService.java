package bitcamp.java110.cms.service;

import java.util.List;
import bitcamp.java110.cms.domain.Report;

public interface ReportService {
  
    boolean add (Report report);
    List<Report> list(int pageNo, int pageSize);
    Report get(int no);
    void delete(int no);
}
