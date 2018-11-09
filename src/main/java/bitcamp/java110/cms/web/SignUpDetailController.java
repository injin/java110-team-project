package bitcamp.java110.cms.web;

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
      @RequestParam(name="grnoList") List<Integer> grnoList,
      MultipartFile profileImage,
      MultipartFile coverImage) throws Exception {

    System.out.println(grnoList.toString());

    if (profileImage != null || coverImage != null ) {
      String profileImg = UUID.randomUUID().toString();
      profileImage.transferTo(new File(sc.getRealPath("/upload/" + profileImg + ".png")));
      member.setProfileImage(profileImg);

      String coverImg = UUID.randomUUID().toString();
      coverImage.transferTo(new File(sc.getRealPath("/upload/" + coverImg + ".png")));
      member.setCoverImage(coverImg);
    }
    /** 제하 작업 끝나면 알아서 
     *  지울 코드.
     *  건들지 마시오!!!!
     *  -->
     */
    if (grnoList.size() > 0) {
      member.setFavGenres(grnoList);
    }
    System.out.println(member);
    //<-- 
    memberService.add(member);
    
    
    //
    return "redirect:/app/";
  }
}