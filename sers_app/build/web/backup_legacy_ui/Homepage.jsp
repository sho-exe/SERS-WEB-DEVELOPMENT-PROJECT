<%@page contentType="text/html" pageEncoding="UTF-8" %>
<% String role = (String) session.getAttribute("accountType"); %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>SERS Dashboard</title>
        <link href="${pageContext.request.contextPath}/resources/vendor/css/core.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/css/css.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    </head>

    <body class="bg-light">
        <% if (role == null) { %>
        <h1>Invalid access or session expired.</h1>
        <a href="Login.jsp">Login Again</a>
        <% } else { %>
        <div class="d-flex" id="wrapper">
            <jsp:include page="sidebar.jsp" />

            <% if ("STUDENT".equals(role)) { %>
            <div id="page-content-wrapper" class="w-100">
                <nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom shadow-sm py-3">
                    <div class="container-fluid">
                        <h5 class="mb-0 text-dark">Welcome Back, ${name}! <span
                                style="color: darkgray;">(${email})</span></h5>
                        <div class="badge bg-success">Status: ${accountType}</div>
                    </div>
                </nav>

                <div class="row mb-4" style="margin:20px;">
                    <div class="col-12">
                        <h5 class="mb-3 text-dark fw-bold">Quick Actions</h5>
                    </div>

                    <div class="col-lg-4 col-md-6 mb-3">
                        <a href="events?action=browse" class="text-decoration-none">
                            <div
                                class="card h-100 shadow-sm border-0 action-card text-center p-3 bg-info-soft">
                                <div class="card-body">
                                    <div class="icon-box mb-3 bg-primary-soft text-primary">
                                        <i class="fas fa-search fa-2x"></i>
                                    </div>
                                    <h5 class="card-title text-dark">Explore Events</h5>
                                    <p class="card-text text-muted small hide-on-mobile">Discover and
                                        register
                                        for upcoming faculty activities.</p>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col-lg-4 col-md-6 mb-3">
                        <a href="attendances?action=myAttendance" class="text-decoration-none">
                            <div
                                class="card h-100 shadow-sm border-0 action-card text-center p-3 bg-success-soft">
                                <div class="card-body">
                                    <div class="icon-box mb-3 bg-success-soft text-success">
                                        <i class="fas fa-clipboard-list fa-2x"></i>
                                    </div>
                                    <h5 class="card-title text-dark">My Registrations</h5>
                                    <p class="card-text text-muted small hide-on-mobile">View and manage
                                        your
                                        current event registrations.</p>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col-lg-4 col-md-12 mb-3">
                        <a href="merits?action=meritHistory" class="text-decoration-none">
                            <div
                                class="card h-100 shadow-sm border-0 action-card text-center p-3 bg-primary-soft">
                                <div class="card-body">
                                    <div class="icon-box mb-3 bg-info-soft text-info">
                                        <i class="fas fa-medal fa-2x"></i>
                                    </div>
                                    <h5 class="card-title text-dark">Merit Transcript</h5>
                                    <p class="card-text text-muted small hide-on-mobile">Check your current
                                        point balance and transcript.</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>

                <div class="container-fluid p-4">
                    <div class="row mb-4">
                        <div class="col-md-6 col-lg-4 mb-3">
                            <div class="card border-0 shadow-sm rounded-3">
                                <div class="card-body p-4 border-start border-primary border-5">
                                    <h6 class="text-muted text-uppercase small font-weight-bold">
                                        Accumulated
                                        Merits</h6>
                                    <h2 class="display-6 fw-bold text-primary">${totalMerits != null
                                                                                 ?
                                                                                 totalMerits : '0'}</h2>
                                    <p class="mb-0 text-muted small">Verified through events
                                        attended
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-lg-4 mb-3">
                            <div class="card border-0 shadow-sm rounded-3">
                                <div class="card-body p-4 border-start border-success border-5">
                                    <h6 class="text-muted text-uppercase small font-weight-bold">
                                        Upcoming
                                        Events
                                    </h6>
                                    <h2 class="display-6 fw-bold text-success">${upcomingEventCount
                                                                                 !=
                                                                                 null
                                                                                 ?
                                                                                 upcomingEventCount : '0'}</h2>
                                    <p class="mb-0 text-muted small">Confirmed registrations this
                                        month
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <% } else if ("ADVISOR".equals(role)) { %>
        <div id="page-content-wrapper" class="w-100">
            <nav
                class="navbar navbar-expand-lg navbar-light bg-white border-bottom shadow-sm py-3">
                <div class="container-fluid">
                    <h5 class="mb-0 text-dark">Advisor Panel: Welcome, ${name}! <span
                            style="color: darkgray;">(${email})</span></h5>
                    <div class="badge bg-success">Status: ${accountType}</div>
                </div>
            </nav>



            <!-- Features incoming: -->
            <div class="row mb-4" style="margin:20px;">
                <div class="col-12">
                    <h5 class="mb-3 text-dark fw-bold">Quick Actions</h5>
                </div>

                <div class="col-lg-4 col-md-6 mb-3">
                    <a href="events?action=pending" class="text-decoration-none">
                        <div
                            class="card h-100 shadow-sm border-0 action-card text-center p-3 bg-info-soft">
                            <div class="card-body">
                                <div class="icon-box mb-3 bg-primary-soft text-primary">
                                    <i class="fas fa-check-circle fa-2x"></i>
                                </div>
                                <h5 class="card-title text-dark">Pending Approvals</h5>
                                <p class="card-text text-muted small hide-on-mobile">Review and
                                    approve
                                    new event proposals from Chairpersons.</p>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-lg-4 col-md-6 mb-3">
                    <a href="events?action=global" class="text-decoration-none">
                        <div class="card h-100 shadow-sm border-0 action-card text-center p-3 bg-success-soft"
                             style="background-color: rgb(255, 255, 107);">
                            <div class="card-body">
                                <div class="icon-box mb-3 bg-success-soft text-success">
                                    <i class="fas fa-award fa-2x"></i>
                                </div>
                                <h5 class="card-title text-dark">System-Wide Events</h5>
                                <p class="card-text text-muted small hide-on-mobile">Authorize
                                    and review all pending event proposals.
                                </p>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-lg-4 col-md-6 mb-3">
                    <a href="events?action=clubEvents" class="text-decoration-none">
                        <div
                            class="card h-100 shadow-sm border-0 action-card text-center p-3 bg-success-soft">
                            <div class="card-body">
                                <div class="icon-box mb-3 bg-success-soft text-success">
                                    <i class="fas fa-history fa-2x"></i>
                                </div>
                                <h5 class="card-title text-dark">Club Event History</h5>
                                <p class="card-text text-muted small hide-on-mobile">Browse past
                                    and
                                    ongoing events managed by your club.</p>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-lg-4 col-md-12 mb-3">
                    <a href="merits?action=meritReports" class="text-decoration-none">
                        <div
                            class="card h-100 shadow-sm border-0 action-card text-center p-3 bg-primary-soft">
                            <div class="card-body">
                                <div class="icon-box mb-3 bg-info-soft text-info">
                                    <i class="fas fa-chart-bar fa-2x"></i>
                                </div>
                                <h5 class="card-title text-dark">Merit Reports</h5>
                                <p class="card-text text-muted small hide-on-mobile">View
                                    statistics on
                                    student participation and merit distribution.</p>
                            </div>
                        </div>
                    </a>
                </div>
            </div>

            <div class="container-fluid p-4">
                <div class="row mb-4">
                    <div class="col-md-6 col-lg-4 mb-3">
                        <div class="card border-0 shadow-sm rounded-3">
                            <div class="card-body p-4 border-start border-warning border-5">
                                <h6 class="text-muted text-uppercase small font-weight-bold">
                                    Events
                                    Pending Review</h6>
                                <h2 class="display-6 fw-bold text-warning">
                                    ${pendingApprovalCount !=
                                      null ? pendingApprovalCount : '0'}</h2>
                                <p class="mb-0 text-muted small">New proposals from your Club
                                    Chairperson</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-4 mb-3">
                        <div class="card border-0 shadow-sm rounded-3">
                            <div class="card-body p-4 border-start border-success border-5">
                                <h6 class="text-muted text-uppercase small font-weight-bold">
                                    Club
                                    Participation</h6>
                                <h2 class="display-6 fw-bold text-success">
                                    ${clubParticipantCount !=
                                      null ? clubParticipantCount : '0'}</h2>
                                <p class="mb-0 text-muted small">Total students active in your
                                    club
                                    events</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <% } else if ("CHAIRPERSON".equals(role)) { %>
    <div id="page-content-wrapper" class="w-100">
        <nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom shadow-sm py-3">
            <div class="container-fluid">
                <h5 class="mb-0 text-dark">Welcome Back, ${name}! <span
                        style="color: darkgray;">(${email})</span></h5>
                <div class="badge bg-success">Status: ${accountType}</div>
            </div>
        </nav>

        <!-- Quick Actions incoming... -->
        <div class="row mb-4" style="margin:20px;">
            <div class="col-12">
                <h5 class="mb-3 text-dark fw-bold">Quick Actions</h5>
            </div>

            <div class="col-lg-4 col-md-6 mb-3" style="">
                <a href="events?action=manage" class="text-decoration-none">
                    <div
                        class="card h-100 shadow-sm border-0 action-card text-center p-3 bg-info-soft">
                        <div class="card-body">
                            <div class="icon-box mb-3 bg-primary-soft text-primary">
                                <i class="fas fa-calendar-plus fa-2x"></i>
                            </div>
                            <h5 class="card-title text-dark">Manage Events</h5>
                            <p class="card-text text-muted small hide-on-mobile">Discover and
                                register for upcoming faculty activities.</p>
                        </div>
                    </div>
                </a>
            </div>

            <!-- <div class="col-lg-4 col-md-6 mb-3">
                    <a href="FillAttendanceServlet" class="text-decoration-none">
                        <div
                            class="card h-100 shadow-sm border-0 action-card text-center p-3 bg-success-soft">
                            <div class="card-body">
                                <div class="icon-box mb-3 bg-success-soft text-success">
                                    <i class="fas fa-user-check fa-2x"></i>
                                </div>
                                <h5 class="card-title text-dark">Fill Attendances</h5>
                                <p class="card-text text-muted small hide-on-mobile">Verify your
                                    presence at an event to earn merits.</p>
                            </div>
                        </div>
                    </a>
                </div> -->

            <div class="col-lg-4 col-md-12 mb-3 ">
                <a href="merits?action=meritHistory" class="text-decoration-none ">
                    <div
                        class="card h-100 shadow-sm border-0 action-card text-center p-3 bg-primary-soft">
                        <div class="card-body">
                            <div class="icon-box mb-3 bg-info-soft text-info">
                                <i class="fas fa-medal fa-2x"></i>
                            </div>
                            <h5 class="card-title text-dark">View Merits</h5>
                            <p class="card-text text-muted small hide-on-mobile">Check your
                                current point balance and transcript.</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>



    </div>
</div>
<% } else if ("HEPA".equals(role)) { %>
<div id="page-content-wrapper" class="w-100" style="width:400px;">
    <nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom shadow-sm py-3">
        <div class="container-fluid">
            <h5 class="mb-0 text-dark">Admin Control Panel: Welcome, ${name}! <span
                    style="color: darkgray;">(${email})</span></h5>
            <div class="badge bg-danger">Status: ${accountType}</div>
        </div>
    </nav>

    <div class="row mb-4" style="margin:20px;">
        <div class="col-12">
            <h5 class="mb-3 text-dark fw-bold">Quick Actions</h5>
        </div>

        <div class="col-lg-4 col-md-6 mb-3">
            <a href="users?action=manage" class="text-decoration-none">
                <div
                    class="card h-100 shadow-sm border-0 action-card text-center p-3 bg-info-soft">
                    <div class="card-body">
                        <div class="icon-box mb-3 bg-primary-soft text-primary">
                            <i class="fas fa-users fa-2x"></i>
                        </div>
                        <h5 class="card-title text-dark">Manage Users</h5>
                        <p class="card-text text-muted small hide-on-mobile">View
                            and
                            manage all registered students and staff.</p>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-lg-4 col-md-6 mb-3">
            <a href="clubs?action=manage" class="text-decoration-none">
                <div class="card h-100 shadow-sm border-0 action-card text-center p-3 bg-secondary-soft"
                     style="background-color: rgb(255, 203, 203);">
                    <div class="card-body">
                        <div class="icon-box mb-3 bg-info-soft text-info">
                            <i class="fas fa-flag fa-2x"></i>
                        </div>
                        <h5 class="card-title text-dark">Manage Clubs</h5>
                        <p class="card-text text-muted small hide-on-mobile">Monitor
                            and
                            configure all active clubs in the system.</p>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-lg-4 col-md-6 mb-3">
            <a href="events?action=global" class="text-decoration-none">
                <div class="card h-100 shadow-sm border-0 action-card text-center p-3 bg-success-soft"
                     style="background-color: rgb(255, 255, 107);">
                    <div class="card-body">
                        <div class="icon-box mb-3 bg-success-soft text-success">
                            <i class="fas fa-award fa-2x"></i>
                        </div>
                        <h5 class="card-title text-dark">System-Wide Events</h5>
                        <p class="card-text text-muted small hide-on-mobile">Authorize
                            and review all pending event proposals.
                        </p>
                    </div>
                </div>
            </a>
        </div>



        <div class="col-lg-4 col-md-6 mb-3">
            <a href="merits?action=distributeMerits" class="text-decoration-none">
                <div
                    class="card h-100 shadow-sm border-0 action-card text-center p-3 bg-success-soft">
                    <div class="card-body">
                        <div class="icon-box mb-3 bg-success-soft text-success">
                            <i class="fas fa-globe fa-2x"></i>
                        </div>
                        <h5 class="card-title text-dark">Distribute Merits</h5>
                        <p class="card-text text-muted small hide-on-mobile">
                            Assign
                            merit points to students for verified event attendance.
                        </p>

                    </div>
                </div>
            </a>
        </div>

    </div>

    <div class="container-fluid p-4">
        <div class="row mb-4">
            <div class="col-md-6 col-lg-4 mb-3">
                <div class="card border-0 shadow-sm rounded-3">
                    <div class="card-body p-4 border-start border-primary border-5">
                        <h6 class="text-muted text-uppercase small font-weight-bold">
                            Total Registered Users</h6>
                        <h2 class="display-6 fw-bold text-primary">${totalUserCount
                                                                     !=
                                                                     null ? totalUserCount : '0'}</h2>
                        <p class="mb-0 text-muted small">Total students and staff in
                            the
                            system</p>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-4 mb-3">
                <div class="card border-0 shadow-sm rounded-3">
                    <div class="card-body p-4 border-start border-danger border-5">
                        <h6 class="text-muted text-uppercase small font-weight-bold">
                            Pending Merit Batches</h6>
                        <h2 class="display-6 fw-bold text-danger">
                            ${pendingMeritBatches
                              != null ? pendingMeritBatches : '0'}</h2>
                        <p class="mb-0 text-muted small">Events with verified
                            attendance
                            awaiting points</p>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-4 mb-3">
                <div class="card border-0 shadow-sm rounded-3">
                    <div class="card-body p-4 border-start border-warning border-5">
                        <h6 class="text-muted text-uppercase small font-weight-bold">
                            Active Clubs</h6>
                        <h2 class="display-6 fw-bold text-warning">${activeClubCount
                                                                     !=
                                                                     null ? activeClubCount : '0'}</h2>
                        <p class="mb-0 text-muted small">Active clubs registered in
                            the
                            system</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<% } else { %>
<h1>Invalid access or session expired.</h1>

<% } %>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<% }%>
</body>

</html>