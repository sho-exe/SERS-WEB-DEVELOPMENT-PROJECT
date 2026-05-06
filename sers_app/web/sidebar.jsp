<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <% String role=(String) session.getAttribute("accountType"); %>

        <% if ("STUDENT".equals(role)) { %>
            <div class="border-right text-white" id="sidebar-wrapper"
                style="min-width: 250px; background-color: var(--dark);">
                <div class="sidebar-heading p-4 fs-4 fw-bold text-info border-bottom border-secondary">
                    SERS Portal
                </div>
                <div class="list-group list-group-flush">
                    <a href="Homepage.jsp" class="list-group-item list-group-item-action bg-dark text-white">
                        <i class="fas fa-home me-2"></i> Dashboard
                    </a>
                    <a href="EventController?action=browse" class="list-group-item list-group-item-action bg-dark text-white">
                        <i class="fas fa-search me-2"></i> Explore Events
                    </a>
                    <a href="AttendanceController?action=myAttendance" class="list-group-item list-group-item-action bg-dark text-white">
                        <i class="fas fa-clipboard-list me-2"></i> My Registrations
                    </a>
                    <a href="MeritController?action=meritHistory" class="list-group-item list-group-item-action bg-dark text-white">
                        <i class="fas fa-medal me-2"></i> Merit Transcript
                    </a>
                    <a href="AuthController?action=logout" class="list-group-item list-group-item-action bg-dark text-danger">
                        <i class="fas fa-sign-out-alt me-2"></i> Logout
                    </a>
                </div>
            </div>
            <% } else if ("ADVISOR".equals(role)) { %>
                <div class="border-right text-white" id="sidebar-wrapper"
                    style="min-width: 250px; background-color: var(--dark);">
                    <div class="sidebar-heading p-4 fs-4 fw-bold text-success border-bottom border-secondary">
                        SERS Advisor
                    </div>
                    <div class="list-group list-group-flush">
                        <a href="Homepage.jsp" class="list-group-item list-group-item-action bg-dark text-white">
                            <i class="fas fa-home me-2"></i> Advisor Dashboard
                        </a>
                        <a href="ClubController?action=advisor" class="list-group-item list-group-item-action bg-dark text-white">
                            <i class="fas fa-flag-checkered me-2"></i> My Managed Clubs
                        </a>
                        <a href="EventController?action=pending" class="list-group-item list-group-item-action bg-dark text-white">
                            <i class="fas fa-check-circle me-2"></i> Pending Approvals
                        </a>
                        <a href="EventController?action=clubEvents" class="list-group-item list-group-item-action bg-dark text-white">
                            <i class="fas fa-history me-2"></i> Club Events History
                        </a>
                        <a href="MeritController?action=meritReports" class="list-group-item list-group-item-action bg-dark text-white">
                            <i class="fas fa-chart-bar me-2"></i> Merit Reports
                        </a>
                        <a href="AuthController?action=logout" class="list-group-item list-group-item-action bg-dark text-danger">
                            <i class="fas fa-sign-out-alt me-2"></i> Logout
                        </a>
                    </div>
                </div>
                <% } else if ("CHAIRPERSON".equals(role)) { %>
                    <div class="border-right text-white" id="sidebar-wrapper"
                        style="min-width: 250px; background-color: var(--dark);">
                        <div class="sidebar-heading p-4 fs-4 fw-bold text-primary border-bottom border-secondary">
                            SERS Chairperson
                        </div>
                        <div class="list-group list-group-flush">
                            <a href="Homepage.jsp" class="list-group-item list-group-item-action bg-dark text-white">
                                <i class="fas fa-home me-2"></i> Dashboard
                            </a>
                            <a href="EventController?action=manage"
                                class="list-group-item list-group-item-action bg-dark text-white">
                                <i class="fas fa-calendar-plus me-2"></i> Manage Events
                            </a>
                            <a href="StudentDashboardServlet"
                                class="list-group-item list-group-item-action bg-dark text-white">
                                <i class="fas fa-user-edit me-2"></i> Update Profile
                            </a>
                            <a href="AuthController?action=logout" class="list-group-item list-group-item-action bg-dark text-danger">
                                <i class="fas fa-sign-out-alt me-2"></i> Logout
                            </a>
                        </div>
                    </div>
                    <% } else if ("HEPA".equals(role)) { %>
                        <div class="border-right text-white" id="sidebar-wrapper"
                            style="min-width: 250px; background-color: var(--dark);">
                            <div class="sidebar-heading p-4 fs-4 fw-bold text-danger border-bottom border-light">
                                SERS HEPA
                            </div>
                            <div class="list-group list-group-flush">
                                <a href="Homepage.jsp"
                                    class="list-group-item list-group-item-action bg-dark text-white">
                                    <i class="fas fa-home me-2"></i> Admin Dashboard
                                </a>
                                <a href="UserController?action=manage"
                                    class="list-group-item list-group-item-action bg-dark text-white">
                                    <i class="fas fa-users me-2"></i> Manage Users
                                </a>
                                <a href="ClubController?action=manage"
                                    class="list-group-item list-group-item-action bg-dark text-white">
                                    <i class="fas fa-flag me-2"></i> Manage Clubs
                                </a>
                                <a href="EventController?action=global"
                                    class="list-group-item list-group-item-action bg-dark text-white">
                                    <i class="fas fa-globe me-2"></i> System-Wide Events
                                </a>
                                <a href="MeritController?action=distributeMerits"
                                    class="list-group-item list-group-item-action bg-dark text-white">
                                    <i class="fas fa-award me-2"></i> Distribute Merits
                                </a>
                                <a href="AuthController?action=logout" class="list-group-item list-group-item-action bg-dark text-danger">
                                    <i class="fas fa-sign-out-alt me-2"></i> Logout
                                </a>
                            </div>
                        </div>
                        <% } %>