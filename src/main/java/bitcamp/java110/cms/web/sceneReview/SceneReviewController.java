package bitcamp.java110.cms.web.sceneReview;

import java.io.File;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.java110.cms.common.Constants;
import bitcamp.java110.cms.common.Paging;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.domain.SceneReview;
import bitcamp.java110.cms.domain.SceneReviewCmt;
import bitcamp.java110.cms.service.LikeService;
import bitcamp.java110.cms.service.SceneAlbumService;
import bitcamp.java110.cms.service.SceneReviewService;
import info.movito.themoviedbapi.TmdbMovies;
import info.movito.themoviedbapi.model.MovieDb;

@Controller

@RequestMapping("/sceneReview")
public class SceneReviewController {
  
  @Autowired ServletContext sc;
  @Autowired TmdbMovies tmdbMovies;
  @Autowired SceneReviewService sceneReviewService;
  @Autowired SceneAlbumService sceneAlbumService;
  @Autowired LikeService likeService;
  
  @RequestMapping("/review")
  public String findScene(SceneReview sr, Model model, 
      Paging paging, HttpSession session) {
    
    MovieDb tmdbMovie = tmdbMovies.getMovie(sr.getMvno(), Constants.LANGUAGE_KO);
    sr = sceneReviewService.initSceneReview(tmdbMovie, sr);
    
    model.addAttribute("tmdbMovie", tmdbMovie);
    model.addAttribute("sceneReview", sr);
    model.addAttribute("sceneList", sceneReviewService.list(tmdbMovie.getId()));
    
    if (sr.getSrno() !=null) {
      paging.setTotalCount(sceneReviewService.getTotalCmtCnt(sr.getSrno()));
      model.addAttribute("cmtList", sceneReviewService.listCmt(sr.getSrno(), paging));
      
      Member loginUser = (Member)session.getAttribute("loginUser");
      if (loginUser != null) {
        model.addAttribute("sceneAlbumList", sceneAlbumService.list2(loginUser.getMno(), sr.getSrno()));
        sr.setLike(likeService.checkLike(sr.getSrno(), Constants.LOG_DO_TYPE_SR, loginUser.getMno()));
      }
      
    }
    
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
  public String addComment(SceneReviewCmt comment,
                    HttpSession session,
                    MultipartFile file1) throws Exception {
    
    Member member = (Member)session.getAttribute("loginUser");
    comment.setMno(member.getMno());
    
    if (file1 != null && file1.getSize() > 0) {
      String filename = UUID.randomUUID().toString();
      file1.transferTo(new File(sc.getRealPath("/upload/sceneReview/" + filename)));
      comment.setPhoto(filename);
    }
    
    sceneReviewService.addCmt(comment);
    SceneReview sr = sceneReviewService.findByNo(comment.getSrno());
    
    return "redirect:/app/sceneReview/review?mvno=" + sr.getMvno()
              + "&srno=" + sr.getSrno();
  }
  
  @RequestMapping("addToSrAlbum")
  public String addToSrAlbum(
      int lbmno, int srno) {
    
    sceneReviewService.addToSrAlbum(lbmno, srno);
    
    SceneReview sr = sceneReviewService.findByNo(srno);
    return "redirect:/app/sceneReview/review?mvno=" + sr.getMvno()
              + "&srno=" + sr.getSrno();
  }
  
  @RequestMapping("addLike")
  public @ResponseBody boolean addLike(
      HttpSession session, int srno) {
    
    int mno = ((Member)session.getAttribute("loginUser")).getMno();
    boolean result = likeService.addLike(srno, Constants.LOG_DO_TYPE_SR, mno);
    
    return result;
  }
  
  @RequestMapping("cancelLike")
  public @ResponseBody boolean cancelLike(
      HttpSession session, int srno) {
    
    int mno = ((Member)session.getAttribute("loginUser")).getMno();
    boolean result = likeService.cancelLike(srno, Constants.LOG_DO_TYPE_SR, mno);
    
    return result;
  }
}
