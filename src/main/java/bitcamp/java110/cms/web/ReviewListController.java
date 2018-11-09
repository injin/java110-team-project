package bitcamp.java110.cms.web;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.java110.cms.domain.Post;
import bitcamp.java110.cms.service.PostService;

@Controller
@RequestMapping("/reviewFeed")
public class ReviewListController {

  PostService postService;
  ServletContext sc;

  public ReviewListController(
      PostService postService, 
      ServletContext sc) {
    this.postService = postService;
    this.sc = sc;
  }

  @RequestMapping("/list")
  public String list() {
    System.out.println("리뷰피드리스트에 들어옴");
    return "reviewFeedList";
  }


  @PostMapping("/add")
  public String add(
      Post post,
      MultipartFile[] files) throws Exception {

    List<String> filenames = new ArrayList<>();
    // 사진 데이터 처리

    for(int i=0;i<files.length;i++) {
      MultipartFile file = files[i];
      if (file.getSize() > 0) {
        String filename = UUID.randomUUID().toString();
        System.out.println(filename);
        file.transferTo(new File(sc.getRealPath("/upload/" + filename)));
        filenames.add(filename);
      }
    }

    post.setPhotos(filenames);

    // 해시 태그 처리
    Pattern MY_PATTERN = Pattern.compile("#(\\S+)"); 
    Matcher mat = MY_PATTERN.matcher(post.getContent()); 
    List<String> strs=new ArrayList<String>(); 
    while (mat.find()) { 
      strs.add(mat.group(1)); 
    } 
    post.setHtags(strs);

//    postService.add(post);

    return "redirect:list";
  }

}
