package controller;

import dao.BookingDao;
import dao.PackageDao;
import model.Booking;
import model.Package;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;

@WebServlet(name = "BookingServlet", urlPatterns = "/booking")
public class BookingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {

            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            int packageId = Integer.parseInt(request.getParameter("packageId"));
            
            PackageDao packageDao = new PackageDao();
            Package selectedPackage = packageDao.getPackageById(packageId);
            
            if (selectedPackage == null) {
                response.sendRedirect(request.getContextPath() + "/destinations");
                return;
            }
            
            request.setAttribute("selectedPackage", selectedPackage);
            request.getRequestDispatcher("/booking.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/destinations");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {

            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            User user = (User) session.getAttribute("user");
            int packageId = Integer.parseInt(request.getParameter("packageId"));
            Date travelDate = Date.valueOf(request.getParameter("travelDate"));
            int numberOfTravelers = Integer.parseInt(request.getParameter("travelers"));
            String specialRequests = request.getParameter("notes");
            
            PackageDao packageDao = new PackageDao();
            Package selectedPackage = packageDao.getPackageById(packageId);
            
            if (selectedPackage == null) {
                throw new ServletException("Package not found for booking.");
            }

            BigDecimal totalPrice = selectedPackage.getPrice().multiply(new BigDecimal(numberOfTravelers));
            
            Booking booking = new Booking();
            booking.setUserId(user.getUserId());
            booking.setPackageId(packageId);
            booking.setTravelDate(travelDate);
            booking.setNumberOfTravelers(numberOfTravelers);
            booking.setSpecialRequests(specialRequests);
            booking.setTotalPrice(totalPrice);
            booking.setPaymentStatus("Pending");
            
            BookingDao bookingDao = new BookingDao();
            Booking createdBooking = bookingDao.createBooking(booking); 
            
            session.setAttribute("lastBooking", createdBooking);
            session.setAttribute("successMessage", "Your booking request has been received!");

            response.sendRedirect(request.getContextPath() + "/booking-confirmation");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing your booking. Please try again.");
            request.getRequestDispatcher("/booking.jsp").forward(request, response);
        }
    }
}