package filter;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;

@WebFilter("/*")
public class ErrorHandlingFilter implements Filter {

 public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
         throws IOException, ServletException {
     
     try {
         chain.doFilter(request, response);
     } catch (Throwable t) {
         System.err.println("Error caught by ErrorHandlingFilter:");
         t.printStackTrace();
         request.setAttribute("jakarta.servlet.error.exception", t);
         request.setAttribute("jakarta.servlet.error.request_uri", ((HttpServletRequest)request).getRequestURI());
         request.getRequestDispatcher("/error.jsp").forward(request, response);
     }
 }
}