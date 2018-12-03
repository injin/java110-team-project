package bitcamp.java110.cms.web.myFeed;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.domain.SceneAlbum;
import bitcamp.java110.cms.domain.SceneReview;
import bitcamp.java110.cms.service.MemberService;
import bitcamp.java110.cms.service.SceneAlbumService;
import bitcamp.java110.cms.service.SceneReviewService;

@Controller
@RequestMapping("/sceneAlbum")
public class SceneAlbumController {

  @Autowired SceneAlbumService sceneAlbumService;
  @Autowired SceneReviewService sceneReviewService;
  @Autowired MemberService memberService;

  @RequestMapping("/list")
  public String list(
      SceneAlbum sceneAlbum,
      Paging paging,
      Model model,
      HttpSession session,
      int tgtMno) throws Exception {
    
    boolean isMyAlbum = false;
    if (session.getAttribute("loginUser") != null) {
      isMyAlbum = (tgtMno == ((Member)session.getAttribute("loginUser")).getMno());
    }
    
    model.addAttribute("targetUser", memberService.findByMno(tgtMno));
    paging.setTotalCount(sceneAlbumService.getTotalCnt(tgtMno, isMyAlbum));
    
    model.addAttribute("sceneAlbumList", sceneAlbumService.pageList(tgtMno, paging, isMyAlbum));
    model.addAttribute("paging", paging);
    model.addAttribute("isMyAlbum", isMyAlbum);
    return "sceneAlbum/list";
  }


  @PostMapping("/add")
  public String album(
      SceneAlbum sceneAlbum,
      HttpSession session) {
    
    int mno = ((Member)session.getAttribute("loginUser")).getMno();
    sceneAlbumService.add(mno, sceneAlbum);
    return "redirect:list";
  }
  
  @RequestMapping("/detail")
  public String detail(
      SceneAlbum sceneAlbum,
      Model model,
      HttpSession session,
      int tgtMno) {
    
    boolean isMyAlbum = false;
    if (session.getAttribute("loginUser") != null) {
      isMyAlbum = (tgtMno == ((Member)session.getAttribute("loginUser")).getMno());
    }
    model.addAttribute("isMyAlbum", isMyAlbum);
    // 현재 클릭된 앨범 안의 장면목록들   => 여기에 현재 클릭된 앨범의 앨범명, 공개여부 나타남! sceneAlbum 대체 가능
    List<SceneAlbum> srList = new ArrayList<>(); 
    srList = sceneAlbumService.srList(tgtMno, sceneAlbum);
    
    List<SceneReview> sceneReview = new ArrayList<>();
    
    // 내 앨범 속 장면별 영화 찾기
    for(SceneAlbum sr : srList) {
      sceneReview.add(sceneReviewService.findByNo(sr.getSrno()));
    }
    // 현재 클릭된 앨범에 담긴 장면
    model.addAttribute("srList", srList);
    
    // 현재 클릭된 앨범의 앨범명, 공개여부...
    model.addAttribute("sceneAlbum", sceneAlbumService.get(sceneAlbum.getLbmno()));
    
    // 각 장면별 영화
    model.addAttribute("sceneReview", sceneReview);
    
    model.addAttribute("sceneAlbumList", sceneAlbumService.list(tgtMno));
    model.addAttribute("targetUser", memberService.findByMno(tgtMno));
    return "sceneAlbum/detail";
  }
  
  @RequestMapping("srList")
  public @ResponseBody Map<String, Object> srList(
      @RequestBody Map<String, Object> request,
      HttpSession session
      )throws Exception{
   
    int mno = ((Member)session.getAttribute("loginUser")).getMno();
    Map<String, Object> resultMap = new HashMap<>();
    int lbmno = (int)request.get("lbmno");
    
    List<SceneAlbum> srList = new ArrayList<>();
    SceneAlbum sceneAlbum = new SceneAlbum();
    sceneAlbum.setLbmno(lbmno);
    srList = sceneAlbumService.srList(mno, sceneAlbum);
    
    List<SceneReview> sceneReview = new ArrayList<>();
    
    // 내 앨범 속 장면별 영화 찾기
    for(SceneAlbum sr : srList) {
      sceneReview.add(sceneReviewService.findByNo(sr.getSrno()));
    }
    resultMap.put("srList", srList);
    resultMap.put("sceneReview", sceneReview);
    return resultMap;
  }
  
  @RequestMapping("addLbmImg")
  public @ResponseBody boolean addLbmImg(
      @RequestBody Map<String, Object> request)throws Exception{
   
    int lbmno = Integer.valueOf((String)request.get("lbmno"));
    String phot = (String)request.get("phot");
    
    return sceneAlbumService.addImg(lbmno, phot);
  }
  
  @RequestMapping("removeImg")
  public @ResponseBody Map<String, Object> removeImg(
      @RequestBody Map<String, Object> request,
      HttpSession session
      )throws Exception{
   
    int mno = ((Member)session.getAttribute("loginUser")).getMno();
    int lbmno = Integer.valueOf((String)request.get("lbmno"));
    int srno = Integer.valueOf((String)request.get("srno"));
    
    sceneAlbumService.removeImg(lbmno, srno);
    
    List<SceneAlbum> srList = new ArrayList<>();
    SceneAlbum sceneAlbum = new SceneAlbum();
    sceneAlbum.setLbmno(lbmno);
    srList = sceneAlbumService.srList(mno, sceneAlbum);
    
    List<SceneReview> sceneReview = new ArrayList<>();
    
    // 내 앨범 속 장면별 영화 찾기
    for(SceneAlbum sr : srList) {
      sceneReview.add(sceneReviewService.findByNo(sr.getSrno()));
    }
    
    Map<String, Object> resultMap = new HashMap<>();
    resultMap.put("srList", srList);
    resultMap.put("sceneReview", sceneReview);
    return resultMap;
    
  }
  
  @RequestMapping("removeLbm")
  public @ResponseBody Map<String, Object> removeLbm(
      @RequestBody Map<String, Object> request,
      HttpSession session
      )throws Exception{
   
    int mno = ((Member)session.getAttribute("loginUser")).getMno();
    int lbmno = (int)request.get("lbmno");
    
    sceneAlbumService.removeLbm(lbmno);
    
    Map<String, Object> resultMap = new HashMap<>();
    resultMap.put("sceneAlbumList", sceneAlbumService.list(mno));
    return resultMap;
    
  }
  
  @RequestMapping("editLbm")
  public @ResponseBody Map<String, Object> editLbm(
      @RequestBody SceneAlbum sceneAlbum,
      HttpSession session
      )throws Exception{
   
    int mno = ((Member)session.getAttribute("loginUser")).getMno();
    sceneAlbumService.editLbm(sceneAlbum.getLbmno(), sceneAlbum.getLbmTitle());
    Map<String, Object> resultMap = new HashMap<>();
    resultMap.put("sceneAlbumList", sceneAlbumService.list(mno));
    return resultMap;
    
  }
 
}
