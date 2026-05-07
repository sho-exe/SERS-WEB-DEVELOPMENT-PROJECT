<%@page contentType="text/html" pageEncoding="UTF-8" %>
<% 
    if (session != null) { 
        session.invalidate(); 
    } 
%>
<!DOCTYPE html>
<html lang="en" class="light-style customizer-hide">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="refresh" content="3;url=Login.jsp">
    <title>Logged Out | SERS</title>
    <!-- Fonts & Core CSS -->
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="resources/assets/vendor/css/core.css" />
    <link rel="stylesheet" href="resources/assets/vendor/css/theme-default.css" />
    <link rel="stylesheet" href="resources/assets/vendor/css/pages/page-auth.css" />
</head>
<body>
    <div class="container-xxl">
      <div class="authentication-wrapper authentication-basic container-p-y">
        <div class="authentication-inner text-center">
          <div class="card">
            <div class="card-body p-5">
              <h2 class="mb-4 fw-bold text-primary">Logged Out Successfully</h2>
              <p class="mb-4">You have been securely signed out of the Student Event Registration System.</p>
              <div class="spinner-border text-primary mb-4" role="status">
                <span class="visually-hidden">Loading...</span>
              </div>
              <p class="text-muted small">Redirecting you to the login page in 3 seconds...</p>
              <a href="Login.jsp" class="btn btn-outline-primary mt-3">Return to Login Now</a>
            </div>
          </div>
        </div>
      </div>
    </div>
</body>
</html>
