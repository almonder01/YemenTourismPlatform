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
	<jsp:include page="admin_header.jsp" />
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="card shadow-sm">
					<div class="card-header bg-primary text-white">
						<h3 class="mb-0">Booking Details (ID: ${booking.bookingId})</h3>
					</div>
					<div class="card-body">
						<h5 class="card-title">User Information</h5>
						<p>
							<strong>Username:</strong> ${booking.username}
						</p>
						<hr>
						<h5 class="card-title">Booking & Package</h5>
						<p>
							<strong>Package:</strong> ${booking.packageName}
						</p>
						<p>
							<strong>Destination:</strong> ${booking.destinationName}
						</p>
						<p>
							<strong>Travel Date:</strong>
							<fmt:formatDate value="${booking.travelDate}"
								pattern="MMMM dd, yyyy" />
						</p>
						<p>
							<strong>Booking Date:</strong>
							<fmt:formatDate value="${booking.bookingDate}"
								pattern="MMM dd, yyyy 'at' HH:mm" />
						</p>
						<p>
							<strong>Number of Travelers:</strong>
							${booking.numberOfTravelers}
						</p>
						<p>
							<strong>Total Price:</strong> $
							<fmt:formatNumber value="${booking.totalPrice}" type="number"
								minFractionDigits="2" maxFractionDigits="2" />
						</p>
						<p>
							<strong>Special Requests:</strong>
							<c:choose>
								<c:when test="${not empty booking.specialRequests}">${booking.specialRequests}</c:when>
								<c:otherwise>
									<span class="text-muted">None</span>
								</c:otherwise>
							</c:choose>
						</p>
						<hr>
						<h5 class="card-title">Payment Status</h5>
						<p>
							<span
								class="badge fs-6
                                <c:choose>
                                    <c:when test='${booking.paymentStatus == "Confirmed"}'>bg-success</c:when>
                                    <c:when test='${booking.paymentStatus == "Pending"}'>bg-warning text-dark</c:when>
                                    <c:when test='${booking.paymentStatus == "Cancelled"}'>bg-secondary</c:when>
                                    <c:when test='${booking.paymentStatus == "Rejected"}'>bg-danger</c:when>
                                    <c:otherwise>bg-danger</c:otherwise>
                                </c:choose>">
								${booking.paymentStatus} </span>
						</p>
					</div>
					<div class="card-footer bg-light">
						<div class="d-flex justify-content-between align-items-center">
							

							<a href="${pageContext.request.contextPath}/admin/manage-bookings"
							   class="btn btn-secondary">
								<i class="bi bi-arrow-left"></i> Back to List
							</a>
	

							<div>
								<%-- زر الموافقة (يظهر فقط للحجوزات المعلقة) --%>
								<c:if test="${booking.paymentStatus == 'Pending'}">
									<form action="${pageContext.request.contextPath}/admin/manage-booking" method="post" class="d-inline">
										<input type="hidden" name="action" value="approve">
										<input type="hidden" name="bookingId" value="${booking.bookingId}">
										<button type="submit" class="btn btn-success">
											<i class="bi bi-check-circle"></i> Approve
										</button>
									</form>
								</c:if>
	

								<c:if test="${booking.paymentStatus == 'Pending' || booking.paymentStatus == 'Confirmed'}">
									<form action="${pageContext.request.contextPath}/admin/manage-booking" method="post" class="d-inline">
										<input type="hidden" name="action" value="cancel">
										<input type="hidden" name="bookingId" value="${booking.bookingId}">
										<button type="submit" class="btn btn-warning"
												onclick="return confirm('Are you sure you want to cancel this booking?')">
											<i class="bi bi-slash-circle"></i> Cancel
										</button>
									</form>
								</c:if>
								

								<c:if test="${booking.paymentStatus == 'Cancelled'}">
									<form action="${pageContext.request.contextPath}/admin/manage-booking" method="post" class="d-inline">
										<input type="hidden" name="action" value="delete">
										<input type="hidden" name="bookingId" value="${booking.bookingId}">
										<button type="submit" class="btn btn-danger"
												onclick="return confirm('Are you sure you want to PERMANENTLY DELETE this booking? This action cannot be undone.')">
											<i class="bi bi-trash"></i> Delete
										</button>
									</form>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>