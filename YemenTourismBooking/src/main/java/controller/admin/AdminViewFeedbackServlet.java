package controller.admin;

import dao.FeedbackDao;
import model.Feedback;   
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/view-feedback")
public class AdminViewFeedbackServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        FeedbackDao feedbackDao = new FeedbackDao();
        List<Feedback> feedbackList = feedbackDao.getAllFeedback();
        
        request.setAttribute("feedbackList", feedbackList);
        
        request.getRequestDispatcher("/admin/view_feedback.jsp").forward(request, response);
    }
}