package bitcamp.java110.cms.service;

import java.util.List;
import bitcamp.java110.cms.common.Paging;
import bitcamp.java110.cms.domain.Report;

public interface ReportService {
  
    boolean add (Report report);
    List<Report> list(Paging paging);
    boolean checkReported(String target, int mno);
    boolean addHcont(Report report);
    int getTotalCnt();
    boolean updateHcont(Report report);
}
