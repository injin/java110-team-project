package bitcamp.java110.cms.web.recommendMovie;

import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.java110.cms.service.RecommendService;
import info.movito.themoviedbapi.TmdbMovies;

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
 * Fake Data List를 더 만들어서 randomMath로 불러오기 어떨지?
 * 화면 불러 오는 속도가 문제는 어떻게 해결 해야 할지?
 *  
 * 회원 취향 테이블에서 pnt가 높은 영화 2개 similarMovies List 받아서 보여주기. 
 * 
 */

@Controller
@RequestMapping("/rcmd")
public class RecommendMvController {
  
  @Autowired ServletContext sc;
  @Autowired TmdbMovies tmdbMovies;
  @Autowired RecommendService rcmdService;
  
  
  public RecommendMvController(RecommendService rcmdService) {
    super();
    this.rcmdService = rcmdService;
  }
  
  @RequestMapping("/list")
  public String list (Model model) {
    
    int[] n = rcmdService.RandomNums();
    
    model.addAttribute("listName1", rcmdService.getListName(n[0]));
    model.addAttribute("list1", rcmdService.getList(n[0]));
    model.addAttribute("listName2", rcmdService.getListName(n[1]));
    model.addAttribute("list2", rcmdService.getList(n[1]));
//    model.addAttribute("listName3", rcmdService.getListName(n[2]));
//    model.addAttribute("list3", rcmdService.getList(n[2]));
    
    return "/recommend/list";
  }
  
  
  
}
