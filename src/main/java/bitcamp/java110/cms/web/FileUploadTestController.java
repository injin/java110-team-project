package bitcamp.java110.cms.web;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/fileUpload")
public class FileUploadTestController {
  
  @Autowired ServletContext sc;

  @RequestMapping("/test")
  public String test() {
    
    return "test";
  }
  
  @RequestMapping("/upload")
  public @ResponseBody List<String> upload (
      MultipartFile[] files) throws Exception {
    
    List<String> filenames = new ArrayList<>();
    
    // 사진 데이터 처리
    for(int i=0;i<files.length;i++) {
      MultipartFile file = files[i];
      if (file.getSize() > 0) {
        String filename = UUID.randomUUID().toString();
        System.out.println(filename);
        file.transferTo(new File(sc.getRealPath("/upload/test/" + filename)));
        filenames.add(filename);
      }
    }
    
    return filenames;
  }
  
  @RequestMapping("/remove")
  public @ResponseBody boolean removeFile(
      String fileName) {
    
    System.out.println("삭제 요청" + fileName);
    File targetFile = new File(sc.getRealPath("/upload/test/" + fileName));
    if (targetFile.exists()) {
      return targetFile.delete();
    }
    return false;
  }
  
}
