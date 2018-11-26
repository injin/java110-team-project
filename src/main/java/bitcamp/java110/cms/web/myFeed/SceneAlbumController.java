package bitcamp.java110.cms.web.myFeed;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.java110.cms.domain.SceneAlbum;
import bitcamp.java110.cms.domain.SceneReview;
import bitcamp.java110.cms.service.SceneAlbumService;
import bitcamp.java110.cms.service.SceneReviewService;

@Controller
@RequestMapping("/sceneAlbum")
public class SceneAlbumController {

  @Autowired SceneAlbumService sceneAlbumService;
  @Autowired SceneReviewService sceneReviewService;
  
  
  ServletContext sc;

  public SceneAlbumController(SceneAlbumService sceneAlbumService,
      SceneReviewService sceneReviewService, ServletContext sc) {
    super();
    this.sceneAlbumService = sceneAlbumService;
    this.sceneReviewService = sceneReviewService;
    this.sc = sc;
  }

  @RequestMapping("/list")
  public String list(
      SceneAlbum sceneAlbum,
      Paging paging,
      Model model,
      HttpSession session) throws Exception {
    
   // int mno = ((Member)session.getAttribute("loginUser")).getMno();
    
    paging.setTotalCount(sceneAlbumService.getTotalCnt(1));
    System.out.println(sceneAlbumService.getTotalCnt(1));
    
    System.out.println("pageNo: " +paging.getPageNo() + "pageSize: "+ paging.getPageSize());
    System.out.println("받은 페이지" + paging.getPageNo());
    
/*    
    
    // 출력될 앨범 
    System.out.println(sceneAlbumList);
//    try {

      paging.setEndPageNo(endPageNo);

*/
    
    List<SceneAlbum> sceneAlbumList = new ArrayList<SceneAlbum>();
    int endPageNo = (int)(sceneAlbumService.list().size()/6) + 1;
    paging.setEndPageNo(endPageNo);
    sceneAlbumList = sceneAlbumService.pageList(paging.getStartRowNo());
    
    /*  } catch (Exception e) {
      throw e;
  }
 */   
    model.addAttribute("sceneAlbumList", sceneAlbumList);
    model.addAttribute("paging", paging);
    return "sceneAlbum/album";
  }


  @PostMapping("/add")
  public String album(
      SceneAlbum sceneAlbum
      ) {
    
    System.out.println(sceneAlbum);
    sceneAlbumService.add(sceneAlbum);
    return "redirect:list";
  }
  
  @RequestMapping("/detail")
  public String detail(
      SceneAlbum sceneAlbum,
      Paging paging,
      Model model) {
    System.out.println("pageNo: "+paging.getPageNo());
    System.out.println("detail Title :" + sceneAlbum.getLbmTitle());
    
    System.out.println(sceneAlbum);
    
    List<SceneReview> sceneReview = new ArrayList<>();
    sceneReview = sceneReviewService.list(157336);
    System.out.println(sceneReview);
    model.addAttribute("title", sceneAlbum.getLbmTitle());
    model.addAttribute("sceneAlbum", sceneAlbum);
    model.addAttribute("sceneReview", sceneReview);
    return "sceneAlbum/detailAlbum";
  }
  
 
}
