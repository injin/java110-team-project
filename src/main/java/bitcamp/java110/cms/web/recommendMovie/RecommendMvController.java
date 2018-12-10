package bitcamp.java110.cms.web.recommendMovie;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import bitcamp.java110.cms.common.Constants;
import bitcamp.java110.cms.dao.MovieAnlyDao;
import bitcamp.java110.cms.dao.MovieDao;
import bitcamp.java110.cms.dao.StatisticDao;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.service.RecommendService;
import info.movito.themoviedbapi.TmdbMovies;
import info.movito.themoviedbapi.model.core.MovieResultsPage;

/**
 * @author Jeaha
 * 영화 추천을 위한 QUARTET
 * 
 * 연결된 source
 * RecommendMvController
 * recommend/anly.jsp
 * recommend/list.jsp
 * RecormendService
 * RecormendServiceImple
 * rcmd.js
 * carousel.js
 * jcmd.css
 * RecommendDao.java
 * RecommendDao.xml
 */

@Controller
@RequestMapping("/rcmd")
public class RecommendMvController {
  
  @Autowired TmdbMovies tmdbMovies;
  @Autowired RecommendService rcmdService;
  @Autowired MovieAnlyDao anlyDao;
  @Autowired MovieDao mvDao;
  @Autowired StatisticDao statDao;
  
  public RecommendMvController(RecommendService rcmdService) {
    super();
    this.rcmdService = rcmdService;
  }
  
  @RequestMapping("/list")
  public String list () {
    return "/recommend/list";
  }
  
  //  분석을 위한 keys
  @RequestMapping("/key")
  public @ResponseBody Map <String, Object> key (HttpSession session) {
    return rcmdService.getKey(((Member)session.getAttribute("loginUser")).getMno());
  }
  
  //  유사영화 List
  @RequestMapping("/smlrList")
  public @ResponseBody Map <String, Object> smlrListById (
      HttpSession session) throws Exception {
    
    int triggerMvId;
    Map <String, Object> returnValue= new HashMap<>();
    
    try {
      triggerMvId = anlyDao.getOneFav(((Member)session.getAttribute("loginUser")).getMno());
      MovieResultsPage smlrList;
      
      do {
        smlrList =  tmdbMovies.getSimilarMovies(triggerMvId, Constants.LANGUAGE_KO, 1);
      } while (smlrList.getResults().size() < 1);
      
      returnValue.put("triggerTitle", mvDao.getTitleById(triggerMvId));
      returnValue.put("list", smlrList.getResults());
      return returnValue;
    }   catch (Exception e) {
      returnValue = new HashMap<>();
      return returnValue;
    }
  }
  
  //  현재 상영작
  @RequestMapping("/now")
  public @ResponseBody Map <String, Object> nowList () throws Exception {
    MovieResultsPage nowList = tmdbMovies.getNowPlayingMovies(Constants.LANGUAGE_KO, 1, "KR");
    Map<String, Object> returnValue = new HashMap<>();
    returnValue.put("list", nowList.getResults());
    return returnValue;
  }
  
  //  개봉 예정작
  @RequestMapping("/upcommig")
  public @ResponseBody Map <String, Object> comeList () throws Exception {
    MovieResultsPage upcommingList = tmdbMovies.getUpcoming(Constants.LANGUAGE_KO, 1, "KR");
    Map <String, Object> returnValue = new HashMap<>();
    returnValue.put("list", upcommingList.getResults());
    return returnValue;
  }
  
  //  MD 추천 List
  @RequestMapping("/mdList")
  public @ResponseBody Map <String, Object> mdList () throws Exception {
    Map <String, Object> returnValue = new HashMap<>();
    int[] n = rcmdService.RandomNums(rcmdService.getCount(), 1);
    returnValue.put("listTitle", rcmdService.getListName(n[0]));
    returnValue.put("list", rcmdService.getList(n[0]));
    return returnValue;
  }
}