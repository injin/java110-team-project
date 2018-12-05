package bitcamp.java110.cms.web.report;

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
  public String list(
           RptPaging rptPaging,
           Model model
          ) {
      
       rptPaging.setTotalCount(reportService.getTotalCnt());
       
       Map<String, Object> condition = new HashMap<>();
       condition.put("rptPaging", rptPaging);
       List<Report> reportlist = reportService.list(condition);
      
       model.addAttribute("findAll", reportlist);
       model.addAttribute("getTotalCnt" , rptPaging);
      
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


}
