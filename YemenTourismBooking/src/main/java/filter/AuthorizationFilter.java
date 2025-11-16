package filter;

import model.User;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/admin/*")
public class AuthorizationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);


        if (session == null || session.getAttribute("user") == null) {

            session = request.getSession(); 
            String requestURI = request.getRequestURI();
            if (request.getQueryString() != null) {
                requestURI += "?" + request.getQueryString();
            }
            session.setAttribute("redirectUrl", requestURI);
            

            response.sendRedirect(request.getContextPath() + "/login");
            return; 
        }


        User user = (User) session.getAttribute("user");

        if ("admin".equalsIgnoreCase(user.getRole())) {

            chain.doFilter(request, response);
        } else {

             response.sendError(HttpServletResponse.SC_FORBIDDEN, "You are not authorized to access this page.");
        }
    }

    @Override public void init(FilterConfig filterConfig) {}
    @Override public void destroy() {}
}