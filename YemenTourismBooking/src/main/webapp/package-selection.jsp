<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/tlds/tourism.tld" prefix="tour" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Packages for ${destination.name} - Yemen Tourism</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.1/font/bootstrap-icons.min.css">
    <style>
        .package-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: none;
        }
        .package-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        }
        .price-tag {
            font-size: 1.75rem;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="container py-5">
        <div class="row mb-5 justify-content-center">
            <div class="col-lg-8 text-center">
                <h1 class="display-4 fw-bold">${destination.name}</h1>
                <p class="lead text-muted">${destination.summary}</p>
                <c:if test="${not empty destination.imageUrl}">
                    <img src="${pageContext.request.contextPath}/${destination.imageUrl}" 
                         alt="${destination.name}"
                         class="img-fluid rounded-3 shadow-lg mt-3" 
                         style="max-height: 400px; object-fit: cover; width: 100%;">
                </c:if>
            </div>
        </div>

        <h2 class="text-center mb-5">Choose Your Package</h2>

        <div class="row g-4">
            <c:if test="${empty packages}">
                <div class="col-12">
                    <div class="alert alert-info text-center" role="alert">
                        <h4 class="alert-heading">Coming Soon!</h4>
                        <p>There are currently no packages available for this destination. Please check back later or contact us for custom arrangements.</p>
                    </div>
                </div>
            </c:if>

            <c:forEach var="pkg" items="${packages}">
                <div class="col-md-6 col-lg-4">
                    <div class="card package-card h-100 shadow-sm text-center">
                        <div class="card-header bg-primary text-white">
                            <h4 class="my-0 fw-normal">${pkg.name}</h4>
                        </div>
                        <div class="card-body d-flex flex-column">
                            <h1 class="card-title price-tag my-3">
                                <fmt:formatNumber value="${pkg.price}" type="currency" currencyCode="USD" minFractionDigits="0" maxFractionDigits="0"/>
                                <small class="text-muted fw-light">/person</small>
                            </h1>
                            <p class="card-text flex-grow-1">${pkg.description}</p>
                            
                            <a href="${pageContext.request.contextPath}/booking?packageId=${pkg.packageId}" class="btn btn-lg btn-outline-primary mt-auto">
                                <i class="bi bi-calendar-check me-2"></i>Book Now
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <jsp:include page="footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>