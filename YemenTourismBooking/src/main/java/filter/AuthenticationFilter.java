package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;


@WebFilter(urlPatterns = {
    "/booking", 
    "/my_bookings", 
    "/profile", 
    "/change_password", 
    "/feedback", 
    "/booking-confirmation",
    "/admin/*"
})
public class AuthenticationFilter implements Filter {

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
        } else {

            chain.doFilter(request, response);
        }
    }

    @Override public void init(FilterConfig filterConfig) {}
    @Override public void destroy() {}
}