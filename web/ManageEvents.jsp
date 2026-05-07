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
