package controller.admin;

import dao.DestinationDao;
import model.Destination;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/manage-destinations")
public class AdminManageDestinationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        DestinationDao destinationDao = new DestinationDao();

        if ("edit".equals(action)) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                Destination destination = destinationDao.getDestinationById(id);
                if (destination != null) {
                    request.setAttribute("destination", destination);
                    request.getRequestDispatcher("/admin/edit_destination.jsp").forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/admin/manage-destinations");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/admin/manage-destinations");
            }
        } 

        else {
            List<Destination> allDestinations = destinationDao.getAllDestinations();
            request.setAttribute("destinations", allDestinations);
            request.getRequestDispatcher("/admin/manage_destinations.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        DestinationDao destinationDao = new DestinationDao();

        try {
            if ("add".equals(action)) {
                String name = request.getParameter("name");
                String summary = request.getParameter("summary");
                String description = request.getParameter("description");
                String imageUrl = request.getParameter("imageUrl");
                boolean isFeatured = "true".equals(request.getParameter("isFeatured"));

                Destination newDest = new Destination();
                newDest.setName(name);
                newDest.setSummary(summary);
                newDest.setDescription(description);
                newDest.setImageUrl(imageUrl);
                newDest.setFeatured(isFeatured);
                
                destinationDao.addDestination(newDest);
                session.setAttribute("adminMessage", "Destination '" + name + "' added successfully!");

            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                destinationDao.deleteDestination(id);
                session.setAttribute("adminMessage", "Destination with ID " + id + " has been deleted.");
            
            } else if ("update".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                String summary = request.getParameter("summary");
                String description = request.getParameter("description");
                String imageUrl = request.getParameter("imageUrl");
                boolean isFeatured = "true".equals(request.getParameter("isFeatured"));
                
                Destination destToUpdate = new Destination();
                destToUpdate.setDestinationId(id);
                destToUpdate.setName(name);
                destToUpdate.setSummary(summary);
                destToUpdate.setDescription(description);
                destToUpdate.setImageUrl(imageUrl);
                destToUpdate.setFeatured(isFeatured);
               
                destinationDao.updateDestination(destToUpdate);
                session.setAttribute("adminMessage", "Destination '" + name + "' updated successfully!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("adminError", "An error occurred: " + e.getMessage());
        }

        response.sendRedirect(request.getContextPath() + "/admin/manage-destinations");
    }
}