package bitcamp.java110.cms.web.follow;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    
    public FlwController(FlwService flwService, FlwDao flwDao) {
        super();
        this.flwService = flwService;
        this.flwDao = flwDao;
    }


    @RequestMapping("flwlist")
    public String flwlist(
            @RequestParam(defaultValue="1") int pageNo, 
            @RequestParam(defaultValue="5")  int pageSize,
            Model model,
            HttpSession session) {

         FlwPaging flwpaging = new FlwPaging();
         Member member = (Member) session.getAttribute("loginUser");
         
         
        flwpaging.setTotalcount(flwDao.getTotalCount(member.getMno()));
        flwpaging.setPageNo(pageNo);
        flwpaging.setPageSize(pageSize);
        flwpaging.setLastblock(flwpaging.getTotalcount());
        
        flwpaging.prevnext(pageSize);
        flwpaging.setStartPage(flwpaging.getCurrentblock());
        flwpaging.setEndPage(flwpaging.getLastblock(), flwpaging.getCurrentblock());
       
        System.out.println(flwpaging);
        
     
        Map<String,Object> condition = new HashMap<>();
        condition.put("mno", member.getMno());
        condition.put("pageNo", flwpaging.getPageNo());
        condition.put("pageSize", flwpaging.getPageSize());
        
        System.out.println(condition);
        
        List<Member> flwList = flwService.list(condition);
          
          
        model.addAttribute("flwlist" , flwList);
        model.addAttribute("flwpaging" , flwpaging);
        
        
        
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