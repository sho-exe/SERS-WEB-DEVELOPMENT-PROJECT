<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <% if (session !=null) { session.invalidate(); } %>
    <jsp:include page="header_sneat.jsp" />

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