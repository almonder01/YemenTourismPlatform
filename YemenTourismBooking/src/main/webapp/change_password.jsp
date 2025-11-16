<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tlds/tourism.tld" prefix="tour" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password - Yemen Tourism</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.1/font/bootstrap-icons.min.css">
</head>
<body class="bg-light">
    <jsp:include page="header.jsp" />

    <div class="container py-5">
        <div class="row">

            <div class="col-lg-3">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title mb-4">Account Settings</h5>
                        <div class="list-group list-group-flush">
                            <a href="${pageContext.request.contextPath}/profile" class="list-group-item list-group-item-action">
                                <i class="bi bi-person-fill me-2"></i>Profile
                            </a>
                            <a href="${pageContext.request.contextPath}/my_bookings" class="list-group-item list-group-item-action">
                                <i class="bi bi-briefcase-fill me-2"></i>My Bookings
                            </a>
                            <a href="${pageContext.request.contextPath}/change_password" class="list-group-item list-group-item-action active" aria-current="true">
                                <i class="bi bi-key-fill me-2"></i>Change Password
                            </a>
                            <a href="${pageContext.request.contextPath}/logout" class="list-group-item list-group-item-action text-danger">
                                <i class="bi bi-box-arrow-right me-2"></i>Logout
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-9">
                <div class="card shadow-sm">
                    <div class="card-header bg-white py-3">
                        <h4 class="mb-0">Change Your Password</h4>
                    </div>
                    <div class="card-body p-4">
                        
                        <c:if test="${not empty success}">
                            <div class="alert alert-success" role="alert">${success}</div>
                            <c:remove var="success" scope="session"/>
                        </c:if>

                        <c:if test="${not empty error}">
                            <div class="alert alert-danger" role="alert">${error}</div>
                        </c:if>
                        
                        <form method="post" action="change_password">
                            <div class="mb-3">
                                <label for="oldPassword" class="form-label fw-semibold">Old Password</label>
                                <input type="password" class="form-control" id="oldPassword" name="oldPassword" required>
                            </div>
                            <div class="mb-3">
                                <label for="newPassword" class="form-label fw-semibold">New Password</label>
                                <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                                <div class="form-text">Password must be at least 8 characters long.</div>
                            </div>
                            <div class="mb-4">
                                <label for="confirmPassword" class="form-label fw-semibold">Confirm New Password</label>
                                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Update Password</button>
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