package bitcamp.java110.cms.service.impl;

import java.util.Map;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.service.AuthService2;

@Service
public class AuthServiceImpl2 implements AuthService2 {

  @Override
  public Member getMember(String email, String password) {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public Member getKakaoMember(String accessToken) {
    
    RestTemplate restTemplate = new RestTemplate();
    
    @SuppressWarnings("rawtypes")
    Map response = restTemplate.getForObject(
        "https://kapi.kakao.com/v2/user/me?access_token={v1}", 
        Map.class,
        accessToken);
    
    System.out.println("사용자 정보 요청 결과" + response);
    
    return null;
  }


    
    
    
    
}
