package bitcamp.java110.cms.web.auth;

import java.io.File;
import java.util.ArrayList;
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
import bitcamp.java110.cms.dao.MovieDao;
import bitcamp.java110.cms.domain.Genre;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.domain.Movie;
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
    @Autowired MovieDao movieDao;
    
    public AuthController(AuthService authService2) {
        super();
        this.authService = authService2;
    }

    @RequestMapping("/kakaologin")
    public String login (
            String accessToken,
            HttpSession session,
            HttpServletRequest request) {
      
      Map<String, Object> kakaoResponse =
          authService.getKakaoResponse(accessToken);
      Member member = authService.getMemberById(
          kakaoResponse.get("id").toString());
      
      System.out.println("login " + member);
      
      // 기존에 가입된 사용자이면
      if (member != null) {
        session.setAttribute("loginUser", member);
        String originPath = request.getHeader("referer");
        return "redirect:" + originPath.substring(
            originPath.indexOf("/app"));
      }
      
      // 기존에 가입된 사용자가 아니면
      member = authService.addMember(kakaoResponse);
      session.setAttribute("loginUser", member);
      return "redirect:/app/auth/detail";
    }
    
    @RequestMapping("/kakaologout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/app/";
    }
    
    @RequestMapping("/signOut")
    public String signout(
        HttpSession session,
        @RequestParam(required=false)int mno) {
      
      authService.signOut(mno);
      System.out.println("Bye" + mno + "\n");
      
      session.invalidate();
      return "redirect:/app/";
    }
    
    //  가입시 최초 상세정보 수정 페이지 출력.
    @RequestMapping("/detail")
    public String detailForm(
        Model model,
        HttpSession session) {
      
      model.addAttribute("member", 
          (Member)session.getAttribute("loginUser"));
      model.addAttribute("genreList", genreService.getList());
      
      return "/auth/detail";
    }
    
    //  가입시 최초 상세정보 수정 메소드.
    @PostMapping("/init")
    public String firstInit (
        Member member,
        MultipartFile profileImageFile,
        MultipartFile coverImage,
        @RequestParam(name="favGrList", required=false)
                List<Integer> favGrList,
        @RequestParam(name="favMvIdList", required=true)
                List<Integer> favMvIdList,
        @RequestParam(name="favMvTitleList", required=true)
                List<String> favMvTitleList,
        HttpSession session) throws Exception {
      
      //    profileImage Control
      if (profileImageFile != null && profileImageFile.getSize() > 0) {
        String profileImg = UUID.randomUUID().toString();
        profileImageFile.transferTo(new File(
            sc.getRealPath("/upload/profile/" + profileImg)));
        member.setProfileImage(profileImg);
      }
      
      //    coverImage Control
      if (coverImage != null && coverImage.getSize() > 0) {
        String coverImg = UUID.randomUUID().toString();
        coverImage.transferTo(new File(
            sc.getRealPath("/upload/cover/" + coverImg)));
        member.setCoverImage(coverImg);
      }
      
      //    favGenreList Control
      if (favGrList != null && favGrList.size() > 0) {
        member.setFavGrList(favGrList);
      }
      
      //    favMvList Control & MV Insert If not exists
      List<Movie> favMvList = new ArrayList<>();
      if (favMvIdList != null && favMvTitleList != null) {
        if (favMvTitleList.size() == favMvIdList.size()) {
          for (int i = 0; i < favMvIdList.size(); i++) {
            Movie mv = new Movie(favMvIdList.get(i), favMvTitleList.get(i));
            favMvList.add(mv);
          }
          member.setFavMvList(favMvList);
        }
      }
      
      session.setAttribute("loginUser", member);
      memberService.update(member);
      return "redirect:/app/";
    }
    
    //  상시 상세정보 수정 페이지 출력
    @RequestMapping("/update")
    public String detailUpdate(
        Model model,
        HttpSession session) {
      model.addAttribute("targetUser", session.getAttribute("loginUser"));
      
      System.out.println("\nupdate 접근 " + (Member)session.getAttribute("loginUser"));
      
      List<Genre> gnrList = genreService.getList();
      List<Integer> favList = memberService.getFavGnrDBList(((Member)session.getAttribute("loginUser")).getMno());
      List<Genre> favGnrList = new ArrayList<Genre>();
      
      for (int j : favList) {
        for (Genre g : gnrList) {
          if(g.getGrno() == j) {
            gnrList.remove(g);
            favGnrList.add(g);
            break;
          }
        }
      }
      model.addAttribute("genreList", gnrList);
      model.addAttribute("favList", favGnrList);
      
      return "auth/update";
    }
    
    //  상시 상세정보 수정 update
    @PostMapping("/update")
    public String update(
        HttpServletRequest request,
        Member member,
        MultipartFile profileImageFile,
        MultipartFile coverImage,
        @RequestParam(name="favGrList", required=false)
                List<Integer> favGrList,
        @RequestParam(name="pr", required=false)
                String pr,
        HttpSession session) throws Exception {
      
      //    profileImage Control
      if (profileImageFile != null && profileImageFile.getSize() > 0) {
        String profileImg = UUID.randomUUID().toString();
        profileImageFile.transferTo(new File(
            sc.getRealPath("/upload/profile/" + profileImg)));
        member.setProfileImage(profileImg);
      }
      
      //    coverImage Control
      if (coverImage != null && coverImage.getSize() > 0) {
        String coverImg = UUID.randomUUID().toString();
        coverImage.transferTo(new File(
            sc.getRealPath("/upload/cover/" + coverImg)));
        member.setCoverImage(coverImg);
      }
      
      if (favGrList != null && favGrList.size() > 0) {
        member.setFavGrList(favGrList);
      }
      
      if (pr != null && pr != "") {
        member.setPr(pr);
      }
      
      session.setAttribute("loginUser", member);
      memberService.update(member);
      
      String originPath = request.getHeader("referer");
      return "redirect:" + originPath.substring(
          originPath.indexOf("/app"));
    }
}