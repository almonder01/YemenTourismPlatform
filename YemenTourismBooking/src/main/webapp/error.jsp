<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - Yemen Tourism</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.1/font/bootstrap-icons.min.css">
</head>
<body class="bg-light">
    <div class="container d-flex align-items-center justify-content-center" style="min-height: 100vh;">
        <div class="text-center p-5 card shadow-sm">
            <i class="bi bi-exclamation-triangle-fill text-danger" style="font-size: 4rem;"></i>
            <h1 class="display-4 fw-bold mt-3">Oops!</h1>
            <p class="lead text-muted">Something went wrong on our side.</p>
            <p>We are very sorry for the inconvenience. Our technical team has been notified and will work to fix the issue.</p>
            <hr>
            <p>You can return to the homepage and try again.</p>
            

            <a href="${pageContext.request.contextPath}/" class="btn btn-primary">
                <i class="bi bi-house-door-fill me-1"></i> Go to Homepage
            </a>
            
        </div>
    </div>
</body>
</html>