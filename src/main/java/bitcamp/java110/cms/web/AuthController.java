package bitcamp.java110.cms.web;

import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.service.AuthService;

@Controller
@RequestMapping("/auth")
public class AuthController {
    
    AuthService authService;
    
    public AuthController(AuthService authService2) {
        super();
        this.authService = authService2;
    }

    @RequestMapping("/kakaologin")
    public String login(
            String accessToken,
            HttpSession session) {
       
      Map<String, Object> kakaoResponse = authService.getKakaoResponse(accessToken);
      Member member = authService.getMemberById(
          kakaoResponse.get("id").toString());
      
      // 기존에 가입된 사용자이면
      if (member != null) {
        session.setAttribute("loginUser", member);
        return "redirect:/app/";
      }
      
      // 기존에 가입된 사용자가 아니면
      member = authService.addMember(kakaoResponse);
      session.setAttribute("loginUser", member);
      return "redirect:/app/signupDetail/detailForm";
    }
    
    @RequestMapping("/kakaologout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/app/";
    }
}
