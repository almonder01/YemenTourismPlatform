<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/tourism.tld" prefix="tour"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Discover Yemen - Breathtaking Destinations Await</title>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.1/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>

    <jsp:include page="header.jsp" />


    <section class="bg-primary text-white py-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 text-center">
                    <tour:ifLoggedIn>
                        <h1 class="display-4 mb-4 fw-bold">Welcome back, ${sessionScope.user.username}!</h1>
                        <p class="lead mb-4">Ready for your next adventure in Yemen?</p>
                    </tour:ifLoggedIn>
                    <c:if test="${empty sessionScope.user}">
                        <h1 class="display-4 mb-4 fw-bold">Discover the Hidden Gems of Yemen</h1>
                        <p class="lead mb-4">Embark on an extraordinary journey through ancient cities, pristine islands, and breathtaking landscapes.</p>
                    </c:if>
                    <a href="#destinations" class="btn btn-light btn-lg px-5 py-3">
                        <i class="bi bi-compass me-2"></i>Explore Destinations
                    </a>
                </div>
            </div>
        </div>
    </section>


    <section id="destinations" class="py-5 bg-light">
        <div class="container">
            <div class="row mb-5">
                <div class="col-12 text-center">
                    <h2 class="display-5 mb-3">Featured Destinations</h2>
                    <div class="mx-auto bg-warning" style="width: 60px; height: 3px;"></div>
                    <p class="text-muted fs-5 mt-3">Discover Yemen's most captivating locations, each offering unique experiences and unforgettable memories</p>
                </div>
            </div>

            <div class="row g-4">
                <c:forEach var="destination" items="${destinations}">
                    <div class="col-md-6 col-lg-4">
                        <div class="card h-100 shadow-sm border-0">
                            <div class="position-relative overflow-hidden">
                                <img src="${pageContext.request.contextPath}/${destination.imageUrl}" 
                                     alt="${destination.name}" 
                                     class="card-img-top" 
                                     style="height: 250px; object-fit: cover;"
                                     onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholder.jpg'">
                            </div>
                            <div class="card-body d-flex flex-column">
                                <h5 class="card-title text-primary fw-bold mb-3">
                                    <i class="bi bi-geo-alt me-2"></i>${destination.name}
                                </h5>
                                <p class="card-text text-muted mb-4 flex-grow-1">${destination.summary}</p>
                                <div class="mt-auto">
                                    <a href="${pageContext.request.contextPath}/destination-details?id=${destination.destinationId}" 
                                       class="btn btn-primary px-4 py-2"> 
                                        <i class="bi bi-arrow-right me-2"></i>View Details
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${empty destinations}">
                    <div class="col-12 text-center">
                        <div class="alert alert-info" role="alert">
                            <i class="bi bi-info-circle me-2"></i>
                            No featured destinations available at the moment. Please check back later.
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </section>


    <section class="py-5 bg-primary text-white">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-8">
                    <h3 class="h2 mb-3">Ready to Start Your Yemen Adventure?</h3>
                    <p class="lead mb-0">Book your dream vacation today and experience the wonders of Yemen with our expertly crafted travel packages.</p>
                </div>
                <div class="col-lg-4 text-lg-end mt-3 mt-lg-0">
                    <a href="${pageContext.request.contextPath}/destinations" class="btn btn-light btn-lg px-5 py-3"> 
                        <i class="bi bi-calendar-check me-2"></i>Book Now
                    </a>
                </div>
            </div>
        </div>
    </section>


    <section id="stats" class="py-5 bg-white">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-3 col-6 mb-4">
                    <div class="p-4">
                        <i class="bi bi-people-fill text-primary display-4 mb-3"></i>
                        <h4 class="fw-bold text-primary counter" data-target="5000">0</h4>
                        <p class="text-muted">Happy Travelers</p>
                    </div>
                </div>
                <div class="col-md-3 col-6 mb-4">
                    <div class="p-4">
                        <i class="bi bi-map text-success display-4 mb-3"></i>
                        <h4 class="fw-bold text-success counter" data-target="25">0</h4>
                        <p class="text-muted">Destinations</p>
                    </div>
                </div>
                <div class="col-md-3 col-6 mb-4">
                    <div class="p-4">
                        <i class="bi bi-award text-warning display-4 mb-3"></i>
                        <h4 class="fw-bold text-warning counter" data-target="15">0</h4>
                        <p class="text-muted">Years Experience</p>
                    </div>
                </div>
                <div class="col-md-3 col-6 mb-4">
                    <div class="p-4">
                        <i class="bi bi-star-fill text-info display-4 mb-3"></i>
                        <h4 class="fw-bold text-info counter" data-target="4.9">0</h4>
                        <p class="text-muted">Average Rating</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="footer.jsp" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
    

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const counters = document.querySelectorAll('.counter');
        let hasAnimated = false;
        
        function animateCounter(counter) {
            const target = parseFloat(counter.getAttribute('data-target'));
            const isDecimal = target % 1 !== 0;
            const increment = target / 100;
            let current = 0;
            
            const updateCounter = () => {
                if (current < target) {
                    current += increment;
                    if (current > target) current = target;
                    
                    if (isDecimal) {
                        counter.textContent = current.toFixed(1);
                    } else {
                        counter.textContent = Math.ceil(current).toLocaleString();
                    }
                    
                    requestAnimationFrame(updateCounter);
                } else {
                    // Add + symbol for specific numbers
                    if (target >= 15 && target !== 4.9) {
                        counter.textContent = target.toLocaleString() + '+';
                    } else {
                        counter.textContent = isDecimal ? target.toFixed(1) : target.toLocaleString();
                    }
                }
            };
            
            updateCounter();
        }
        

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting && !hasAnimated) {
                    hasAnimated = true;
                    counters.forEach(counter => {
                        setTimeout(() => animateCounter(counter), Math.random() * 200);
                    });
                }
            });
        }, { threshold: 0.5 });
        
        const statsSection = document.getElementById('stats');
        if (statsSection) {
            observer.observe(statsSection);
        }
    });
    </script>
</body>
</html>