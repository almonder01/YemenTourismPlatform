<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/tourism.tld" prefix="tour"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Yemen Tourism</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css" rel="stylesheet">
</head>
<body>

    <jsp:include page="header.jsp" />

    <main class="py-5">
        <div class="container">
            <div class="row mb-5">
                <div class="col-12 text-center">
                    <h1 class="display-4 fw-bold text-primary mb-3">Contact Us</h1>
                    <p class="lead text-muted">Get in touch with us to plan your unforgettable journey to Yemen</p>
                </div>
            </div>

            <div class="row g-5">
                <div class="col-md-6">
                    <div class="h-100">
                        <h2 class="h3 fw-bold mb-4"><i class="bi bi-info-circle-fill text-primary me-2"></i> Contact Information</h2>
                        <div class="mb-4">
                            <h4 class="h5 fw-semibold mb-2"><i class="bi bi-geo-alt-fill text-danger me-2"></i> Our Office</h4>
                            <p class="mb-0 text-muted">
                                Yemen Tourism Board<br> Al-Zubairi Street, Building 45<br> Sana'a, Yemen
                            </p>
                        </div>
                        <div class="mb-4">
                            <h4 class="h5 fw-semibold mb-2"><i class="bi bi-envelope-fill text-success me-2"></i> Email Address</h4>
                            <p class="mb-0"><a href="mailto:info@yementourism.gov.ye" class="text-decoration-none">info@yementourism.gov.ye</a></p>
                            <p class="mb-0"><a href="mailto:support@yementourism.gov.ye" class="text-decoration-none">support@yementourism.gov.ye</a></p>
                        </div>
                        <div class="mb-4">
                            <h4 class="h5 fw-semibold mb-2"><i class="bi bi-telephone-fill text-warning me-2"></i> Phone Numbers</h4>
                            <p class="mb-1"><strong>Main Office:</strong> +967 1 234 567</p>
                            <p class="mb-1"><strong>Tourism Hotline:</strong> +967 1 234 568</p>
                            <p class="mb-0"><strong>Emergency:</strong> +967 1 234 569</p>
                        </div>
                        <div class="mb-4">
                            <h4 class="h5 fw-semibold mb-2"><i class="bi bi-clock-fill text-info me-2"></i> Office Hours</h4>
                            <p class="mb-1"><strong>Sunday - Thursday:</strong> 8:00 AM - 4:00 PM</p>
                            <p class="mb-0"><strong>Friday - Saturday:</strong> Closed</p>
                        </div>
                        <div class="mb-4">
                            <h4 class="h5 fw-semibold mb-3"><i class="bi bi-map-fill text-primary me-2"></i> Find Us</h4>
                            <div class="ratio ratio-16x9 border rounded">
                                <iframe
                                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3847.123456789!2d44.206667!3d15.369444!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMTXCsDIyJzEwLjAiTiA0NMKwMTInMjQuMCJF!5e0!3m2!1sen!2s!4v1234567890123"
                                    style="border: 0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"
                                    title="Yemen Tourism Office Location">
                                </iframe>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="h-100">
                        <h2 class="h3 fw-bold mb-4"><i class="bi bi-chat-dots-fill text-primary me-2"></i> Send us a Message</h2>
                        
                        <c:if test="${not empty sessionScope.contactSuccess}">
                            <div class="alert alert-success" role="alert">${sessionScope.contactSuccess}</div>
                            <c:remove var="contactSuccess" scope="session"/>
                        </c:if>
                        <c:if test="${not empty contactError}">
                            <div class="alert alert-danger" role="alert">${contactError}</div>
                        </c:if>
                        
                        <form class="needs-validation" method="post" action="contact" novalidate>
                            <tour:ifLoggedIn>
                                <div class="mb-3">
                                    <label for="fullName" class="form-label fw-semibold"><i class="bi bi-person-fill me-1"></i> Full Name *</label> 
                                    <input type="text" class="form-control form-control-lg" id="fullName" name="fullName" value="${sessionScope.user.username}" required>
                                </div>
                                <div class="mb-3">
                                    <label for="emailAddress" class="form-label fw-semibold"><i class="bi bi-envelope-fill me-1"></i> Email Address *</label> 
                                    <input type="email" class="form-control form-control-lg" id="emailAddress" name="emailAddress" value="${sessionScope.user.email}" required>
                                </div>
                            </tour:ifLoggedIn>
                            
                            <tour:ifGuest>
                                <div class="mb-3">
                                    <label for="fullName" class="form-label fw-semibold"><i class="bi bi-person-fill me-1"></i> Full Name *</label> 
                                    <input type="text" class="form-control form-control-lg" id="fullName" name="fullName" placeholder="Enter your full name" required>
                                </div>
                                <div class="mb-3">
                                    <label for="emailAddress" class="form-label fw-semibold"><i class="bi bi-envelope-fill me-1"></i> Email Address *</label> 
                                    <input type="email" class="form-control form-control-lg" id="emailAddress" name="emailAddress" placeholder="your.email@example.com" required>
                                </div>
                            </tour:ifGuest>

                            <div class="mb-3">
                                <label for="subject" class="form-label fw-semibold"><i class="bi bi-tag-fill me-1"></i> Subject *</label> 
                                <input type="text" class="form-control form-control-lg" id="subject" name="subject" placeholder="What is this message about?" required>
                                <div class="invalid-feedback">Please provide a subject for your message.</div>
                            </div>
                            
                            <div class="mb-4">
                                <label for="message" class="form-label fw-semibold"><i class="bi bi-chat-text-fill me-1"></i> Message *</label>
                                <textarea class="form-control" id="message" name="message" rows="6" placeholder="Tell us about your travel plans, questions, or how we can help you discover Yemen..." required></textarea>
                                <div class="invalid-feedback">Please provide your message.</div>
                            </div>
                            
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary btn-lg"><i class="bi bi-send-fill me-2"></i> Send Message</button>
                            </div>
                            
                            <div class="mt-3">
                                <small class="text-muted"><i class="bi bi-info-circle me-1"></i> We typically respond within 24 hours during business days.</small>
                            </div>
                        </form>
                        
                        <div class="mt-5 pt-4 border-top">
                            <h4 class="h5 fw-semibold mb-3">Connect with Us</h4>
                            <div class="d-flex gap-3">
                                <a href="#" class="btn btn-outline-primary btn-sm"><i class="bi bi-facebook me-1"></i> Facebook</a> 
                                <a href="#" class="btn btn-outline-info btn-sm"><i class="bi bi-twitter me-1"></i> Twitter</a> 
                                <a href="#" class="btn btn-outline-success btn-sm"><i class="bi bi-whatsapp me-1"></i> WhatsApp</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <jsp:include page="footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>

        (() => {
            'use strict'
            const forms = document.querySelectorAll('.needs-validation')
            Array.from(forms).forEach(form => {
                form.addEventListener('submit', event => {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
        })()
    </script>

</body>
</html>