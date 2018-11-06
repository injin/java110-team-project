package bitcamp.java110.cms.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class reviewListController {
  
  @RequestMapping("/reviewFeedList")
  public String main() {
    System.out.println("리뷰피드리스트에 들어옴");
    return "reviewFeedList";
  }

}
