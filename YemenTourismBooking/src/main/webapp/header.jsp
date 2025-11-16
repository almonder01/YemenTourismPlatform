<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/tourism.tld" prefix="tour"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="currentURI" value="${pageContext.request.requestURI}" />
<c:set var="currentPage"
	value="${fn:substringAfter(currentURI, pageContext.request.contextPath)}" />

<header>
	<nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
		<div class="container">
			<a class="navbar-brand fw-bold text-primary fs-4"
				href="${pageContext.request.contextPath}/"> Yemen Tourism </a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a
						class="nav-link ${fn:endsWith(currentPage, '/index.jsp') or fn:endsWith(currentPage, '/home') or currentPage eq '/' or currentPage eq '' ? 'active' : ''}"
						href="${pageContext.request.contextPath}/">Home</a></li>

					<li class="nav-item"><a
						class="nav-link ${fn:contains(currentPage, '/destinations') or fn:endsWith(currentPage, '/destinations.jsp') ? 'active' : ''}"
						href="${pageContext.request.contextPath}/destinations">Destinations</a>
					</li>

					<li class="nav-item"><a
						class="nav-link ${fn:endsWith(currentPage, '/about.jsp') ? 'active' : ''}"
						href="${pageContext.request.contextPath}/about.jsp">About Us</a></li>

					<li class="nav-item"><a
						class="nav-link ${fn:endsWith(currentPage, '/contact.jsp') or fn:contains(currentPage, '/contact') ? 'active' : ''}"
						href="${pageContext.request.contextPath}/contact.jsp">Contact</a>
					</li>
				</ul>

				<ul class="navbar-nav ms-auto">
					<tour:ifGuest>
						<li class="nav-item"><a
							class="btn btn-outline-primary btn-sm me-2"
							href="${pageContext.request.contextPath}/login.jsp">Login</a></li>
						<li class="nav-item"><a class="btn btn-primary btn-sm"
							href="${pageContext.request.contextPath}/register.jsp">Register</a>
						</li>
					</tour:ifGuest>

					<tour:ifLoggedIn>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<i class="bi bi-person-circle me-1"></i> Welcome,
								${sessionScope.user.username}
						</a>
							<ul class="dropdown-menu dropdown-menu-end"
								aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/profile.jsp"> <i
										class="bi bi-person-fill me-2"></i>My Profile
								</a></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/my_bookings"> <i
										class="bi bi-briefcase-fill me-2"></i>My Bookings
								</a></li>

								<tour:ifAdmin>
									<li><hr class="dropdown-divider"></li>
									<li><a class="dropdown-item"
										href="${pageContext.request.contextPath}/admin/dashboard">
											<i class="bi bi-gear-fill me-2"></i>Admin Panel
									</a></li>
								</tour:ifAdmin>

								<tour:ifUser>
									<li><a class="dropdown-item"
										href="${pageContext.request.contextPath}/feedback"> <i
											class="bi bi-chat-quote-fill me-2"></i>Submit Feedback
									</a></li>
								</tour:ifUser>

								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item text-danger"
									href="${pageContext.request.contextPath}/logout"> <i
										class="bi bi-box-arrow-right me-2"></i>Logout
								</a></li>
							</ul></li>
					</tour:ifLoggedIn>
				</ul>
			</div>
		</div>
	</nav>
</header>