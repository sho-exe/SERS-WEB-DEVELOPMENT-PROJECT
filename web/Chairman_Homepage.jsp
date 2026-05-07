<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Chairperson Dashboard | SERS</title>
        <style>
            /* CSS remains consistent, utilizing a secondary color for identification */
            :root { --primary: #007bff; --success: #28a745; --info: #17a2b8; --dark: #343a40; --light: #f8f9fa; }
            body { font-family: 'Segoe UI', Arial, sans-serif; background: #f4f7f6; margin: 0; display: flex; }
            .sidebar { width: 250px; background: var(--dark); color: white; height: 100vh; position: fixed; padding: 20px; }
            .sidebar h2 { color: var(--info); font-size: 1.5rem; margin-bottom: 30px; }
            .nav-link { color: #bbb; text-decoration: none; display: block; padding: 12px 0; border-bottom: 1px solid #444; }
            .nav-link:hover { color: white; }
            .main-content { margin-left: 290px; padding: 40px; width: 100%; }
            .header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px; }
            .grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px; }
            .card { background: white; padding: 25px; border-radius: 12px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
            .card h3 { margin-top: 0; color: var(--dark); font-size: 1.1rem; }
            .stat { font-size: 2rem; font-weight: bold; color: var(--info); }
            .btn { display: inline-block; padding: 10px 20px; background: var(--info); color: white; text-decoration: none; border-radius: 5px; margin-top: 15px; transition: 0.3s; }
            .role-badge { background: var(--info); color: white; padding: 4px 10px; border-radius: 20px; font-size: 0.8rem; }
        </style>
    </head>
    <body>
        <div class="sidebar">
            <h2>SERS Portal</h2>
            <a href="#" class="nav-link">Chairperson Home</a>
            <a href="CreateEventServlet" class="nav-link">Create New Event</a>
            <a href="ManageEventsServlet" class="nav-link">Manage My Events</a>
            <a href="VerifyAttendanceServlet" class="nav-link">Verify Attendance</a>
            <a href="ClubMembersServlet" class="nav-link">Club Members</a>
            <a href="Logout.jsp" class="nav-link" style="margin-top: 50px; color: #ff4d4d;">Logout</a>
        </div>

        <div class="main-content">
            <div class="header">
                <h1>Chairperson Panel: Hello, ${name}!</h1>
                <span class="role-badge">${accountType}</span>
            </div>

            <div class="grid">
                <div class="card">
                    <h3>Active Events</h3>
                    <div class="stat">2</div> 
                    <p>Events currently open for student registration.</p>
                    <a href="ManageEventsServlet" class="btn">Edit Events</a>
                </div>

                <div class="card">
                    <h3>Needs Verification</h3>
                    <div class="stat">45</div> 
                    <p>Students waiting for physical attendance confirmation.</p>
                    <a href="VerifyAttendanceServlet" class="btn">Verify Now</a>
                </div>

                <div class="card">
                    <h3>Club Profile</h3>
                    <p><strong>Managed Club:</strong> Robotics Club</p>
                    <p><strong>Advisor:</strong> Dr. Sarah Lee</p>
                    <a href="ClubMembersServlet" class="btn" style="background: var(--dark);">View Members</a>
                </div>
            </div>

            <div style="margin-top: 40px; padding: 20px; background: #d1ecf1; border-radius: 10px; border-left: 5px solid var(--info);">
                <h4 style="margin-top:0">Operational Reminder</h4>
                <p>Ensure you verify attendance within 24 hours of the event completion to allow HEPA to distribute merit points.</p>
            </div>
        </div>
    </body>
</html>