package bitcamp.java110.cms.web.reviewFeed;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.domain.Post;
import bitcamp.java110.cms.domain.PostCmt;
import bitcamp.java110.cms.service.FlwService;
import bitcamp.java110.cms.service.PostService;

@Controller
@RequestMapping("/reviewFeed")
public class ReviewFeedController {

   PostService postService;
   ServletContext sc;
   FlwService flwService;

  public ReviewFeedController(
      PostService postService, 
      FlwService flwService,
      ServletContext sc) {
    this.postService = postService;
    this.flwService = flwService;
    this.sc = sc;
  }

  @RequestMapping("/list")
  public String list(
      Post post,
      Model model,
      HttpSession session)  throws Exception {

    Member member = (Member) session.getAttribute("loginUser");

    if(member != null) {
      List<Member> flwList = flwService.listAll(member.getMno());
      model.addAttribute("userFlwList", flwList); // 로그인한사람의 팔로우리스트저장
    }
    
    List<Post> list = postService.list();
    
    model.addAttribute("postList", list);
    
    return "reviewFeed/reviewFeedList";
  }

  @PostMapping("/add")
  public String add(
      Post post,
      MultipartFile[] files,
      HttpSession session,
      HttpServletRequest request) throws Exception {

    Member m = (Member)session.getAttribute("loginUser");
    post.setMno(m.getMno());

    List<String> filenames = new ArrayList<>();

    // 사진 데이터 처리
    for(int i=0;i<files.length;i++) {
      MultipartFile file = files[i];
      if (file.getSize() > 0) {
        String filename = UUID.randomUUID().toString();
        System.out.println(filename);
        file.transferTo(new File(sc.getRealPath("/upload/post/" + filename)));
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

    postService.add(post);

    String originPath = request.getHeader("referer");
    return "redirect:" + originPath.substring(
        originPath.indexOf("/app"));
  }
  

  @PostMapping("addCmt")
  public String addCmt(PostCmt comment,
                    HttpSession session) throws Exception {

    Member member = (Member)session.getAttribute("loginUser");
    comment.setMno(member.getMno());
    
    postService.addCmt(comment);
    
    return "redirect:list";
  }
  
  @RequestMapping("listCmt")
  public @ResponseBody Map<String, Object> listCmt(
      @RequestBody Map<String, Object> request,
      HttpSession session) throws Exception {
    
    Map<String, Object> resultMap = new HashMap<>();
    int pstno = Integer.valueOf((String)request.get("pstno"));
    List<PostCmt> cmtsResult = postService.findCmts(pstno);
    resultMap.put("cmtsResult", cmtsResult);
    return resultMap;
  }
  
  @RequestMapping("/myFeed")
  public String myFeed() {
    
    return "include/myFeed";
  }
}
