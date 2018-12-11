package bitcamp.java110.cms.web.follow;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import bitcamp.java110.cms.common.Paging;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.service.FlwService;

@Controller
@RequestMapping("/follow")
public class FlwController {

  @Autowired
  FlwService flwService;

  @RequestMapping("flwlist")
  public String flwlist(
      Paging paging,
      Model model,
      HttpSession session) {

    int mno = ((Member)session.getAttribute("loginUser")).getMno();
    model.addAttribute("targetUser", session.getAttribute("loginUser"));
    paging.setTotalCount(flwService.getTotalCnt(mno));

    Map<String,Object> condition = new HashMap<>();
    condition.put("mno", mno);
    condition.put("paging", paging);
    List<Member> flwList = flwService.list(condition);

    model.addAttribute("flwlist" , flwList);
    model.addAttribute("paging" , paging);
    return "follow/flwlist";
  }


  @PostMapping("flwadd")
  public @ResponseBody boolean addFlw(Member m, HttpSession session) {

    int mno = ((Member) session.getAttribute("loginUser")).getMno();

    System.out.println(flwService.rcmdflw(mno));

    Map<String,Object> condition =  new HashMap<>();
    condition.put("mno", mno);
    condition.put("flw", m.getMno());
    condition.put("flwNick", m.getNickname());

    return flwService.add(condition);
  }

  @PostMapping("flwrcmd")
  public @ResponseBody List<Member> flwrcmd(HttpSession session) {

    Member member= (Member)session.getAttribute("loginUser");
    
    return flwService.rcmdflw(member.getMno());
  }

  @PostMapping("flwdelete")
  public  @ResponseBody boolean deleteFlw(int flw,
      HttpSession session) {

    Member member = (Member)session.getAttribute("loginUser");
    int mno = member.getMno();

    return flwService.delete(mno, flw);
  }
}