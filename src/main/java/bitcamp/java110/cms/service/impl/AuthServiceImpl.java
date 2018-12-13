package bitcamp.java110.cms.service.impl;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;
import bitcamp.java110.cms.dao.FavGenreDao;
import bitcamp.java110.cms.dao.MemberDao;
import bitcamp.java110.cms.dao.SceneAlbumDao;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.domain.SceneAlbum;
import bitcamp.java110.cms.service.AuthService;
import bitcamp.java110.cms.service.MemberService;

@Service
public class AuthServiceImpl implements AuthService {
  
  @Autowired MemberDao memberDao;
  @Autowired FavGenreDao favGenreDao;
  @Autowired MemberService memberService;
  @Autowired SceneAlbumDao sceneAlbumDao;

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
  
  @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
  @Override
  public Member addMember(Map<String, Object> kakaoResponse) {
    
    @SuppressWarnings("unchecked")
    Map<String, Object> properties = (Map<String, Object>)kakaoResponse.get("properties");
    @SuppressWarnings("unchecked")
    Map<String, Object> kakaoAccount = (Map<String, Object>)kakaoResponse.get("kakao_account");
    
    Member newbie = new Member();
    newbie.setAdmin(false);
    newbie.setId(kakaoResponse.get("id").toString());
    
    if (properties != null && properties.get("nickname") != null) {
      newbie.setNickname(properties.get("nickname").toString());
    } else {
      newbie.setNickname("(알수없음)");
    }
    if (properties != null && properties.get("profile_image") != null
          && properties.get("profile_image") != "") {
      newbie.setProfileImage(properties.get("profile_image").toString());
    }
    
    if (kakaoAccount.get("gender") != null) {
      newbie.setGender(kakaoAccount.get("gender").toString().substring(0, 1));
    }
    if (kakaoAccount.get("age_range") != null) {
      newbie.setAgeRange(kakaoAccount.get("age_range").toString());
    }
    
    if(memberDao.insert(newbie) > 0) {
      Map<String, Object> condition = new HashMap<>();
      condition.put("mno", newbie.getMno());
      condition.put("sceneAlbum", new SceneAlbum("기본 앨범", true));
      sceneAlbumDao.insert(condition);
    }
    return newbie;
  }
  
  @Transactional(rollbackFor = Exception.class)
  @Override
  public void signOut(int mno) {
    memberService.signOut(mno);
  }
}
