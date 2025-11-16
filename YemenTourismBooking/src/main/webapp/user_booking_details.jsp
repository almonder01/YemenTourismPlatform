<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Booking Details - ID: ${booking.bookingId}</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.1/font/bootstrap-icons.min.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="card shadow-sm">
					<div class="card-header bg-primary text-white">
						<h3 class="mb-0">
							<i class="bi bi-receipt me-2"></i>
							Booking Details (ID: ${booking.bookingId})
						</h3>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-8">
								<h4 class="card-title text-primary">${booking.packageName}</h4>
								<p class="card-text text-muted">
									<i class="bi bi-geo-alt-fill me-2"></i>
									<strong>Destination:</strong> ${booking.destinationName}
								</p>
							</div>
							<div class="col-md-4 text-md-end">
								<p class="mb-1"><strong>Status:</strong></p>
								<span class="badge fs-6 p-2
									<c:choose>
										<c:when test='${booking.paymentStatus == "Confirmed"}'>bg-success</c:when>
										<c:when test='${booking.paymentStatus == "Pending"}'>bg-warning text-dark</c:when>
										<c:when test='${booking.paymentStatus == "Cancelled"}'>bg-danger</c:when>
										<c:when test='${booking.paymentStatus == "Rejected"}'>bg-danger</c:when>
										<c:otherwise>bg-secondary</c:otherwise>
									</c:choose>">
									<c:choose>
										<c:when test='${booking.paymentStatus == "Confirmed"}'>
											<i class="bi bi-check-circle-fill me-1"></i>
										</c:when>
										<c:when test='${booking.paymentStatus == "Pending"}'>
											<i class="bi bi-clock-fill me-1"></i>
										</c:when>
										<c:when test='${booking.paymentStatus == "Cancelled"}'>
											<i class="bi bi-x-circle-fill me-1"></i>
										</c:when>
										<c:when test='${booking.paymentStatus == "Rejected"}'>
											<i class="bi bi-x-circle-fill me-1"></i>
										</c:when>
										<c:otherwise>
											<i class="bi bi-hourglass-split me-1"></i>
										</c:otherwise>
									</c:choose>
									${booking.paymentStatus}
								</span>
							</div>
						</div>
						
						<hr>
						
						<div class="row">
							<div class="col-md-6">
								<h6 class="text-muted mb-3">
									<i class="bi bi-calendar-event me-2"></i>Travel Information
								</h6>
								<p class="mb-2">
									<strong>Travel Date:</strong>
									<fmt:formatDate value="${booking.travelDate}" pattern="EEEE, MMMM dd, yyyy" />
								</p>
								<p class="mb-2">
									<strong>Number of Travelers:</strong>
									${booking.numberOfTravelers}
								</p>
								<p class="mb-2">
									<strong>Booking Date:</strong>
									<fmt:formatDate value="${booking.bookingDate}" pattern="MMM dd, yyyy 'at' HH:mm" />
								</p>
							</div>
							<div class="col-md-6">
								<h6 class="text-muted mb-3">
									<i class="bi bi-credit-card me-2"></i>Payment Information
								</h6>
								<p class="mb-2">
									<strong>Total Price:</strong>
									<span class="text-success fw-bold fs-5">
										$<fmt:formatNumber value="${booking.totalPrice}" type="number" 
											minFractionDigits="2" maxFractionDigits="2" />
									</span>
								</p>
								<p class="mb-2">
									<strong>Payment Status:</strong>
									<span class="
										<c:choose>
											<c:when test='${booking.paymentStatus == "Confirmed"}'>text-success</c:when>
											<c:when test='${booking.paymentStatus == "Pending"}'>text-warning</c:when>
											<c:otherwise>text-danger</c:otherwise>
										</c:choose>">
										${booking.paymentStatus}
									</span>
								</p>
							</div>
						</div>
						
						<c:if test="${not empty booking.specialRequests}">
							<hr>
							<h6 class="text-muted mb-3">
								<i class="bi bi-chat-left-text me-2"></i>Special Requests
							</h6>
							<div class="alert alert-info">
								<i class="bi bi-info-circle me-2"></i>
								${booking.specialRequests}
							</div>
						</c:if>
						
						<hr>
						
						<div class="alert alert-light">
							<i class="bi bi-info-circle me-2"></i>
							<strong>Booking Status Information:</strong>
							<c:choose>
								<c:when test='${booking.paymentStatus == "Pending"}'>
									Your booking is currently pending approval. We will notify you once it's confirmed.
								</c:when>
								<c:when test='${booking.paymentStatus == "Confirmed"}'>
									Your booking has been confirmed! We're excited to have you on this journey.
								</c:when>
								<c:when test='${booking.paymentStatus == "Cancelled"}'>
									This booking has been cancelled. If you have any questions, please contact us.
								</c:when>
								<c:when test='${booking.paymentStatus == "Rejected"}'>
									This booking has been rejected. Please contact us for more information.
								</c:when>
								<c:otherwise>
									Please contact us if you have any questions about your booking status.
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					
					<div class="card-footer bg-light">
						<div class="d-flex justify-content-between align-items-center">
							<a href="${pageContext.request.contextPath}/user/bookings" 
							   class="btn btn-secondary">
								<i class="bi bi-arrow-left me-1"></i> Back to My Bookings
							</a>
							
							<div>

								<c:if test="${booking.paymentStatus == 'Pending' || booking.paymentStatus == 'Confirmed'}">
									<form action="${pageContext.request.contextPath}/user/manage-booking" 
										  method="post" class="d-inline">
										<input type="hidden" name="action" value="cancel">
										<input type="hidden" name="bookingId" value="${booking.bookingId}">
										<button type="submit" class="btn btn-danger" 
												onclick="return confirm('Are you sure you want to cancel this booking? This action cannot be undone.')">
											<i class="bi bi-x-circle me-1"></i> Cancel Booking
										</button>
									</form>
								</c:if>
								

								<c:if test="${booking.paymentStatus == 'Cancelled' || booking.paymentStatus == 'Rejected'}">
									<a href="${pageContext.request.contextPath}/destinations" 
									   class="btn btn-primary">
										<i class="bi bi-arrow-clockwise me-1"></i> Book Again
									</a>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="footer.jsp" />

</body>
</html>