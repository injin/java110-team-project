package bitcamp.java110.cms.web.auth;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.service.AuthService;
import bitcamp.java110.cms.service.GenreService;
import bitcamp.java110.cms.service.MemberService;

@Controller
@RequestMapping("/auth")
public class AuthController {
    
    @Autowired AuthService authService;
    @Autowired MemberService memberService;
    @Autowired GenreService genreService;
    @Autowired ServletContext sc;
    
    public AuthController(AuthService authService2) {
        super();
        this.authService = authService2;
    }

    @RequestMapping("/kakaologin")
    public String login(
            String accessToken,
            HttpSession session,
            HttpServletRequest request) {
      
      Map<String, Object> kakaoResponse = authService.getKakaoResponse(accessToken);
      Member member = authService.getMemberById(
          kakaoResponse.get("id").toString());
      
      // 기존에 가입된 사용자이면
      if (member != null) {
        session.setAttribute("loginUser", member);
        String originPath = request.getHeader("referer");
        return "redirect:" + originPath.substring(originPath.indexOf("/app"));
//        return "redirect:/app/";
      }
      
      // 기존에 가입된 사용자가 아니면
      member = authService.addMember(kakaoResponse);
      session.setAttribute("loginUser", member);
      return "redirect:/app/auth/detailForm";
    }
    
    @RequestMapping("/kakaologout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/app/";
    }
    
    
    
    
    
    
    
    
    
    
    /**
     * !!주석 삭제 금지!!
     * 제하 To Do
     * kakao 연동 해제 NOTICE
     * !! SginOut 할 때 DB에서 삭제 해야하므로 자주 UPDATE 해야함!!
     */
    @RequestMapping("/signOut")
    public String signout(
        HttpSession session,
        @RequestParam(required=false)int mno) {
      System.out.println("Bye\n\n");
      System.out.println(mno);
      //    비로그인 유저가 들어온다면 돌려보냄. 안되네?
      if (mno <= 0) {
        return "redirect:/app/";
      }
      
      authService.signOut(mno);
      
      session.invalidate();
      return "redirect:/app/";
    }
    
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
        @RequestParam(name="grnoList", required=false)
                List<Integer> grnoList,
        MultipartFile profileImage,
        MultipartFile coverImage,
        HttpSession session) throws Exception {
      System.out.println("add 시작 \n" + member + "\n");
      System.out.println("Add.profileImage.getName() : " + profileImage.getName());
      
      if (profileImage != null && profileImage.getSize() > 0) {
        String profileImg = UUID.randomUUID().toString();
        profileImage.transferTo(new File(sc.getRealPath("/upload/profile/" + profileImg)));
        member.setProfileImage(profileImg);
        System.out.println(profileImg);
      }
      
      if (coverImage != null && coverImage.getSize() > 0) {
        String coverImg = UUID.randomUUID().toString();
        coverImage.transferTo(new File(sc.getRealPath("/upload/cover/" + coverImg)));
        member.setCoverImage(coverImg);
        System.out.println(coverImg);
      }
      
      if (grnoList != null && grnoList.size() > 0) {
        member.setFavGenres(grnoList);
      }
      memberService.update(member);
      System.out.println("update");
      
      System.out.println(member + "\n");
      session.setAttribute("loginUser", member);
      System.out.println(member + "\n");
      return "redirect:/app/";
    }
    
    
}
