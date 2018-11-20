package bitcamp.java110.cms.web.myFeed;

import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

  @RequestMapping(value="/list",  method=RequestMethod.GET)
  public String list(
      SceneAlbum sceneAlbum,
      Model model) throws Exception {
    
    List<SceneAlbum> sceneAlbumList = sceneAlbumService.list();

    try {
      // (Before) Doing...

      Paging paging = new Paging();
      paging.setPageNo(1);
      paging.setPageSize(10);
      paging.setTotalCount(sceneAlbumList.size());

      System.out.println(sceneAlbumList.size());

      // (After) Doing...
  } catch (Exception e) {
      throw e;
  }
    
    model.addAttribute("sceneAlbumList", sceneAlbumList);
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
  
 
}
