<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${destination.name} - Destination Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
    <jsp:include page="header.jsp" />


    <div class="container my-5">
        <div class="row">
            <div class="col-12 mb-4">

                <a href="${pageContext.request.contextPath}/destinations" class="btn btn-outline-secondary">
                    <i class="bi bi-arrow-left-circle me-1"></i> Back to Destinations
                </a>
                <hr>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">

                <c:out value="${destination.description}" escapeXml="false" />
            </div>
        </div>

        <div class="row mt-5">
            <div class="col-12 text-center">
                <div class="card bg-light border-0 p-4">
                    <div class="card-body">
                        <h3 class="card-title">Ready for an adventure in ${destination.name}?</h3>
                        <p class="lead text-muted">Explore our curated packages and start planning your unforgettable trip today.</p>

                        <a href="${pageContext.request.contextPath}/packages?destinationId=${destination.destinationId}" class="btn btn-success btn-lg mt-3">
                            <i class="bi bi-box-seam me-2"></i> View Available Packages
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>