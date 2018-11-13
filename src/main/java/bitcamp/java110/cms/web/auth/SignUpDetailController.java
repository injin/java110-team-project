package bitcamp.java110.cms.web.auth;

import java.io.File;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.service.GenreService;
import bitcamp.java110.cms.service.MemberService;

@Controller
@RequestMapping("/signupDetail")
public class SignUpDetailController {

  @Autowired MemberService memberService;
  @Autowired GenreService genreService;
  @Autowired ServletContext sc;

  @RequestMapping("/detailForm")
  public String detailForm(
      Model model,
      HttpSession session) {
    
    model.addAttribute("member", (Member)session.getAttribute("loginUser"));
    model.addAttribute("genreList", genreService.getList());
    
    
    return "/auth/detailForm";
  }

  @PostMapping("/add")
  public String add(
      Member member,
      @RequestParam(name="grnoList", required=false) List<Integer> grnoList,
      MultipartFile profileImage,
      MultipartFile coverImage,
      HttpSession session) throws Exception {

    if (profileImage != null) {
      String profileImg = UUID.randomUUID().toString();
      profileImage.transferTo(new File(sc.getRealPath("/upload/profile/" + profileImg)));
      member.setProfileImage(profileImg);
      System.out.println(profileImg);
    }
    
    if (coverImage != null) {
      String coverImg = UUID.randomUUID().toString();
      coverImage.transferTo(new File(sc.getRealPath("/upload/cover/" + coverImg)));
      member.setCoverImage(coverImg);
      System.out.println(coverImg);
    }
    
    if (grnoList != null && grnoList.size() > 0) {
      member.setFavGenres(grnoList);
    }
    memberService.update(member);
    System.out.println(member);
    
    session.setAttribute("loginUser", member);
    
    return "redirect:/app/";
  }
  
  @PostMapping("/signOut")
  public String signOut (HttpSession session, int mno) {
    System.out.println("Bye");
    System.out.println(mno);
    
    
    
    
    
    
    session.invalidate();
    return "redirect:/app/";
  }
}