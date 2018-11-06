package bitcamp.java110.cms.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
  
  @RequestMapping("/")
  public String main() {
    System.out.println("메인 컨트롤러에 들어옴");
    return "index";
    
  }
}
