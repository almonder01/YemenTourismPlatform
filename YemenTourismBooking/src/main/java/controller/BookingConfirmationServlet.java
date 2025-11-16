package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/booking-confirmation")
public class BookingConfirmationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);

          if (session == null || session.getAttribute("lastBooking") == null) {
            response.sendRedirect(request.getContextPath() + "/my_bookings");
            return;
        }

        request.getRequestDispatcher("/bookingConfirmation.jsp").forward(request, response);
    }
}