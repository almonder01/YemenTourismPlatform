<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Destinations</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
	<jsp:include page="admin_header.jsp" />

	<div class="container mt-5">
		<h2 class="text-primary mb-4">Manage Destinations</h2>

		<c:if test="${not empty sessionScope.adminMessage}">
			<div class="alert alert-success" role="alert">${sessionScope.adminMessage}</div>
			<c:remove var="adminMessage" scope="session" />
		</c:if>
		<c:if test="${not empty sessionScope.adminError}">
			<div class="alert alert-danger" role="alert">${sessionScope.adminError}</div>
			<c:remove var="adminError" scope="session" />
		</c:if>

		<form
			action="${pageContext.request.contextPath}/admin/manage-destinations"
			method="post" class="mb-5 card p-4">
			<h4 class="mb-3">Add New Destination</h4>
			<input type="hidden" name="action" value="add">
			<div class="row g-3">
				<div class="col-md-4">
					<input type="text" name="name" class="form-control"
						placeholder="Destination Name" required>
				</div>
				<div class="col-md-4">
					<input type="text" name="imageUrl" class="form-control"
						placeholder="Image URL (e.g., assets/images/sanaa.jpg)" required>
				</div>
				<div class="col-md-4">
					<input type="text" name="summary" class="form-control"
						placeholder="Summary" required>
				</div>
			</div>
			<div class="form-check mt-3">
				<input class="form-check-input" type="checkbox" name="isFeatured"
					value="true" id="isFeaturedCheck"> <label
					class="form-check-label" for="isFeaturedCheck">Make this a
					featured destination?</label>
			</div>
			<div class="mt-3">
				<button type="submit" class="btn btn-primary">
					<i class="fas fa-plus"></i> Add Destination
				</button>
			</div>
		</form>

		<h4 class="text-success mb-3">Existing Destinations</h4>
		<table class="table table-striped table-hover">
			<thead class="table-light">
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Image URL</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dest" items="${destinations}">
					<tr>
						<td>${dest.destinationId}</td>
						<td>${dest.name}</td>
						<td>${dest.imageUrl}</td>
						<td>
							<form
								action="${pageContext.request.contextPath}/admin/manage-destinations"
								method="post" style="display: inline-block">
								<input type="hidden" name="action" value="delete"> <input
									type="hidden" name="id" value="${dest.destinationId}">
								<button type="submit" class="btn btn-danger btn-sm"
									onclick="return confirm('Are you sure?')">
									<i class="fas fa-trash"></i>
								</button>
							</form> <a
							href="${pageContext.request.contextPath}/admin/manage-destinations?action=edit&id=${dest.destinationId}"
							class="btn btn-warning btn-sm"> <i class="fas fa-edit"></i>
						</a> <a
							href="${pageContext.request.contextPath}/admin/manage-packages?destinationId=${dest.destinationId}"
							class="btn btn-info btn-sm"> <i
								class="fas fa-suitcase-rolling"></i> Packages
						</a>
						</td>
					</tr>
				</c:forEach>
				<c:if test="${empty destinations}">
					<tr>
						<td colspan="4" class="text-center text-muted">No destinations found.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
</body>
</html>