package bitcamp.java110.cms.web;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import bitcamp.java110.cms.dao.MsDao;
import bitcamp.java110.cms.domain.Ms;
import bitcamp.java110.cms.service.MsService;

@Controller
@RequestMapping("/practice")
public class MsController {

    MsService msService;
    ServletContext sc;
    @ Autowired MsDao msDao;
    
    public MsController(MsService msService, ServletContext sc) {
        super();
        this.msService = msService;
        this.sc = sc;
    }

    
    @RequestMapping("form")
    public String form() {
      return "form";
    }
    
    
    @RequestMapping("add")
    public String add(Ms ms , MultipartFile file) throws Exception  {
    
        
        if (file.getSize() > 0) {
            String filename = UUID.randomUUID().toString();
            file.transferTo(new File(sc.getRealPath("/upload/" + filename)));
            ms.setPhot(filename);
        }
        
       msService.add(ms);
        
       return "redirect:list";
    }
    
    @RequestMapping("list")
    public String list(
              Model model //Model객체 생성
                    ) {
        
        //MsService에 있는 list메서드를 사용해서
        //List<Ms>의 객체 a에 담는다.
        List<Ms> a = msService.list();
        
        //Model addAttribute(String name, Object value)
        // value 객체를 name 이름으로 추가 
        model.addAttribute("list" , a);
        
        return "list";
    }
    
    
    @RequestMapping("detail")
    public String detail( int no, Model model) {
        
        Ms ms = msService.get(no);
        model.addAttribute("ms" , ms);
    
        
        return "detailform";
    }
    
    @RequestMapping("delete")
    public String delete(int no) {
        
        msService.delete(no);
        
        
        return "redirect:list";
    }
    
    
    @RequestMapping("updateform")
    public String updateform(Model model, int no) {
        
        Ms ms = msService.get(no);
        model.addAttribute("ms", ms);
        
        
        
        return "updateform";
    }
    
    
    @RequestMapping("update")
    public String update(Ms ms , MultipartFile file) throws Exception {
        
        
        if (file.getSize() > 0) {
            String filename = UUID.randomUUID().toString();
            file.transferTo(new File(sc.getRealPath("/upload/" + filename)));
            ms.setPhot(filename);
        }
        
        System.out.println(ms);
       
        msDao.update(ms);
        
       return "redirect:list";
    }
    
    @RequestMapping("follow")
    public String follow() {
        
        return "follow";
        
    }

}
