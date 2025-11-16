package controller;

import java.io.IOException;
import java.util.List;
import dao.DestinationDao;
import dao.PackageDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Destination;
import model.Package;

@WebServlet("/packages")
public class PackageServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String destinationIdStr = request.getParameter("destinationId");

		if (destinationIdStr == null || destinationIdStr.trim().isEmpty()) {
			response.sendRedirect(request.getContextPath() + "/destinations");
			return;
		}

		try {
			int destinationId = Integer.parseInt(destinationIdStr);

			DestinationDao destinationDao = new DestinationDao();
			PackageDao packageDao = new PackageDao();

			Destination destination = destinationDao.getDestinationById(destinationId);
			List<Package> packages = packageDao.getPackagesByDestinationId(destinationId);

			request.setAttribute("destination", destination);
			request.setAttribute("packages", packages);

			request.getRequestDispatcher("/package-selection.jsp").forward(request, response);

		} catch (NumberFormatException e) {
			System.err.println("Invalid destination ID format: " + destinationIdStr);
			response.sendRedirect(request.getContextPath() + "/destinations");
		}
	}
}