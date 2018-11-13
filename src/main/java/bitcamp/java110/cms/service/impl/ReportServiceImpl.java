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
  
  @Transactional(
      // 트랜잭션 관리자의 이름이 transactionPost 라면
      // 다음 속성은 생략해도 된다.
      //transactionPost="transactionPost",

      // 이 메서드를 호출하는 쪽에 이미 트랜잭션이 있으면 그 트랜잭션에 소속되게 하고,
      // 없으면 새 트랜잭션을 만들어서 수행한다.
      // 기본 값은 propagation=Propagation.REQUIRED 이다.
      propagation=Propagation.REQUIRED,

      // 메서드를 실행 중에 Exception 예외가 발생하면 rollback을 수행한다.
      rollbackFor=Exception.class
      )
  
  @Override
  public void add(Report report) {
    
    reportDao.insert(report);
    System.out.println(report);
    List<String> types = report.getTypes();
    for(String t:types) {
      HashMap<String, Object> params = new HashMap<>();
      params.put("rptno", report.getRptno());
      params.put("type", t);
      
      reportTypeDao.insert(params);
    }
    System.out.println(report);
    
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
