package bitcamp.java110.cms.web.log;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import bitcamp.java110.cms.common.Constants;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.domain.Mlog;
import bitcamp.java110.cms.domain.Post;
import bitcamp.java110.cms.service.MlogService;
import bitcamp.java110.cms.service.PostService;

@Controller
@RequestMapping("/log")
public class MlogController {
 
  @Autowired MlogService mlogservice;
  @Autowired PostService postService;
  
  @RequestMapping("/mloglist")
  public String list(Model model,
      HttpSession session) {
    
    model.addAttribute("targetUser", session.getAttribute("loginUser"));
    Member member = (Member)session.getAttribute("loginUser");
    int mno = member.getMno();
    
    model.addAttribute("mpList", mlogservice.getListByType(mno, Constants.LOG_DO_TYPE_MP));
    
    model.addAttribute("dpList", mlogservice.getListByType(mno, Constants.LOG_DO_TYPE_DP));
    model.addAttribute("pcList", mlogservice.getListByType(mno, Constants.LOG_DO_TYPE_PC));
    model.addAttribute("scList", mlogservice.getListByType(mno, Constants.LOG_DO_TYPE_SC));
    model.addAttribute("frList", mlogservice.getListByType(mno, Constants.LOG_DO_TYPE_FR));
    model.addAttribute("srList", mlogservice.getListByType(mno, Constants.LOG_DO_TYPE_SR));
    
    return "log/mloglist";
  }
  
  @PostMapping("/more")
  public @ResponseBody List<Mlog> more(
      @RequestBody Map<String, Object> request,
      HttpSession session) {
    
    int mno = ((Member)session.getAttribute("loginUser")).getMno();
    int lastno = (int)request.get("lastno");
    String type = (String)request.get("type");
    
    return mlogservice.getListMore(mno, type, lastno);
  }
  
  @RequestMapping("/getPost")
  public @ResponseBody Post more(@RequestBody Map<String, Object> request) {
    
    int pstno = (int)request.get("pstno");
    Post post = postService.getOnePost(pstno);
    
    return post;
  }
}
