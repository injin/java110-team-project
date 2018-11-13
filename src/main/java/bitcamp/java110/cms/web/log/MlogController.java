package bitcamp.java110.cms.web.log;

import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.java110.cms.dao.MemberDao;
import bitcamp.java110.cms.dao.MlogDao;
import bitcamp.java110.cms.domain.Mlog;
import bitcamp.java110.cms.service.MlogService;

@Controller
public class MlogController {
 
  @Autowired MlogService mlogservice;
  @Autowired MlogDao mlogDao;
  @Autowired ServletContext sc;
  @Autowired MemberDao memberDao;
  
  @RequestMapping("/mloglist")
  public String list(Model model
      ) {
    
    List<Mlog> logList = mlogservice.getList();
    
    String thisDirect;
    String thisAct;
    String thisIndirect;
    String thisnick;
    
    for (Mlog log : logList) {
      thisDirect = log.getDirect();
      thisAct = log.getAct();
      thisIndirect = log.getIndirect();
      thisnick=log.getNick();    
      
      if ("mp".equals(thisDirect)) {
        if("wr".equals(thisAct)) {
          log.setText(log.getNick()+"님이 " + thisIndirect + "의 영화 리뷰를 작성했습니다");
        }
        else if("lk".equals(log.getAct())) {
          log.setText(log.getNick()+"님이 "+ thisIndirect +"의 영화 리뷰를 좋아합니다");
        }
      }
      else if("dp".equals(thisDirect)) {
        if("wr".equals(thisAct)) {
          log.setText(log.getNick()+"님이 일상리뷰를 작성했습니다");
        }
        else if("lk".equals(thisAct)) {
          log.setText(log.getNick()+"님이 " + thisIndirect + "의 영화 리뷰를 좋아합니다");
        }
      }
      else if("sr".equals(thisDirect)) {
        if("wr".equals(thisAct)) {
          log.setText(log.getNick()+"님이 " + thisIndirect +"에 장면리뷰를 작성했습니다");
        }
        else if("lk".equals(thisAct)) {
          log.setText(log.getNick()+"님이 " + thisIndirect +"의 장면리뷰를 좋아합니다");
        }
      }
      else if("sc".equals(thisDirect)) {
        log.setText(log.getNick()+"님이 " + thisIndirect +"의 장면리뷰에 댓글을 작성하였습니다");
      }
      else if("pc".equals(thisDirect)) {
        log.setText(log.getNick()+"님이 " + thisIndirect +"님의 게시물에 댓글을 작성했습니다");
      }
      else {
        log.setText(log.getNick()+"님이 " + thisIndirect +"을/를 팔로우 했습니다");
      }
      
    }
    
    model.addAttribute("list", logList);
    
    
    
    return "log/mloglist";
  }


}
