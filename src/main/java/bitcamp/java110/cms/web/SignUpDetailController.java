package bitcamp.java110.cms.web;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.java110.cms.service.GenreService;

@Controller
@RequestMapping("/signupDetail")
public class SignUpDetailController {
  
    @Autowired GenreService genreService;
    
    @RequestMapping("/detailForm")
    public String detailForm(Model model) {
      
      model.addAttribute("genreList", genreService.getList());
      
      return "/auth/detailForm";
    }
    
    @GetMapping("/asd")
    public void detail(Map data) {
      System.out.println(data);
        System.out.println("aasd");
    }
    
}
