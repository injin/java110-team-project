package bitcamp.java110.cms.web.report;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
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
  public String list() {
    return "sceneReview/review";
  }

  @PostMapping("/add")
  public @ResponseBody boolean add(
      @RequestBody Report report, HttpSession session) throws Exception{
    
    int mno = ((Member)session.getAttribute("loginUser")).getMno();
    report.setMno(mno);
    
    return reportService.add(report);
  }


}
