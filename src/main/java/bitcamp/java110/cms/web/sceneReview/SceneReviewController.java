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
import bitcamp.java110.cms.domain.SceneReviewComment;
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
  public String findScene(SceneReview sr, Model model) {
    
    MovieDb tmdbMovie = tmdbMovies.getMovie(sr.getMvno(), Constants.LANGUAGE_KO);
    sr = sceneReviewService.initSceneReview(tmdbMovie, sr);
    
    model.addAttribute("tmdbMovie", tmdbMovie);
    model.addAttribute("sceneReview", sr);
    model.addAttribute("sceneList", sceneReviewService.list(tmdbMovie.getId()));
    
    return "sceneReview/review";
  }
  
  @RequestMapping("/add")
  public String add(SceneReview sceneReview,
                HttpSession session,
                MultipartFile phot) throws Exception {
    
    Member member = (Member)session.getAttribute("loginUser");
    sceneReview.setMno(member.getMno());
    
    if (phot.getSize() > 0) {
      String filename = UUID.randomUUID().toString();
      phot.transferTo(new File(sc.getRealPath("/upload/sceneReview/" + filename)));
      sceneReview.setPhoto(filename);
    }
    
    sceneReviewService.add(sceneReview);
    
    return "redirect:/app/sceneReview/review?mvno=" + sceneReview.getMvno();
  }
  
  @RequestMapping("addComment")
  public String addComment(SceneReviewComment comment,
                    HttpSession session,
                    MultipartFile file1) throws Exception {
    
    if (file1.getSize() > 0) {
      String filename = UUID.randomUUID().toString();
      file1.transferTo(new File(sc.getRealPath("/upload/sceneReview/" + filename)));
      comment.setPhoto(filename);
    }
    
    System.out.println("올릴 댓글" + comment.toString());
    SceneReview sr = sceneReviewService.findByNo(comment.getSrno());
    System.out.println("대상 장면" + sr.toString());
    
    return "redirect:/app/sceneReview/review?mvno=" + sr.getMvno()
              + "&time=" + sr.getTime();
  }
  
}
