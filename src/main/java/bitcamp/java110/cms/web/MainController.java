package bitcamp.java110.cms.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
  
  @RequestMapping("/")
  public String main() {
    
    return "index";
  }

  @RequestMapping("/search")
  public String search() {
    
    return "/search/search";
  }

  
}
