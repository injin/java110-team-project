package bitcamp.java110.cms.web;

import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.java110.cms.common.Constants;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.domain.Post;
import bitcamp.java110.cms.domain.SceneReview;
import bitcamp.java110.cms.service.FlwService;
import bitcamp.java110.cms.service.MemberService;
import bitcamp.java110.cms.service.PostService;
import bitcamp.java110.cms.service.SceneReviewService;
import info.movito.themoviedbapi.TmdbSearch;
import info.movito.themoviedbapi.model.core.MovieResultsPage;

@Controller
public class MainController {
  
  @Autowired TmdbSearch tmdbSearch;
  @Autowired PostService postService;
  @Autowired MemberService memberService;
  @Autowired SceneReviewService sceneReviewService;
  @Autowired FlwService flwService;
  
  ServletContext sc;
  

  public MainController(PostService postService, MemberService memberService,
      ServletContext sc) {
    this.postService = postService;
    this.memberService = memberService;
    this.sc = sc;
  }

  @RequestMapping("/")
  public String main(Model model, HttpSession session) {
    
    Member member = (Member) session.getAttribute("loginUser");
    
    if(member != null) {
      List<Member> flwList = flwService.listAll(member.getMno());
      model.addAttribute("userFlwList", flwList); // 로그인한사람의 팔로우리스트저장
    }
    
    List<Post> topMpList = postService.listTopMp();
    List<SceneReview> topSrList = sceneReviewService.listTopSr();
    model.addAttribute("topSrList", topSrList);
    model.addAttribute("topMpList", topMpList);
    System.out.println(topMpList);
    return "main";
    
  }

  @RequestMapping("/search")
  public String search() {
    
    return "/search/search";
  }

  @RequestMapping("/searchResult")
  public String searchResult(
      String keyword,
      Model model) throws Exception{

    System.out.println(keyword);
    
    // 회원 찾기
    List<Member> memberList = memberService.findByNick(keyword);
    
    // 해쉬태그
    List<Post> hashList = postService.findByKeyword(keyword);
    //System.out.println(hashList.toString());
    
    // 영화 찾기
    MovieResultsPage response = tmdbSearch.searchMovie(
        keyword
        ,null
        , Constants.LANGUAGE_KO
        , Constants.INCLUDE_ADULT_TRUE
        , 0);
   
    model.addAttribute("keyword", keyword);
    model.addAttribute("movieList", response.getResults());
    model.addAttribute("imgPrefix", Constants.TMDB_IMG_PREFIX_W500);
    model.addAttribute("hashList", hashList);
    model.addAttribute("memberList", memberList);
    model.addAttribute("totalPages", response.getTotalPages());
    model.addAttribute("totalResults", response.getTotalResults());

    System.out.println("reponse: "+response.getResults().size());
    System.out.println("imgPrefix: "+ Constants.TMDB_IMG_PREFIX_W500);
    //System.out.println(model.toString());
    return "/search/search";
  }

  
}
