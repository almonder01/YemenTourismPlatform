<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Bookings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.1/font/bootstrap-icons.min.css">
</head>
<body>

<jsp:include page="admin_header.jsp" />

<div class="container mt-5">
    <h2 class="text-primary mb-4">Manage All Bookings</h2>

    <div class="card shadow-sm">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>User</th>
                            <th>Package</th>
                            <th>Destination</th>
                            <th>Travel Date</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="booking" items="${bookings}">
                            <tr>
                                <td>${booking.bookingId}</td>
                                <td>${booking.username}</td>
                                <td>${booking.packageName}</td>
                                <td>${booking.destinationName}</td>
                                <td>
                                    <fmt:formatDate value="${booking.travelDate}" pattern="MMM dd, yyyy" />
                                </td>
                                <td>
                                    <span class="badge 
                                        <c:choose>
                                            <c:when test='${booking.paymentStatus == "Confirmed"}'>bg-success</c:when>
                                            <c:when test='${booking.paymentStatus == "Pending"}'>bg-warning text-dark</c:when>
                                            <c:otherwise>bg-danger</c:otherwise>
                                        </c:choose>">
                                        ${booking.paymentStatus}
                                    </span>
                                </td>
                                <td class="text-center">
                                    <div class="btn-group" role="group">
                                        <%-- زر التفاصيل دائمًا متاح --%>
                                        <a href="${pageContext.request.contextPath}/admin/manage-booking?action=details&id=${booking.bookingId}" class="btn btn-sm btn-info">
                                            <i class="bi bi-eye"></i> Details
                                        </a>

                                        <%-- زر الموافقة (يظهر فقط للحجوزات المعلقة) --%>
                                        <c:if test="${booking.paymentStatus == 'Pending'}">
                                            <form action="${pageContext.request.contextPath}/admin/manage-booking" method="post" class="d-inline">
                                                <input type="hidden" name="action" value="approve">
                                                <input type="hidden" name="bookingId" value="${booking.bookingId}">
                                                <button type="submit" class="btn btn-sm btn-success" title="Approve">
                                                    <i class="bi bi-check-lg"></i>
                                                </button>
                                            </form>
                                        </c:if>


                                        <c:if test="${booking.paymentStatus == 'Cancelled' || booking.paymentStatus == 'Rejected'}">
                                            <form action="${pageContext.request.contextPath}/admin/manage-booking" method="post" class="d-inline"
                                                  onsubmit="return confirm('Are you sure you want to permanently delete booking ID ${booking.bookingId}?');">
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="bookingId" value="${booking.bookingId}">
                                                <button type="submit" class="btn btn-sm btn-danger" title="Delete">
                                                    <i class="bi bi-trash"></i>
                                                </button>
                                            </form>
                                        </c:if>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>

                        <c:if test="${empty bookings}">
                            <tr>
                                <td colspan="7" class="text-center text-muted">No bookings found.</td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>