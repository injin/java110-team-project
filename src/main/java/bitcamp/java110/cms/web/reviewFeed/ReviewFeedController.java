package bitcamp.java110.cms.web.reviewFeed;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.domain.Post;
import bitcamp.java110.cms.service.PostService;

@Controller
@RequestMapping("/reviewFeed")
public class ReviewFeedController {

  PostService postService;
  ServletContext sc;

  public ReviewFeedController(
      PostService postService, 
      ServletContext sc) {
    this.postService = postService;
    this.sc = sc;
  }

  @RequestMapping("/list")
  public String list(
      Post post,
      Model model) {

    System.out.println("리뷰피드리스트에 들어옴");
    return "reviewFeed/reviewFeedList";
  }

  @PostMapping("/add")
  public String add(
      Post post,
      MultipartFile[] files,
      HttpSession session) throws Exception {

    Member m = (Member)session.getAttribute("loginUser");
    post.setMno(m.getMno());

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

    System.out.println(post);

    postService.add(post);

    return "redirect:list";
  }
}
