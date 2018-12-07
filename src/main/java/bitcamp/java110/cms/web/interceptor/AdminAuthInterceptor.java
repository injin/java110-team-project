package bitcamp.java110.cms.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;
import bitcamp.java110.cms.domain.Member;

public class AdminAuthInterceptor implements HandlerInterceptor {
  
  @Override
  public boolean preHandle(
          HttpServletRequest request,
          HttpServletResponse response,
          Object handler) throws Exception {
    
    Member loginUser = (Member)request.getSession().getAttribute("loginUser");
    if (loginUser == null || loginUser.isAdmin() == false) {
        response.sendRedirect(request.getServletPath() + "/error/notAdmin");
        return false;
    }
    
    return true;
  }

}
