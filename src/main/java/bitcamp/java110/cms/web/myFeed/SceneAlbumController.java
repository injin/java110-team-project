package bitcamp.java110.cms.web.myFeed;

import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.java110.cms.domain.SceneAlbum;

@Controller
public class SceneAlbumController {

  ServletContext sc;

  public SceneAlbumController(
      ServletContext sc) {
    this.sc = sc;
  }

  @RequestMapping("/sceneAlbum")
  public String list() {

    
    return "sceneAlbum/album";
  }

/*  @PostMapping("/add")
  public String album(
      SceneAlbum sceneAlbum,
      Model model
      ) {
    System.out.println(sceneAlbum);
    return "sceneAlbum/album";
  }*/
 
}
