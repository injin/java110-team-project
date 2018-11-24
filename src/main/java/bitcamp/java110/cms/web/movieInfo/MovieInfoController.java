package bitcamp.java110.cms.web.movieInfo;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import bitcamp.java110.cms.common.Constants;
import bitcamp.java110.cms.dao.MovieAnlyDao;
import bitcamp.java110.cms.dao.MovieDao;
import bitcamp.java110.cms.domain.Member;
import info.movito.themoviedbapi.TmdbMovies;
import info.movito.themoviedbapi.TmdbSearch;
import info.movito.themoviedbapi.model.core.MovieResultsPage;

@RestController
@RequestMapping(value="/movieInfo")
public class MovieInfoController {
  
  @Autowired TmdbSearch tmdbSearch;
  @Autowired TmdbMovies tmdbMovies;
  @Autowired MovieAnlyDao anlyDao;
  @Autowired MovieDao mvDao;
  
  @RequestMapping(value="/listByKeyword", method=RequestMethod.POST)
  public @ResponseBody Map<String, Object> listByKeyword(
      @RequestBody Map<String, Object> request) throws Exception {
    
    String keyword = (String)request.get("keyword");
    int page = 0;
    if (request.get("page") != null) { 
      page = (int)request.get("page");
    }
    MovieResultsPage response = tmdbSearch.searchMovie(
        keyword
        ,null
        , Constants.LANGUAGE_KO
        , Constants.INCLUDE_ADULT_TRUE
        , page);
    
    Map<String, Object> result = new HashMap<>();
    result.put("movieList", response.getResults());
    result.put("totalPages", response.getTotalPages());
    result.put("totalResults", response.getTotalResults());
    result.put("imgPrefix", Constants.TMDB_IMG_PREFIX_W500);
    
    System.out.println("totalPages: "+response.getTotalPages());
    System.out.println("totalResults: "+response.getTotalResults());
    
    return result;
  }
  
  /**
   * JEAHA
   * Login안하면 테스트 불가.
   * http://localhost:8888/app/movieInfo/smlrList
   */
  @RequestMapping(value="/smlrList")
  public @ResponseBody Map<String, Object> smlrListById (
      HttpSession session) throws Exception {
    
    int triggerMvId = anlyDao.getOneFav(((Member)session.getAttribute("loginUser")).getMno());
    MovieResultsPage smlrList =  tmdbMovies.getSimilarMovies(triggerMvId, Constants.LANGUAGE_KO, 1);
    
    /*
    List<MovieDb> list = smlrList.getResults();
    System.out.println(list.toString());
    
    MovieDb i = list.get(0);
    System.out.println(i.toString());
    System.out.println(i.getId());
    System.out.println(i.getPosterPath());
    */
    
    Map<String, Object> returnValue= new HashMap<>();
    returnValue.put("triggerTitle", mvDao.getTitleById(triggerMvId));
    returnValue.put("smlrList", smlrList.getResults());
    
    
    return returnValue;
  }
}