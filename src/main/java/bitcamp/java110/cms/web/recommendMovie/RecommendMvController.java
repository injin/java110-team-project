package bitcamp.java110.cms.web.recommendMovie;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import bitcamp.java110.cms.common.Constants;
import bitcamp.java110.cms.dao.MovieAnlyDao;
import bitcamp.java110.cms.dao.MovieDao;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.service.RecommendService;
import info.movito.themoviedbapi.TmdbMovies;
import info.movito.themoviedbapi.model.core.MovieResultsPage;

/**
 * @author Jeaha
 * 영화 추천을 위한 QUARTET
 * 
 * 회원 영화 취향 분석 테이블 -> mv_mv_anly
 * 최초 등록한 영화는 10점씩 point를 줬음.
 * 활동 로그를 바탕으로 영화별 점수를 줘야 함.
 * 
 * 등록시 취향 장르 테이블 -> mv_memb_gr
 * 활동 로그를 바탕으로 회원 영화 취향 장르 분석 테이블 -> mv_gr_anly
 * 
 * 세 테이블을 분석해서 영화 추천을 해야 함.
 * 
 * 기존 기록에 있는 영화들 분석해서 취향 저격 영화 추천 해 주는 list 1개 출력.
 * 기존 기록에 있는 영화 기반 추천 list 2개 3개,
 * folow한 member 중 취향이 비슷한 member의 추천 리스트를 같이 추천해 주는 메소드 1개
 * 그리고 관리자 추천영화 리스트 다수가 있으면 좋을것 같음.
 * 
 * 연결된 source
 * RecommendMvController
 * recommend/recommend.jsp
 * RecormendService
 * RecormendServiceImple
 * RecommendDao
 * RecommendDao.xml
 * 
 * 
 * 취향 분석까지 들어가기엔 시간이 모자르니 simmilarList로 대체하고 시간이 남는다면 하자.
 * 
 */

@Controller
@RequestMapping("/rcmd")
public class RecommendMvController {
  
  @Autowired TmdbMovies tmdbMovies;
  @Autowired RecommendService rcmdService;
  @Autowired MovieAnlyDao anlyDao;
  @Autowired MovieDao mvDao;
  
  public RecommendMvController(RecommendService rcmdService) {
    super();
    this.rcmdService = rcmdService;
  }
  
  @RequestMapping("anly")
  public String waiting() {
    System.out.println("list 진입 시도");
    return "/recommend/anly";
  }
  
  @RequestMapping("/list")
  public String list (Model model,
      HttpSession session) {
    
    System.out.println("LIST REQUEST START");
    
    int[] n = rcmdService.RandomNums(rcmdService.getCount());
    System.out.println("[" + n[0] + ", " + n[1] + "]");
    model.addAttribute("listName1", rcmdService.getListName(n[0]));
    model.addAttribute("list1", rcmdService.getList(n[0]));
    model.addAttribute("listName2", rcmdService.getListName(n[1]));
    model.addAttribute("list2", rcmdService.getList(n[1]));
    System.out.println("\nREQUEST COMPLETE\n");
    return "/recommend/list";
  }
  
  @RequestMapping(value="/smlrList")
  public @ResponseBody Map<String, Object> smlrListById (
      HttpSession session) throws Exception {
    
    System.out.println("smlrList REQUEST START");
    
    int triggerMvId = anlyDao.getOneFav(((Member)session.getAttribute("loginUser")).getMno());
    MovieResultsPage smlrList =  tmdbMovies.getSimilarMovies(triggerMvId, Constants.LANGUAGE_KO, 1);
    
    Map<String, Object> returnValue= new HashMap<>();
    returnValue.put("triggerTitle", mvDao.getTitleById(triggerMvId));
    returnValue.put("smlrList", smlrList.getResults());
    
    System.out.println("\nsmlr REQUEST COMPLETE\n");
    return returnValue;
  }
}
