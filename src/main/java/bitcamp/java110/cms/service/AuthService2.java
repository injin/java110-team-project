package bitcamp.java110.cms.service;

import bitcamp.java110.cms.domain.Member;

public interface AuthService2 {
    Member getMember(String email, String password);
    Member getKakaoMember(String accessToken);
}
