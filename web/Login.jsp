<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | SERS</title>
    <style>
        /* Modern Variables */
        :root {
            --primary: #007bff;
            --primary-hover: #0056b3;
            --dark: #343a40;
            --bg: #f4f7f6;
            --text: #555;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: var(--bg);
            margin: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .login-container {
            background: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            box-sizing: border-box;
        }

        h2 {
            text-align: center;
            color: var(--dark);
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: var(--text);
        }

        input[type="text"], 
        input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: var(--primary);
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: var(--primary-hover);
        }

        /* Dev Table Styling */
        .test-data-container {
            margin-top: 40px;
            width: 100%;
            max-width: 500px;
        }

        .test-data {
            width: 100%;
            border-collapse: collapse;
            background: white;
            font-size: 0.85rem;
        }

        .test-data th, .test-data td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .role-name {
            color: var(--primary);
            font-weight: bold;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h2>SERS Portal</h2>
        <form action="LoginServlet" method="POST">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="e.g. sho" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter Password" required>

            <input type="submit" value="Sign In">
        </form>
    </div>

    <div class="test-data-container">
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