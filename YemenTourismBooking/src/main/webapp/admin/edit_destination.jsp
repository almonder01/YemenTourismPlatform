<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Destination - ${destination.name}</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
	<jsp:include page="admin_header.jsp" />

	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="card shadow-sm">
					<div class="card-header">
						<h3 class="mb-0">Edit Destination</h3>
					</div>
					<div class="card-body">
						<form id="edit-destination-form"
							action="${pageContext.request.contextPath}/admin/manage-destinations"
							method="post">
							<input type="hidden" name="action" value="update"> <input
								type="hidden" name="id" value="${destination.destinationId}">

							<div class="mb-3">
								<label for="name" class="form-label">Destination Name</label> <input
									type="text" name="name" id="name" class="form-control"
									value="${destination.name}" required>
							</div>

							<div class="mb-3">
								<label for="imageUrl" class="form-label">Image URL</label> <input
									type="text" name="imageUrl" id="imageUrl" class="form-control"
									value="${destination.imageUrl}" required>
							</div>

							<div class="mb-3">
								<label for="summary" class="form-label">Summary (For Card Display)</label>
								<textarea name="summary" id="summary" class="form-control"
									rows="3"
									placeholder="Write a short summary for the destination card..."
									required>${destination.summary}</textarea>
							</div>

							<div class="mb-3">
								<label for="description" class="form-label">Full Detailed Description</label>
								<textarea name="description" id="description"
									class="form-control" rows="15">${destination.description}</textarea>
							</div>

							<div class="form-check mb-3">
								<input class="form-check-input" type="checkbox"
									name="isFeatured" value="true" id="isFeaturedEdit"
									${destination.featured ? 'checked' : ''}> <label
									class="form-check-label" for="isFeaturedEdit"> Is this
									a featured destination? </label>
							</div>

							<button type="submit" class="btn btn-primary">
								<i class="fas fa-save me-1"></i> Save Changes
							</button>
							<a
								href="${pageContext.request.contextPath}/admin/manage-destinations"
								class="btn btn-secondary">Cancel</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.tiny.cloud/1/71emqq80yfg15xrpy97elwjk3udjwycyfv6wwmhbog9qcxwb/tinymce/6/tinymce.min.js"
		referrerpolicy="origin"></script>

   <!-- We used API from https://www.tiny.cloud    for easy to edit new destination -add photos and text and use code inside description part- -->
	<script>
		tinymce.init({
			selector : '#description', 
			plugins : 'code anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount',
			toolbar : 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table | align lineheight | numlist bullist indent outdent | emoticons charmap | removeformat | code',
			height : 500,
			content_css : false,
			skin : 'bootstrap'
		});

		document.getElementById('edit-destination-form').addEventListener('submit', function(e) {
			tinymce.triggerSave();
		});
	</script>
</body>
</html>