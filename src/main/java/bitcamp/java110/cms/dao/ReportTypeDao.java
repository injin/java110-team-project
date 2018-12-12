package bitcamp.java110.cms.dao;

import java.util.List;
import java.util.Map;
import bitcamp.java110.cms.domain.ReportType;

public interface ReportTypeDao {
  
  int insert(Map<String, Object> params);
  List<ReportType> findByNo(int rptno);
}
