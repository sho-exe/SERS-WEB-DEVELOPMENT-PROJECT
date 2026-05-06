<%@page import="java.util.List"%>
<%@page import="com.lab.model.Attendance"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>My Event Registrations | SERS</title>
    <link href="${pageContext.request.contextPath}/resources/vendor/css/core.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/css.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .timeline { position: relative; padding-left: 2rem; margin-top: 2rem; }
        .timeline::before { content: ''; position: absolute; left: 0.5rem; top: 0; bottom: 0; width: 4px; background: #e9ecef; border-radius: 4px; }
        .timeline-item { position: relative; margin-bottom: 2rem; padding-left: 1.5rem; }
        .timeline-item::before { content: ''; position: absolute; left: -1.75rem; top: 0.5rem; width: 1.5rem; height: 1.5rem; background: var(--primary); border: 4px solid #fff; border-radius: 50%; box-shadow: 0 0 0 2px rgba(0,0,0,0.1); z-index: 1;}
        .timeline-item.attended::before { background: var(--success); }
        .timeline-item.missed::before { background: var(--danger); }
        .timeline-item.pending::before { background: var(--warning); }
    </style>
</head>

<body class="bg-light">

<div class="d-flex" id="wrapper">
    <!-- Student Sidebar Context -->
    <jsp:include page="sidebar.jsp" />


    <!-- Page Content -->
    <div id="page-content-wrapper" class="w-100">
        <nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom shadow-sm py-3 px-4">
            <div class="container-fluid">
                <h4 class="mb-0 text-dark fw-bold"><i class="fas fa-clipboard-list text-success me-2"></i> My Personal Sign-Ups</h4>
            </div>
        </nav>

        <div class="container-fluid p-4" style="max-width: 900px;">
            
            <div class="card border-0 shadow-sm rounded-3 p-4 mb-4">
                <h5 class="fw-bold mb-3"><i class="fas fa-history text-muted me-2"></i> Registration History</h5>
                <p class="text-muted small">This timeline tracks every faculty event you have ever registered for. Once the Chairperson physically verifies your attendance at the event, its status will turn Green (ATTENDED), locking you in for future Merit point payouts!</p>
                
                <div class="timeline">
                    <% 
                        List<Attendance> myRegistrations = (List<Attendance>) request.getAttribute("myRegistrations");
                        if(myRegistrations != null && !myRegistrations.isEmpty()) {
                            for(Attendance a : myRegistrations) {
                                boolean isPending = "REGISTERED".equals(a.getStatus());
                                boolean isAttended = "ATTENDED".equals(a.getStatus());
                                boolean isMissed = "MISSED".equals(a.getStatus());
                                
                                String statusIndicatorClass = isPending ? "pending" : (isAttended ? "attended" : "missed");
                    %>
                        <div class="timeline-item <%= statusIndicatorClass %>">
                            <div class="card border-0 shadow-sm overflow-hidden bg-white">
                                <div class="card-body p-4 <%= isPending ? "border-start border-warning border-4" : (isAttended ? "border-start border-success border-4" : "border-start border-danger border-4") %>">
                                    <div class="d-flex justify-content-between align-items-start mb-2">
                                        <h5 class="fw-bold text-dark mb-0"><%= a.getEventName() %></h5>
                                        <% if(isPending) { %>
                                            <span class="badge bg-warning text-dark"><i class="fas fa-hourglass-half"></i> PENDING VERIFICATION</span>
                                        <% } else if(isAttended) { %>
                                            <span class="badge bg-success"><i class="fas fa-check-double"></i> ATTENDED</span>
                                        <% } else { %>
                                            <span class="badge bg-danger"><i class="fas fa-times"></i> MISSED</span>
                                        <% } %>
                                    </div>
                                    <p class="small text-muted mb-3"><i class="fas fa-flag text-primary me-1"></i> Hosted by: <strong><%= a.getClubName() %></strong></p>
                                    
                                    <div class="row text-secondary small fw-bold mt-3">
                                        <div class="col-sm-6 mb-2 mb-sm-0">
                                            <i class="far fa-calendar-alt text-danger me-1"></i> Event Date: <%= a.getEventDate() %>
                                        </div>
                                        <div class="col-sm-6">
                                            <i class="fas fa-map-marker-alt text-info me-1"></i> Venue: <%= a.getEventVenue() %>
                                        </div>
                                    </div>
                                    <hr class="text-muted opacity-25">
                                    <div class="text-muted small">
                                        <i class="far fa-clock me-1"></i> Signed up on <%= a.getRegistrationDate() %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <%
                            }
                        } else {
                    %>
                        <div class="text-center py-5 text-muted">
                            <i class="fas fa-box-open fa-3x mb-3 text-light"></i>
                            <h6 class="fw-bold">No Registrations Found</h6>
                            <p>You haven't signed up for any events yet. Check out the Event Catalog!</p>
                            <a href="EventController?action=browse" class="btn btn-outline-primary btn-sm"><i class="fas fa-compass me-1"></i> Browse Events</a>
                        </div>
                    <% } %>
                </div>
            </div>

        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
