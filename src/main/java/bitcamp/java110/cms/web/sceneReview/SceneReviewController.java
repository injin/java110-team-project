package bitcamp.java110.cms.web.sceneReview;

import java.io.File;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.java110.cms.common.Constants;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.domain.SceneReview;
import bitcamp.java110.cms.service.SceneReviewService;
import info.movito.themoviedbapi.TmdbMovies;
import info.movito.themoviedbapi.model.MovieDb;

@Controller
@RequestMapping("/sceneReview")
public class SceneReviewController {
  
  @Autowired ServletContext sc;
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
  
  @RequestMapping("/add")
  public String add(SceneReview sceneReview,
                Model model,
                HttpSession session,
                MultipartFile phot) throws Exception {
    
    System.out.println("장면리뷰" + sceneReview.toString());
    Member member = (Member)session.getAttribute("loginUser");
    sceneReview.setMno(member.getMno());
    
    if (phot.getSize() > 0) {
      String filename = UUID.randomUUID().toString();
      phot.transferTo(new File(sc.getRealPath("/upload/sceneReview/" + filename)));
      sceneReview.setPhoto(filename);
    }
    
    sceneReviewService.add(sceneReview);
    
    return "redirect:/app/sceneReview/review?movieId=" + sceneReview.getMovie().getMvno();
  }
  
  
}
