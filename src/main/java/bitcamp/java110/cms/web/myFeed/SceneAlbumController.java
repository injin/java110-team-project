package bitcamp.java110.cms.web.myFeed;

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
      Model model) {
    
    List<SceneAlbum> sceneAlbumList = sceneAlbumService.list();
    
    model.addAttribute("sceneAlbumList", sceneAlbumList);
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
 
}
