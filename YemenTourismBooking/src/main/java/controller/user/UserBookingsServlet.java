package controller.user;

import dao.BookingDao;
import dao.UserDao;
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

@WebServlet("/user/bookings")
public class UserBookingsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingDao bookingDao = new BookingDao();
    private UserDao userDao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();


        String username = null;
        User currentUser = null;

        // First try to get username as String
        Object usernameAttr = session.getAttribute("username");
        if (usernameAttr instanceof String) {
            username = (String) usernameAttr;
        }

        // If not found, try to get User object and extract username
        if (username == null) {
            Object userAttr = session.getAttribute("user");
            if (userAttr instanceof User) {
                currentUser = (User) userAttr;
                username = currentUser.getUsername();
            } else if (userAttr instanceof String) {
                username = (String) userAttr;
            }
        }

        // Check if user is logged in
        if (username == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            // Get user object if we don't have it already
            if (currentUser == null) {
                currentUser = userDao.getUserByUsername(username);
                if (currentUser == null) {
                    response.sendRedirect(request.getContextPath() + "/login");
                    return;
                }
            }

            // Get user's bookings
            List<BookingDetails> userBookings = bookingDao.getBookingsByUser(currentUser.getUserId());

            // Set bookings as request attribute
            request.setAttribute("userBookings", userBookings);

            // Forward to the correct JSP file - my_bookings.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("/my_bookings.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            System.err.println("Error in UserBookingsServlet: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}