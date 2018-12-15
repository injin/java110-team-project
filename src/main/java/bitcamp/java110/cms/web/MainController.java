package bitcamp.java110.cms.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.java110.cms.common.Constants;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.domain.Post;
import bitcamp.java110.cms.domain.SceneAlbum;
import bitcamp.java110.cms.domain.SceneReview;
import bitcamp.java110.cms.domain.SceneReviewCmt;
import bitcamp.java110.cms.service.FlwService;
import bitcamp.java110.cms.service.MemberService;
import bitcamp.java110.cms.service.PostService;
import bitcamp.java110.cms.service.SceneAlbumService;
import bitcamp.java110.cms.service.SceneReviewService;
import info.movito.themoviedbapi.TmdbSearch;
import info.movito.themoviedbapi.model.core.MovieResultsPage;

@Controller
public class MainController {
  
  @Autowired TmdbSearch tmdbSearch;
  @Autowired PostService postService;
  @Autowired MemberService memberService;
  @Autowired SceneReviewService sceneReviewService;
  @Autowired SceneAlbumService sceneAlbumService;
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
    
    List<Post> topMpList = postService.getHotPosts(); //핫리뷰리스트
    postService.setMovieInfo(topMpList);
    model.addAttribute("topMpList", topMpList);
    model.addAttribute("posterPrefix", Constants.TMDB_IMG_PREFIX_W500);
    
    List<SceneReview> topSrList = sceneReviewService.listTopSrByCdt(); //인기있는 장면 리스트
    model.addAttribute("topSrList", topSrList);
    
    List<SceneAlbum> listScA = sceneAlbumService.listScA(); //장면앨범 리스트
    model.addAttribute("albumList", listScA);
    return "main";
    
  }

  @RequestMapping("/search")
  public String search() {
    
    return "/search/search";
  }

  @RequestMapping("/searchResult")
  public String searchResult(
      String keyword,
      HttpSession session,
      Model model) throws Exception{
    
    // 회원 찾기
    List<Member> memberList = memberService.findByNick(keyword);
        
    // 장면 앨범
    List<SceneAlbum> albumList = sceneAlbumService.getListByKeyword(keyword);

    // 장면리뷰 댓글 해시태그 
    List<SceneReviewCmt> sceneHashList = sceneReviewService.getListByKeyword(keyword);
    
    // 해쉬태그
    Member member = ((Member)session.getAttribute("loginUser"));
    Map<String, Object> params = new HashMap<>();
    params.put("mno", (member==null)?0:member.getMno());
    params.put("prevpstno", "forKeyword");
    params.put("keyword", keyword);

    List<Post> hashList = postService.getPosts(params);
    
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
    model.addAttribute("albumList", albumList);
    model.addAttribute("sceneHashList", sceneHashList);
    model.addAttribute("totalPages", response.getTotalPages());
    model.addAttribute("totalResults", response.getTotalResults());

    return "/search/search";
  }

  
}
