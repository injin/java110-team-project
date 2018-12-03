package bitcamp.java110.cms.web.movieInfo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import bitcamp.java110.cms.common.Constants;
import bitcamp.java110.cms.dao.MovieAnlyDao;
import bitcamp.java110.cms.dao.MovieDao;
import info.movito.themoviedbapi.TmdbApi;
import info.movito.themoviedbapi.TmdbMovies;
import info.movito.themoviedbapi.TmdbSearch;
import info.movito.themoviedbapi.model.Genre;
import info.movito.themoviedbapi.model.MovieDb;
import info.movito.themoviedbapi.model.core.MovieResultsPage;

@RestController
@RequestMapping(value="/movieInfo")
public class MovieInfoController {
  
  @Autowired Environment env;
  
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
  
  @RequestMapping(value="/saveMvIDnGRbyId", method=RequestMethod.POST)
  public void saveMvIDnGRbyId (int mvno) {
    String tmdbKey = env.getProperty("tmdb.key");
    
    tmdbMovies = new TmdbApi(tmdbKey).getMovies();
    MovieDb mvdb = tmdbMovies.getMovie(mvno, Constants.LANGUAGE_KO);
    List <Genre> genres = mvdb.getGenres();
    Map <String, Integer> params = new HashMap<>();
    if(genres.size() > 0) {
      for(Genre g : genres) {
        params.put("mvno", mvdb.getId());
        params.put("grno", g.getId());
        anlyDao.insertGrNotExists(params);
      }
    }
  }
  
  @RequestMapping(value="/saveMvIDnGRbyMap", method=RequestMethod.POST)
  public void saveMvIDnGRbyMap (int mvid, int grno) {
    Map <String, Integer> params = new HashMap<>();
        params.put("mvno", mvid);
        params.put("grno", grno);
        anlyDao.insertGrNotExists(params);
  }
}