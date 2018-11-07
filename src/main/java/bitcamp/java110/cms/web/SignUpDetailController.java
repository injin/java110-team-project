package bitcamp.java110.cms.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/signupDetail")
public class SignUpDetailController {
    
    @RequestMapping("/detailForm")
    public String detailForm() {
        return "auth/detailForm";
    }
    
    @PostMapping("/add")
    public void detail() {
        System.out.println();
    }
    
}
