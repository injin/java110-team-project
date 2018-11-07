package bitcamp.java110.cms.web;

import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/signupDetail")
public class SignUpDetailController {
    
    @RequestMapping("/detailForm")
    public String detailForm(Model model) {
      
      //  model.addAttribute("genreList", genreList);
      
        return "/auth/form";
    }
    
    @GetMapping("/asd")
    public void detail(Map data) {
      System.out.println(data);
        System.out.println("aasd");
    }
    
}
