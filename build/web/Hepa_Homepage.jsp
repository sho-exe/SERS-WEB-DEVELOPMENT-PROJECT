<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>HEPA Dashboard | SERS</title>
        <style>
            :root { --primary: #007bff; --danger: #dc3545; --dark: #343a40; --light: #f8f9fa; }
            body { font-family: 'Segoe UI', Arial, sans-serif; background: #f4f7f6; margin: 0; display: flex; }
            .sidebar { width: 250px; background: var(--dark); color: white; height: 100vh; position: fixed; padding: 20px; }
            .sidebar h2 { color: var(--danger); font-size: 1.5rem; margin-bottom: 30px; }
            .nav-link { color: #bbb; text-decoration: none; display: block; padding: 12px 0; border-bottom: 1px solid #444; }
            .nav-link:hover { color: white; }
            .main-content { margin-left: 290px; padding: 40px; width: 100%; }
            .header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px; }
            .grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px; }
            .card { background: white; padding: 25px; border-radius: 12px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
            .card h3 { margin-top: 0; color: var(--dark); font-size: 1.1rem; }
            .stat { font-size: 2rem; font-weight: bold; color: var(--danger); }
            .btn { display: inline-block; padding: 10px 20px; background: var(--danger); color: white; text-decoration: none; border-radius: 5px; margin-top: 15px; transition: 0.3s; }
            .role-badge { background: var(--danger); color: white; padding: 4px 10px; border-radius: 20px; font-size: 0.8rem; }
        </style>
    </head>
    <body>
        <div class="sidebar">
            <h2>SERS Admin</h2>
            <a href="#" class="nav-link">Admin Dashboard</a>
            <a href="ManageUsersServlet" class="nav-link">Manage Users</a>
            <a href="ManageClubsServlet" class="nav-link">Manage Clubs</a>
            <a href="GlobalEventsServlet" class="nav-link">System-Wide Events</a>
            <a href="DistributeMeritsServlet" class="nav-link">Distribute Merits</a>
            <a href="LogoutServlet" class="nav-link" style="margin-top: 50px; color: #ff4d4d;">Logout</a>
        </div>

        <div class="main-content">
            <div class="header">
                <h1>Admin Control Panel: Welcome, ${name}</h1>
                <span class="role-badge">SYSTEM ADMIN (HEPA)</span>
            </div>

            <div class="grid">
                <div class="card">
                    <h3>Total Registered Users</h3>
                    <div class="stat">1,240</div> 
                    <p>Total students and staff in the system.</p>
                    <a href="ManageUsersServlet" class="btn">User Directory</a>
                </div>

                <div class="card">
                    <h3>Pending Merit Batches</h3>
                    <div class="stat">3</div> 
                    <p>Events with verified attendance waiting for points.</p>
                    <a href="DistributeMeritsServlet" class="btn">Assign Merits</a>
                </div>

                <div class="card">
                    <h3>Club Monitoring</h3>
                    <div class="stat">15</div> 
                    <p>Active clubs registered in the system.</p>
                    <a href="ManageClubsServlet" class="btn">Club Management</a>
                </div>
            </div>

            <div style="margin-top: 40px; padding: 20px; background: #f8d7da; border-radius: 10px; border-left: 5px solid var(--danger);">
                <h4 style="margin-top:0">Superuser Status</h4>
                <p>You have full override permissions. You can finalize merit distribution for any event once attendance has been verified by a Chairperson.</p>
            </div>
        </div>
    </body>
</html>