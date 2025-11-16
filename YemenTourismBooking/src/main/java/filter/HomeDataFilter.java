package filter;

import dao.DestinationDao;
import model.Destination;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

@WebFilter(urlPatterns = {"/index.jsp"})
public class HomeDataFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest request = (HttpServletRequest) req;
        if (request.getAttribute("destinations") == null) {
            System.out.println("--- HomeDataFilter: Data not found. Loading featured destinations... ---");
            DestinationDao destinationDao = new DestinationDao();
            List<Destination> featuredDestinations = destinationDao.getFeaturedDestinations(6);
            request.setAttribute("destinations", featuredDestinations);
        }
        chain.doFilter(request, res);
    }

    @Override public void init(FilterConfig filterConfig) throws ServletException {}
    @Override public void destroy() {}
}