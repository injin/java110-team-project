package bitcamp.java110.cms.web;

import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.service.AuthService2;

@Controller
@RequestMapping("/auth2")
public class AuthController2 {
    
    AuthService2 authService2;
    
    public AuthController2(AuthService2 authService2) {
        super();
        this.authService2 = authService2;
    }

    @RequestMapping("/kakaologin")
    public String login(
            String accessToken,
            HttpSession session) {
       
      Map<String, Object> kakaoResponse = authService2.getKakaoResponse(accessToken);
      Member member = authService2.getMemberById(
          kakaoResponse.get("id").toString());
      
      // 기존에 가입된 사용자이면
      if (member != null) {
        session.setAttribute("loginUser", member);
        return "redirect:/app/";
      }
      
      // 기존에 가입된 사용자가 아니면
      member = authService2.addMember(kakaoResponse);
       return "redirect:/app/"; //TODO 추가 정보 입력 페이지로 리다이렉트
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:form";
    }
}
