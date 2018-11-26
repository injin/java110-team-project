package bitcamp.java110.cms.web.myFeed;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.java110.cms.domain.SceneAlbum;
import bitcamp.java110.cms.service.SceneAlbumService;

@Controller
@RequestMapping("/sceneAlbum")
public class SceneAlbumController {

  @Autowired SceneAlbumService sceneAlbumService;
  ServletContext sc;

  public SceneAlbumController(SceneAlbumService sceneAlbumService, ServletContext sc) {
    super();
    this.sceneAlbumService = sceneAlbumService;
    this.sc = sc;
  }

  @RequestMapping("/list")
  public String list(
      SceneAlbum sceneAlbum,
      Paging paging,
      Model model) throws Exception {
    
    System.out.println("pageNo: " +paging.getPageNo() + "pageSize: "+ paging.getPageSize());
    
    System.out.println("받은 페이지" + paging.getPageNo());
    //List<SceneAlbum> sceneAlbumList = sceneAlbumService.list();
    
/*    int start = 6*paging.getPageNo()-6; // 페이지 별 앨범 첫 번호
    int end = start + 6;  // 페이지 별 앨범 마지막 번호 
    int endPageNo = (int)(sceneAlbumService.list().size()/6) + 1;
    
    System.out.println("start: " + start + "end: " + end +  "endPageNo: " + endPageNo);
    if(end >= sceneAlbumService.list().size()) {
      end = sceneAlbumService.list().size();
    }
    for(int i=start; i<end; i++) {
      sceneAlbumList.add(sceneAlbumService.list().get(i));
    }
    
    // 출력될 앨범 
    System.out.println(sceneAlbumList);
//    try {

      //paging.setPageSize(6);
      paging.setEndPageNo(endPageNo);
      paging.setTotalCount(sceneAlbumService.list().size());

      // 총 게시물 수 
      System.out.println(sceneAlbumService.list().size());
*/
    
    List<SceneAlbum> sceneAlbumList = new ArrayList<SceneAlbum>();
    int start = 6*paging.getPageNo()-6; // 페이지 별 앨범 첫 번호
    int endPageNo = (int)(sceneAlbumService.list().size()/6) + 1;
    paging.setEndPageNo(endPageNo);
    paging.setTotalCount(sceneAlbumService.list().size());
    sceneAlbumList = sceneAlbumService.pageList(start);
    
    /*  } catch (Exception e) {
      throw e;
  }
 */   
    model.addAttribute("sceneAlbumList", sceneAlbumList);
    model.addAttribute("paging", paging);
    return "sceneAlbum/album";
  }

  /*
  @RequestMapping("/list")
  public String list(
      SceneAlbum sceneAlbum,
      Model model) {
    
    List<SceneAlbum> sceneAlbumList = sceneAlbumService.list();
    
    model.addAttribute("sceneAlbumList", sceneAlbumList);
    return "sceneAlbum/album";
  }*/
  
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
    //System.out.println(sceneAlbum);
    
    model.addAttribute("title", sceneAlbum.getLbmTitle());
    return "sceneAlbum/detailAlbum";
  }
  
 
}
