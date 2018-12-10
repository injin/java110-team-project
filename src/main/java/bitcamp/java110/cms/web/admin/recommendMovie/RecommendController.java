package bitcamp.java110.cms.web.admin.recommendMovie;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bitcamp.java110.cms.domain.Movie;
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
    model.addAttribute("movieList", recommendService.getRcmdMvList(theme.getThmno()));
       //Map<String, Object> condition = new HashMap<>();
       //List<Report> reportlist = reportService.list(condition);
      
       //model.addAttribute("findAll", reportlist);
      
      return "admin/add";
    
  }

  @RequestMapping("/save")
  public String save(
      @RequestParam(name="favMvIdList", required=true)
      List<Integer> mvnoList,
      @RequestParam(name="favMvTitleList", required=false)
      List<String> titleList,
      Theme theme,
      Model model){
    
    System.out.println();
    System.out.println(mvnoList.size());
    System.out.println(titleList.size());
    System.out.println(titleList);
    List<Movie> movieList = new ArrayList<>();
    for(int i=0; i<mvnoList.size(); i++) {
      movieList.add(new Movie(mvnoList.get(i), titleList.get(i)));
    }
      
    recommendService.addMovieList(theme, movieList);
    
    //System.out.println(recommendService.addMovieList(theme, movieList));
    /*
    List<Theme> themes = new ArrayList<>();
    System.out.println();
    System.out.println("save: " + theme);
    for(Integer mvno : mvnoList) {
      theme.setMvno(mvno);
      themes.add(theme);
    System.out.println("save: " + mvnoList);
    }*/
    model.addAttribute("theme", recommendService.getAllTitle());
       
       //Map<String, Object> condition = new HashMap<>();
       //List<Report> reportlist = reportService.list(condition);
      
       //model.addAttribute("findAll", reportlist);
      
      return "admin/recommend";
    
  }

}
