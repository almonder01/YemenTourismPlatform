<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tlds/tourism.tld" prefix="tour" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Yemen Tourism</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <jsp:include page="header.jsp" />
    
<main class="flex-grow-1 d-flex align-items-center py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                
                <c:if test="${not empty sessionScope.user}">
                    <c:redirect url="${pageContext.request.contextPath}/"/>
                </c:if>

                <tour:ifLoggedIn>
                    <div class="card shadow-sm border-0 text-center p-4">
                        <h4 class="h5">You already have an account!</h4>
                        <p class="text-muted">You are logged in as ${sessionScope.user.username}.</p>

                        <a href="${pageContext.request.contextPath}/" class="btn btn-primary mt-2">Go to Homepage</a>
                    </div>
                </tour:ifLoggedIn>
                
                <c:if test="${empty sessionScope.user}">
                    <div class="card shadow-sm border-0">
                        <div class="card-body p-4">

                            <div class="text-center mb-4">
                                <i class="fas fa-user-plus text-primary mb-3" style="font-size: 3rem;"></i>
                                <h2 class="h4 text-dark fw-bold">Create Your Account</h2>
                                <p class="text-muted small">Join us to explore the beauty of Yemen</p>
                            </div>

                            <c:if test="${not empty registerError}">
                                <div class="alert alert-danger" role="alert">
                                    <i class="fas fa-times-circle me-2"></i>
                                    ${registerError}
                                </div>
                            </c:if>
                            <c:if test="${not empty registerSuccess}">
                                <div class="alert alert-success" role="alert">
                                    <i class="fas fa-check-circle me-2"></i>
                                    ${registerSuccess}
                                </div>
                            </c:if>
                            
                            <form method="post" action="register" novalidate>
                                <div class="mb-3">
                                    <label for="fullName" class="form-label fw-semibold">
                                        <i class="fas fa-user text-muted me-1"></i>
                                        Full Name
                                    </label>
                                    <input type="text" 
                                           class="form-control form-control-lg" 
                                           id="fullName" 
                                           name="fullName" 
                                           placeholder="Enter your full name"
                                           required
                                           autocomplete="name"
                                           value="${param.fullName}">
                                </div>
                                
                                <div class="mb-3">
                                    <label for="username" class="form-label fw-semibold">
                                        <i class="fas fa-user-tag text-muted me-1"></i>
                                        Username
                                    </label>
                                    <input type="text" 
                                           class="form-control form-control-lg" 
                                           id="username" 
                                           name="username" 
                                           placeholder="Choose a unique username"
                                           required
                                           value="${param.username}">
                                </div>
                                
                                <div class="mb-3">
                                    <label for="email" class="form-label fw-semibold">
                                        <i class="fas fa-envelope text-muted me-1"></i>
                                        Email Address
                                    </label>
                                    <input type="email" 
                                           class="form-control form-control-lg" 
                                           id="email" 
                                           name="email" 
                                           placeholder="Enter your email address"
                                           required
                                           autocomplete="email"
                                           value="${param.email}">
                                </div>
                                
                                <div class="mb-3">
                                    <label for="password" class="form-label fw-semibold">
                                        <i class="fas fa-lock text-muted me-1"></i>
                                        Password
                                    </label>
                                    <input type="password" 
                                           class="form-control form-control-lg" 
                                           id="password" 
                                           name="password" 
                                           placeholder="Create a strong password"
                                           required
                                           autocomplete="new-password">
                                </div>
                                
                                <div class="mb-4">
                                    <label for="confirmPassword" class="form-label fw-semibold">
                                        <i class="fas fa-lock text-muted me-1"></i>
                                        Confirm Password
                                    </label>
                                    <input type="password" 
                                           class="form-control form-control-lg" 
                                           id="confirmPassword" 
                                           name="confirmPassword" 
                                           placeholder="Re-enter your password"
                                           required
                                           autocomplete="new-password">
                                </div>
                                
                                <div class="mb-3">
                                    <div class="form-check">
                                        <input class="form-check-input" 
                                               type="checkbox" 
                                               id="agreeTerms" 
                                               name="agreeTerms"
                                               required>
                                        <label class="form-check-label text-muted" for="agreeTerms">
                                            I agree to the <a href="terms-of-service.jsp" class="text-primary text-decoration-none">Terms of Service</a> 
                                            and <a href="privacy-policy.jsp" class="text-primary text-decoration-none">Privacy Policy</a>
                                        </label>
                                    </div>
                                </div>
                               
                                <div class="d-grid mb-3">
                                    <button type="submit" class="btn btn-primary btn-lg fw-semibold">
                                        <i class="fas fa-user-plus me-2"></i>
                                        Create Account
                                    </button>
                                </div>
                            </form>
                            
                            <hr class="my-4">
                            <div class="text-center">
                                <p class="text-muted small mb-2">Already have an account?</p>

                                <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-primary btn-sm fw-semibold">
                                    <i class="fas fa-sign-in-alt me-1"></i>
                                    Login here
                                </a>
                            </div>
                        </div>
                    </div>
                </c:if>
                
                <div class="text-center mt-4">
                    <p class="small text-muted">
                        <i class="fas fa-shield-alt text-success me-1"></i>
                        Your information is secure and protected
                    </p>
                </div>
            </div>
        </div>
    </div>
</main>
    
    <jsp:include page="footer.jsp" />
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>