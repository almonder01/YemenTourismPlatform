package filter;

import java.io.IOException;
import java.util.List;
import dao.DestinationDao;
import model.Destination;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;

@WebFilter("/*")
public class FooterDataFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        if (request.getAttribute("footerDestinations") == null) {
            DestinationDao destinationDao = new DestinationDao();
            List<Destination> footerDestinations = destinationDao.getFeaturedDestinations(4);
            request.setAttribute("footerDestinations", footerDestinations);
        }
        
        chain.doFilter(request, response);
    }
}