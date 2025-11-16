package controller;

import java.io.IOException;
import dao.DestinationDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Destination;

@WebServlet("/destination-details")
public class DestinationDetailsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            int destinationId = Integer.parseInt(request.getParameter("id"));
            DestinationDao destinationDao = new DestinationDao();
            Destination destination = destinationDao.getDestinationById(destinationId);
            
            if (destination != null) {
                request.setAttribute("destination", destination);
                request.getRequestDispatcher("/destination-details.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Destination not found.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid request.");
        }
    }
}