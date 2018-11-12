package bitcamp.java110.cms.web;

import java.io.File;
import java.util.UUID;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.java110.cms.dao.HsDao;
import bitcamp.java110.cms.domain.Hs;

@Controller
@RequestMapping("/hsform")

public class HsControl {

  @Autowired HsDao hsDao;
  @Autowired ServletContext sc;

  /*public HsControl(
   * 
      ServletContext sc) {
    this.sc = sc;
  }*/

  @RequestMapping("/hsboard")
  public String view() {

    System.out.println("hsboard 들어옴");
    return "auth/hsboard";

  }
  @PostMapping("add")
  public String add(Hs hs/*,
       @RequestParam(name="type")String type*/
      ,MultipartFile phot ) throws Exception {


    System.out.println("add 들어옴");


    if(phot.getSize()>0) {
      String filename = UUID.randomUUID().toString();
      System.out.println(filename);
      phot.transferTo(new File(sc.getRealPath("/upload/" + filename)));
      hs.setPhot(filename);
      System.out.println(hs);
    }

    hsDao.insert(hs);

    return "redirect:hslist";
  }

  @RequestMapping("/hslist")
  public String list(Model model
      ) {
    model.addAttribute("list", hsDao.list());
    System.out.println(model);
    System.out.println("list 들어옴");

    return "auth/hslist";
  }
  @GetMapping("change")
  public String change(int no, Model model) {
    
    model.addAttribute("hs",hsDao.findByno(no));
    System.out.println(no);
    System.out.println("change:"+model);
    System.out.println("수정페이지 들어옴");
    return "auth/hschange";
  }
  @PostMapping("update")
  public String update(Hs hs/*,
      @RequestParam(name="type")String type*/
     ,MultipartFile phot ) throws Exception {


   System.out.println("update 들어옴");
   

   if(phot.getSize()>0) {
     String filename = UUID.randomUUID().toString();
     System.out.println(filename);
     phot.transferTo(new File(sc.getRealPath("/upload/" + filename)));
     hs.setPhot(filename);
     System.out.println(hs);
   }

   System.out.println("hs update 전 확인" + hs.toString());
   hsDao.update(hs);

   return "redirect:hslist";
 }
  @GetMapping("hsdetail")
  public String detail(
          int no,
          Model model) {
     
      model.addAttribute("hs", hsDao.findByno(no));
      System.out.println(model);
      
      return "auth/hsdetail";
  }
  @GetMapping("delete")
  public String delete(int no) throws Exception {
      
      hsDao.delete(no);
      return "redirect:hslist";
  }
  


}
