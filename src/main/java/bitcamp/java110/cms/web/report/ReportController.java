package bitcamp.java110.cms.web.report;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.java110.cms.domain.Report;
import bitcamp.java110.cms.service.ReportService;

@Controller
@RequestMapping("/report")
public class ReportController {

  ReportService reportService;
  ServletContext sc;

  public ReportController(
      ReportService reportService,
      ServletContext sc) {
    this.reportService = reportService;
    this.sc = sc;
  }

  @RequestMapping("/list")
  public String list() {
    System.out.println("장면리뷰에 들어옴");
    return "sceneReview/sceneReview";
  }

  @PostMapping("/add")
  public String add(Report report,
        Model model,
        String[] reportType) throws Exception{
    System.out.println("신고submit");
    
    // 신고유형
    List<String> types = new ArrayList<>();
    for(String t : reportType) {
      types.add(t);
      System.out.println(t);
    }
    
    report.setTypes(types);
    System.out.println(report.getCont());
    model.addAttribute("type", types);
    model.addAttribute("cont", report.getCont());
    reportService.add(report);
    return "report/admin";
  }


}
