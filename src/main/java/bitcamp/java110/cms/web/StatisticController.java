package bitcamp.java110.cms.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bitcamp.java110.cms.domain.Member;

@Controller
@RequestMapping("/statistic")
public class StatisticController {

    @RequestMapping("/list")
    public String stis(
            Model model,
            HttpSession session
            ) {
        
        Member member = (Member)session.getAttribute("loginUser");
        int mno = member.getMno();
        List<Integer> favGrList = member.getFavGrList();
        
        
        return "staticstic";
    }
    
    
}
