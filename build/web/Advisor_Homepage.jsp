<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Advisor Dashboard | SERS</title>
        <style>
            /* Reusing the same CSS from your Student Template */
            :root { --primary: #007bff; --success: #28a745; --warning: #ffc107; --dark: #343a40; --light: #f8f9fa; }
            body { font-family: 'Segoe UI', Arial, sans-serif; background: #f4f7f6; margin: 0; display: flex; }
            .sidebar { width: 250px; background: var(--dark); color: white; height: 100vh; position: fixed; padding: 20px; }
            .sidebar h2 { color: var(--primary); font-size: 1.5rem; margin-bottom: 30px; }
            .nav-link { color: #bbb; text-decoration: none; display: block; padding: 12px 0; border-bottom: 1px solid #444; }
            .nav-link:hover { color: white; }
            .main-content { margin-left: 290px; padding: 40px; width: 100%; }
            .header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px; }
            .grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px; }
            .card { background: white; padding: 25px; border-radius: 12px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
            .card h3 { margin-top: 0; color: var(--dark); font-size: 1.1rem; }
            .stat { font-size: 2rem; font-weight: bold; color: var(--warning); }
            .btn { display: inline-block; padding: 10px 20px; background: var(--primary); color: white; text-decoration: none; border-radius: 5px; margin-top: 15px; transition: 0.3s; }
            .role-badge { background: var(--warning); color: black; padding: 4px 10px; border-radius: 20px; font-size: 0.8rem; font-weight: bold; }
        </style>
    </head>
    <body>
        <div class="sidebar">
            <h2>SERS Portal</h2>
            <a href="#" class="nav-link">Advisor Dashboard</a>
            <a href="PendingApprovalsServlet" class="nav-link">Pending Approvals</a>
            <a href="ClubEventsServlet" class="nav-link">Club Event History</a>
            <a href="MeritReportsServlet" class="nav-link">Merit Reports</a>
            <a href="LogoutServlet" class="nav-link" style="margin-top: 50px; color: #ff4d4d;">Logout</a>
        </div>

        <div class="main-content">
            <div class="header">
                <h1>Advisor Panel: Welcome, ${name}!</h1>
                <span class="role-badge">${accountType}</span>
            </div>

            <div class="grid">
                <div class="card">
                    <h3>Events Pending Review</h3>
                    <div class="stat">5</div> 
                    <p>New proposals from your Club Chairperson.</p>
                    <a href="PendingApprovalsServlet" class="btn">Review Now</a>
                </div>

                <div class="card">
                    <h3>Club Participation</h3>
                    <div class="stat">120</div> 
                    <p>Total students active in your club events.</p>
                    <a href="MeritReportsServlet" class="btn">View Statistics</a>
                </div>

                <div class="card">
                    <h3>Advisor Profile</h3>
                    <p><strong>Email:</strong> ${email}</p>
                    <p><strong>Club:</strong> Robotics Club</p>
                    <a href="UpdateProfileServlet" class="btn" style="background: var(--dark);">Edit Profile</a>
                </div>
            </div>

            <div style="margin-top: 40px; padding: 20px; background: #fff3cd; border-radius: 10px; border-left: 5px solid var(--warning);">
                <h4 style="margin-top:0">Action Required</h4>
                <p>Please approve pending events. Students cannot register for events until they are officially approved by you or HEPA.</p>
            </div>
        </div>
    </body>
</html>