<%@page import="java.util.List" %>
    <%@page import="com.lab.model.Attendance" %>
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
                    <link rel="stylesheet" href="resources/assets/vendor/css/core.css"
                        class="template-customizer-core-css" />

                    <link rel="stylesheet" href="resources/assets/vendor/css/theme-default.css"
                        class="template-customizer-theme-css" />
                    <link rel="stylesheet" href="resources/assets/css/demo.css" />

                    <!-- Vendors CSS -->
                    <link rel="stylesheet"
                        href="resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

                    <!-- Helpers -->
                    <script src="resources/assets/vendor/js/helpers.js"></script>
                    <script src="resources/assets/js/config.js"></script>
                    <link rel="stylesheet"
                        href="${pageContext.request.contextPath}/resources/assets/css/custom-styles.css" />
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
                                                            <g id="Brand-Logo"
                                                                transform="translate(-27.000000, -15.000000)">
                                                                <g id="Icon"
                                                                    transform="translate(27.000000, 15.000000)">
                                                                    <g id="Mask"
                                                                        transform="translate(0.000000, 8.000000)">
                                                                        <mask id="mask-2" fill="white">
                                                                            <use xlink:href="#path-1"></use>
                                                                        </mask>
                                                                        <use fill="#696cff" xlink:href="#path-1"></use>
                                                                        <g id="Path-3" mask="url(#mask-2)">
                                                                            <use fill="#696cff" xlink:href="#path-3">
                                                                            </use>
                                                                            <use fill-opacity="0.2" fill="#FFFFFF"
                                                                                xlink:href="#path-3"></use>
                                                                        </g>
                                                                        <g id="Path-4" mask="url(#mask-2)">
                                                                            <use fill="#696cff" xlink:href="#path-4">
                                                                            </use>
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
                                                <span class="app-brand-text demo menu-text fw-bolder ms-2">SERS
                                                    Portal</span>
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
                                                            <div data-i18n="Club Events History">Club Events History
                                                            </div>
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
                                                                    <div data-i18n="Admin Dashboard">Admin Dashboard
                                                                    </div>
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
                                                                    <div data-i18n="System-Wide Events">System-Wide
                                                                        Events</div>
                                                                </a>
                                                            </li>
                                                            <li class="menu-item">
                                                                <a href="merits?action=distributeMerits"
                                                                    class="menu-link">
                                                                    <i class="menu-icon tf-icons bx bx-award"></i>
                                                                    <div data-i18n="Distribute Merits">Distribute Merits
                                                                    </div>
                                                                </a>
                                                            </li>
                                                            <% } %>
                                                                <li class="menu-item">
                                                                    <a href="auths?action=logout"
                                                                        class="menu-link text-danger">
                                                                        <i
                                                                            class="menu-icon tf-icons bx bx-power-off"></i>
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

                                            <div class="navbar-nav-right d-flex align-items-center"
                                                id="navbar-collapse">
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
                                                                                    alt
                                                                                    class="w-px-40 h-auto rounded-circle" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="flex-grow-1">
                                                                            <span
                                                                                class="fw-semibold d-block">${name}</span>
                                                                            <small
                                                                                class="text-muted">${accountType}</small>
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
                                                    <span class="text-muted fw-light">SERS /</span> My Personal Sign-Ups
                                                </h4>

                                                <style>
                                                    .timeline {
                                                        position: relative;
                                                        padding-left: 2rem;
                                                        margin-top: 2rem;
                                                    }

                                                    .timeline::before {
                                                        content: '';
                                                        position: absolute;
                                                        left: 0.5rem;
                                                        top: 0;
                                                        bottom: 0;
                                                        width: 4px;
                                                        background: #e9ecef;
                                                        border-radius: 4px;
                                                    }

                                                    .timeline-item {
                                                        position: relative;
                                                        margin-bottom: 2rem;
                                                        padding-left: 1.5rem;
                                                    }

                                                    .timeline-item::before {
                                                        content: '';
                                                        position: absolute;
                                                        left: -1.75rem;
                                                        top: 0.5rem;
                                                        width: 1.5rem;
                                                        height: 1.5rem;
                                                        background: var(--bs-primary);
                                                        border: 4px solid #fff;
                                                        border-radius: 50%;
                                                        box-shadow: 0 0 0 2px rgba(0, 0, 0, 0.1);
                                                        z-index: 1;
                                                    }

                                                    .timeline-item.attended::before {
                                                        background: var(--bs-success);
                                                    }

                                                    .timeline-item.missed::before {
                                                        background: var(--bs-danger);
                                                    }

                                                    .timeline-item.pending::before {
                                                        background: var(--bs-warning);
                                                    }
                                                </style>

                                                <div class="row">
                                                    <div class="col-md-10 col-lg-8">
                                                        <div class="card border-0 shadow-sm rounded-3 p-4 mb-4">
                                                            <h5 class="fw-bold mb-3"><i
                                                                    class="fas fa-history text-muted me-2"></i>
                                                                Registration History</h5>
                                                            <p class="text-muted small">This timeline tracks every
                                                                faculty event you have ever registered for. Once the
                                                                Chairperson physically verifies your attendance at the
                                                                event, its status will turn Green (ATTENDED), locking
                                                                you in for future Merit point payouts!</p>

                                                            <div class="timeline">
                                                                <% List<Attendance> myRegistrations = (List<Attendance>)
                                                                        request.getAttribute("myRegistrations");
                                                                        if(myRegistrations != null &&
                                                                        !myRegistrations.isEmpty()) {
                                                                        for(Attendance a : myRegistrations) {
                                                                        boolean isPending =
                                                                        "REGISTERED".equals(a.getStatus());
                                                                        boolean isAttended =
                                                                        "ATTENDED".equals(a.getStatus());
                                                                        boolean isMissed =
                                                                        "MISSED".equals(a.getStatus());

                                                                        String statusIndicatorClass = isPending ?
                                                                        "pending" : (isAttended ? "attended" :
                                                                        "missed");
                                                                        %>
                                                                        <div
                                                                            class="timeline-item <%= statusIndicatorClass %>">
                                                                            <div
                                                                                class="card border-0 shadow-sm overflow-hidden bg-white">
                                                                                <% String cardBodyClass="card-body p-4 "
                                                                                    + (isPending
                                                                                    ? "border-start border-warning border-4"
                                                                                    : (isAttended
                                                                                    ? "border-start border-success border-4"
                                                                                    : "" )); %>
                                                                                    <div class="<%= cardBodyClass %>">
                                                                                        <div
                                                                                            class="d-flex justify-content-between align-items-start mb-2">
                                                                                            <h5
                                                                                                class="fw-bold text-dark mb-0">
                                                                                                <%= a.getEventName() %>
                                                                                            </h5>
                                                                                            <% if(isPending) { %>
                                                                                                <span
                                                                                                    class="badge bg-warning text-dark"><i
                                                                                                        class="fas fa-hourglass-half"></i>
                                                                                                    PENDING
                                                                                                    VERIFICATION</span>
                                                                                                <% } else if(isAttended)
                                                                                                    { %>
                                                                                                    <span
                                                                                                        class="badge bg-success"><i
                                                                                                            class="fas fa-check-double"></i>
                                                                                                        ATTENDED</span>
                                                                                                    <% } else { %>
                                                                                                        <span
                                                                                                            class="badge bg-danger"><i
                                                                                                                class="fas fa-times"></i>
                                                                                                            MISSED</span>
                                                                                                        <% } %>
                                                                                        </div>
                                                                                        <p
                                                                                            class="small text-muted mb-3">
                                                                                            <i
                                                                                                class="fas fa-flag text-primary me-1"></i>
                                                                                            Hosted by: <strong>
                                                                                                <%= a.getClubName() %>
                                                                                            </strong>
                                                                                        </p>

                                                                                        <div
                                                                                            class="row text-secondary small fw-bold mt-3">
                                                                                            <div
                                                                                                class="col-sm-6 mb-2 mb-sm-0">
                                                                                                <i
                                                                                                    class="far fa-calendar-alt text-danger me-1"></i>
                                                                                                Event Date: <%=
                                                                                                    a.getEventDate() %>
                                                                                            </div>
                                                                                            <div class="col-sm-6">
                                                                                                <i
                                                                                                    class="fas fa-map-marker-alt text-info me-1"></i>
                                                                                                Venue: <%=
                                                                                                    a.getEventVenue() %>
                                                                                            </div>
                                                                                        </div>
                                                                                        <hr
                                                                                            class="text-muted opacity-25">
                                                                                        <div class="text-muted small">
                                                                                            <i
                                                                                                class="far fa-clock me-1"></i>
                                                                                            Signed up on <%=
                                                                                                a.getRegistrationDate()
                                                                                                %>
                                                                                        </div>
                                                                                    </div>
                                                                            </div>
                                                                        </div>
                                                                        <% } } else { %>
                                                                            <div class="text-center py-5 text-muted">
                                                                                <i
                                                                                    class="fas fa-box-open fa-3x mb-3 text-light"></i>
                                                                                <h6 class="fw-bold">No Registrations
                                                                                    Found</h6>
                                                                                <p>You haven't signed up for any events
                                                                                    yet. Check out the Event Catalog!
                                                                                </p>
                                                                                <a href="EventController?action=browse"
                                                                                    class="btn btn-outline-primary btn-sm"><i
                                                                                        class="fas fa-compass me-1"></i>
                                                                                    Browse Events</a>
                                                                            </div>
                                                                            <% } %>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

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
                            <script
                                src="${pageContext.request.contextPath}/resources/assets/vendor/libs/jquery/jquery.js"></script>
                            <script
                                src="${pageContext.request.contextPath}/resources/assets/vendor/libs/popper/popper.js"></script>
                            <script
                                src="${pageContext.request.contextPath}/resources/assets/vendor/js/bootstrap.js"></script>
                            <script
                                src="${pageContext.request.contextPath}/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
                            <script
                                src="${pageContext.request.contextPath}/resources/assets/vendor/js/menu.js"></script>

                            <!-- Main JS -->
                            <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

                            <% } %>
                </body>

                </html>