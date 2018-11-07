package bitcamp.java110.cms.web;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.java110.cms.service.GenreService;

@Controller
@RequestMapping("/signupDetail")
public class SignUpDetailController {

  @Autowired GenreService genreService;
  @Autowired ServletContext sc;

  @RequestMapping("/detailForm")
  public String detailForm(Model model) {

    model.addAttribute("genreList", genreService.getList());

    return "/auth/detailForm";
  }

  @PostMapping("/add")
  public void add(Model data, MultipartFile[] files) throws Exception {
    System.out.println(data);
    System.out.println(files);
    System.out.println("aasdf");

    List<String> filenames = new ArrayList<>();

    for(int i=0;i<files.length;i++) {
      MultipartFile file = files[i];
      System.out.println(file);
      String filename = UUID.randomUUID().toString();
      file.transferTo(new File(sc.getRealPath("/upload/" + filename)));
      filenames.add(filename);
    }
  }

}
