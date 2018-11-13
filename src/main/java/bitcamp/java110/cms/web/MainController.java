package bitcamp.java110.cms.web;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.java110.cms.common.Constants;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.service.MemberService2;
import info.movito.themoviedbapi.TmdbSearch;
import info.movito.themoviedbapi.model.core.MovieResultsPage;

@Controller
public class MainController {
  
  @Autowired TmdbSearch tmdbSearch;
  @Autowired MemberService2 memberService;
  
  @RequestMapping("/")
  public String main() {
    
    return "index";
    
  }

  @RequestMapping("/search")
  public String search() {
    
    return "/search/search";
  }

  @RequestMapping("/searchResult")
  public String searchResult(
      String keyword,
      Model model) throws Exception{
       
    // 회원 찾기
    memberService.findByNick(keyword);
    
    // 영화 찾기
    MovieResultsPage response = tmdbSearch.searchMovie(
        keyword
        ,null
        , Constants.LANGUAGE_KO
        , Constants.INCLUDE_ADULT_TRUE
        , 0);
    
    model.addAttribute("movieList", response.getResults());
    model.addAttribute("imgPrefix", Constants.TMDB_POSTER_PREFIX);
    
    
    System.out.println(model.toString());
    return "/search/search";
  }

  
}
