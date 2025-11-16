<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Feedback</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.1/font/bootstrap-icons.min.css">
</head>
<body>
    <jsp:include page="admin_header.jsp" />

    <div class="container mt-5">
        <h2 class="text-primary mb-4">User Feedback</h2>

        <c:choose>
            <c:when test="${empty feedbackList}">
                <div class="alert alert-info">No feedback available yet.</div>
            </c:when>
            <c:otherwise>
                <div class="row row-cols-1 row-cols-md-2 g-4">
                    <c:forEach var="f" items="${feedbackList}">
                        <div class="col">
                            <div class="card shadow-sm h-100">
                                <div class="card-body">
                                    <h5 class="card-title text-primary">${f.name}</h5>
                                    <h6 class="card-subtitle mb-2 text-muted">${f.email}</h6>
                                    <p class="card-text fst-italic">"${f.message}"</p>
                                </div>
                                <div class="card-footer text-end bg-white border-0">
                                    <small class="text-muted">
                                        Submitted on: <fmt:formatDate value="${f.submittedAt}" type="both" dateStyle="medium" timeStyle="short"/>
                                    </small>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>