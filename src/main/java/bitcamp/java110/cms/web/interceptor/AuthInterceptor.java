package bitcamp.java110.cms.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;

public class AuthInterceptor implements HandlerInterceptor {
    
    @Override
    public boolean preHandle(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler) throws Exception {
        
        boolean result = false;
        
        if (request.getSession().getAttribute("loginUser") == null) {
          if (isAjaxRequest(request)) {
            response.setStatus(401);
            return false;
          } else {
            result = false;
          }
        } else {
          result = false;
        }
        
        if (result == false) {
          response.sendRedirect(request.getServletPath() + "/error/notLogged");
        }
        return result;
    }
    
    private boolean isAjaxRequest(HttpServletRequest req) {
      String header = req.getHeader("x-requested-with");
      if ("XMLHttpRequest".equals(header)){
       return true;
      }else{
       return false;
      }
    }
    
}
