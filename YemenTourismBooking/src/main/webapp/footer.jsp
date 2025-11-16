<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<footer class="bg-dark text-light py-5">
    <div class="container">
        <div class="row g-4">
            <div class="col-lg-3 col-md-6">
                <h5 class="text-warning mb-3">Discover Yemen</h5>
                <p class="text-muted">
                    Explore the hidden treasures of Yemen - from ancient cities to pristine islands. 
                    Experience authentic culture, breathtaking landscapes, and timeless heritage.
                </p>
            </div>
            
            <div class="col-lg-2 col-md-6">
                <h6 class="text-warning mb-3">Quick Links</h6>
                <ul class="list-unstyled">
                    <li class="mb-2"><a href="${pageContext.request.contextPath}/" class="text-light text-decoration-none hover-link">Home</a></li>
                    <li class="mb-2"><a href="${pageContext.request.contextPath}/destinations" class="text-light text-decoration-none hover-link">Destinations</a></li>

                    <li class="mb-2"><a href="${pageContext.request.contextPath}/about" class="text-light text-decoration-none hover-link">About Us</a></li>
                    <li class="mb-2"><a href="${pageContext.request.contextPath}/feedback" class="text-light text-decoration-none hover-link">Feedback</a></li>
                </ul>
            </div>
            
            <div class="col-lg-3 col-md-6">
                <h6 class="text-warning mb-3">Popular Destinations</h6>
                <ul class="list-unstyled">
                    <c:forEach var="dest" items="${footerDestinations}">
                        <li class="mb-2">
                            <a href="${pageContext.request.contextPath}/destination-details?id=${dest.destinationId}" class="text-light text-decoration-none hover-link">
                                ${dest.name}
                            </a>
                        </li>
                    </c:forEach>
                    <c:if test="${empty footerDestinations}">
                         <li class="text-muted">No popular destinations yet.</li>
                    </c:if>
                </ul>
            </div>
            
            <div class="col-lg-4 col-md-6">
                <h6 class="text-warning mb-3">Contact Us</h6>
                <div class="contact-info">
                    <p class="mb-2 text-light"><i class="fas fa-envelope me-2 text-warning"></i><a href="mailto:info@discoveryemen.com" class="text-light text-decoration-none">info@discoveryemen.com</a></p>
                    <p class="mb-2 text-light"><i class="fas fa-phone me-2 text-warning"></i><a href="tel:+967123456789" class="text-light text-decoration-none">+967 123 456 789</a></p>
                    <p class="mb-3 text-light"><i class="fas fa-map-marker-alt me-2 text-warning"></i>Al-Zubairi Street, Sana'a, Yemen</p>
                    
                    <div class="social-links mt-3">
                        <h6 class="text-warning mb-2">Follow Us</h6>
                        <a href="https://facebook.com" class="text-light me-3 fs-4" target="_blank" rel="noopener noreferrer" title="Facebook"><i class="fab fa-facebook-f"></i></a>
                        <a href="https://twitter.com" class="text-light me-3 fs-4" target="_blank" rel="noopener noreferrer" title="Twitter"><i class="fab fa-twitter"></i></a>
                        <a href="https://instagram.com" class="text-light me-3 fs-4" target="_blank" rel="noopener noreferrer" title="Instagram"><i class="fab fa-instagram"></i></a>
                        <a href="https://youtube.com" class="text-light fs-4" target="_blank" rel="noopener noreferrer" title="YouTube"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
            </div>
        </div>
        
        <hr class="my-4 text-secondary">
        <div class="row align-items-center">
            <div class="col-md-6">
                <p class="mb-0 text-muted">© 2025 Discover Yemen. All rights reserved.</p>
            </div>
            <div class="col-md-6 text-md-end">

                <a href="privacy-policy.jsp" class="text-muted text-decoration-none me-3">Privacy Policy</a>
                <a href="terms-of-service.jsp" class="text-muted text-decoration-none">Terms of Service</a>
            </div>
        </div>
    </div>
</footer>

<style>
    .hover-link:hover { color: #ffc107 !important; }
    .social-links a:hover { color: #ffc107 !important; transform: translateY(-2px); }
    body { display: flex; flex-direction: column; min-height: 100vh; }
    footer { margin-top: auto; }
    footer .text-light, footer p.text-muted { color: #f8f9fa !important; opacity: 0.9; }
    footer a.text-light:visited { color: #f8f9fa !important; }
    footer .text-muted { color: #adb5bd !important; }
</style>