<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Merit Reports Analytics | SERS</title>
    <link href="${pageContext.request.contextPath}/resources/vendor/css/core.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/css.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .metric-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border-radius: 12px;
            overflow: hidden;
        }
        .metric-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1) !important;
        }
        .icon-box {
            width: 60px;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            font-size: 24px;
        }
    </style>
</head>

<body class="bg-light">

<div class="d-flex" id="wrapper">
    <jsp:include page="sidebar.jsp" />

    <div id="page-content-wrapper" class="w-100">
        <nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom shadow-sm py-3 px-4">
            <div class="container-fluid">
                <h4 class="mb-0 text-dark fw-bold"><i class="fas fa-chart-bar text-warning me-2"></i> Merit Analytics Dashboard</h4>
                <a href="Homepage.jsp" class="btn btn-outline-secondary btn-sm"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
            </div>
        </nav>

        <div class="container-fluid p-4">
            <% 
                Map<String, Integer> metrics = (Map<String, Integer>) request.getAttribute("metrics");
            %>
            
            <!-- Metric Cards Row -->
            <div class="row mb-5">
                <!-- Total Events -->
                <div class="col-md-4">
                    <div class="card metric-card border-0 shadow-sm h-100 p-3">
                        <div class="card-body d-flex align-items-center">
                            <div class="icon-box bg-primary-soft text-primary me-4">
                                <i class="fas fa-calendar-check"></i>
                            </div>
                            <div>
                                <h6 class="text-muted text-uppercase fw-bold mb-1">Total Events Validated</h6>
                                <h2 class="mb-0 fw-bold text-dark"><%= metrics.get("totalEvents") %></h2>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Total Students -->
                <div class="col-md-4">
                    <div class="card metric-card border-0 shadow-sm h-100 p-3">
                        <div class="card-body d-flex align-items-center">
                            <div class="icon-box bg-info-soft text-info me-4">
                                <i class="fas fa-users"></i>
                            </div>
                            <div>
                                <h6 class="text-muted text-uppercase fw-bold mb-1">Students Reached</h6>
                                <h2 class="mb-0 fw-bold text-dark"><%= metrics.get("totalStudents") %></h2>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Total Merits -->
                <div class="col-md-4">
                    <div class="card metric-card border-0 shadow-sm h-100 p-3">
                        <div class="card-body d-flex align-items-center">
                            <div class="icon-box bg-warning-soft text-warning me-4">
                                <i class="fas fa-star"></i>
                            </div>
                            <div>
                                <h6 class="text-muted text-uppercase fw-bold mb-1">Total Merits Awarded</h6>
                                <h2 class="mb-0 fw-bold text-dark"><%= metrics.get("totalPoints") %></h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="alert alert-secondary border-0 shadow-sm text-dark mb-4">
                <i class="fas fa-trophy me-2 text-warning"></i> This leaderboard showcases the most active participants across all clubs under your supervision. Use this data to identify highly engaged student leaders!
            </div>

            <!-- Leaderboard Table -->
            <div class="row">
                <div class="col-12">
                    <div class="card shadow-sm border-0">
                        <div class="card-header bg-white p-3 border-bottom d-flex justify-content-between align-items-center">
                            <h5 class="mb-0 fw-bold"><i class="fas fa-list-ol me-2"></i> Top 10 Student Participants</h5>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-hover align-middle mb-0">
                                    <thead class="bg-light text-muted small text-uppercase">
                                        <tr>
                                            <th class="ps-4" style="width:10%;">Rank</th>
                                            <th style="width:40%;">Student Name</th>
                                            <th style="width:30%;">Email Address</th>
                                            <th class="text-end pe-4" style="width:20%;">Merits Earned</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <% 
                                        List<Map<String, Object>> topStudents = (List<Map<String, Object>>) request.getAttribute("topStudents");
                                        if(topStudents != null && !topStudents.isEmpty()) {
                                            int rank = 1;
                                            for(Map<String, Object> student : topStudents) {
                                                String rankBadge = "bg-secondary";
                                                String icon = "";
                                                if(rank == 1) { rankBadge = "bg-warning text-dark"; icon = "<i class='fas fa-crown ms-2 text-warning'></i>"; }
                                                else if(rank == 2) { rankBadge = "bg-light text-dark border"; }
                                                else if(rank == 3) { rankBadge = "bg-danger text-white"; }
                                    %>
                                        <tr>
                                            <td class="ps-4">
                                                <span class="badge <%= rankBadge %> fs-6 px-3 py-2 shadow-sm">#<%= rank %></span>
                                            </td>
                                            <td>
                                                <strong class="text-dark"><%= student.get("fullName") %></strong><%= icon %>
                                            </td>
                                            <td class="text-muted">
                                                <a href="mailto:<%= student.get("email") %>" class="text-decoration-none text-info"><i class="far fa-envelope me-1"></i> <%= student.get("email") %></a>
                                            </td>
                                            <td class="text-end pe-4">
                                                <div class="d-inline-flex align-items-center bg-warning-soft px-3 py-1 rounded-pill">
                                                    <span class="fw-bold text-dark fs-5 me-2"><%= student.get("meritsEarned") %></span>
                                                    <i class="fas fa-star text-warning"></i>
                                                </div>
                                            </td>
                                        </tr>
                                    <% 
                                            rank++;
                                            }
                                        } else {
                                    %>
                                        <tr>
                                            <td colspan="4" class="text-center py-5 text-muted">
                                                <i class="fas fa-chart-line fa-3x mb-3 text-light"></i><br>
                                                No merit data is available for your clubs yet. Publish some events!
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
