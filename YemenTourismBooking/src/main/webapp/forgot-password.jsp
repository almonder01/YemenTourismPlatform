<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password - Yemen Tourism</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.1/font/bootstrap-icons.min.css">
</head>
<body class="bg-light">

    <jsp:include page="header.jsp" />

    <div class="container" style="max-width: 500px; margin-top: 5rem; margin-bottom: 5rem;">
        <div class="card shadow-sm">
            <div class="card-body p-5">
                <div class="text-center mb-4">
                    <h2 class="fw-bold">Forgot Your Password?</h2>
                    <p class="text-muted">No problem. Enter your email address and we'll send you a link to reset it.</p>
                </div>

                <c:if test="${param.submitted eq 'true'}">
                    <div class="alert alert-warning" role="alert">
                        <h4 class="alert-heading"><i class="bi bi-tools me-2"></i>Under Development</h4>
                        <p>We're sorry, the password reset feature is not yet available. We are working hard to bring it to you soon.</p>
                        <hr>
                        <p class="mb-0">Please contact support if you need immediate assistance.</p>
                    </div>
                </c:if>

                <form action="forgot-password.jsp?submitted=true" method="post">
                    <div class="mb-3">
                        <label for="email" class="form-label">Email Address</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="d-grid mb-3">
                        <button type="submit" class="btn btn-primary btn-lg">Send Reset Link</button>
                    </div>
                </form>
                <div class="text-center">
                    <a href="${pageContext.request.contextPath}/login">Back to Login</a>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>