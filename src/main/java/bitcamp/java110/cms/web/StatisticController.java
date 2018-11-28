package bitcamp.java110.cms.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bitcamp.java110.cms.domain.Genre;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.domain.Statistic;
import bitcamp.java110.cms.service.StatisticService;

@Controller
@RequestMapping("/stsc")
public class StatisticController {

    @Autowired
    StatisticService stscService;
    
    
    @RequestMapping("/list")
    public String stsc(
            Genre genre,
            Model model,
            HttpSession session
            ) {
        
       Member member = (Member)session.getAttribute("loginUser");
       int mno = member.getMno();
       
       List<Statistic> stscLabel = stscService.list(mno);
       
       model.addAttribute("stscLabel", stscLabel);
       
       
       
       
        return "statistic";
    }
    
    
}
