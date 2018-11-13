package bitcamp.java110.cms.web.sceneReview;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.java110.cms.common.Constants;
import bitcamp.java110.cms.service.SceneReviewService;
import info.movito.themoviedbapi.TmdbMovies;
import info.movito.themoviedbapi.model.MovieDb;

@Controller
@RequestMapping("/sceneReview")
public class SceneReviewController {
  
  @Autowired TmdbMovies tmdbMovies;
  @Autowired SceneReviewService sceneReviewService;
  
  @RequestMapping("/review")
  public String findScene(int movieId, Model model) {
    
    MovieDb tmdbMovie = tmdbMovies.getMovie(movieId, Constants.LANGUAGE_KO);
    model.addAttribute("tmdbMovie", tmdbMovie);
    model.addAttribute("imgPrefix", Constants.TMDB_IMG_PREFIX_ORIGIN);
    model.addAttribute("sceneCover", sceneReviewService.makeSceneCover(tmdbMovie));
    
    
    
    return "sceneReview/review";
  }
  
  
}
