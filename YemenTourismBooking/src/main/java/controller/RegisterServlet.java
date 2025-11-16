package controller;

import dao.UserDao;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        UserDao userDao = new UserDao();

        if (!password.equals(confirmPassword)) {
            request.setAttribute("registerError", "Passwords do not match.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }
        if (userDao.getUserByUsername(username) != null) {
            request.setAttribute("registerError", "Username already exists.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        User newUser = new User();
        newUser.setUsername(username);
        newUser.setEmail(email);
        newUser.setPasswordHash(password); 

        userDao.addUser(newUser);

        request.getSession().setAttribute("registerSuccess", "Account created successfully! Please login.");
        response.sendRedirect(request.getContextPath() + "/login");
    }
}