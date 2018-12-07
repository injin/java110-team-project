package bitcamp.java110.cms.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error")
public class ErrorController {
  
  @RequestMapping("notLogged")
  public String notLogged() {
    
    return "error/notLogged";
  }
  
  @RequestMapping("notAdmin")
  public String notAdmin() {
    
    return "error/notAdmin";
  }
  
}
