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
import bitcamp.java110.cms.service.MemberService2;

@Controller
@RequestMapping("/signupDetail")
public class SignUpDetailController {

  @Autowired MemberService2 memberService;
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
      @RequestParam(name="grnoList") List<Integer> grnoList,
      MultipartFile profileImage,
      MultipartFile coverImage) throws Exception {

    if (profileImage != null || coverImage != null ) {
      String profileImg = UUID.randomUUID().toString();
      profileImage.transferTo(new File(sc.getRealPath("/upload/" + profileImg + ".png")));
      member.setProfileImage(profileImg);

      String coverImg = UUID.randomUUID().toString();
      coverImage.transferTo(new File(sc.getRealPath("/upload/" + coverImg + ".png")));
      member.setCoverImage(coverImg);
    }
    if (grnoList.size() > 0) {
      member.setFavGenres(grnoList);
    }
    memberService.update(member);
    
    return "redirect:/app/";
  }
}