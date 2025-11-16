package controller;

import java.io.IOException;
import java.util.List;
import dao.DestinationDao;
import model.Destination;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "HomeServlet", urlPatterns = {"/home", ""})
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        DestinationDao destinationDao = new DestinationDao();
        List<Destination> featuredDestinations = destinationDao.getFeaturedDestinations(6); 
        
        request.setAttribute("destinations", featuredDestinations);
        
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}