<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/tlds/tourism.tld" prefix="tour" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Your Adventure: ${selectedPackage.name} - Yemen Tourism</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.1/font/bootstrap-icons.min.css">
</head>
<body class="bg-light">

    <jsp:include page="header.jsp" />

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">

                <div class="text-center mb-4">
                    <h2 class="fw-bold text-primary">Book Your Yemen Adventure</h2>
                    <p class="text-muted">You are just a few steps away from an unforgettable journey.</p>
                </div>
                
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger" role="alert">${errorMessage}</div>
                </c:if>

                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0">Booking for: ${selectedPackage.name}</h5>
                    </div>
                    <div class="card-body p-4">
                        <div class="alert alert-info">
                            <strong>Package Price:</strong> 
                            <fmt:formatNumber value="${selectedPackage.price}" type="currency" currencyCode="USD"/> per traveler.
                            <br>
                            The total price will be calculated based on the number of travelers.
                        </div>

                        <form method="post" action="booking">
                            <input type="hidden" name="packageId" value="${selectedPackage.packageId}">

                            <p class="mb-1"><strong>Booking as:</strong></p>
                            <p class="text-muted">${sessionScope.user.username} (${sessionScope.user.email})</p>

                            <hr>

                            <div class="row g-3">
                                <div class="col-md-6 mb-3">
                                    <label for="travelDate" class="form-label fw-semibold">Preferred Travel Date *</label>
                                    <input type="date" class="form-control" id="travelDate" name="travelDate" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="travelers" class="form-label fw-semibold">Number of Travelers *</label>
                                    <input type="number" class="form-control" id="travelers" name="travelers" min="1" max="20" value="1" required>
                                </div>
                            </div>
                            
                            <div class="mb-4">
                                <label for="notes" class="form-label fw-semibold">Special Requests or Notes</label>
                                <textarea class="form-control" id="notes" name="notes" rows="3" placeholder="e.g., dietary requirements, accessibility needs, special occasions"></textarea>
                            </div>

                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary btn-lg fw-semibold">
                                    <i class="bi bi-check-lg me-2"></i>Confirm and Proceed
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