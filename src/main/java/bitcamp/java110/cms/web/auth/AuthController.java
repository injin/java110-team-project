package bitcamp.java110.cms.web.auth;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
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
            HttpSession session,
            HttpServletRequest request) {
      
      Map<String, Object> kakaoResponse = authService.getKakaoResponse(accessToken);
      Member member = authService.getMemberById(
          kakaoResponse.get("id").toString());
      
      // 기존에 가입된 사용자이면
      if (member != null) {
        session.setAttribute("loginUser", member);
        String originPath = request.getHeader("referer");
        return "redirect:" + originPath.substring(originPath.indexOf("/app"));
//        return "redirect:/app/";
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
    
    
    /**
     * 제하 To Do
     * kakao 연동 해제
     * 
     */
    @RequestMapping("/signout")
    public String signout(
        String accessToken,
        HttpSession session) {
      
      System.out.println(accessToken);
      
      //    세션에 저장된 로그인 유저
      Member escaper = (Member)session.getAttribute("loginUser");
      System.out.println(escaper);
      //    비로그인 유저가 들어온다면 돌려보냄.
      if (escaper != null) {
        return "redirect:/app/";
      }
//      Map<String, Object> kakaoUnlink = authService.getOut(accessToken);
      
      
      
      session.invalidate();
      return "redirect:/app/";
    }
}
