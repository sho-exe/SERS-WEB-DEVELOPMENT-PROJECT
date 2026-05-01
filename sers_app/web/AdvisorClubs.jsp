<%@page import="java.util.List"%>
<%@page import="com.lab.model.User"%>
<%@page import="com.lab.model.Club"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>My Managed Clubs | SERS Advisor</title>
    <link href="${pageContext.request.contextPath}/resources/vendor/css/core.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/css.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .club-card {
            border-top: 5px solid #28a745;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .club-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
    </style>
</head>

<body class="bg-light">

<div class="d-flex" id="wrapper">
    <jsp:include page="sidebar.jsp" />


    <!-- Page Content -->
    <div id="page-content-wrapper" class="w-100">
        <nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom shadow-sm py-3 px-4">
            <div class="container-fluid">
                <h4 class="mb-0 text-dark fw-bold"><i class="fas fa-flag-checkered text-success me-2"></i> My Managed Clubs</h4>
                <a href="Homepage.jsp" class="btn btn-outline-secondary btn-sm"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
            </div>
        </nav>

        <div class="container-fluid p-4">
            <div class="alert alert-success border-0 shadow-sm bg-success-soft">
                <i class="fas fa-info-circle me-2 text-success"></i> As an assigned Advisor, you have the authority to assign or change the <strong>Chairperson</strong> who will handle event creation for your clubs.
            </div>

            <div class="row mt-4">
                <% 
                    List<Club> clubList = (List<Club>) request.getAttribute("clubList");
                    List<User> userList = (List<User>) request.getAttribute("userList");

                    if(clubList != null && !clubList.isEmpty()) {
                        for(Club c : clubList) {
                %>
                <div class="col-lg-6 col-md-12 mb-4">
                    <div class="card h-100 club-card bg-white rounded-3 shadow-sm">
                        <div class="card-header bg-white border-bottom-0 pt-4 pb-0">
                            <h5 class="fw-bold text-dark mb-1"><%= c.getClubName() %></h5>
                            <span class="badge bg-secondary">System ID: #<%= c.getClubId() %></span>
                        </div>
                        <div class="card-body">
                            <p class="text-muted"><%= c.getDescription() %></p>
                            
                            <hr class="bg-light">

                            <div class="row align-items-center mb-3 p-3 bg-light rounded">
                                <div class="col-2 text-center text-success"><i class="fas fa-user-tie fa-2x"></i></div>
                                <div class="col-10">
                                    <small class="text-muted d-block text-uppercase fw-bold">Official Advisor (You)</small>
                                    <span class="fs-5"><%= c.getAdvisorName() %></span>
                                </div>
                            </div>

                            <form action="AdvisorClubsServlet" method="POST" class="p-3 bg-warning-soft rounded border border-warning">
                                <input type="hidden" name="action" value="assignChairperson">
                                <input type="hidden" name="clubId" value="<%= c.getClubId() %>">
                                
                                <label class="fw-bold text-warning mb-2" style="color: #d39e00 !important;"><i class="fas fa-user-graduate me-1"></i> Appointed Chairperson</label>
                                <div class="input-group">
                                    <select name="chairpersonId" class="form-select border-warning bg-white">
                                        <option value="">-- Vacant Position --</option>
                                        <% 
                                            for(User u : userList) {
                                                if (u.getRole().equals("CHAIRPERSON")) { 
                                                    boolean selected = (c.getChairpersonId() != null && c.getChairpersonId() == u.getUserId());
                                        %>
                                            <option value="<%= u.getUserId() %>" <%= selected ? "selected" : "" %>><%= u.getFullName() %></option>
                                        <%      } 
                                            } 
                                        %>
                                    </select>
                                    <button type="submit" class="btn btn-warning fw-bold text-dark border-warning">Save Assignment</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <% 
                        }
                    } else {
                %>
                <div class="col-12 text-center py-5 text-muted">
                    <i class="fas fa-folder-open fa-3x mb-3 text-light"></i><br>
                    HEPA has not assigned you to manage any clubs yet.
                </div>
                <% } %>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
