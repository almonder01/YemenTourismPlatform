package controller;

import dao.BookingDao;
import model.BookingDetails;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MyBookingsServlet", urlPatterns = "/my_bookings")
public class MyBookingsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {

            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");
        BookingDao bookingDao = new BookingDao();
        List<BookingDetails> userBookings = bookingDao.getBookingsByUser(user.getUserId());
        
        request.setAttribute("userBookings", userBookings);
        
        request.getRequestDispatcher("/my_bookings.jsp").forward(request, response);
    }
}