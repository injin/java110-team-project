package bitcamp.java110.cms.web.log;

import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.java110.cms.dao.MemberDao;
import bitcamp.java110.cms.dao.MlogDao;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.domain.Mlog;
import bitcamp.java110.cms.service.MlogService;

@Controller
public class MlogController {
 
  @Autowired MlogService mlogservice;
  @Autowired MlogDao mlogDao;
  @Autowired ServletContext sc;
  @Autowired MemberDao memberDao;
  
  @RequestMapping("/mloglist")
  public String list(Model model,
      HttpSession session) {
    
    Member member = (Member)session.getAttribute("loginUser");
    int mno = member.getMno();
    
    List<Mlog> logList = mlogservice.getList(mno);
    System.out.println(logList);
    
    model.addAttribute("list", logList);
    
    
    return "log/mloglist";
  }
  


}
