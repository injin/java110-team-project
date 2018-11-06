package bitcamp.java110.cms.web;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.java110.cms.service.AuthService;

@Controller
@RequestMapping("/auth2")
public class AuthController2 {
    
    AuthService authService;
    
    public AuthController2(AuthService authService) {
        super();
        this.authService = authService;
    }
    

    @RequestMapping("/kakaologin")
    public String login(
            String accessToken,
            HttpSession session) {
        
       System.out.println("token"+accessToken);
       return "redirect:/";
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:form";
    }
}
