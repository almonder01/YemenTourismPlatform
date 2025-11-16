<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/tourism.tld" prefix="tour"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<c:set var="booking" value="${sessionScope.lastBooking}" scope="page" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmation - Yemen Tourism</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.1/font/bootstrap-icons.min.css">
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="text-center mb-4">
                    <i class="bi bi-check-circle-fill text-success" style="font-size: 4rem;"></i>
                    <h2 class="fw-bold text-success mt-3">Booking Request Received!</h2>
                    <p class="text-muted">Thank you, ${sessionScope.user.username}. We have received your booking request. A confirmation email will be sent to you shortly.</p>
                </div>

                <div class="card shadow-sm">
                    <div class="card-header">
                        <h5 class="mb-0">Booking Summary (ID: ${booking.bookingId})</h5>
                    </div>
                    <div class="card-body p-4">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <span>Travel Date:</span> 
                                <strong><tour:formatDate value="${booking.travelDate}" pattern="EEEE, MMMM dd, yyyy" /></strong>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <span>Number of Travelers:</span> 
                                <strong>${booking.numberOfTravelers}</strong>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <span>Total Price:</span> 
                                <strong class="text-success h5"><fmt:formatNumber value="${booking.totalPrice}" type="currency" currencyCode="USD" /></strong>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <span>Payment Status:</span> 
                                <strong><span class="badge bg-warning text-dark">${booking.paymentStatus}</span></strong>
                            </li>
                        </ul>
                        <c:if test="${not empty booking.specialRequests}">
                            <div class="mt-3 p-3 bg-light rounded">
                                <h6 class="mb-1">Your Special Requests:</h6>
                                <p class="text-muted fst-italic mb-0">"${booking.specialRequests}"</p>
                            </div>
                        </c:if>
                    </div>
                </div>

                <div class="text-center mt-4">
                    <a href="${pageContext.request.contextPath}/home" class="btn btn-primary">
                        <i class="bi bi-house-door-fill me-1"></i> Back to Home
                    </a> 
                    <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/my_bookings">
                        <i class="bi bi-briefcase-fill me-1"></i>View All My Bookings
                    </a>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <c:remove var="lastBooking" scope="session" />
    <c:remove var="successMessage" scope="session" />
</body>
</html>