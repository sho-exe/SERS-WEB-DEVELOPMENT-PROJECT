<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <% // This part actually clears the session data in the server if (session !=null) { session.invalidate(); } %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta http-equiv="refresh" content="1;url=Login.jsp">
            <title>Logged Out | SERS</title>
            <link rel="stylesheet" href="style.css">
        </head>

        <body class="auth-body">

            <div class="logout-container">
                <h2>Logged Out Successfully</h2>
                <div class="loader"></div>
                <p>You have been signed out of the Student Event Registration System.</p>
                <p>Redirecting you to the login page in <strong>3 seconds</strong>...</p>

                <a href="Login.jsp" class="manual-link">Click here if you are not redirected</a>
            </div>

        </body>

        </html>