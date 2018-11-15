package bitcamp.java110.cms.web.movieInfo;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import bitcamp.java110.cms.common.Constants;
import info.movito.themoviedbapi.TmdbSearch;
import info.movito.themoviedbapi.model.core.MovieResultsPage;

@RestController
@RequestMapping(value="/movieInfo")
public class MovieInfoController {
  
  @Autowired TmdbSearch tmdbSearch;
  
  @RequestMapping(value="/listByKeyword", method=RequestMethod.POST)
  public @ResponseBody Map<String, Object> listByKeyword(
      @RequestBody Map<String, Object> request) throws Exception {
    
    String keyword = (String)request.get("keyword");
    int page = 0;
    // 페이지가 1개뿐일 경우 =>처리해줘야함
    if (request.get("page") != null) { 
      page = (int)request.get("page");
      System.out.println("페이지 받음" + page);
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
}