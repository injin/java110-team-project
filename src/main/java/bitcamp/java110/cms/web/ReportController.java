package bitcamp.java110.cms.web;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.java110.cms.domain.Post;
import bitcamp.java110.cms.service.PostService;

@Controller
@RequestMapping("/report")
public class ReportController {

  ServletContext sc;

  public ReportController(
      ServletContext sc) {
    this.sc = sc;
  }

  @RequestMapping("/list")
  public String list() {
    System.out.println("장면리뷰에 들어옴");
    return "sceneReview";
  }



}
