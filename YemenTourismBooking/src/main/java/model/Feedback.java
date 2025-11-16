package model;

import java.sql.Timestamp;

public class Feedback {
    private int feedbackId;
    private Integer userId;
    private String name;
    private String email;
    private String subject;
    private String message;
    private Timestamp submittedAt;
    private boolean isRead;

    public int getFeedbackId() { return feedbackId; }
    public void setFeedbackId(int feedbackId) { this.feedbackId = feedbackId; }

    public Integer getUserId() { return userId; }
    public void setUserId(Integer userId) { this.userId = userId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getSubject() { return subject; }
    public void setSubject(String subject) { this.subject = subject; }

    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }

    public Timestamp getSubmittedAt() { return submittedAt; }
    public void setSubmittedAt(Timestamp submittedAt) { this.submittedAt = submittedAt; }

    public boolean isRead() { return isRead; }
    public void setRead(boolean read) { isRead = read; }
}