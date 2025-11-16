<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Package</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <jsp:include page="admin_header.jsp" />

    <div class="container mt-5">
        <a href="${pageContext.request.contextPath}/admin/manage-packages?destinationId=${pkg.destinationId}" class="btn btn-outline-secondary btn-sm mb-3">
            <i class="fas fa-arrow-left"></i> Back to Packages
        </a>
        
        <h2 class="mb-4">Edit Package: <span class="text-primary">${pkg.name}</span></h2>

        <div class="card shadow-sm">
            <div class="card-header">
                <h5>Update Package Details</h5>
            </div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/admin/manage-packages" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="packageId" value="${pkg.packageId}">
                    <input type="hidden" name="destinationId" value="${pkg.destinationId}">
                    
                    <div class="row g-3">
                        <div class="col-md-4">
                            <label for="name" class="form-label">Package Name</label>
                            <input type="text" name="name" id="name" class="form-control" value="${pkg.name}" required>
                        </div>
                        <div class="col-md-2">
                            <label for="price" class="form-label">Price (USD)</label>
                            <input type="number" step="0.01" name="price" id="price" class="form-control" value="${pkg.price}" required>
                        </div>
                        <div class="col-md-6">
                            <label for="description" class="form-label">Description</label>
                            <input type="text" name="description" id="description" class="form-control" value="${pkg.description}" required>
                        </div>
                    </div>
                    
                    <button type="submit" class="btn btn-primary mt-3"><i class="fas fa-save"></i> Update Package</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>