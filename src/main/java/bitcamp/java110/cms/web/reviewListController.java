package bitcamp.java110.cms.web;

import java.io.File;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.java110.cms.dao.MemberDao;
import bitcamp.java110.cms.dao.PhotoDao;

@Controller
public class reviewListController {
  
  @RequestMapping("/reviewFeedList")
  public String main() {
    System.out.println("리뷰피드리스트에 들어옴");
    return "reviewFeedList";
  }


/*  @PostMapping("/add")
  public String add(
          Manager manager,
          MultipartFile file1) throws Exception {
      
      // 사진 데이터 처리
      if (file1.getSize() > 0) {
          String filename = UUID.randomUUID().toString();
          file1.transferTo(new File(sc.getRealPath("/upload/" + filename)));
          manager.setPhoto(filename);
      }
      
      managerService.add(manager);
      
      return "redirect:list";
  }*/
  
}
