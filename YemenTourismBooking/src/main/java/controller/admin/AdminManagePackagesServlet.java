package controller.admin;

import dao.DestinationDao;
import dao.PackageDao;
import model.Destination;
import model.Package;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet("/admin/manage-packages")
public class AdminManagePackagesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");

        if ("showEditForm".equals(action)) {
            showEditForm(request, response);
        } else {
            showPackagesPage(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        int destinationId = Integer.parseInt(request.getParameter("destinationId"));

        if ("add".equals(action)) {
            addPackage(request, response);
        } else if ("delete".equals(action)) {
            deletePackage(request, response);
        } else if ("update".equals(action)) {
            updatePackage(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/manage-packages?destinationId=" + destinationId);
        }
    }

    private void showPackagesPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int destinationId = Integer.parseInt(request.getParameter("destinationId"));
            
            DestinationDao destDao = new DestinationDao();
            PackageDao pkgDao = new PackageDao();

            Destination destination = destDao.getDestinationById(destinationId);
            List<Package> packages = pkgDao.getPackagesByDestinationId(destinationId);
            
            if (destination == null) {
                response.sendRedirect(request.getContextPath() + "/admin/manage-destinations");
                return;
            }
            
            request.setAttribute("destination", destination);
            request.setAttribute("packages", packages);
            
            request.getRequestDispatcher("/admin/manage_packages.jsp").forward(request, response); 
            
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/manage-destinations");
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int packageId = Integer.parseInt(request.getParameter("packageId"));
            PackageDao pkgDao = new PackageDao();
            Package pkg = pkgDao.getPackageById(packageId);

            if (pkg != null) {
                request.setAttribute("pkg", pkg);
                request.getRequestDispatcher("/admin/edit_package.jsp").forward(request, response);
            } else {
                int destinationId = Integer.parseInt(request.getParameter("destinationId"));
                response.sendRedirect(request.getContextPath() + "/admin/manage-packages?destinationId=" + destinationId + "&error=notFound");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/manage-destinations?error=invalidRequest");
        }
    }

    private void addPackage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int destinationId = Integer.parseInt(request.getParameter("destinationId"));
        try {
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            BigDecimal price = new BigDecimal(request.getParameter("price"));

            Package newPkg = new Package();
            newPkg.setDestinationId(destinationId);
            newPkg.setName(name);
            newPkg.setDescription(description);
            newPkg.setPrice(price);
            
            PackageDao pkgDao = new PackageDao();
            pkgDao.addPackage(newPkg);
            
            response.sendRedirect(request.getContextPath() + "/admin/manage-packages?destinationId=" + destinationId + "&status=added");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/manage-packages?destinationId=" + destinationId + "&error=addFailed");
        }
    }

    private void updatePackage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int destinationId = Integer.parseInt(request.getParameter("destinationId"));
        try {
            int packageId = Integer.parseInt(request.getParameter("packageId"));
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            BigDecimal price = new BigDecimal(request.getParameter("price"));

            Package pkgToUpdate = new Package();
            pkgToUpdate.setPackageId(packageId);
            pkgToUpdate.setDestinationId(destinationId);
            pkgToUpdate.setName(name);
            pkgToUpdate.setDescription(description);
            pkgToUpdate.setPrice(price);

            PackageDao pkgDao = new PackageDao();
            pkgDao.updatePackage(pkgToUpdate);

            response.sendRedirect(request.getContextPath() + "/admin/manage-packages?destinationId=" + destinationId + "&status=updated");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/manage-packages?destinationId=" + destinationId + "&error=updateFailed");
        }
    }

    private void deletePackage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int destinationId = Integer.parseInt(request.getParameter("destinationId"));
        try {
            int packageId = Integer.parseInt(request.getParameter("packageId"));
            PackageDao pkgDao = new PackageDao();
            pkgDao.deletePackage(packageId);
            response.sendRedirect(request.getContextPath() + "/admin/manage-packages?destinationId=" + destinationId + "&status=deleted");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/manage-packages?destinationId=" + destinationId + "&error=deleteFailed");
        }
    }
}