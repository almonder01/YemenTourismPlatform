package controller.admin;

import dao.BookingDao;
import dao.DestinationDao;
import dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.BookingDetails;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        UserDao userDao = new UserDao();
        DestinationDao destinationDao = new DestinationDao();
        BookingDao bookingDao = new BookingDao();

        long totalUsers = userDao.getUserCount();
        long totalDestinations = destinationDao.getDestinationCount();
        long totalBookings = bookingDao.getBookingCount();
        
        List<BookingDetails> recentBookings = bookingDao.getRecentBookings(5);

        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("totalDestinations", totalDestinations);
        request.setAttribute("totalBookings", totalBookings);
        request.setAttribute("recentBookings", recentBookings);

        request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
    }
}