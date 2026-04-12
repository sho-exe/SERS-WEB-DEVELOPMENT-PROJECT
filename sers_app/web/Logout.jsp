<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // This part actually clears the session data in the server
    if (session != null) {
        session.invalidate();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="refresh" content="5;url=index.jsp">
    <title>Logged Out | SERS</title>
    <style>
        :root {
            --primary: #007bff;
            --dark: #343a40;
            --bg: #f4f7f6;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: var(--bg);
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            text-align: center;
        }

        .logout-container {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            max-width: 400px;
        }

        h2 { color: var(--dark); }
        p { color: #666; line-height: 1.6; }

        .loader {
            margin: 20px auto;
            border: 4px solid #f3f3f3;
            border-top: 4px solid var(--primary);
            border-radius: 50%;
            width: 30px;
            height: 30px;
            animation: spin 2s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .manual-link {
            display: block;
            margin-top: 20px;
            color: var(--primary);
            text-decoration: none;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>

    <div class="logout-container">
        <h2>Logged Out Successfully</h2>
        <div class="loader"></div>
        <p>You have been signed out of the Student Event Registration System.</p>
        <p>Redirecting you to the login page in <strong>5 seconds</strong>...</p>
        
        <a href="Login.jsp" class="manual-link">Click here if you are not redirected</a>
    </div>

</body>
</html>