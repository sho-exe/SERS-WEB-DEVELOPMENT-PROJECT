<%@page import="java.util.List"%>
<%@page import="com.lab.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Manage Users | SERS Admin</title>
    <link href="${pageContext.request.contextPath}/resources/vendor/css/core.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/css.css" rel="stylesheet">
    <!-- FontAwesome setup -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .table-custom {
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
        }
        .table-custom th {
            background-color: #343a40;
            color: white;
            font-weight: 500;
            border: none;
        }
        .badges-role {
            font-size: 0.85em;
            padding: 5px 10px;
        }
    </style>
</head>

<body class="bg-light">

<div class="d-flex" id="wrapper">
    <!-- Sidebar Mirroring Homepage -->
    <jsp:include page="sidebar.jsp" />


    <!-- Page Content -->
    <div id="page-content-wrapper" class="w-100">
        <nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom shadow-sm py-3 px-4">
            <div class="container-fluid">
                <h4 class="mb-0 text-dark fw-bold"><i class="fas fa-users-cog text-danger me-2"></i> User Directory Matrix</h4>
                <a href="Homepage.jsp" class="btn btn-outline-secondary btn-sm"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
            </div>
        </nav>

        <div class="container-fluid p-4">
            
            <div class="alert alert-info border-0 shadow-sm">
                <i class="fas fa-info-circle me-2"></i> As a <strong>HEPA Administrator</strong>, you can assign users to the <strong>ADVISOR</strong> role, or revoke roles back to <strong>STUDENT</strong>. Chairpersons are assigned automatically via Club creation.
            </div>

            <div class="table-responsive table-custom mt-4">
                <table class="table table-hover align-middle mb-0">
                    <thead>
                        <tr>
                            <th scope="col" class="py-3 px-4">ID</th>
                            <th scope="col" class="py-3">Full Name</th>
                            <th scope="col" class="py-3">Email Address</th>
                            <th scope="col" class="py-3">Current Role</th>
                            <th scope="col" class="py-3 text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            List<User> userList = (List<User>) request.getAttribute("userList");
                            if(userList != null && !userList.isEmpty()) {
                                for(User u : userList) {
                                    String roleClass = "bg-primary";
                                    if(u.getRole().equals("HEPA")) roleClass = "bg-danger";
                                    if(u.getRole().equals("ADVISOR")) roleClass = "bg-success";
                                    if(u.getRole().equals("CHAIRPERSON")) roleClass = "bg-warning text-dark";
                        %>
                        <tr>
                            <td class="px-4 text-muted">#<%= u.getUserId() %></td>
                            <td class="fw-bold"><%= u.getFullName() %></td>
                            <td class="text-muted"><%= u.getEmail() %></td>
                            <td>
                                <span class="badge rounded-pill <%= roleClass %> badges-role"><%= u.getRole() %></span>
                            </td>
                            <td class="text-center">
                                <% if(!u.getRole().equals("HEPA")) { %>
                                <form action="ManageUsersServlet" method="POST" class="d-inline">
                                    <input type="hidden" name="action" value="updateRole">
                                    <input type="hidden" name="userId" value="<%= u.getUserId() %>">
                                    <div class="input-group input-group-sm d-flex justify-content-center">
                                        <select name="newRole" class="form-select form-select-sm" style="max-width: 150px;">
                                            <option value="STUDENT" <%= u.getRole().equals("STUDENT") ? "selected" : "" %>>Student</option>
                                            <option value="ADVISOR" <%= u.getRole().equals("ADVISOR") ? "selected" : "" %>>Advisor</option>
                                            <option value="CHAIRPERSON" <%= u.getRole().equals("CHAIRPERSON") ? "selected" : "" %>>Chairperson</option>
                                        </select>
                                        <button type="submit" class="btn btn-dark">Update</button>
                                    </div>
                                </form>
                                <% } else { %>
                                    <span class="text-muted small fst-italic">System Admin (Locked)</span>
                                <% } %>
                            </td>
                        </tr>
                        <% 
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="5" class="text-center py-5 text-muted">
                                <i class="fas fa-folder-open fa-3x mb-3 text-light"></i><br>
                                No users found in the system registry.
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
