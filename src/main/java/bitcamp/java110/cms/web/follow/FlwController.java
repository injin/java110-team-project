package bitcamp.java110.cms.web.follow;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.service.FlwService;

@Controller
@RequestMapping("/flw")
public class FlwController {


    @Autowired
    FlwService flwService;
    
    @RequestMapping("flwlist")
    public String flwlist(
            @RequestParam(defaultValue="1") int pageNo,
            @RequestParam(defaultValue="2") int pageSize,
            Model model,
            HttpSession session) {
        
/*        Member member = (Member) session.getAttribute("loginUser");

        Paging pagemaker = new Paging();
        
        //전체 게시글 개수를 지정
        pagemaker.setTotalcount(flwService.getTotalCount(member.getMno()));
        
        //현재 페이지를 페이지 객체에 지정 , -1을 해야 쿼리에서 사용할 수 있다.
        pagemaker.setPageNo(pageNo);
        
        //한 페이지에 몇개씩 게시글을 보여줄지 지정
        pagemaker.setPageSize(pageSize);
        
        //현재 페이지 블록이 몇번인지 현재 페이지 번호를 통해 지정
        pagemaker.setCurrentblock(pageNo);
        
        //마지막 블록 번호를 전체 게시글 수를 통해서 정한다.
        pagemaker.setLastblock(pagemaker.getTotalcount());
        
        //현재 페이지 번호로 화살표를 나타낼지 정한다.
        pagemaker.prevnext(pageNo);
        
        //시작페이지를 페이지 블록 번호로 정한다
        pagemaker.setStartPage(pagemaker.getCurrentblock());
        
        //마지막 페이지를 마지막 페이지 블록과 현재 페이지 블록 번호로 정한다.
        pagemaker.setEndPage(pagemaker.getLastblock(), pagemaker.getCurrentblock());
        
        
        Map<String, Object> condition = new HashMap<>();
        condition.put("mno", member.getMno());
        condition.put("pageNo", pageNo);
        condition.put("pageSize", pageSize);
        
        List<Member> a = flwService.list(condition);
        model.addAttribute("flwlist" , a);
        model.addAttribute("page", pagemaker);
        */
        return "follow/flwlist";

    }

 
    @RequestMapping("flwadd")
    public void addFlw(int flw, HttpSession session) {
        
        Member member = (Member) session.getAttribute("loginUser");
        
        int mno = member.getMno();
        
        Map<String,Object> condition =  new HashMap<>();
        condition.put("mno", mno);
        condition.put("flw", flw);
        
        
        flwService.add(condition);
    }
    
   @RequestMapping("flwdelete")
    public String deleteFlw(int flw,
            HttpSession session) {
        
       Member member = (Member)session.getAttribute("loginUser");
       int mno = member.getMno();
       
       Map<String,Object> condition =  new HashMap<>();
       condition.put("mno", mno);
       condition.put("flw", flw);
       
        flwService.delete(condition);
        
        return "redirect: flwlist";
    }
}