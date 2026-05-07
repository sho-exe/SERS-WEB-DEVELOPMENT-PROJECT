<%@page import="java.util.List"%>
<%@page import="com.lab.model.User"%>
<%@page import="com.lab.model.Club"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Manage Clubs | SERS Admin</title>
    <link href="${pageContext.request.contextPath}/resources/vendor/css/core.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/css.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .club-card {
            transition: transform 0.2s, box-shadow 0.2s;
            border: 1px solid rgba(0,0,0,0.1);
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
                <h4 class="mb-0 text-dark fw-bold"><i class="fas fa-flag text-danger me-2"></i> Club Management Matrix</h4>
                <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#createClubModal">
                    <i class="fas fa-plus"></i> New Club
                </button>
            </div>
        </nav>

        <div class="container-fluid p-4">
            <div class="alert alert-secondary border-0 shadow-sm">
                <i class="fas fa-info-circle me-2"></i> Select established <strong>Advisors</strong> and <strong>Chairpersons</strong> to assign them to clubs. Unassigned clubs cannot propose events!
            </div>

            <div class="row mt-4">
                <% 
                    List<Club> clubList = (List<Club>) request.getAttribute("clubList");
                    List<User> userList = (List<User>) request.getAttribute("userList");

                    if(clubList != null && !clubList.isEmpty()) {
                        for(Club c : clubList) {
                %>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100 club-card bg-white rounded-3 p-0 border position-relative">
                        <!-- Tiny Delete Button Form Floating Top Right -->
                        <form action="ClubController?action=manage" method="POST" class="position-absolute end-0 top-0 m-2" style="z-index: 10;" onsubmit="return confirm('WARNING: Are you absolutely sure you want to permanently delete this club?');">
                            <input type="hidden" name="action" value="deleteClub">
                            <input type="hidden" name="clubId" value="<%= c.getClubId() %>">
                            <button type="submit" class="btn btn-sm btn-outline-danger border-0"><i class="fas fa-trash-alt"></i></button>
                        </form>

                        <form action="ClubController?action=manage" method="POST" class="h-100 d-flex flex-column">
                            <input type="hidden" name="action" value="updateClub">
                            <input type="hidden" name="clubId" value="<%= c.getClubId() %>">
                            
                            <div class="card-header bg-white border-bottom-0 pt-4 pb-0">
                                <span class="badge bg-secondary mb-2">System ID: #<%= c.getClubId() %></span>
                                <input type="text" name="clubName" class="form-control fw-bold fs-5 p-1 mb-2 pe-4" value="<%= c.getClubName() %>" required style="border: 1px dashed #ccc;">
                            </div>
                        <div class="card-body pt-1">
                            <textarea name="description" class="form-control text-muted small p-2" rows="3" required style="border: 1px dashed #ccc;"><%= c.getDescription() %></textarea>
                            
                            <hr class="bg-light">

                            <div class="mb-3">
                                <label class="small fw-bold text-success mb-1"><i class="fas fa-user-tie me-1"></i> Club Advisor</label>
                                <select name="advisorId" class="form-select form-select-sm border-success bg-light">
                                    <option value="">-- No Advisor Assigned --</option>
                                    <% 
                                        for(User u : userList) {
                                            if (u.getRole().equals("ADVISOR") || u.getRole().equals("HEPA")) { 
                                                boolean selected = (c.getAdvisorId() != null && c.getAdvisorId() == u.getUserId());
                                    %>
                                        <option value="<%= u.getUserId() %>" <%= selected ? "selected" : "" %>><%= u.getFullName() %></option>
                                    <%      } 
                                        } 
                                    %>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="small fw-bold text-warning mb-1" style="color: #d39e00 !important;"><i class="fas fa-user-graduate me-1"></i> Chairperson</label>
                                <select name="chairpersonId" class="form-select form-select-sm border-warning bg-light">
                                    <option value="">-- No Chairperson Assigned --</option>
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
                            </div>

                                <button type="submit" class="btn btn-dark btn-sm w-100 mt-2">Save All Changes</button>
                            </div>
                        </form>
                    </div>
                </div>
                <% 
                        }
                    } else {
                %>
                <div class="col-12 text-center py-5 text-muted">
                    <i class="fas fa-flag fa-3x mb-3 text-light"></i><br>
                    No clubs have been registered yet. Click "New Club" to begin!
                </div>
                <% } %>
            </div>
            
        </div>
    </div>
</div>

<!-- Create Club Modal -->
<div class="modal fade" id="createClubModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content border-0 shadow-lg">
            <div class="modal-header bg-danger text-white">
                <h5 class="modal-title fw-bold"><i class="fas fa-plus-circle me-2"></i> Register New Club</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="ClubController?action=manage" method="POST">
                <div class="modal-body bg-light p-4">
                    <input type="hidden" name="action" value="createClub">
                    
                    <div class="mb-3">
                        <label class="form-label fw-bold">Official Club Name</label>
                        <input type="text" name="clubName" class="form-control" placeholder="e.g., Programming Club" required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label fw-bold">Club Mandate / Description</label>
                        <textarea name="description" class="form-control" rows="3" placeholder="Define the goal of this club..." required></textarea>
                    </div>
                    
                    <div class="alert alert-warning small border-0 mb-0">
                        <i class="fas fa-exclamation-triangle me-1"></i> You will assign the Advisor and Chairperson from the portal after creation!
                    </div>
                </div>
                <div class="modal-footer bg-white">
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-danger fw-bold">Register Club</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
