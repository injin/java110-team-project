package bitcamp.java110.cms.service;

import java.util.List;
import java.util.Map;
import bitcamp.java110.cms.domain.Member;


public interface FlwService {

  List<Member> list(Map<String,Object> condition);
  List<Member> listAll(int mno);
  int getTotalCnt(int mno);
  boolean delete(int mno, int flw);
  boolean add(Map<String,Object> condition);
  boolean flwCheck(int mno, int flw);
}
