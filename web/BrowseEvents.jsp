<%@page import="java.util.List" %>
    <%@page import="com.lab.model.Event" %>
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
                                    <jsp:include page="sidebar_sneat.jsp" />

                                    <!-- Layout container -->
                                    <div class="layout-page">
                                        <jsp:include page="navbar_sneat.jsp" />


                                        <!--SINI-->

                                        <!-- Content wrapper -->
                                        <div class="content-wrapper" style="padding: 0px 30px;">
                                            <!-- Content -->
                                            <div class=" flex-grow-1 container-p-y">

                                                <h4 class="fw-bold py-3 mb-4">
                                                    <span class="text-muted fw-light">SERS /</span> Explore
                                                    Campus Events
                                                </h4>

                                                <div class="row row-cols-1 row-cols-md-2 row-cols-xl-3 g-4">
                                                    <% List<Event> eventCatalog = (List<Event>)
                                                            request.getAttribute("eventCatalog");
                                                            if(eventCatalog != null && !eventCatalog.isEmpty()) {
                                                            for(Event e : eventCatalog) {

                                                            String[] dParts = e.getDate().toString().split("-");
                                                            String[] months = {"JAN", "FEB", "MAR", "APR", "MAY", "JUN",
                                                            "JUL", "AUG",
                                                            "SEP", "OCT", "NOV", "DEC"};
                                                            String mo = months[Integer.parseInt(dParts[1]) - 1];
                                                            String dy = dParts[2];

                                                            boolean isFull = e.getCurrentEnrollments() >= e.getQuota();
                                                            int spotsLeft = e.getQuota() - e.getCurrentEnrollments();
                                                            %>

                                                            <div class="col">
                                                                <div class="card h-100 event-card ">
                                                                    <div class="card-body p-4">
                                                                        <div
                                                                            class="d-flex justify-content-between border-bottom pb-3 mb-3">
                                                                            <div>
                                                                                <span
                                                                                    class="badge bg-primary-soft text-primary mb-2"><i
                                                                                        class="fas fa-flag me-1"></i>
                                                                                    <%= e.getClubName() %>
                                                                                </span>
                                                                                <h5
                                                                                    class="card-title fw-bold text-dark mb-0 line-clamp-2">
                                                                                    <%= e.getEventName() %>
                                                                                </h5>
                                                                            </div>
                                                                            <div class="date-badge ms-3 flex-shrink-0">
                                                                                <span class="month">
                                                                                    <%= mo %>
                                                                                </span>
                                                                                <span class="day">
                                                                                    <%= dy %>
                                                                                </span>
                                                                            </div>
                                                                        </div>

                                                                        <p class="card-text text-muted small mb-4"
                                                                            style="min-height: 60px;">
                                                                            <%= e.getDescription() %>
                                                                        </p>

                                                                        <div class="rounded bg-light p-3 mb-4">
                                                                            <div
                                                                                class="d-flex mb-2 small fw-bold text-secondary">
                                                                                <i
                                                                                    class="fas fa-map-marker-alt text-danger me-2 mt-1"></i>
                                                                                <span>
                                                                                    <%= e.getVenue() %>
                                                                                </span>
                                                                            </div>
                                                                            <div
                                                                                class="d-flex small fw-bold text-secondary">
                                                                                <i
                                                                                    class="fas fa-bullseye text-success me-2 mt-1"></i>
                                                                                <span>Merit Tier: <%= e.getCriteria() %>
                                                                                        | Category: <%= e.getCategory()
                                                                                            %></span>
                                                                            </div>
                                                                        </div>

                                                                        <div
                                                                            class="d-flex justify-content-between align-items-center mt-auto">
                                                                            <div>
                                                                                <div class="small fw-bold text-dark"><i
                                                                                        class="fas fa-user-friends text-info me-1"></i>
                                                                                    <%= e.getCurrentEnrollments() %> /
                                                                                        <%= e.getQuota() %>
                                                                                </div>
                                                                                <% if(!isFull &&
                                                                                    !e.isAlreadyRegistered()) { %>
                                                                                    <div
                                                                                        class="small text-success fw-bold">
                                                                                        <%= spotsLeft %> Spots Left!
                                                                                    </div>
                                                                                    <% } else if(isFull &&
                                                                                        !e.isAlreadyRegistered()) { %>
                                                                                        <div
                                                                                            class="small text-danger fw-bold">
                                                                                            Fully Booked
                                                                                        </div>
                                                                                        <% } %>
                                                                            </div>

                                                                            <div>
                                                                                <% if (e.isAlreadyRegistered()) { %>
                                                                                    <button
                                                                                        class="btn btn-success disabled "
                                                                                        disabled>
                                                                                        <i
                                                                                            class="fas fa-check-circle me-1"></i>
                                                                                        Enrolled
                                                                                    </button>
                                                                                    <% } else if (isFull) { %>
                                                                                        <button
                                                                                            class="btn btn-secondary disabled "
                                                                                            disabled>
                                                                                            <i
                                                                                                class="fas fa-ban me-1"></i>
                                                                                            Filled
                                                                                        </button>
                                                                                        <% } else { %>
                                                                                            <% String
                                                                                                confirmMsg="Register for "
                                                                                                +
                                                                                                e.getEventName().replace("'", "\\'"
                                                                                                ) + "?" ; %>
                                                                                                <form
                                                                                                    action="EventController?action=browse"
                                                                                                    method="POST"
                                                                                                    class="m-0"
                                                                                                    onsubmit="return confirm('<%= confirmMsg %>');">
                                                                                                    <input type="hidden"
                                                                                                        name="action"
                                                                                                        value="register">
                                                                                                    <input type="hidden"
                                                                                                        name="eventId"
                                                                                                        value="<%= e.getEventId() %>">
                                                                                                    <button
                                                                                                        type="submit"
                                                                                                        class="btn btn-primary  fw-bold">
                                                                                                        Sign Up <i
                                                                                                            class="fas fa-arrow-right ms-1"></i>
                                                                                                    </button>
                                                                                                </form>
                                                                                                <% } %>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <% } } else { %>
                                                                <div class="col-12 text-center py-5 text-muted w-100">
                                                                    <i class="fas fa-map text-light fa-4x mb-3"></i>
                                                                    <h5 class="fw-bold">No Events Found</h5>
                                                                    <p>There are currently no approved campus events to
                                                                        sign up for. Check
                                                                        back soon!</p>
                                                                </div>
                                                                <% } %>
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