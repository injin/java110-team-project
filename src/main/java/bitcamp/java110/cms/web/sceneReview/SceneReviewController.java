package bitcamp.java110.cms.web.sceneReview;

import java.io.File;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.java110.cms.common.Constants;
import bitcamp.java110.cms.common.Paging;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.domain.SceneReview;
import bitcamp.java110.cms.domain.SceneReviewCmt;
import bitcamp.java110.cms.service.LikeService;
import bitcamp.java110.cms.service.ReportService;
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
  @Autowired ReportService reportService;
  
  @RequestMapping("/review")
  public String findScene(SceneReview sr, Model model, 
      Paging paging, HttpSession session) {
    
    MovieDb tmdbMovie = tmdbMovies.getMovie(sr.getMvno(), Constants.LANGUAGE_KO);
    List<MovieDb> smlrList = tmdbMovies.getSimilarMovies(
                                sr.getMvno(), 
                                Constants.LANGUAGE_KO,
                                1).getResults();
    sr = sceneReviewService.initSceneReview(tmdbMovie, sr);
    
    model.addAttribute("tmdbMovie", tmdbMovie);
    model.addAttribute("sceneReview", sr);
    model.addAttribute("sceneList", sceneReviewService.list(tmdbMovie.getId()));
    model.addAttribute("smlrList", smlrList);
    model.addAttribute("topReviewer", sceneReviewService.listTopReviewer(tmdbMovie.getId()));
    model.addAttribute("posterPrefix", Constants.TMDB_IMG_PREFIX_W500);
    
    if (sr.getSrno() !=null) {
      paging.setTotalCount(sceneReviewService.getTotalCmtCnt(sr.getSrno()));
      model.addAttribute("cmtList", sceneReviewService.listCmt(sr.getSrno(), paging));
      
      Member loginUser = (Member)session.getAttribute("loginUser");
      if (loginUser != null) {
        model.addAttribute("sceneAlbumList", sceneAlbumService.list2(loginUser.getMno(), sr.getSrno()));
        sr.setLike(likeService.checkLike(sr.getSrno(), Constants.LOG_DO_TYPE_SR, loginUser.getMno()));
        sr.setReported(reportService.checkReported(sr.getSrno().toString(), loginUser.getMno()));
      }
    }
    
    return "sceneReview/review";
  }
  
  @PostMapping("/fileUpload")
  public @ResponseBody String upload (
      MultipartFile phot, String removeFileName) throws Exception {
    
    if (removeFileName != null) {
      File targetFile = new File(sc.getRealPath("/upload/sceneReview/" + removeFileName));
      targetFile.delete();
    }
    
    if (phot != null && phot.getSize() > 0) {
      String filename = UUID.randomUUID().toString();
      phot.transferTo(new File(sc.getRealPath("/upload/sceneReview/" + filename)));
      return filename;
    }
    return null;
  }
  
  
  @PostMapping("/add")
  public String add(SceneReview sceneReview,
                HttpSession session) throws Exception {
    
    Member member = (Member)session.getAttribute("loginUser");
    sceneReview.setMno(member.getMno());
    
    sceneReviewService.add(sceneReview);
    
    return "redirect:/app/sceneReview/review?mvno=" + sceneReview.getMvno();
  }
  
  @PostMapping("delete")
  public @ResponseBody boolean deleteSr(
      int srno, HttpSession session) {
    
    Member member = (Member)session.getAttribute("loginUser");
    if (member !=null && member.isAdmin()) {
      return sceneReviewService.deleteSr(sc, srno);
    }
    return false;
  }
  
  @PostMapping("addComment")
  public String addComment(SceneReviewCmt comment,
    String photoName, HttpSession session) throws Exception {
    
    Member member = (Member)session.getAttribute("loginUser");
    comment.setMno(member.getMno());
    
    if (!("".equals(photoName))) {
      comment.setPhoto(photoName);
    }
    
    SceneReview sr = sceneReviewService.findByNo(comment.getSrno());
    sceneReviewService.addCmt(comment, sr);
    
    return "redirect:/app/sceneReview/review?mvno=" + sr.getMvno()
              + "&srno=" + sr.getSrno();
  }
  
  @PostMapping("deleteComment")
  public String deleteComment(int srno, int mvno, int cmno) {
    
    sceneReviewService.deleteCmt(cmno);
    return "redirect:/app/sceneReview/review?mvno=" + mvno
              + "&srno=" + srno;
  }
  
  @PostMapping("addToSrAlbum")
  public @ResponseBody boolean addToSrAlbum(
      int lbmno, int srno) {
    
    return sceneReviewService.addToSrAlbum(lbmno, srno);
  }
  
  @PostMapping("deleteFromSrAlbum")
  public @ResponseBody boolean deleteFromSrAlbum(
      int lbmno, int srno) {
    
    return sceneReviewService.deleteFromSrAlbum(lbmno, srno);
  }
  
  @PostMapping("editComment")
  public String editComment(int srno, int mvno, 
      SceneReviewCmt comment) {
    
    sceneReviewService.updateCmt(comment);
    
    return "redirect:/app/sceneReview/review?mvno=" + mvno
        + "&srno=" + srno;
  }
  
  @PostMapping("addLike")
  public @ResponseBody boolean addLike(
      HttpSession session, int srno) {
    
    int mno = ((Member)session.getAttribute("loginUser")).getMno();
    boolean result = likeService.addLike(srno, Constants.LOG_DO_TYPE_SR, mno);
    
    return result;
  }
  
  @PostMapping("cancelLike")
  public @ResponseBody boolean cancelLike(
      HttpSession session, int srno) {
    
    int mno = ((Member)session.getAttribute("loginUser")).getMno();
    boolean result = likeService.cancelLike(srno, Constants.LOG_DO_TYPE_SR, mno);
    
    return result;
  }
  
}
