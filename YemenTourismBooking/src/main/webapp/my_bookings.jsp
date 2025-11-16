<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/tourism.tld" prefix="tour"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Bookings - Yemen Tourism</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.1/font/bootstrap-icons.min.css">
</head>
<body class="bg-light">
	<jsp:include page="header.jsp" />

	<div class="container py-5">
		<div class="d-flex justify-content-between align-items-center mb-4">
			<h1 class="h2 fw-bold">My Bookings</h1>
			<a href="${pageContext.request.contextPath}/destinations"
				class="btn btn-primary"> <i class="bi bi-plus-circle-fill me-1"></i>
				Make a New Booking
			</a>
		</div>


		<c:if test="${not empty param.success}">
			<div class="alert alert-success alert-dismissible fade show"
				role="alert">
				<i class="bi bi-check-circle-fill me-2"></i> ${param.success}
				<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			</div>
		</c:if>

		<c:if test="${not empty param.error}">
			<div class="alert alert-danger alert-dismissible fade show"
				role="alert">
				<i class="bi bi-exclamation-triangle-fill me-2"></i> ${param.error}
				<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			</div>
		</c:if>

		<c:if test="${empty userBookings}">
			<div class="text-center p-5 bg-white rounded shadow-sm">
				<i class="bi bi-briefcase fs-1 text-muted"></i>
				<h4 class="mt-3">No Bookings Yet</h4>
				<p class="text-muted">You haven't made any bookings. Start
					exploring our amazing destinations!</p>
			</div>
		</c:if>

		<c:if test="${not empty userBookings}">
			<div class="row row-cols-1 g-4">
				<c:forEach var="booking" items="${userBookings}">
					<div class="col">
						<div class="card shadow-sm">
							<div
								class="card-header d-flex justify-content-between align-items-center">
								<h5 class="mb-0">Booking #${booking.bookingId}</h5>

								<c:set var="statusClass" value="bg-secondary" />
								<c:set var="statusIcon" value="bi-hourglass-split" />
								<c:if test="${booking.paymentStatus == 'Confirmed'}">
									<c:set var="statusClass" value="bg-success" />
									<c:set var="statusIcon" value="bi-check-circle-fill" />
								</c:if>
								<c:if test="${booking.paymentStatus == 'Pending'}">
									<c:set var="statusClass" value="bg-warning text-dark" />
									<c:set var="statusIcon" value="bi-clock-fill" />
								</c:if>
								<c:if test="${booking.paymentStatus == 'Cancelled'}">
									<c:set var="statusClass" value="bg-danger" />
									<c:set var="statusIcon" value="bi-x-circle-fill" />
								</c:if>
								<c:if test="${booking.paymentStatus == 'Rejected'}">
									<c:set var="statusClass" value="bg-danger" />
									<c:set var="statusIcon" value="bi-x-circle-fill" />
								</c:if>

								<span class="badge ${statusClass} fs-6 p-2"> <i
									class="bi ${statusIcon} me-1"></i> ${booking.paymentStatus}
								</span>
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col-md-8">
										<h4 class="card-title text-primary">${booking.packageName}</h4>
										<p class="card-text text-muted">
											<i class="bi bi-geo-alt-fill me-1"></i> Destination:
											${booking.destinationName}
										</p>
									</div>
									<div class="col-md-4 text-md-end">
										<p class="mb-1">
											<strong>Total Price:</strong>
										</p>
										<h4 class="text-success">
											<fmt:formatNumber value="${booking.totalPrice}"
												type="currency" currencyCode="USD" />
										</h4>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-6">
										<p class="mb-1">
											<i class="bi bi-calendar-event me-2"></i><strong>Travel
												Date:</strong>
										</p>
										<p>
											<tour:formatDate value="${booking.travelDate}"
												pattern="EEEE, MMMM dd, yyyy" />
										</p>
									</div>
									<div class="col-sm-6">
										<p class="mb-1">
											<i class="bi bi-people-fill me-2"></i><strong>Number
												of Travelers:</strong>
										</p>
										<p>${booking.numberOfTravelers}</p>
									</div>
								</div>
								<div class="row">
									<div class="col-12">
										<p class="mb-1">
											<i class="bi bi-clock-history me-2"></i><strong>Booking
												Date:</strong>
										</p>
										<p>
											<tour:formatDate value="${booking.bookingDate}"
												pattern="MMMM dd, yyyy 'at' HH:mm" />
										</p>
									</div>
								</div>

								<c:if test="${not empty booking.specialRequests}">
									<div class="row">
										<div class="col-12">
											<p class="mb-1">
												<i class="bi bi-chat-left-text me-2"></i><strong>Special
													Requests:</strong>
											</p>
											<p class="text-muted">${booking.specialRequests}</p>
										</div>
									</div>
								</c:if>
							</div>


							<div class="card-footer bg-light">
								<div class="d-flex justify-content-between align-items-center">
									<small class="text-muted"> <i
										class="bi bi-info-circle me-1"></i> <c:choose>
											<c:when test="${booking.paymentStatus == 'Pending'}">
                                                Your booking is awaiting confirmation
                                            </c:when>
											<c:when test="${booking.paymentStatus == 'Confirmed'}">
                                                Your booking has been confirmed
                                            </c:when>
											<c:when test="${booking.paymentStatus == 'Cancelled'}">
                                                This booking has been cancelled
                                            </c:when>
											<c:when test="${booking.paymentStatus == 'Rejected'}">
                                                This booking has been rejected
                                            </c:when>
										</c:choose>
									</small>

									<div>

										<form
											action="${pageContext.request.contextPath}/user/manage-booking"
											method="post" class="d-inline">
											<input type="hidden" name="action" value="details"> <input
												type="hidden" name="bookingId" value="${booking.bookingId}">
											<button type="submit" class="btn btn-outline-info btn-sm">
												<i class="bi bi-eye me-1"></i> View Details
											</button>
										</form>

										<c:if
											test="${booking.paymentStatus == 'Pending' || booking.paymentStatus == 'Confirmed'}">
											<form
												action="${pageContext.request.contextPath}/user/manage-booking"
												method="post" class="d-inline">
												<input type="hidden" name="action" value="cancel"> <input
													type="hidden" name="bookingId" value="${booking.bookingId}">
												<button type="submit" class="btn btn-outline-danger btn-sm"
													onclick="return confirm('Are you sure you want to cancel this booking? This action cannot be undone.')">
													<i class="bi bi-x-circle me-1"></i> Cancel Booking
												</button>
											</form>
										</c:if>

										<c:if
											test="${booking.paymentStatus == 'Cancelled' || booking.paymentStatus == 'Rejected'}">
											<a href="${pageContext.request.contextPath}/destinations"
												class="btn btn-outline-primary btn-sm"> <i
												class="bi bi-arrow-clockwise me-1"></i> Book Again
											</a>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>

	<jsp:include page="footer.jsp" />
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>