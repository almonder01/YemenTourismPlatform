<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tlds/tourism.tld" prefix="tour" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Profile - Yemen Tourism</title>
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

                            <a href="${pageContext.request.contextPath}/profile" class="list-group-item list-group-item-action active" aria-current="true"><i class="bi bi-person-fill me-2"></i>Profile</a>
                            <tour:ifUser>
                                <a href="${pageContext.request.contextPath}/my_bookings" class="list-group-item list-group-item-action"><i class="bi bi-briefcase-fill me-2"></i>My Bookings</a>
                            </tour:ifUser>
                            <tour:ifAdmin>
                                <a href="${pageContext.request.contextPath}/admin/dashboard" class="list-group-item list-group-item-action"><i class="bi bi-speedometer2 me-2"></i>Admin Dashboard</a>
                            </tour:ifAdmin>
                            <a href="${pageContext.request.contextPath}/change_password" class="list-group-item list-group-item-action"><i class="bi bi-key-fill me-2"></i>Change Password</a>
                            <a href="${pageContext.request.contextPath}/logout" class="list-group-item list-group-item-action text-danger"><i class="bi bi-box-arrow-right me-2"></i>Logout</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-9">
                <div class="card shadow-sm">
                    <div class="card-header bg-white py-3"><h4 class="mb-0">Profile Information</h4></div>
                    <div class="card-body p-4">
                        <div class="row mb-3"><div class="col-sm-3"><h6 class="mb-0">Username</h6></div><div class="col-sm-9 text-secondary">${sessionScope.user.username}</div></div>
                        <hr>
                        <div class="row mb-3"><div class="col-sm-3"><h6 class="mb-0">Email</h6></div><div class="col-sm-9 text-secondary">${sessionScope.user.email}</div></div>
                        <hr>
                        <div class="row mb-3">
                            <div class="col-sm-3"><h6 class="mb-0">Account Type</h6></div>
                            <div class="col-sm-9 text-secondary">
                                <tour:ifAdmin><span class="badge bg-success">Administrator</span></tour:ifAdmin>
                                <tour:ifUser><span class="badge bg-primary">User</span></tour:ifUser>
                            </div>
                        </div>
                        <hr>
                        <div class="row"><div class="col-sm-3"><h6 class="mb-0">Member Since</h6></div><div class="col-sm-9 text-secondary"><tour:formatDate value="${sessionScope.user.createdAt}" pattern="MMMM dd, yyyy"/></div></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>