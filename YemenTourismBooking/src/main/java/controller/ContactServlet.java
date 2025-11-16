package controller;

import dao.FeedbackDao;
import model.Feedback;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/contact.jsp").forward(request, response);
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("emailAddress");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        if (fullName == null || fullName.trim().isEmpty() || 
            email == null || email.trim().isEmpty() ||
            subject == null || subject.trim().isEmpty() || 
            message == null || message.trim().isEmpty()) {
            
            request.setAttribute("contactError", "All fields with an asterisk (*) are required.");
            request.getRequestDispatcher("/contact.jsp").forward(request, response);
            return;
        }

        FeedbackDao feedbackDao = new FeedbackDao();
        Feedback feedback = new Feedback();


        if (session != null && session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            feedback.setUserId(user.getUserId());
        }

        feedback.setName(fullName);
        feedback.setEmail(email);
        feedback.setSubject(subject);
        feedback.setMessage(message);
        
        try {
            feedbackDao.addFeedback(feedback);

            session.setAttribute("contactSuccess", "Thank you for your message! We will get back to you shortly.");
            response.sendRedirect(request.getContextPath() + "/contact");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("contactError", "An unexpected error occurred. Please try again later.");
            request.getRequestDispatcher("/contact.jsp").forward(request, response);
        }
    }
}