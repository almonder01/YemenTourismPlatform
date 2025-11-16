package dao;

import model.Feedback;
import util.DatabaseUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDao {

    public void addFeedback(Feedback feedback) {
        String sql = "INSERT INTO feedback (user_id, name, email, subject, message) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseUtil.get_connection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            if (feedback.getUserId() != null) {
                ps.setInt(1, feedback.getUserId());
            } else {
                ps.setNull(1, Types.INTEGER);
            }
            ps.setString(2, feedback.getName());
            ps.setString(3, feedback.getEmail());
            ps.setString(4, feedback.getSubject());
            ps.setString(5, feedback.getMessage());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Feedback> getAllFeedback() {
        List<Feedback> feedbackList = new ArrayList<>();
        String sql = "SELECT * FROM feedback ORDER BY submitted_at DESC";
        try (Connection conn = DatabaseUtil.get_connection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setFeedbackId(rs.getInt("feedback_id"));
                int userId = rs.getInt("user_id");
                if (!rs.wasNull()) {
                    feedback.setUserId(userId);
                }
                feedback.setName(rs.getString("name"));
                feedback.setEmail(rs.getString("email"));
                feedback.setSubject(rs.getString("subject"));
                feedback.setMessage(rs.getString("message"));
                feedback.setSubmittedAt(rs.getTimestamp("submitted_at"));
                feedback.setRead(rs.getBoolean("is_read"));
                feedbackList.add(feedback);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return feedbackList;
    }
}