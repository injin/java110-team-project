package bitcamp.java110.cms.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bitcamp.java110.cms.domain.Flw;
import bitcamp.java110.cms.service.FlwService;

@Controller
@RequestMapping("/flw")
public class FlwController {

   
    @Autowired
    FlwService flwService;

    
    @RequestMapping("flwlist")
    public String flwlist(Model model) {
        
     List<Flw> a = flwService.list();
     model.addAttribute("flwlist" , a);
     
   
      return "flwlist";
    
    }
    

    
    
    
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
