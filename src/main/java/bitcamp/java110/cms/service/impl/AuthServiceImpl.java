package bitcamp.java110.cms.service.impl;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import bitcamp.java110.cms.dao.FavGenreDao;
import bitcamp.java110.cms.dao.MemberDao;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.service.AuthService;

@Service
public class AuthServiceImpl implements AuthService {
  
  @Autowired MemberDao memberDao;
  @Autowired FavGenreDao favGenreDao;

  @Override
  public Member getMemberById(String id) {
    return memberDao.findById(id);
  }

  @Override
  public Map<String, Object> getKakaoResponse(String accessToken) {
    
    @SuppressWarnings({"unchecked"})
    Map<String, Object> response = new RestTemplate().getForObject(
        "https://kapi.kakao.com/v2/user/me?access_token={v1}",
        Map.class,
        accessToken);
    
    return response;
  }
  
  @Override
  public Member addMember(Map<String, Object> kakaoResponse) {
    
    @SuppressWarnings("unchecked")
    Map<String, Object> properties = (Map<String, Object>)kakaoResponse.get("properties");
    @SuppressWarnings("unchecked")
    Map<String, Object> kakaoAccount = (Map<String, Object>)kakaoResponse.get("kakao_account");
    
    Member newbie = new Member();
    newbie.setAdmin(false);
    newbie.setId(kakaoResponse.get("id").toString());
    newbie.setNickname(properties.get("nickname").toString());
    if (properties.get("profile_image") != null) {
      newbie.setProfileImage(properties.get("profile_image").toString());
    }
    
    if (kakaoAccount.get("gender") != null) {
      newbie.setGender(kakaoAccount.get("gender").toString().substring(0, 1));
    }
    if (kakaoAccount.get("age_range") != null) {
      newbie.setAgeRange(kakaoAccount.get("age_range").toString());
    }
    
    memberDao.insert(newbie);
    return newbie;
  }
  
  /**
   * 제하 To Do
   * kakao 연동 해제
   */
  @Override
  public void signOut(int mno) {
    
    favGenreDao.signOut(mno);
    memberDao.signOut(mno);
  }
}
