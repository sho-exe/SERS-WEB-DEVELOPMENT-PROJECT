<%@page import="java.util.List" %>
    <%@page import="com.lab.model.User" %>
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
                                                        <span class="text-muted fw-light">SERS /</span> Club Management
                                                        Matrix
                                                    </h4>

                                                    <div class="alert alert-secondary border-0 ">
                                                        <i class="fas fa-info-circle me-2"></i> Select established
                                                        <strong>Advisors</strong> and <strong>Chairpersons</strong> to
                                                        assign them to clubs. Unassigned clubs cannot propose events!
                                                    </div>

                                                    <div class="row mt-4">
                                                        <% List<Club> clubList = (List<Club>)
                                                                request.getAttribute("clubList");
                                                                List<User> userList = (List<User>)
                                                                        request.getAttribute("userList");

                                                                        if(clubList != null && !clubList.isEmpty()) {
                                                                        for(Club c : clubList) {
                                                                        %>
                                                                        <div class="col-lg-4 col-md-6 mb-4">
                                                                            <div
                                                                                class="card h-100 club-card bg-white  p-0 border position-relative">
                                                                                <!-- Tiny Delete Button Form Floating Top Right -->
                                                                                <form
                                                                                    action="ClubController?action=manage"
                                                                                    method="POST"
                                                                                    class="position-absolute end-0 top-0 m-2"
                                                                                    style="z-index: 10;"
                                                                                    onsubmit="return confirm('WARNING: Are you absolutely sure you want to permanently delete this club?');">
                                                                                    <input type="hidden" name="action"
                                                                                        value="deleteClub">
                                                                                    <input type="hidden" name="clubId"
                                                                                        value="<%= c.getClubId() %>">
                                                                                    <button type="submit"
                                                                                        class="btn btn-sm btn-outline-danger border-0"><i
                                                                                            class="fas fa-trash-alt"></i></button>
                                                                                </form>

                                                                                <form
                                                                                    action="ClubController?action=manage"
                                                                                    method="POST"
                                                                                    class="h-100 d-flex flex-column">
                                                                                    <input type="hidden" name="action"
                                                                                        value="updateClub">
                                                                                    <input type="hidden" name="clubId"
                                                                                        value="<%= c.getClubId() %>">

                                                                                    <div
                                                                                        class="card-header bg-white border-bottom-0 pt-4 pb-0">
                                                                                        <span
                                                                                            class="badge bg-secondary mb-2">System
                                                                                            ID: #<%= c.getClubId() %>
                                                                                                </span>
                                                                                        <input type="text"
                                                                                            name="clubName"
                                                                                            class="form-control fw-bold fs-5 p-1 mb-2 pe-4"
                                                                                            value="<%= c.getClubName() %>"
                                                                                            required
                                                                                            style="border: 1px dashed #ccc;">
                                                                                    </div>
                                                                                    <div class="card-body pt-1">
                                                                                        <textarea name="description"
                                                                                            class="form-control text-muted small p-2"
                                                                                            rows="3" required
                                                                                            style="border: 1px dashed #ccc;"><%= c.getDescription() %></textarea>

                                                                                        <hr class="bg-light">

                                                                                        <div class="mb-3">
                                                                                            <label
                                                                                                class="small fw-bold text-success mb-1"><i
                                                                                                    class="fas fa-user-tie me-1"></i>
                                                                                                Club Advisor</label>
                                                                                            <select name="advisorId"
                                                                                                class="form-select form-select-sm border-success bg-light">
                                                                                                <option value="">-- No
                                                                                                    Advisor Assigned --
                                                                                                </option>
                                                                                                <% for(User u :
                                                                                                    userList) { if
                                                                                                    (u.getRole().equals("ADVISOR")
                                                                                                    ||
                                                                                                    u.getRole().equals("HEPA"))
                                                                                                    { boolean
                                                                                                    selected=(c.getAdvisorId()
                                                                                                    !=null &&
                                                                                                    c.getAdvisorId()==u.getUserId());
                                                                                                    %>
                                                                                                    <option
                                                                                                        value="<%= u.getUserId() %>"
                                                                                                        <%=selected
                                                                                                        ? "selected"
                                                                                                        : "" %>><%=
                                                                                                            u.getFullName()
                                                                                                            %>
                                                                                                    </option>
                                                                                                    <% } } %>
                                                                                            </select>
                                                                                        </div>

                                                                                        <div class="mb-3">
                                                                                            <label
                                                                                                class="small fw-bold text-warning mb-1"
                                                                                                style="color: #d39e00 !important;"><i
                                                                                                    class="fas fa-user-graduate me-1"></i>
                                                                                                Chairperson</label>
                                                                                            <select name="chairpersonId"
                                                                                                class="form-select form-select-sm border-warning bg-light">
                                                                                                <option value="">-- No
                                                                                                    Chairperson Assigned
                                                                                                    --</option>
                                                                                                <% for(User u :
                                                                                                    userList) { if
                                                                                                    (u.getRole().equals("CHAIRPERSON"))
                                                                                                    { boolean
                                                                                                    selected=(c.getChairpersonId()
                                                                                                    !=null &&
                                                                                                    c.getChairpersonId()==u.getUserId());
                                                                                                    %>
                                                                                                    <option
                                                                                                        value="<%= u.getUserId() %>"
                                                                                                        <%=selected
                                                                                                        ? "selected"
                                                                                                        : "" %>><%=
                                                                                                            u.getFullName()
                                                                                                            %>
                                                                                                    </option>
                                                                                                    <% } } %>
                                                                                            </select>
                                                                                        </div>

                                                                                        <button type="submit"
                                                                                            class="btn btn-dark btn-sm w-100 mt-2">Save
                                                                                            All Changes</button>
                                                                                    </div>
                                                                                </form>
                                                                            </div>
                                                                        </div>
                                                                        <% } } else { %>
                                                                            <div
                                                                                class="col-12 text-center py-5 text-muted">
                                                                                <i
                                                                                    class="fas fa-flag fa-3x mb-3 text-light"></i><br>
                                                                                No clubs have been registered yet. Click
                                                                                "New Club" to begin!
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