<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tlds/tourism.tld" prefix="tour" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit Feedback - Yemen Tourism</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.1/font/bootstrap-icons.min.css">
</head>
<body class="bg-light">

    <jsp:include page="header.jsp" />

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-7 col-md-9">

                <div class="text-center mb-4">
                    <h1 class="display-5 fw-bold text-primary">Share Your Feedback</h1>
                    <p class="lead text-muted">
                        Your opinion is important to us! Let us know about your experience.
                    </p>
                </div>

                <div class="card shadow-sm border-0">
                    <div class="card-body p-4 p-md-5">

                        <c:if test="${not empty sessionScope.feedbackSuccess}">
                            <div class="alert alert-success" role="alert">
                                <i class="bi bi-check-circle-fill me-2"></i>
                                ${sessionScope.feedbackSuccess}
                            </div>
                            <c:remove var="feedbackSuccess" scope="session"/>
                        </c:if>

                        <c:if test="${not empty feedbackError}">
                            <div class="alert alert-danger" role="alert">
                                <i class="bi bi-exclamation-triangle-fill me-2"></i>
                                ${feedbackError}
                            </div>
                        </c:if>

                        <form method="post" action="feedback">
                            <div class="mb-3">
                                <p class="mb-1"><strong>Submitting as:</strong></p>
                                <p class="text-muted">
                                    <i class="bi bi-person-circle me-1"></i>
                                    ${sessionScope.user.username} (${sessionScope.user.email})
                                </p>
                            </div>

                            <div class="mb-3">
                                <label for="subject" class="form-label fw-semibold">Subject</label>
                                <input type="text" class="form-control" id="subject" name="subject" placeholder="e.g., Feedback on Socotra Tour" required>
                            </div>
                            
                            <div class="mb-4">
                                <label for="message" class="form-label fw-semibold">Your Message</label>
                                <textarea class="form-control" id="message" name="message" rows="5" placeholder="Tell us more about your experience, what you liked, or what we can improve..." required></textarea>
                            </div>
                            
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary btn-lg">
                                    <i class="bi bi-send-fill me-2"></i>Submit Feedback
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>