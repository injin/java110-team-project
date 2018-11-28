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
import bitcamp.java110.cms.domain.Member;
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
    
    int mno = ((Member)session.getAttribute("loginUser")).getMno();
    paging.setTotalCount(sceneAlbumService.getTotalCnt(mno));
    
    model.addAttribute("sceneAlbumList", sceneAlbumService.pageList(mno, paging));
    model.addAttribute("paging", paging);
    return "sceneAlbum/album";
  }


  @PostMapping("/add")
  public String album(
      SceneAlbum sceneAlbum,
      HttpSession session) {
    
    System.out.println(sceneAlbum);
    int mno = ((Member)session.getAttribute("loginUser")).getMno();
    sceneAlbumService.add(mno, sceneAlbum);
    return "redirect:list";
  }
  
  @RequestMapping("/detail")
  public String detail(
      SceneAlbum sceneAlbum,
      Model model,
      HttpSession session) {
    
    int mno = ((Member)session.getAttribute("loginUser")).getMno();
    
    System.out.println("detail Title : " + sceneAlbum.getLbmTitle());
    System.out.println("detail open : "+ sceneAlbum.isOpen());
    System.out.println(sceneAlbum);
    
    // 현재 클릭된 앨범 안의 장면목록들   => 여기에 현재 클릭된 앨범의 앨범명, 공개여부 나타남! sceneAlbum 대체 가능
    List<SceneAlbum> srList = new ArrayList<>(); 
    srList = sceneAlbumService.srList(mno, sceneAlbum);
    
    System.out.println("srList" + srList.size());
    
    List<SceneReview> sceneReview = new ArrayList<>();
    
    // 내 앨범 속 장면별 영화 찾기
    for(SceneAlbum sr : srList) {
      sceneReview.add(sceneReviewService.findByNo(sr.getSrno()));
    }
    System.out.println("srList: "+srList);
    // 현재 클릭된 앨범에 담긴 장면
    model.addAttribute("srList", srList);
    
    // 현재 클릭된 앨범의 앨범명, 공개여부...
    model.addAttribute("sceneAlbum", sceneAlbum);
    
    // 각 장면별 영화
    model.addAttribute("sceneReview", sceneReview);
    model.addAttribute("sceneAlbumList", sceneAlbumService.list(mno));
    return "sceneAlbum/detailAlbum";
  }
  
 
}
