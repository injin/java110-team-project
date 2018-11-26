package bitcamp.java110.cms.service;

import java.util.List;
import java.util.Map;
import bitcamp.java110.cms.domain.Member;


public interface FlwService {

  List<Member> list(Map<String,Object> condition);
  List<Member> listAll(int mno);
  int getTotalCnt(int mno);
  void delete(Map<String,Object> condition);
  void add(Map<String,Object> condition);
}
