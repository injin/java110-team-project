package bitcamp.java110.cms.web;

import javax.servlet.http.HttpServletRequest;
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
            HttpServletRequest request,
            HttpSession session) {
       
       //System.out.println(request.getServletPath());
       System.out.println("token: " + accessToken);
       
       Member loginUser = authService2.getKakaoMember(accessToken);
       
       
       return "redirect:/app/";
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:form";
    }
}
