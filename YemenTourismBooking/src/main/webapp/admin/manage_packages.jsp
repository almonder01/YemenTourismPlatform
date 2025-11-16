<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Packages for ${destination.name}</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
	<jsp:include page="admin_header.jsp" />

	<div class="container mt-5">
		<a href="${pageContext.request.contextPath}/admin/manage-destinations"
			class="btn btn-outline-secondary btn-sm mb-3"> <i
			class="fas fa-arrow-left"></i> Back to Destinations
		</a>
		<h2 class="mb-4">
			Manage Packages for <span class="text-primary">${destination.name}</span>
		</h2>

		<div class="card shadow-sm mb-5">
			<div class="card-header">
				<h5>Add New Package</h5>
			</div>
			<div class="card-body">
				<form
					action="${pageContext.request.contextPath}/admin/manage-packages"
					method="post">
					<input type="hidden" name="action" value="add"> <input
						type="hidden" name="destinationId"
						value="${destination.destinationId}">

					<div class="row g-3">
						<div class="col-md-4">
							<label for="name" class="form-label">Package Name</label> <input
								type="text" name="name" id="name" class="form-control" required>
						</div>
						<div class="col-md-2">
							<label for="price" class="form-label">Price (USD)</label> <input
								type="number" step="0.01" name="price" id="price"
								class="form-control" required>
						</div>
						<div class="col-md-6">
							<label for="description" class="form-label">Description</label> <input
								type="text" name="description" id="description"
								class="form-control" required>
						</div>
					</div>
					<button type="submit" class="btn btn-success mt-3">
						<i class="fas fa-plus"></i> Add Package
					</button>
				</form>
			</div>
		</div>

		<h4>Existing Packages</h4>
		<table class="table table-striped table-hover">
			<thead class="table-light">
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Price</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="pkg" items="${packages}">
					<tr>
						<td>${pkg.packageId}</td>
						<td>${pkg.name}</td>
						<td><fmt:formatNumber value="${pkg.price}" type="currency"
								currencyCode="USD" /></td>
						<td>
							<form
								action="${pageContext.request.contextPath}/admin/manage-packages"
								method="post" class="d-inline">
								<input type="hidden" name="action" value="delete"> <input
									type="hidden" name="destinationId"
									value="${destination.destinationId}"> <input
									type="hidden" name="packageId" value="${pkg.packageId}">
								<button type="submit" class="btn btn-danger btn-sm"
									onclick="return confirm('Are you sure you want to delete this package?')">
									<i class="fas fa-trash"></i>
								</button>
							</form> <a
							href="${pageContext.request.contextPath}/admin/manage-packages?action=showEditForm&packageId=${pkg.packageId}&destinationId=${destination.destinationId}"
							class="btn btn-warning btn-sm"> <i class="fas fa-edit"></i>
						</a>
						</td>
					</tr>
				</c:forEach>
				<c:if test="${empty packages}">
					<tr>
						<td colspan="4" class="text-center text-muted">No packages
							found for this destination. Add one above!</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
</body>
</html>