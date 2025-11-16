package controller.user;

import dao.BookingDao;
import model.BookingDetails;
import model.User;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user/manage-booking")
public class UserManageBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingDao bookingDao = new BookingDao();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // For GET requests, redirect to bookings page
        response.sendRedirect(request.getContextPath() + "/user/bookings");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        

        String username = null;
        

        Object usernameAttr = session.getAttribute("username");
        if (usernameAttr instanceof String) {
            username = (String) usernameAttr;
        }
        
        // If not found, try to get User object and extract username
        if (username == null) {
            Object userAttr = session.getAttribute("user");
            if (userAttr instanceof model.User) {
                model.User user = (model.User) userAttr;
                username = user.getUsername();
            } else if (userAttr instanceof String) {
                username = (String) userAttr;
            }
        }
        
        // Debug logging
        System.out.println("DEBUG: Session username: " + username);
        System.out.println("DEBUG: All session attributes:");
        java.util.Enumeration<String> attributeNames = session.getAttributeNames();
        while (attributeNames.hasMoreElements()) {
            String name = attributeNames.nextElement();
            System.out.println("  " + name + " = " + session.getAttribute(name));
        }
        
        // Check if user is logged in
        if (username == null) {
            System.out.println("DEBUG: No username found in session, redirecting to login");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        String action = request.getParameter("action");
        String bookingIdParam = request.getParameter("bookingId");
        
        System.out.println("DEBUG: Action: " + action);
        System.out.println("DEBUG: BookingId: " + bookingIdParam);
        
        String successMessage = null;
        String errorMessage = null;
        
        try {
            if (bookingIdParam == null || bookingIdParam.trim().isEmpty()) {
                errorMessage = "Booking ID is required.";
                redirectToBookingsWithMessage(request, response, successMessage, errorMessage);
                return;
            }
            
            int bookingId = Integer.parseInt(bookingIdParam);
            
            // Get booking details to verify ownership
            BookingDetails booking = bookingDao.getBookingDetailsById(bookingId);
            
            if (booking == null) {
                errorMessage = "Booking not found.";
            } else if (!username.equals(booking.getUsername())) {
                errorMessage = "You are not authorized to modify this booking.";
                System.out.println("DEBUG: Username mismatch. Session: " + username + ", Booking: " + booking.getUsername());
            } else {
                switch (action) {
                    case "cancel":
                        if ("Pending".equals(booking.getPaymentStatus()) || 
                            "Confirmed".equals(booking.getPaymentStatus())) {
                            
                            try {
                                bookingDao.updateBookingStatus(bookingId, "Cancelled");
                                successMessage = "Booking #" + bookingId + " has been cancelled successfully.";
                                System.out.println("DEBUG: Booking cancelled successfully");
                            } catch (Exception e) {
                                errorMessage = "Failed to cancel the booking. Please try again.";
                                System.err.println("Error updating booking status: " + e.getMessage());
                                e.printStackTrace();
                            }
                        } else {
                            errorMessage = "Only pending or confirmed bookings can be cancelled.";
                        }
                        break;
                        
                    case "details":
                        // Show booking details - forward to user_booking_details.jsp
                        System.out.println("DEBUG: Showing booking details");
                        request.setAttribute("booking", booking);
                        request.setAttribute("originalPath", "/user/manage-booking");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("/user_booking_details.jsp");
                        dispatcher.forward(request, response);
                        return;
                        
                    default:
                        errorMessage = "Invalid action requested.";
                        break;
                }
            }
            
        } catch (NumberFormatException e) {
            errorMessage = "Invalid booking ID provided.";
            System.err.println("NumberFormatException: " + e.getMessage());
        } catch (Exception e) {
            errorMessage = "An error occurred while processing your request. Please try again.";
            System.err.println("Error in UserManageBookingServlet: " + e.getMessage());
            e.printStackTrace();
        }
        
        // Redirect back to bookings page with message
        redirectToBookingsWithMessage(request, response, successMessage, errorMessage);
    }
    
    private void redirectToBookingsWithMessage(HttpServletRequest request, HttpServletResponse response, 
                                             String successMessage, String errorMessage) throws IOException {
        String redirectUrl = request.getContextPath() + "/user/bookings";
        
        try {
            if (successMessage != null) {
                redirectUrl += "?success=" + java.net.URLEncoder.encode(successMessage, "UTF-8");
            } else if (errorMessage != null) {
                redirectUrl += "?error=" + java.net.URLEncoder.encode(errorMessage, "UTF-8");
            }
            
            System.out.println("DEBUG: Redirecting to: " + redirectUrl);
            response.sendRedirect(redirectUrl);
        } catch (Exception e) {
            System.err.println("Error in redirect: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/user/bookings");
        }
    }
}