<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Student Dashboard | SERS</title>
        <style>
            :root { --primary: #007bff; --success: #28a745; --dark: #343a40; --light: #f8f9fa; }
            body { font-family: 'Segoe UI', Arial, sans-serif; background: #f4f7f6; margin: 0; display: flex; }
            
            /* Sidebar Navigation */
            .sidebar { width: 250px; background: var(--dark); color: white; height: 100vh; position: fixed; padding: 20px; }
            .sidebar h2 { color: var(--primary); font-size: 1.5rem; margin-bottom: 30px; }
            .nav-link { color: #bbb; text-decoration: none; display: block; padding: 12px 0; border-bottom: 1px solid #444; }
            .nav-link:hover { color: white; }
            
            /* Main Content */
            .main-content { margin-left: 290px; padding: 40px; width: 100%; }
            .header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px; }
            
            /* Dashboard Grid */
            .grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px; }
            .card { background: white; padding: 25px; border-radius: 12px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
            .card h3 { margin-top: 0; color: var(--dark); font-size: 1.1rem; }
            .stat { font-size: 2rem; font-weight: bold; color: var(--primary); }
            
            /* Action Buttons */
            .btn { display: inline-block; padding: 10px 20px; background: var(--primary); color: white; 
                   text-decoration: none; border-radius: 5px; margin-top: 15px; transition: 0.3s; }
            .btn:hover { opacity: 0.8; }
            .role-badge { background: var(--success); padding: 4px 10px; border-radius: 20px; font-size: 0.8rem; }
        </style>
    </head>
    <body>

        <div class="sidebar">
            <h2>SERS Portal</h2>
            <a href="#" class="nav-link">Dashboard</a>
            <a href="BrowseEventsServlet" class="nav-link">Explore Events</a>
            <a href="MyAttendanceServlet" class="nav-link">My Registrations</a>
            <a href="MeritHistoryServlet" class="nav-link">Merit Transcript</a>
            <a href="LogoutServlet" class="nav-link" style="margin-top: 50px; color: #ff4d4d;">Logout</a>
        </div>

        <div class="main-content">
            <div class="header">
                <h1>Welcome Back, ${name}!</h1>
                <span class="role-badge">${accountType}</span>
            </div>

            <div class="grid">
                <div class="card">
                    <h3>Accumulated Merits</h3>
                    <div class="stat">250</div> <p>Verified through events attended.</p>
                    <a href="MeritHistoryServlet" class="btn">View History</a>
                </div>

                <div class="card">
                    <h3>Upcoming Events</h3>
                    <div class="stat">3</div> <p>Confirmed registrations for this month.</p>
                    <a href="BrowseEventsServlet" class="btn">Find More Events</a>
                </div>

                <div class="card">
                    <h3>Your Profile</h3>
                    <p><strong>Email:</strong> ${email}</p>
                    <p><strong>Faculty:</strong> Computer Science</p>
                    <a href="UpdateProfileServlet" class="btn" style="background: var(--dark);">Edit Profile</a>
                </div>
            </div>

            <div style="margin-top: 40px; padding: 20px; background: #e9ecef; border-radius: 10px;">
                <h4 style="margin-top:0">System Status</h4>
                <p>Verify your attendance at the venue to trigger merit calculation by Admin HEPA.</p>
            </div>
        </div>
        
    </body>
</html>