<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/tourism.tld" prefix="tour"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="admin_header.jsp" />

	<div class="container mt-5">
		<h2 class="text-center mb-5">Admin Dashboard</h2>

		<div class="row row-cols-1 row-cols-md-3 g-4 mb-5">
			<div class="col">
				<div class="card text-center p-3">
					<i class="fas fa-users text-primary"></i>
					<h5>Total Users: ${totalUsers}</h5>
				</div>
			</div>
			<div class="col">
				<div class="card text-center p-3">
					<i class="fas fa-map-marked-alt text-success"></i>
					<h5>Total Destinations: ${totalDestinations}</h5>
				</div>
			</div>
			<div class="col">
				<div class="card text-center p-3">
					<i class="fas fa-suitcase-rolling text-warning"></i>
					<h5>Total Bookings: ${totalBookings}</h5>
				</div>
			</div>
		</div>

		<h4 class="mb-3">Recent Bookings</h4>
		<div class="card">
			<div class="table-responsive">
				<table class="table table-hover mb-0">
					<thead>
						<tr>
							<th>Booking ID</th>
							<th>User</th>
							<th>Package</th>
							<th>Date</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="booking" items="${recentBookings}">
							<tr>
								<td>#${booking.bookingId}</td>
								<td>${booking.username}</td>
								<td>${booking.packageName}</td>
								<td><fmt:formatDate value="${booking.bookingDate}"
										type="both" dateStyle="short" timeStyle="short" /></td>
								<td><span
									class="badge 
        <c:choose>
            <c:when test='${booking.paymentStatus == "Confirmed"}'>bg-success</c:when>
            <c:when test='${booking.paymentStatus == "Pending"}'>bg-warning text-dark</c:when>
            <c:when test='${booking.paymentStatus == "Cancelled" or booking.paymentStatus == "Rejected"}'>bg-danger</c:when>
            <c:otherwise>bg-secondary</c:otherwise>
        </c:choose>">
										${booking.paymentStatus} </span></td>
							</tr>
						</c:forEach>
						<c:if test="${empty recentBookings}">
							<tr>
								<td colspan="5" class="text-center text-muted">No recent
									bookings found.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>