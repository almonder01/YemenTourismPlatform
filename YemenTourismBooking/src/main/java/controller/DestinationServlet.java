package controller;

import java.io.IOException;
import java.util.List;
import dao.DestinationDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Destination;

@WebServlet("/destinations")
public class DestinationServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DestinationDao destinationDao = new DestinationDao();
		List<Destination> allDestinations = destinationDao.getAllDestinations();
   	    request.setAttribute("allDestinations", allDestinations);
		request.getRequestDispatcher("/destinations.jsp").forward(request, response);
	}
}