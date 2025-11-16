<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="uriWithoutContext"
	value="${fn:substringAfter(pageContext.request.requestURI, pageContext.request.contextPath)}" />
<c:set var="cleanURI"
	value="${fn:startsWith(uriWithoutContext, '/') ? uriWithoutContext : '/' += uriWithoutContext}" />

<header>
	<nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
		<div class="container-fluid">
			<a class="navbar-brand fw-bold text-primary fs-4"
				href="${pageContext.request.contextPath}/admin/dashboard"> Admin
				Panel </a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#adminNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="adminNavbar">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a
						class="nav-link ${fn:contains(cleanURI, '/admin/dashboard') ? 'active' : ''}"
						href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
					</li>
					<li class="nav-item"><a
						class="nav-link ${fn:contains(cleanURI, '/admin/manage-destinations') || fn:contains(cleanURI, '/admin/manage_destinations.jsp') || fn:contains(cleanURI, '/admin/edit_destination.jsp') ? 'active' : ''}"
						href="${pageContext.request.contextPath}/admin/manage-destinations">Destinations</a>
					</li>
					<li class="nav-item"><a
						class="nav-link ${fn:contains(cleanURI, '/admin/manage-bookings') || fn:contains(cleanURI, '/admin/manage_bookings.jsp') ? 'active' : ''}"
						href="${pageContext.request.contextPath}/admin/manage-bookings">Bookings</a>
					</li>
					<li class="nav-item"><a
						class="nav-link ${fn:contains(cleanURI, '/admin/view-feedback') || fn:contains(cleanURI, '/admin/view_feedback.jsp') ? 'active' : ''}"
						href="${pageContext.request.contextPath}/admin/view-feedback">Feedback</a>
					</li>
				</ul>

				<ul class="navbar-nav ms-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="adminUserDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="bi bi-person-circle me-1"></i> Welcome,
							${sessionScope.user.username}
					</a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="adminUserDropdown">
							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath}/profile.jsp"><i
									class="bi bi-person-fill me-2"></i>My Profile</a></li>
							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath}/"><i
									class="bi bi-house-door-fill me-1"></i>Public Site</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item text-danger"
								href="${pageContext.request.contextPath}/logout"><i
									class="bi bi-box-arrow-right me-2"></i>Logout</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
</header>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>