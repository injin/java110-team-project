package bitcamp.java110.cms.service;

import java.util.List;
import java.util.Map;

import bitcamp.java110.cms.domain.Report;

public interface ReportService {
  
    boolean add (Report report);
    List<Report> list(Map<String, Object> condition);
    void delete(int no);
    boolean checkReported(String target, int mno);
    boolean addHcont(Report report);
    int getTotalCnt();
}
