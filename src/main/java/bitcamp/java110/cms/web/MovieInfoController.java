package bitcamp.java110.cms.web;

import java.util.HashMap;
import java.util.Map;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value="/movieInfo")
public class MovieInfoController {
  
  @RequestMapping(value="/listByKeyword", method=RequestMethod.POST)
  public @ResponseBody Map<String, Object> listByKeyword(
      @RequestBody Map<String, Object> request) throws Exception {
    
    Map<String, Object> result = new HashMap<>();
    result.put("keyword", request.get("keyword"));
    result.put("movie", "베놈(2016)");
    
    return result;
  }
  
  
}
