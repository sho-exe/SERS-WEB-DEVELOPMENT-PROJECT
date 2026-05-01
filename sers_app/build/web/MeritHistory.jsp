<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Personal Merit Transcript | SERS</title>
    <link href="${pageContext.request.contextPath}/resources/vendor/css/core.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/css.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body class="bg-light">

<div class="d-flex" id="wrapper">
    <jsp:include page="sidebar.jsp" />

    <div id="page-content-wrapper" class="w-100">
        <nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom shadow-sm py-3 px-4">
            <div class="container-fluid">
                <h4 class="mb-0 text-dark fw-bold"><i class="fas fa-medal text-warning me-2"></i> Merit Transcript</h4>
                <a href="Homepage.jsp" class="btn btn-outline-secondary btn-sm"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
            </div>
        </nav>

        <div class="container-fluid p-4">

            <div class="row mb-4">
                <div class="col-12 col-md-6 mb-3">
                    <div class="card border-0 shadow-sm rounded-3 h-100">
                        <div class="card-body p-4 border-start border-warning border-5 d-flex align-items-center">
                            <div class="me-4 text-warning">
                                <i class="fas fa-trophy fa-4x"></i>
                            </div>
                            <div>
                                <h6 class="text-muted text-uppercase fw-bold mb-1">Total Lifetime Merits</h6>
                                <h1 class="display-5 fw-bold text-dark mb-0">${totalMerits != null ? totalMerits : '0'}</h1>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 mb-3">
                    <div class="card border-0 shadow-sm rounded-3 h-100 bg-dark text-white">
                        <div class="card-body p-4 d-flex align-items-center">
                            <div class="me-4 text-success">
                                <i class="fas fa-check-circle fa-3x"></i>
                            </div>
                            <div>
                                <h5 class="fw-bold mb-2">Verified Ledger</h5>
                                <p class="mb-0 small text-light opacity-75">This is your official chronological record of event participation. Merits shown here are fully authorized by HEPA Administrators and permanently attributed to your profile.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="card shadow-sm border-0">
                        <div class="card-header bg-white p-3 border-bottom">
                            <h5 class="mb-0 fw-bold"><i class="fas fa-clipboard-list me-2"></i> Distribution History</h5>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-hover align-middle mb-0">
                                    <thead class="bg-light text-muted small text-uppercase">
                                        <tr>
                                            <th class="ps-4">Event Date</th>
                                            <th>Event Name</th>
                                            <th>Category</th>
                                            <th>Date Awarded</th>
                                            <th class="text-end pe-4">Merits Earned</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <% 
                                        List<Map<String, Object>> history = (List<Map<String, Object>>) request.getAttribute("meritHistory");
                                        if(history != null && !history.isEmpty()) {
                                            for(Map<String, Object> record : history) {
                                    %>
                                        <tr>
                                            <td class="ps-4">
                                                <span class="text-muted fw-bold"><i class="far fa-calendar text-primary me-2"></i><%= record.get("date") %></span>
                                            </td>
                                            <td>
                                                <strong class="text-dark"><%= record.get("eventName") %></strong>
                                            </td>
                                            <td>
                                                <span class="badge bg-secondary"><%= record.get("category") %></span>
                                            </td>
                                            <td>
                                                <div class="small fw-bold text-success"><i class="fas fa-check text-success me-1"></i><%= record.get("awardedDate") %></div>
                                            </td>
                                            <td class="text-end pe-4">
                                                <div class="d-inline-flex align-items-center bg-warning-soft px-3 py-1 rounded-pill border border-warning">
                                                    <span class="fw-bold text-dark fs-5 me-2">+<%= record.get("points") %></span>
                                                    <i class="fas fa-star text-warning"></i>
                                                </div>
                                            </td>
                                        </tr>
                                    <% 
                                            }
                                        } else {
                                    %>
                                        <tr>
                                            <td colspan="5" class="text-center py-5 text-muted">
                                                <i class="fas fa-box-open fa-3x mb-3 text-light"></i><br>
                                                You do not have any merit points yet. Keep registering for events!
                                            </td>
                                        </tr>
                                    <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
