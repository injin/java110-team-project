package bitcamp.java110.cms.web.myFeed;

import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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

 
}
