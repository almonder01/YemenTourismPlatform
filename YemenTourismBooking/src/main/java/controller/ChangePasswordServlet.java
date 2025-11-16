package controller;

import dao.UserDao;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;
import java.io.IOException;

@WebServlet("/change_password")
public class ChangePasswordServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        request.getRequestDispatcher("/change_password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        UserDao userDao = new UserDao();

        if (!BCrypt.checkpw(oldPassword, user.getPasswordHash())) {
            request.setAttribute("error", "The old password you entered is incorrect.");
            request.getRequestDispatcher("/change_password.jsp").forward(request, response);
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "The new passwords do not match.");
            request.getRequestDispatcher("/change_password.jsp").forward(request, response);
            return;
        }
        
        if (newPassword.length() < 8) {
             request.setAttribute("error", "The new password must be at least 8 characters long.");
             request.getRequestDispatcher("/change_password.jsp").forward(request, response);
             return;
        }

        userDao.updatePassword(user.getUserId(), newPassword);

        session.setAttribute("success", "Your password has been changed successfully.");
        response.sendRedirect(request.getContextPath() + "/profile");
    }
}