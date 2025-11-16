package controller.admin;

import dao.BookingDao;
import model.BookingDetails;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/manage-bookings")
public class AdminViewBookingsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        BookingDao bookingDao = new BookingDao();
        List<BookingDetails> allBookings = bookingDao.getAllBookings();
        
        request.setAttribute("bookings", allBookings);
        request.getRequestDispatcher("/admin/manage_bookings.jsp").forward(request, response);
    }
}