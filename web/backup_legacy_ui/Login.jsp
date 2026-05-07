<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | SERS</title>
    <link rel="stylesheet" href="style.css">
</head>
<body class="auth-body">

    <div class="login-container">
        <h2>SERS Portal</h2>
        <form action="auths?action=login" method="POST">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="e.g. sho" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter Password" required>

            <input type="submit" value="Sign In">
        </form>
    </div>

    <div class="test-data-container" style="display:">
        <p style="text-align:center; font-size: 0.8rem; color: #888;">DEV ACCOUNTS</p>
        <table class="test-data" >
            <thead>
                <tr>
                    <th>Role</th>
                    <th>User</th>
                    <th>Pass</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="role-name">HEPA</td>
                    <td>ahmad</td>
                    <td>ahmad123</td>
                </tr>
                <tr>
                    <td class="role-name">Advisor</td>
                    <td>sarah</td>
                    <td>sarah123</td>
                </tr>
                <tr>
                    <td class="role-name">Chairperson</td>
                    <td>sho</td>
                    <td>sho123</td>
                </tr>
                <tr>
                    <td class="role-name">Student</td>
                    <td>ali</td>
                    <td>ali123</td>
                </tr>
            </tbody>
        </table>
    </div>

</body>
</html>