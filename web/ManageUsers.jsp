<%@page import="java.util.List" %>
    <%@page import="com.lab.model.User" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <% String role=(String) session.getAttribute("accountType"); %>

                <!DOCTYPE html>
                <html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default"
                    data-assets-path="resources/assets/" data-template="vertical-menu-template-free">

                <head>
                    <meta charset="utf-8" />
                    <meta name="viewport"
                        content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

                    <title>SERS Dashboard - Manage Users</title>

                    <meta name="description" content="SERS Dashboard" />

                    <!-- Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com" />
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
                    <link
                        href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
                        rel="stylesheet" />

                    <!-- Icons -->
                    <link rel="stylesheet" href="resources/assets/vendor/fonts/boxicons.css" />
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

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

                                        <!-- Content wrapper -->
                                        <div class="content-wrapper" style="padding: 0px 30px;">
                                            <!-- Content -->
                                            <div class=" flex-grow-1 container-p-y">

                                                <h4 class="fw-bold py-3 mb-4">
                                                    <span class="text-muted fw-light">Admin /</span> User Directory
                                                    Matrix
                                                </h4>

                                                <div class="alert alert-info border-0 shadow-sm">
                                                    <i class="fas fa-info-circle me-2"></i> As a <strong>HEPA
                                                        Administrator</strong>, you can assign
                                                    users to the <strong>ADVISOR</strong> role, or revoke roles back to
                                                    <strong>STUDENT</strong>.
                                                    Chairpersons are assigned automatically via Club creation.
                                                </div>

                                                <div class="card mt-4">
                                                    <div class="table-responsive text-nowrap">
                                                        <table class="table table-hover">
                                                            <thead>
                                                                <tr>
                                                                    <th>ID</th>
                                                                    <th>Full Name</th>
                                                                    <th>Email Address</th>
                                                                    <th>Current Role</th>
                                                                    <th class="text-center">Actions</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <% List<User> userList = (List<User>)
                                                                        request.getAttribute("userList");
                                                                        if(userList != null && !userList.isEmpty()) {
                                                                        for(User u : userList) {
                                                                        String roleClass = "bg-label-primary";
                                                                        if(u.getRole().equals("HEPA")) roleClass =
                                                                        "bg-label-danger";
                                                                        if(u.getRole().equals("ADVISOR")) roleClass =
                                                                        "bg-label-success";
                                                                        if(u.getRole().equals("CHAIRPERSON")) roleClass
                                                                        = "bg-label-warning";
                                                                        %>
                                                                        <tr>
                                                                            <td class="px-4 text-muted">#<%=
                                                                                    u.getUserId() %>
                                                                            </td>
                                                                            <td class="fw-bold">
                                                                                <%= u.getFullName() %>
                                                                            </td>
                                                                            <td class="text-muted">
                                                                                <%= u.getEmail() %>
                                                                            </td>
                                                                            <td>
                                                                                <span
                                                                                    class="badge rounded-pill <%= roleClass %> badges-role">
                                                                                    <%= u.getRole() %>
                                                                                </span>
                                                                            </td>
                                                                            <td class="text-center">
                                                                                <% if(!u.getRole().equals("HEPA")) { %>
                                                                                    <form action="users" method="POST"
                                                                                        class="d-inline">
                                                                                        <input type="hidden"
                                                                                            name="action"
                                                                                            value="updateRole">
                                                                                        <input type="hidden"
                                                                                            name="userId"
                                                                                            value="<%= u.getUserId() %>">
                                                                                        <div
                                                                                            class="input-group input-group-sm d-flex justify-content-center">
                                                                                            <select name="newRole"
                                                                                                class="form-select form-select-sm"
                                                                                                style="max-width: 150px;">
                                                                                                <option value="STUDENT"
                                                                                                    <%=u.getRole().equals("STUDENT")
                                                                                                    ? "selected" : "" %>
                                                                                                    >Student</option>
                                                                                                <option value="ADVISOR"
                                                                                                    <%=u.getRole().equals("ADVISOR")
                                                                                                    ? "selected" : "" %>
                                                                                                    >Advisor</option>
                                                                                                <option
                                                                                                    value="CHAIRPERSON"
                                                                                                    <%=u.getRole().equals("CHAIRPERSON")
                                                                                                    ? "selected" : "" %>
                                                                                                    >Chairperson
                                                                                                </option>
                                                                                            </select>
                                                                                            <button type="submit"
                                                                                                class="btn btn-dark">Update</button>
                                                                                        </div>
                                                                                    </form>
                                                                                    <% } else { %>
                                                                                        <span
                                                                                            class="text-muted small fst-italic">System
                                                                                            Admin
                                                                                            (Locked)</span>
                                                                                        <% } %>
                                                                            </td>
                                                                        </tr>
                                                                        <% } } else { %>
                                                                            <tr>
                                                                                <td colspan="5"
                                                                                    class="text-center py-5 text-muted">
                                                                                    <i
                                                                                        class="fas fa-folder-open fa-3x mb-3 text-light"></i><br>
                                                                                    No users found in the system
                                                                                    registry.
                                                                                </td>
                                                                            </tr>
                                                                            <% } %>
                                                            </tbody>
                                                        </table>
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