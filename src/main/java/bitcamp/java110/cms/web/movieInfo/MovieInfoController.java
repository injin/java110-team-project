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
    MovieResultsPage response = tmdbSearch.searchMovie(
        keyword
        ,null
        , Constants.LANGUAGE_KO
        , Constants.INCLUDE_ADULT_TRUE
        , 0);
    
    Map<String, Object> result = new HashMap<>();
    result.put("movieList", response.getResults());
    result.put("totalPages", response.getTotalPages());
    result.put("totalResults", response.getTotalResults());
    result.put("imgPrefix", Constants.TMDB_IMG_PREFIX_W500);
    
    return result;
  }
}