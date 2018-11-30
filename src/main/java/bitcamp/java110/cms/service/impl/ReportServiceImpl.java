package bitcamp.java110.cms.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import bitcamp.java110.cms.dao.ReportDao;
import bitcamp.java110.cms.dao.ReportTypeDao;
import bitcamp.java110.cms.domain.Report;
import bitcamp.java110.cms.service.ReportService;

@Service
public class ReportServiceImpl implements ReportService {

  @Autowired ReportDao reportDao;
  @Autowired ReportTypeDao reportTypeDao;
  
  @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
  @Override
  public boolean add(Report report) {
    
    if (reportDao.insert(report) > 0) {
      List<String> types = report.getTypes();
      for(String t:types) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("rptno", report.getRptno());
        params.put("type", t);
        
        reportTypeDao.insert(params);
      }
      return true;
    } else {
      return false;
    }
    
  }

  @Override
  public List<Report> list(int pageNo, int pageSize) {
    HashMap<String, Object> params = new HashMap<>();
    params.put("rowNo", (pageNo - 1)*pageSize);
    params.put("size", pageSize);
    return reportDao.findAll(params);

  }

  @Override
  public Report get(int no) {
    return reportDao.findByNo(no);
  }

  @Override
  public void delete(int no) {
    if (reportDao.delete(no) == 0) {
      throw new RuntimeException("해당 번호의 데이터가 없습니다.");
    }
    reportTypeDao.delete(no);
    
  }


}
