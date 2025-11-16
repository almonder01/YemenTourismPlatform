package controller.admin;

import dao.BookingDao;
import model.BookingDetails;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/manage-booking")
public class AdminManageSingleBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingDao bookingDao = new BookingDao();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("details".equals(action)) {
            showBookingDetails(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/manage-bookings");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            int bookingId = Integer.parseInt(request.getParameter("bookingId"));
            
            switch (action) {
                case "cancel":
                    bookingDao.updateBookingStatus(bookingId, "Cancelled");
                    break;
                case "approve":
                    bookingDao.updateBookingStatus(bookingId, "Confirmed");
                    break;
                case "reject":
                    bookingDao.updateBookingStatus(bookingId, "Rejected"); 
                    break;
                case "delete":
                    BookingDetails booking = bookingDao.getBookingDetailsById(bookingId);
                    if (booking != null && 
                        ("Cancelled".equals(booking.getPaymentStatus()) || 
                         "Rejected".equals(booking.getPaymentStatus()))) {
                        
                        boolean deleted = bookingDao.deleteBooking(bookingId);
                        if (deleted) {
                            System.out.println("Booking ID " + bookingId + " deleted successfully.");
                        } else {
                            System.err.println("Failed to delete booking ID " + bookingId);
                        }
                    } else {
                        System.err.println("Cannot delete booking ID " + bookingId + " - only cancelled or rejected bookings can be deleted.");
                    }
                    break;
                default:
                    System.err.println("Unknown action: " + action);
                    break;
            }
        } catch (NumberFormatException e) {
            System.err.println("Invalid Booking ID provided.");
        } catch (Exception e) {
            System.err.println("Error processing booking action: " + e.getMessage());
        }
        
        response.sendRedirect(request.getContextPath() + "/admin/manage-bookings");
    }
    
    private void showBookingDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            BookingDetails booking = bookingDao.getBookingDetailsById(id);
            if (booking != null) {
                request.setAttribute("booking", booking);
                request.setAttribute("originalPath", "/admin/manage-booking");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/booking_details.jsp");
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/manage-bookings");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/manage-bookings");
        }
    }
}