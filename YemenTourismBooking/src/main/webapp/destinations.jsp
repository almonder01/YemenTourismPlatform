<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/tourism.tld" prefix="tour"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Discover Yemen - Destinations</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <style>
        .destination-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: none;
            overflow: hidden;
        }
        .destination-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15) !important;
        }
        .card-img-top {
            height: 250px;
            object-fit: cover;
            transition: transform 0.3s ease;
        }
        .destination-card:hover .card-img-top {
            transform: scale(1.05);
        }
        .page-header {
            background: linear-gradient(135deg, #2c3e50 0%, #3498db 100%);
            color: white;
            padding: 4rem 0;
            margin-bottom: 3rem;
        }
        .page-header h1 {
            font-weight: 300;
            margin-bottom: 1rem;
        }
        .page-header p {
            font-size: 1.2rem;
            opacity: 0.9;
        }
        .section-title {
            position: relative;
            margin-bottom: 3rem;
            text-align: center;
        }
        .section-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 3px;
            background: #3498db;
        }
        .card-body { padding: 1.5rem; }
        .card-title {
            color: #2c3e50;
            font-weight: 600;
            margin-bottom: 1rem;
        }
        .card-text {
            color: #666;
            line-height: 1.6;
            margin-bottom: 1.5rem;
        }
        .btn-outline-primary {
            border-width: 2px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        .btn-outline-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(52, 152, 219, 0.3);
        }
        @media (max-width: 768px) {
            .page-header {
                padding: 2rem 0;
                margin-bottom: 2rem;
            }
            .page-header h1 { font-size: 2rem; }
            .card-img-top { height: 200px; }
        }
    </style>
</head>
<body>

    <jsp:include page="header.jsp" />

    <div class="page-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mx-auto text-center">
                    <h1 class="display-4"><i class="bi bi-geo-alt-fill me-3"></i> Discover Yemen's Hidden Treasures</h1>
                    <p class="lead">Explore breathtaking landscapes, ancient heritage sites, and unique natural wonders that make Yemen one of the world's most fascinating destinations.</p>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-12">
                <h2 class="section-title h3 text-center text-dark">All Our Destinations</h2>
            </div>
        </div>
        <div class="row g-4 mb-5">
            <c:forEach var="dest" items="${allDestinations}">
                <div class="col-lg-4 col-md-6">
                    <div class="card destination-card shadow-sm h-100">
                        <img src="${pageContext.request.contextPath}/${dest.imageUrl}" class="card-img-top" alt="${dest.name}"
                             onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholder.jpg'" loading="lazy">
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title"><i class="bi bi-compass text-primary me-2"></i> ${dest.name}</h5>
                            <p class="card-text flex-grow-1">${dest.summary}</p>
                            <a href="${pageContext.request.contextPath}/destination-details?id=${dest.destinationId}" class="btn btn-outline-primary mt-auto">View Details</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <c:if test="${empty allDestinations}">
                <div class="col-12 text-center">
                    <div class="alert alert-info">
                        <p class="mb-0 fs-5">There are currently no destinations available. Please check back soon!</p>
                    </div>
                </div>
            </c:if>
        </div>

        <div class="row mb-5">
            <div class="col-12">
                <div class="card border-0 bg-light">
                    <div class="card-body text-center py-5">
                        <h3 class="card-title mb-3">Ready to Start Your Adventure?</h3>
                        <p class="card-text mb-4 text-muted">Contact our expert travel consultants to plan your personalized Yemen experience.</p>
                        <div class="d-flex flex-column flex-sm-row gap-3 justify-content-center">
                            <%-- CORRECTED LINK --%>
                            <a href="${pageContext.request.contextPath}/contact" class="btn btn-primary btn-lg">
                                <i class="bi bi-telephone me-2"></i> Contact Us
                            </a>
                            <a href="#" class="btn btn-outline-secondary btn-lg">
                                <i class="bi bi-download me-2"></i> Download Brochure
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>