package bitcamp.java110.cms.web.follow;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bitcamp.java110.cms.dao.FlwDao;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.service.FlwService;

@Controller
@RequestMapping("/flw")
public class FlwController {


    @Autowired
    FlwService flwService;

    @Autowired 
    FlwDao flwDao;

    @RequestMapping("flwlist")
    public String flwlist(Model model,
            HttpSession session) {

        Member member = (Member) session.getAttribute("loginUser");
        List<Member> a = flwService.list(member.getMno());
        model.addAttribute("flwlist" , a);

        return "follow/flwlist";

    }

 
    @RequestMapping("flwadd")
    public void addFlw(int flw, HttpSession session) {
        
        Member member = (Member) session.getAttribute("loginUser");
        
        int mno = member.getMno();
        
        Map<String,Object> condition =  new HashMap<>();
        condition.put("mno", mno);
        condition.put("flw", flw);
        
        
        flwService.add(condition);
    }
    
   @RequestMapping("flwdelete")
    public String deleteFlw(int flw,
            HttpSession session) {
        
       Member member = (Member)session.getAttribute("loginUser");
       int mno = member.getMno();
       
       Map<String,Object> condition =  new HashMap<>();
       condition.put("mno", mno);
       condition.put("flw", flw);
       
        flwService.delete(condition);
        
        return "redirect: flwlist";
    }
    
  
}
