<%@page import="java.util.List" %>
    <%@page import="com.lab.model.Event" %>
        <%@page import="com.lab.model.Club" %>
            <%@page contentType="text/html" pageEncoding="UTF-8" %>
    <% String role=(String) session.getAttribute("accountType"); %>

        <!DOCTYPE html>
        <html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default"
            data-assets-path="resources/assets/" data-template="vertical-menu-template-free">

        <head>
            <meta charset="utf-8" />
            <meta name="viewport"
                content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

            <title>SERS Dashboard</title>

            <meta name="description" content="SERS Dashboard" />

            <!-- Fonts -->
            <link rel="preconnect" href="https://fonts.googleapis.com" />
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
            <link
                href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
                rel="stylesheet" />

            <!-- Icons -->
            <link rel="stylesheet" href="resources/assets/vendor/fonts/boxicons.css" />

            <!-- Core CSS -->
            <link rel="stylesheet" href="resources/assets/vendor/css/core.css" class="template-customizer-core-css" />

            <link rel="stylesheet" href="resources/assets/vendor/css/theme-default.css"
                class="template-customizer-theme-css" />
            <link rel="stylesheet" href="resources/assets/css/demo.css" />

            <!-- Vendors CSS -->
            <link rel="stylesheet" href="resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

            <!-- Helpers -->
            <script src="resources/assets/vendor/js/helpers.js"></script>
            <script src="resources/assets/js/config.js"></script>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/custom-styles.css" />
</head>

        <body>
            <% if (role==null) { %>
                <div class="container-xxl container-p-y">
                    <div class="misc-wrapper">
                        <h2 class="mb-2 mx-2">Invalid access or session expired.</h2>
                        <p class="mb-4 mx-2">Please login again to continue.</p>
                        <a href="Login.jsp" class="btn btn-primary">Back to Login</a>
                    </div>
                </div>
                <% } else { %>
                    <!-- Layout wrapper -->
                    <div class="layout-wrapper layout-content-navbar">
                        <div class="layout-container">
                            <!-- Menu -->
                            <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
                                <div class="app-brand demo">
                                    <a href="Homepage_sneat.jsp" class="app-brand-link">
                                        <span class="app-brand-logo demo">
                                            <svg width="25" viewBox="0 0 25 42" version="1.1"
                                                xmlns="http://www.w3.org/2000/svg"
                                                xmlns:xlink="http://www.w3.org/1999/xlink">
                                                <defs>
                                                    <path
                                                        d="M13.7918663,0.358365126 L3.39788168,7.44174259 C0.566865006,9.69408886 -0.379795268,12.4788597 0.557900856,15.7960551 C0.68998853,16.2305145 1.09562888,17.7872135 3.12357076,19.2293357 C3.8146334,19.7207684 5.32369333,20.3834223 7.65075054,21.2172976 L7.59773219,21.2525164 L2.63468769,24.5493413 C0.445452254,26.3002124 0.0884951797,28.5083815 1.56381646,31.1738486 C2.83770406,32.8170431 5.20850219,33.2640127 7.09180128,32.5391577 C8.347334,32.0559211 11.4559176,30.0011079 16.4175519,26.3747182 C18.0338572,24.4997857 18.6973423,22.4544883 18.4080071,20.2388261 C17.963753,17.5346866 16.1776345,15.5799961 13.0496516,14.3747546 L10.9194936,13.4715819 L18.6192054,7.984237 L13.7918663,0.358365126 Z"
                                                        id="path-1"></path>
                                                    <path
                                                        d="M5.47320593,6.00457225 C4.05321814,8.216144 4.36334763,10.0722806 6.40359441,11.5729822 C8.61520715,12.571656 10.0999176,13.2171421 10.8577257,13.5094407 L15.5088241,14.433041 L18.6192054,7.984237 C15.5364148,3.11535317 13.9273018,0.573395879 13.7918663,0.358365126 C13.5790555,0.511491653 10.8061687,2.3935607 5.47320593,6.00457225 Z"
                                                        id="path-3"></path>
                                                    <path
                                                        d="M7.50063644,21.2294429 L12.3234468,23.3159332 C14.1688022,24.7579751 14.397098,26.4880487 13.008334,28.506154 C11.6195701,30.5242593 10.3099883,31.790241 9.07958868,32.3040991 C5.78142938,33.4346997 4.13234973,34 4.13234973,34 C4.13234973,34 2.75489982,33.0538207 2.37032616e-14,31.1614621 C-0.55822714,27.8186216 -0.55822714,26.0572515 -4.05231404e-15,25.8773518 C0.83734071,25.6075023 2.77988457,22.8248993 3.3049379,22.52991 C3.65497346,22.3332504 5.05353963,21.8997614 7.50063644,21.2294429 Z"
                                                        id="path-4"></path>
                                                    <path
                                                        d="M20.6,7.13333333 L25.6,13.8 C26.2627417,14.6836556 26.0836556,15.9372583 25.2,16.6 C24.8538077,16.8596443 24.4327404,17 24,17 L14,17 C12.8954305,17 12,16.1045695 12,15 C12,14.5672596 12.1403557,14.1461923 12.4,13.8 L17.4,7.13333333 C18.0627417,6.24967773 19.3163444,6.07059163 20.2,6.73333333 C20.3516113,6.84704183 20.4862915,6.981722 20.6,7.13333333 Z"
                                                        id="path-5"></path>
                                                </defs>
                                                <g id="g-app-brand" stroke="none" stroke-width="1" fill="none"
                                                    fill-rule="evenodd">
                                                    <g id="Brand-Logo" transform="translate(-27.000000, -15.000000)">
                                                        <g id="Icon" transform="translate(27.000000, 15.000000)">
                                                            <g id="Mask" transform="translate(0.000000, 8.000000)">
                                                                <mask id="mask-2" fill="white">
                                                                    <use xlink:href="#path-1"></use>
                                                                </mask>
                                                                <use fill="#696cff" xlink:href="#path-1"></use>
                                                                <g id="Path-3" mask="url(#mask-2)">
                                                                    <use fill="#696cff" xlink:href="#path-3"></use>
                                                                    <use fill-opacity="0.2" fill="#FFFFFF"
                                                                        xlink:href="#path-3"></use>
                                                                </g>
                                                                <g id="Path-4" mask="url(#mask-2)">
                                                                    <use fill="#696cff" xlink:href="#path-4"></use>
                                                                    <use fill-opacity="0.2" fill="#FFFFFF"
                                                                        xlink:href="#path-4"></use>
                                                                </g>
                                                            </g>
                                                            <g id="Triangle"
                                                                transform="translate(19.000000, 11.000000) rotate(-300.000000) translate(-19.000000, -11.000000) ">
                                                                <use fill="#696cff" xlink:href="#path-5"></use>
                                                                <use fill-opacity="0.2" fill="#FFFFFF"
                                                                    xlink:href="#path-5"></use>
                                                            </g>
                                                        </g>
                                                    </g>
                                                </g>
                                            </svg>
                                        </span>
                                        <span class="app-brand-text demo menu-text fw-bolder ms-2">SERS Portal</span>
                                    </a>

                                    <a href="javascript:void(0);"
                                        class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
                                        <i class="bx bx-chevron-left bx-sm align-middle"></i>
                                    </a>
                                </div>

                                <div class="menu-inner-shadow"></div>

                                <ul class="menu-inner py-1">
                                    <% if ("STUDENT".equals(role)) { %>
                                        <li class="menu-item active">
                                            <a href="Homepage_sneat.jsp" class="menu-link">
                                                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                                                <div data-i18n="Dashboard">Dashboard</div>
                                            </a>
                                        </li>
                                        <li class="menu-item">
                                            <a href="events?action=browse" class="menu-link">
                                                <i class="menu-icon tf-icons bx bx-search"></i>
                                                <div data-i18n="Explore Events">Explore Events</div>
                                            </a>
                                        </li>
                                        <li class="menu-item">
                                            <a href="attendances?action=myAttendance" class="menu-link">
                                                <i class="menu-icon tf-icons bx bx-clipboard"></i>
                                                <div data-i18n="My Registrations">My Registrations</div>
                                            </a>
                                        </li>
                                        <li class="menu-item">
                                            <a href="merits?action=meritHistory" class="menu-link">
                                                <i class="menu-icon tf-icons bx bx-medal"></i>
                                                <div data-i18n="Merit Transcript">Merit Transcript</div>
                                            </a>
                                        </li>
                                        <% } else if ("ADVISOR".equals(role)) { %>
                                            <li class="menu-item active">
                                                <a href="Homepage_sneat.jsp" class="menu-link">
                                                    <i class="menu-icon tf-icons bx bx-home-circle"></i>
                                                    <div data-i18n="Advisor Dashboard">Advisor Dashboard</div>
                                                </a>
                                            </li>
                                            <li class="menu-item">
                                                <a href="clubs?action=advisor" class="menu-link">
                                                    <i class="menu-icon tf-icons bx bx-flag"></i>
                                                    <div data-i18n="My Managed Clubs">My Managed Clubs</div>
                                                </a>
                                            </li>
                                            <li class="menu-item">
                                                <a href="events?action=pending" class="menu-link">
                                                    <i class="menu-icon tf-icons bx bx-check-circle"></i>
                                                    <div data-i18n="Pending Approvals">Pending Approvals</div>
                                                </a>
                                            </li>
                                            <li class="menu-item">
                                                <a href="events?action=clubEvents" class="menu-link">
                                                    <i class="menu-icon tf-icons bx bx-history"></i>
                                                    <div data-i18n="Club Events History">Club Events History</div>
                                                </a>
                                            </li>
                                            <li class="menu-item">
                                                <a href="merits?action=meritReports" class="menu-link">
                                                    <i class="menu-icon tf-icons bx bx-bar-chart-alt-2"></i>
                                                    <div data-i18n="Merit Reports">Merit Reports</div>
                                                </a>
                                            </li>
                                            <% } else if ("CHAIRPERSON".equals(role)) { %>
                                                <li class="menu-item active">
                                                    <a href="Homepage_sneat.jsp" class="menu-link">
                                                        <i class="menu-icon tf-icons bx bx-home-circle"></i>
                                                        <div data-i18n="Dashboard">Dashboard</div>
                                                    </a>
                                                </li>
                                                <li class="menu-item">
                                                    <a href="events?action=manage" class="menu-link">
                                                        <i class="menu-icon tf-icons bx bx-calendar-plus"></i>
                                                        <div data-i18n="Manage Events">Manage Events</div>
                                                    </a>
                                                </li>
                                                <li class="menu-item">
                                                    <a href="StudentDashboardServlet" class="menu-link">
                                                        <i class="menu-icon tf-icons bx bx-user"></i>
                                                        <div data-i18n="Update Profile">Update Profile</div>
                                                    </a>
                                                </li>
                                                <% } else if ("HEPA".equals(role)) { %>
                                                    <li class="menu-item active">
                                                        <a href="Homepage_sneat.jsp" class="menu-link">
                                                            <i class="menu-icon tf-icons bx bx-home-circle"></i>
                                                            <div data-i18n="Admin Dashboard">Admin Dashboard</div>
                                                        </a>
                                                    </li>
                                                    <li class="menu-item">
                                                        <a href="users?action=manage" class="menu-link">
                                                            <i class="menu-icon tf-icons bx bx-group"></i>
                                                            <div data-i18n="Manage Users">Manage Users</div>
                                                        </a>
                                                    </li>
                                                    <li class="menu-item">
                                                        <a href="clubs?action=manage" class="menu-link">
                                                            <i class="menu-icon tf-icons bx bx-flag"></i>
                                                            <div data-i18n="Manage Clubs">Manage Clubs</div>
                                                        </a>
                                                    </li>
                                                    <li class="menu-item">
                                                        <a href="events?action=global" class="menu-link">
                                                            <i class="menu-icon tf-icons bx bx-globe"></i>
                                                            <div data-i18n="System-Wide Events">System-Wide Events</div>
                                                        </a>
                                                    </li>
                                                    <li class="menu-item">
                                                        <a href="merits?action=distributeMerits" class="menu-link">
                                                            <i class="menu-icon tf-icons bx bx-award"></i>
                                                            <div data-i18n="Distribute Merits">Distribute Merits</div>
                                                        </a>
                                                    </li>
                                                    <% } %>
                                                        <li class="menu-item">
                                                            <a href="auths?action=logout" class="menu-link text-danger">
                                                                <i class="menu-icon tf-icons bx bx-power-off"></i>
                                                                <div data-i18n="Logout">Logout</div>
                                                            </a>
                                                        </li>
                                </ul>
                            </aside>
                            <!-- / Menu -->

                            <!-- Layout container -->
                            <div class="layout-page">
                                <!-- Navbar -->
                                <nav class="layout-navbar navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
                                    id="layout-navbar">
                                    <div
                                        class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
                                        <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                                            <i class="bx bx-menu bx-sm"></i>
                                        </a>
                                    </div>

                                    <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
                                        <!-- Welcome message -->
                                        <div class="navbar-nav align-items-center">
                                            <div class="nav-item d-flex align-items-center">
                                                <span class="fw-semibold">Welcome Back, ${name}!</span>
                                                <span class="text-muted ms-2">(${email})</span>
                                                <span class="badge bg-label-primary ms-3">${accountType}</span>
                                            </div>
                                        </div>

                                        <ul class="navbar-nav flex-row align-items-center ms-auto">
                                            <!-- User -->
                                            <li class="nav-item navbar-dropdown dropdown-user dropdown">
                                                <a class="nav-link dropdown-toggle hide-arrow"
                                                    href="javascript:void(0);" data-bs-toggle="dropdown">
                                                    <div class="avatar avatar-online">
                                                        <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png"
                                                            alt class="w-px-40 h-auto rounded-circle" />
                                                    </div>
                                                </a>
                                                <ul class="dropdown-menu dropdown-menu-end">
                                                    <li>
                                                        <a class="dropdown-item" href="#">
                                                            <div class="d-flex">
                                                                <div class="flex-shrink-0 me-3">
                                                                    <div class="avatar avatar-online">
                                                                        <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png"
                                                                            alt class="w-px-40 h-auto rounded-circle" />
                                                                    </div>
                                                                </div>
                                                                <div class="flex-grow-1">
                                                                    <span class="fw-semibold d-block">${name}</span>
                                                                    <small class="text-muted">${accountType}</small>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <div class="dropdown-divider"></div>
                                                    </li>
                                                    <li>
                                                        <a class="dropdown-item" href="auths?action=logout">
                                                            <i class="bx bx-power-off me-2"></i>
                                                            <span class="align-middle">Log Out</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <!--/ User -->
                                        </ul>
                                    </div>
                                </nav>
                                <!-- / Navbar -->


                                <!--SINI-->

                                <!-- Content wrapper -->
                                <div class="content-wrapper" style="padding: 0px 30px;">
                                    <!-- Content -->
                                    <div class=" flex-grow-1 container-p-y">

<h4 class="fw-bold py-3 mb-4">
    <span class="text-muted fw-light">Chairperson /</span> Event Proposal Matrix
</h4>

<% Club myClub=(Club) request.getAttribute("club"); if (myClub==null) { %>
                                    <div
                                        class="alert alert-danger  border-0 d-flex align-items-center p-4 ">
                                        <i class="fas fa-exclamation-triangle fa-3x me-4 text-danger"></i>
                                        <div>
                                            <h4 class="fw-bold mb-1">Access Denied: Unassigned Chairperson</h4>
                                            <p class="mb-0">You have not been officially appointed as the Chairperson to
                                                any active club. Please contact your Advisor or the HEPA Administrator
                                                to finish setting up your account profile before proposing events.</p>
                                        </div>
                                    </div>
                                    <% } else { %>

                                        <div class="alert alert-primary border-0  bg-primary-soft">
                                            <i class="fas fa-info-circle me-2 text-primary"></i> You are actively
                                            managing <strong>
                                                <%= myClub.getClubName() %>
                                            </strong>. Submit event proposals here. The Advisor or HEPA must manually
                                            approve them before students can register!
                                        </div>

                                        <div class="d-flex justify-content-between align-items-center mt-4 mb-3">
                                            <h5 class="fw-bold text-dark mb-0"><i class="fas fa-list me-2"></i> Club
                                                Event Archive</h5>
                                            <button type="button" class="btn btn-primary "
                                                data-bs-toggle="modal" data-bs-target="#proposeEventModal">
                                                <i class="fas fa-paper-plane me-1"></i> Propose New Event
                                            </button>
                                        </div>

                                        <div class="row">
                                            <% List<Event> eventList = (List<Event>) request.getAttribute("eventList");
                                                    if(eventList != null && !eventList.isEmpty()) {
                                                    for(Event e : eventList) {
                                                    String badgeColor = "bg-warning text-dark"; // PENDING
                                                    String icon = "fa-hourglass-half";
                                                    if("APPROVED".equals(e.getStatus())) { badgeColor = "bg-success";
                                                    icon = "fa-check-circle"; }
                                                    if("REJECTED".equals(e.getStatus())) { badgeColor = "bg-danger";
                                                    icon = "fa-times-circle"; }
                                                    %>
                                                    <div class="col-lg-12 mb-3">
                                                        <div class="card border-0  ">
                                                            <div
                                                                class="card-body p-4 d-flex align-items-lg-center flex-column flex-lg-row">
                                                                <div class="flex-grow-1 pe-jg-4">
                                                                    <div class="d-flex align-items-center mb-2">
                                                                        <h5 class="fw-bold mb-0 me-3">
                                                                            <%= e.getEventName() %>
                                                                        </h5>
                                                                        <span class="badge <%= badgeColor %>"><i
                                                                                class="fas <%= icon %> me-1"></i>
                                                                            <%= e.getStatus() %>
                                                                        </span>
                                                                    </div>
                                                                    <p class="text-muted small mb-3">
                                                                        <%= e.getDescription() %>
                                                                    </p>
                                                                    <div class="d-flex text-muted small fw-bold">
                                                                        <div class="me-4"><i
                                                                                class="far fa-calendar-alt text-primary me-1"></i>
                                                                            <%= e.getDate() %>
                                                                        </div>
                                                                        <div class="me-4"><i
                                                                                class="fas fa-map-marker-alt text-danger me-1"></i>
                                                                            <%= e.getVenue() %>
                                                                        </div>
                                                                        <div class="me-4"><i
                                                                                class="fas fa-users text-info me-1"></i>
                                                                            <%= e.getQuota() %> Pax
                                                                        </div>
                                                                        <div><i
                                                                                class="fas fa-bullseye text-success me-1"></i>
                                                                            <%= e.getCriteria() %> | <%= e.getCategory() %>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="mt-3 mt-lg-0 pb-lg-0 text-center text-lg-end"
                                                                    style="min-width: 170px; border-left: 1px solid #eee; padding-left: 20px;">
                                                                    <span class="d-block small text-muted mb-1">System
                                                                        ID</span>
                                                                    <span class="fw-bold fs-5 mb-3 d-block">#<%=
                                                                            e.getEventId() %></span>

                                                                    <% if("APPROVED".equals(e.getStatus())) { %>
                                                                        <a href="AttendanceController?action=manageAttendances&eventId=<%= e.getEventId() %>"
                                                                            class="btn btn-sm btn-outline-primary fw-bold w-100">
                                                                            <i class="fas fa-users me-1"></i>
                                                                            Attendances
                                                                        </a>
                                                                        <% } %>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <% } } else { %>
                                                        <div class="col-12 text-center py-5 text-muted">
                                                            <i class="fas fa-folder-open fa-3x mb-3 text-light"></i><br>
                                                            You have not proposed any events yet. Click the button above
                                                            to begin!
                                                        </div>
                                                        <% } %>
                                        </div>

                                        <!-- Propose Event Modal -->
                                        <div class="modal fade" id="proposeEventModal" tabindex="-1" aria-hidden="true">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content border-0 shadow-lg">
                                                    <div class="modal-header bg-primary text-white">
                                                        <h5 class="modal-title fw-bold"><i
                                                                class="fas fa-paper-plane me-2"></i> Submit Event
                                                            Proposal</h5>
                                                        <button type="button" class="btn-close btn-close-white"
                                                            data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <form action="EventController?action=manage" method="POST">
                                                        <div class="modal-body p-4 bg-light">
                                                            <input type="hidden" name="action" value="proposeEvent">
                                                            <input type="hidden" name="clubId"
                                                                value="<%= myClub.getClubId() %>">

                                                            <div class="row">
                                                                <div class="col-md-12 mb-3">
                                                                    <label class="form-label fw-bold">Event
                                                                        Title</label>
                                                                    <input type="text" name="eventName"
                                                                        class="form-control border-primary"
                                                                        placeholder="e.g., Annual Coding Hackathon"
                                                                        required>
                                                                </div>

                                                                <div class="col-md-12 mb-2">
                                                                    <label
                                                                        class="form-label fw-bold">Description</label>
                                                                    <textarea name="description"
                                                                        class="form-control border-primary" rows="4"
                                                                        placeholder="Briefly inform students what this event entails. They will read this during registration..."
                                                                        required></textarea>
                                                                </div>

                                                                <div class="col-md-5 mb-3">
                                                                    <label class="form-label fw-bold">Target
                                                                        Date</label>
                                                                    <input type="date" name="date"
                                                                        class="form-control border-primary" required>
                                                                </div>

                                                                <div class="col-md-5 mb-3">
                                                                    <label class="form-label fw-bold">Location /
                                                                        Venue</label>
                                                                    <input type="text" name="venue"
                                                                        class="form-control border-primary"
                                                                        placeholder="e.g., Main Hall B" required>
                                                                </div>

                                                                <div class="col-md-2 mb-3">
                                                                    <label class="form-label fw-bold">Quota
                                                                        Limit</label>
                                                                    <input type="number" name="quota"
                                                                        class="form-control border-primary"
                                                                        placeholder="0" required min="1">
                                                                </div>

                                                                <!-- <div class="col-md-12 mb-3">
                                                                    <label class="form-label fw-bold">Merit Decision
                                                                        Criteria <span
                                                                            class="text-muted fw-normal">(Optional
                                                                            context)</span></label>
                                                                    <input type="text" name="criteria"
                                                                        class="form-control"
                                                                        placeholder="e.g., Activity Level, Hardcoded specific tier...">
                                                                </div> -->


                                                                <div class="col-md-12 mb-3">
                                                                    <label class="form-label fw-bold">Select
                                                                        Category:</label>
                                                                    <select class="fw-bold form-select" id="kategori"
                                                                        name="kategori">
                                                                        <option value="leadership">Leadership</option>
                                                                        <option value="culture">Culture</option>
                                                                        <option value="spirituality">Spirituality
                                                                        </option>
                                                                        <option value="entrepreneurship">
                                                                            Entrepreneurship</option>
                                                                        <option value="volunteerism">Volunteerism
                                                                        </option>
                                                                        <option value="career">Career</option>
                                                                        <option value="sports">Sports</option>
                                                                        <option value="counseling_wellbeing">Student
                                                                            Counseling and Wellbeing</option>
                                                                    </select>
                                                                </div>



                                                            </div>
                                                            <div class="alert alert-warning small border-0 mt-3 mb-0">
                                                                <i class="fas fa-lock me-1"></i> <strong>Note:</strong>
                                                                Once submitted, the proposal is frozen as "PENDING". It
                                                                must be approved by Administration to appear in the
                                                                public catalog.
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer bg-white">
                                                            <button type="button"
                                                                class="btn btn-outline-secondary fw-bold"
                                                                data-bs-dismiss="modal">Discard Proposal</button>
                                                            <button type="submit"
                                                                class="btn btn-primary fw-bold px-4">Submit to
                                                                Administration</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>

                                        <% } %> <!-- End Else Branch -->

</div>
<!-- / Content -->

<div class="content-backdrop fade"></div>
</div>
<!-- Content wrapper -->
</div>
<!-- / Layout page -->
</div>

<!-- Overlay -->
<div class="layout-overlay layout-menu-toggle"></div>
</div>
<!-- / Layout wrapper -->

<!-- Core JS -->
<script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/jquery/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/popper/popper.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendor/js/bootstrap.js"></script>
<script
    src="${pageContext.request.contextPath}/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendor/js/menu.js"></script>

<!-- Main JS -->
<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

<% } %>
    </body>

    </html>
