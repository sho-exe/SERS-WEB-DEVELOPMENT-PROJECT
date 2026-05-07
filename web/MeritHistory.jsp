<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <span class="text-muted fw-light">SERS /</span> Merit Transcript
</h4>

<div class="row mb-4">
                <div class="col-12 col-md-6 mb-3">
                    <div class="card border-0   h-100">
                        <div class="card-body p-4 border-start border-warning border-5 d-flex align-items-center">
                            <div class="me-4 text-warning">
                                <i class="fas fa-trophy fa-4x"></i>
                            </div>
                            <div>
                                <h6 class="text-muted text-uppercase fw-bold mb-1">Total Lifetime Merits</h6>
                                <h1 class="display-5 fw-bold text-dark mb-0">${totalMerits != null ? totalMerits : '0'}</h1>
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
