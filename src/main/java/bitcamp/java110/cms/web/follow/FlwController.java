<<<<<<< HEAD
package bitcamp.java110.cms.web.follow;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.java110.cms.dao.FlwDao;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.service.FlwService;

@Controller
@RequestMapping("/flw")
public class FlwController {


    @Autowired
    FlwService flwService;

    @Autowired 
    FlwDao flwDao;

    @RequestMapping("flwlist")
    public String flwlist(Model model,
            HttpSession session) {

        Member member = (Member) session.getAttribute("loginUser");
        List<Member> a = flwService.list(member.getMno());
        model.addAttribute("flwlist" , a);

        return "follow/flwlist";

    }

 
/*    @RequestMapping("flwadd")
    public void addFlw(Model model, HttpSession session) {
        
        Member member = (Member) session.getAttribute("loginUser");
        int a = flwService.add(member.getMno());
        model.addAttribute("addFlw" , a);
        
    }*/
    
/*    @RequestMapping("flwdelete")
    public String deleteFlw(int no) {
        
        flwService.delete(no);
        
        return "redirect: flwlist";
    }
    */


    /*    @RequestMapping("list")
    public String list(
              Model model //Model객체 생성
                    ) {

        //flwService에 있는 list메서드를 사용해서
        //List<Ms>의 객체 a에 담는다.
        List<Flw> a = flwService.list();

        //Model addAttribute(String name, Object value)
        // value 객체를 name 이름으로 추가 
        model.addAttribute("list" , a);

        return "";
    }*/


    /*    @RequestMapping("detail")
    public String detail( int no, Model model) {

        Flw mno = flwService.get(no);
        model.addAttribute("mno" , mno);


        return "flwlist";
    }

    @RequestMapping("delete")
    public String delete(int no) {

        flwService.delete(no);


        return "";
    }
     */

}
=======
package bitcamp.java110.cms.web.follow;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bitcamp.java110.cms.dao.FlwDao;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.service.FlwService;

@Controller
@RequestMapping("/flw")
public class FlwController {


    @Autowired
    FlwService flwService;

    @Autowired 
    FlwDao flwDao;

    @RequestMapping("flwlist")
    public String flwlist(Model model,
            HttpSession session) {

        Member member = (Member) session.getAttribute("loginUser");
        List<Member> a = flwService.list(member.getMno());
        model.addAttribute("flwlist" , a);

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
>>>>>>> 3db115f43a25d2c18f75d5d68a138ff48a244f60
