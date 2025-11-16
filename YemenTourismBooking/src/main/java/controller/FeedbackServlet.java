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

@WebServlet("/feedback")
public class FeedbackServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/feedback.jsp").forward(request, response);
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
            String subject = request.getParameter("subject");
            String message = request.getParameter("message");
            
            if (subject == null || subject.trim().isEmpty() || message == null || message.trim().isEmpty()) {
                request.setAttribute("feedbackError", "Subject and message cannot be empty.");
                request.getRequestDispatcher("/feedback.jsp").forward(request, response);
                return;
            }

            Feedback feedback = new Feedback();
            feedback.setUserId(user.getUserId());
            feedback.setName(user.getUsername());
            feedback.setEmail(user.getEmail());
            feedback.setSubject(subject);
            feedback.setMessage(message);
            
            FeedbackDao feedbackDao = new FeedbackDao();
            feedbackDao.addFeedback(feedback);

            session.setAttribute("feedbackSuccess", "Thank you for your feedback! We appreciate you helping us improve.");
            response.sendRedirect(request.getContextPath() + "/feedback");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("feedbackError", "An unexpected error occurred. Please try again later.");
            request.getRequestDispatcher("/feedback.jsp").forward(request, response);
        }
    }
}