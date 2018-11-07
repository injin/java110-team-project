package bitcamp.java110.cms.service;

import java.util.Map;
import bitcamp.java110.cms.domain.Member;

public interface AuthService2 {
  
  Member getMemberById(String id);
  Map<String, Object> getKakaoResponse(String accessToken);
  Member addMember(Map<String, Object> kakaoResponse);
  
}
