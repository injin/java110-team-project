package bitcamp.java110.cms.web.admin.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import bitcamp.java110.cms.common.Paging;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.domain.Report;
import bitcamp.java110.cms.service.ReportService;

@Controller
@RequestMapping("/report")
public class ReportController {

  ReportService reportService;

  public ReportController(ReportService reportService) {
    this.reportService = reportService;
  }

  @RequestMapping("/list")
  public String list(Paging paging,Model model) {
      
       paging.setTotalCount(reportService.getTotalCnt());
       
       Map<String, Object> condition = new HashMap<>();
       condition.put("paging", paging);
       List<Report> reportList = reportService.list(condition);
      
       model.addAttribute("reportList", reportList);
       
       System.out.println(reportList);
      
      return "report/admin";
    
  }
  
  @RequestMapping("/addHndl")
  public @ResponseBody boolean addHndl(Report report) {
    
    boolean result =  reportService.addHcont(report);
    
    return result;
  }

  
  @PostMapping("/add")
  public @ResponseBody boolean add(
      @RequestBody Report report, HttpSession session) throws Exception{
    
    int mno = ((Member)session.getAttribute("loginUser")).getMno();
    report.setMno(mno);
    
    return reportService.add(report);
  }


  @RequestMapping("/updateHcont")
  public @ResponseBody boolean updateHcont(Report report) {
    
    boolean result =  reportService.updateHcont(report);
    
    return result;
  }
  
  
}
