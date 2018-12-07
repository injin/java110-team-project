package bitcamp.java110.cms.web.statistic;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.domain.Post;
import bitcamp.java110.cms.domain.Statistic;
import bitcamp.java110.cms.service.PostService;
import bitcamp.java110.cms.service.StatisticService;

@Controller
@RequestMapping("/stsc")
public class StatisticController {

  @Autowired
  StatisticService stscService;
  
  @Autowired
  PostService postService;
  
  @RequestMapping("/list")
  public String stsc(
     Post post,
     Model model,
     HttpSession session
     ) {
  
    model.addAttribute("targetUser", session.getAttribute("loginUser"));
    Member member = (Member)session.getAttribute("loginUser");
    int mno = member.getMno();
    
    List<Statistic> postData = stscService.list(mno);
    
    List<Statistic> mvTitl = stscService.list2(mno);
    
    model.addAttribute("postData", postData);
    model.addAttribute("mvTitl" , mvTitl);
    
    return "statis/tic";
  }
  
  
}
