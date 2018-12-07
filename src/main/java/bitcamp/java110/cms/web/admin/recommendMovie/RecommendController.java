package bitcamp.java110.cms.web.admin.recommendMovie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.java110.cms.domain.Theme;
import bitcamp.java110.cms.service.RecommendService;

@Controller
@RequestMapping("/admin")
public class RecommendController {

  @Autowired RecommendService recommendService;
  
  public RecommendController(RecommendService recommendService) {
    this.recommendService = recommendService;
  }

  @RequestMapping("/themeList")
  public String themeList(
      Model model){
      
    model.addAttribute("theme", recommendService.getAllTitle());
    System.out.println(recommendService.getAllTitle());  
    //rptPaging.setTotalCount(reportService.getTotalCnt());
       
       //Map<String, Object> condition = new HashMap<>();
       //List<Report> reportlist = reportService.list(condition);
      
       //model.addAttribute("findAll", reportlist);
      
      return "admin/recommend";
    
  }
  
  @RequestMapping("/addList")
  public String addList(
      Theme theme,
      Model model){
      
    System.out.println("addList:" + theme);
    model.addAttribute("theme", theme);
       
       //Map<String, Object> condition = new HashMap<>();
       //List<Report> reportlist = reportService.list(condition);
      
       //model.addAttribute("findAll", reportlist);
      
      return "admin/add";
    
  }

}
