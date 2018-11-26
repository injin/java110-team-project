package bitcamp.java110.cms.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bitcamp.java110.cms.domain.Member;

@Controller
@RequestMapping("/stsc")
public class StatisticController {

    @RequestMapping("/list")
    public String stis(
            Model model,
            HttpSession session
            ) {
        
        Member member = (Member)session.getAttribute("loginUser");
        
        Map<String,Object> condition = new HashMap<>();
        condition.put("mno", member.getMno());
        
   /*     List<Integer> favGrList = member.getFavGrList(condition);*/
        
        System.out.println(member.getMno());
        
        return "staticstic";
    }
    
    
}
